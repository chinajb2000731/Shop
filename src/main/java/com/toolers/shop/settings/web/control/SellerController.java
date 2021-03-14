package com.toolers.shop.settings.web.control;

import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.domain.Seller;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.service.SellerService;
import com.toolers.shop.settings.service.impl.SellerServiceImpl;
import com.toolers.shop.settings.vo.AddressBean;
import com.toolers.shop.settings.vo.PageBean;
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
import java.util.ArrayList;
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

            register(request,response);

        }else if ("/settings/seller/login.do".equals(path))
        {


            login(request,response);

        }
        else if ("/settings/user/sellerinfo.do".equals(path))
        {


            sellerinfo(request,response);

        }
        else if("/settings/seller/sellerheadportrait.do".equals(path))
        {

            sellerheadportrait(request,response);
        }
        else if ("/settings/seller/selleraddress.do".equals(path))
        {

            selleraddress(request,response);
        }
        else if("/settings/seller/findselleraddress.do".equals(path))
        {

            findselleraddress(request,response);
        }
        else if("/settings/seller/deleteselleraddress.do".equals(path))
        {

            deleteselleraddress(request,response);
        }
        else if ("/settings/seller/updateselleraddress.do".equals(path))
        {

            updateselleraddress(request,response);
        }
       else if("/settings/seller/selectcheckproduct.do".equals(path))
        {
            selectcheckproduct(request,response);
        }
        else if ("/settings/seller/onsellproduct.do".equals(path))
        {
            onsellproduct(request,response);
        }
       else if ("/settings/seller/deletesellproduct.do".equals(path))
        {
            deletesellproduct(request,response);
        }
        else if("/settings/seller/addsellproduct.do".equals(path))
        {
            addsellproduct(request,response);
        }
        else if("/settings/seller/sellerorder.do".equals(path))
        {
            sellerorder(request,response);
        }
        else if("/settings/seller/sellconfirmdeliver.do".equals(path))
        {
            sellconfirmdeliver(request,response);
        }
        else if("/settings/seller/selectsellorder.do".equals(path))
        {
            selectsellorder(request,response);
        }
    }



    private void selectsellorder(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String orderflagstr=request.getParameter("orderflag");
        int orderflag=Integer.parseInt(orderflagstr);
        String sid=request.getParameter("sid");
        List<Cart> cartList=new ArrayList<Cart>();
        List<Product> productcartList3=new ArrayList<Product>();
        Product product=null;
        if(orderflag==0)
        {
           cartList=us.selectsellerorder(sid);
        }
        else if(orderflag==1)
        {
            cartList= us.selectsellerordernodeliver(sid);
        }
        else if (orderflag==2)
        {
            cartList=us.selectsellonget(sid);
        }
        else if(orderflag==4)
        {
            cartList=us.selectsellordercomplete(sid);
        }
        if (cartList==null)
        {
                request.getSession().setAttribute("productcartList3", productcartList3);
                try {
                    response.sendRedirect(request.getContextPath()+"/seller_order.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }

        else {
                for (Cart c : cartList) {
                    String pid2 = c.getPid();
                    product = us.findProductByPid(pid2);
                    product.setBuynum(c.getBuynum());
                    product.setIs_pay(c.getIs_pay());
                    product.setIs_get(c.getIs_get());
                    product.setIs_rent(c.getIs_rent());
                    product.setId(c.getId());
                    product.setIs_deliver(c.getIs_deliver());
                    productcartList3.add(product);
                }
            }
            request.getSession().setAttribute("productcartList3", productcartList3);
            try {
                response.sendRedirect(request.getContextPath()+"/seller_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }


    }

    private void sellconfirmdeliver(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String id=request.getParameter("id");
        us.sellconfirmdeliver(id);
        sellerorder(request,response);

    }

    private void sellerorder(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String sid=request.getParameter("sid");
        List<Cart> cartList=us.selectsellerorder(sid);
        List<Product> productcartList3=new ArrayList<Product>();
        Product product=null;
        if (cartList==null)
        {
            request.getSession().setAttribute("productcartList3", productcartList3);
            try {
                response.sendRedirect(request.getContextPath()+"/seller_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : cartList) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                productcartList3.add(product);
            }
        }
        request.getSession().setAttribute("productcartList3", productcartList3);
        try {
            response.sendRedirect(request.getContextPath()+"/seller_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void addsellproduct(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        Product product=new Product();
        Map<String,Object> map=new HashMap<String,Object>();
        String sid=request.getParameter("sid");
       /* String cid=request.getParameter("cid");
        String pname=request.getParameter("pname");
        String pdesc=request.getParameter("pdesc");
        String pricestr=request.getParameter("price");

        double price=Double.parseDouble(pricestr);
        String rentstr=request.getParameter("rent");
        double rent=Double.parseDouble(rentstr);*/
        try {
            DiskFileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload upload=new ServletFileUpload(factory);
            List<FileItem> parseRequest=upload.parseRequest(request);
            for(FileItem item:parseRequest){
                //判断是否是普通表单
                boolean forField =item.isFormField();
                if (forField)
                {
                    String fieldName=item.getFieldName();
                    String fieldValue=item.getString("UTF-8");
                    map.put(fieldName,fieldValue);
                }
                else{
                    //文件上传
                    String fileName=item.getName();
                    String path=this.getServletContext().getRealPath("products");
                    InputStream in=item.getInputStream();
                    OutputStream out=new FileOutputStream(path+"/"+fileName);
                    IOUtils.copy(in,out);
                    in.close();
                    out.close();
                    item.delete();
                    map.put("pimage","products/"+fileName);
                }
            }
            BeanUtils.populate(product,map);
            product.setPid(CommonsUtils.getUUid());
            product.setSid(sid);
            us.addsellproduct(product);
            selectcheckproduct(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void deletesellproduct(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String sid=request.getParameter("sid");
        String pid=request.getParameter("pid");
        us.deletesellproduct(sid,pid);
        selectcheckproduct(request,response);
    }

    private void onsellproduct(HttpServletRequest request, HttpServletResponse response) {
        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String sid=request.getParameter("sid");
        String pid=request.getParameter("pid");
        String sellflag=request.getParameter("sellflag");
        us.onsellproduct(sid,pid,sellflag);
        selectcheckproduct(request,response);


    }

    private void selectcheckproduct(HttpServletRequest request, HttpServletResponse response) {

        SellerService us=(SellerService) ServiceFactory.getService(new SellerServiceImpl());
        String sid=request.getParameter("sid");

        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null)
        {
            currentPageStr="1";
        }

        int currentPage=Integer.parseInt(currentPageStr);
        int currentCount=4;
        PageBean pageBean=us.selectcheckproduct(sid,currentPage,currentCount);
        request.getSession().setAttribute("checkproductBean",pageBean);
        try {
            response.sendRedirect(request.getContextPath()+"/seller_product.jsp");
        } catch (IOException e) {
            e.printStackTrace();
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





