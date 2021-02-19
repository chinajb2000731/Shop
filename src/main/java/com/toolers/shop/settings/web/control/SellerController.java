package com.toolers.shop.settings.web.control;

import com.toolers.shop.settings.domain.Seller;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.service.SellerService;
import com.toolers.shop.settings.service.impl.SellerServiceImpl;
import com.toolers.shop.settings.vo.AddressBean;
import com.toolers.shop.untils.CommonsUtils;
import com.toolers.shop.untils.PrintJson;
import com.toolers.shop.untils.ServiceFactory;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SellerController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入到卖家控制器");
        String path=request.getServletPath();
        if("/settings/seller/register.do".equals(path))
        {
            System.out.println("进入注册");

            register(request,response);

        }else if ("/settings/seller/login.do".equals(path))
        {

             System.out.println("进入登录");
            login(request,response);

        }
        else if ("/settings/user/sellerinfo.do".equals(path))
        {

            System.out.println("进入用户信息");
            sellerinfo(request,response);

        }
        else if("/settings/seller/sellerheadportrait.do".equals(path))
        {
            System.out.println("进入头像信息");
            sellerheadportrait(request,response);
        }
        else if ("/settings/seller/selleraddress.do".equals(path))
        {
            System.out.println("进入地址信息");
            selleraddress(request,response);
        }
        else if("/settings/seller/findselleraddress.do".equals(path))
        {
            System.out.println("进入地址信息显示");
            findselleraddress(request,response);
        }
        else if("/settings/seller/deleteselleraddress.do".equals(path))
        {
            System.out.println("进入商家地址信息删除显示");
            deleteselleraddress(request,response);
        }
        else if ("/settings/seller/updateselleraddress.do".equals(path))
        {
            System.out.println("进入地址信息修改");
            updateselleraddress(request,response);
        }


    }

    private void updateselleraddress(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Map<String,String[]> properties=request.getParameterMap();
        UserAddress userAddress=new UserAddress();
        Seller seller=(Seller) request.getSession().getAttribute("seller");
        try {
            BeanUtils.populate(userAddress,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        AddressBean addressBean=us.updateselleraddress(userAddress,seller.getLoginAct());
        request.getSession().setAttribute("addressBean",addressBean);
        try {
            response.sendRedirect(request.getContextPath()+"/useraddress.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteselleraddress(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Seller seller=(Seller) request.getSession().getAttribute("seller");
        String aid=request.getParameter("aid");
        AddressBean addressBean=us.deleteselleraddress(aid,seller.getLoginAct());
        request.getSession().setAttribute("addressBean",addressBean);
        try {
            response.sendRedirect(request.getContextPath()+"/useraddress.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findselleraddress(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入卖家地址");
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String loginAct=request.getParameter("loginAct");
        AddressBean addressBean=us.findselleraddress(loginAct);
        request.getSession().setAttribute("addressBean",addressBean);
        PrintJson.printJsonFlag(response,true);
    }

    private void selleraddress(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Map<String,String[]> properties=request.getParameterMap();
        Seller seller=(Seller)request.getSession().getAttribute("seller");
        UserAddress userAddress=new UserAddress();
        try {
            BeanUtils.populate(userAddress,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        userAddress.setAid(CommonsUtils.getUUid());
        userAddress.setLoginAct(seller.getLoginAct());
        AddressBean addressBean=us.useraddress(userAddress,seller.getLoginAct());


        request.getSession().setAttribute("addressBean",addressBean);


    }

    private void sellerheadportrait(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Seller seller=(Seller)request.getSession().getAttribute("seller");
        try {
            DiskFileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload upload=new ServletFileUpload(factory);
            List<FileItem> parseRequest=upload.parseRequest(request);
            for(FileItem item:parseRequest){
                //判断是否是普通表单
                boolean forField =item.isFormField();
                if (forField)
                {
                    System.out.println("普通表单");
                }
                else{
                    //文件上传
                    String fileName=item.getName();
                    String path=this.getServletContext().getRealPath("userheadportrait");
                    InputStream in=item.getInputStream();
                    OutputStream out=new FileOutputStream(path+"/"+fileName);
                    IOUtils.copy(in,out);
                    seller.setHeadportrait("userheadportrait/"+fileName);
                    in.close();
                    out.close();
                    item.delete();

                }
            }

            seller=us.sellerheadportrait(seller);
            request.getSession().setAttribute("seller",seller);
            response.sendRedirect(request.getContextPath()+"/userinformation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void sellerinfo(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Map<String,String[]> properties=request.getParameterMap();
        Seller seller=(Seller)request.getSession().getAttribute("seller");
        try {
            BeanUtils.populate(seller,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        seller=us.sellerinfo(seller);
        request.getSession().setAttribute("seller",seller);
        try {
            response.sendRedirect(request.getContextPath()+"/userinformation.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void login(HttpServletRequest request, HttpServletResponse response) {


        System.out.println("进入到验证登录的操作");
        String loginAct=request.getParameter("loginAct");
        String loginPwd=request.getParameter("loginPwd");
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        try {

            Seller seller= us.login(loginAct,loginPwd);
            request.getSession().setAttribute("seller",seller);
            PrintJson.printJsonFlag(response,true);


        }catch (Exception e)
        {
            e.printStackTrace();
            String msg=e.getMessage();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("success",false);
            map.put("msg",msg);
            PrintJson.printJsonObj(response,map);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("进入到验证注册的操作");
        String registerAct=request.getParameter("sellerAct");
        String registerPwd=request.getParameter("sellerPwd1");
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Seller seller=new Seller();
        seller.setSid(CommonsUtils.getUUid());
        seller.setLoginAct(registerAct);
        seller.setLoginPwd(registerPwd);
        try {

        /*    Seller seller= us.register(registerAct,registerPwd);*/
            // request.getSession().setAttribute("user",user);
            seller=us.register(seller);
            PrintJson.printJsonFlag(response,true);

        }catch (Exception e)
        {
            e.printStackTrace();
            String msg=e.getMessage();
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("success",false);
            map.put("msg",msg);
            PrintJson.printJsonObj(response,map);
        }
    }

}





