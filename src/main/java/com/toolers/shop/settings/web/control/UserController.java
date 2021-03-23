package com.toolers.shop.settings.web.control;

import com.toolers.shop.settings.domain.User;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.service.UserService;
import com.toolers.shop.settings.service.impl.UserServiceImpl;
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
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入到用户控制器");
        String path=request.getServletPath();
        if("/settings/user/login.do".equals(path))
        {
            System.out.println("进入登录");

            login(request,response);

        }else if ("/settings/user/register.do".equals(path))
        {
            System.out.println("进入注册");
            register(request,response);

        }else if("/settings/user/userinfo.do".equals(path))
        {
            System.out.println("进入用户信息");
            //获取表单数据
           userinfo(request,response);

        }
        else if ("/settings/user/userheadportrait.do".equals(path))
        {
            System.out.println("进入头像信息");
            userheadportrait(request,response);
        }
        else if ("/settings/user/useraddress.do".equals(path))
        {
            System.out.println("进入地址信息");
            useraddress(request,response);
        }
        else if ("/settings/user/finduseraddress.do".equals(path))
        {
            System.out.println("进入地址信息显示");
            finduseraddress(request,response);
        }
        else if ("/settings/user/deleteuseraddress.do".equals(path))
        {
            System.out.println("进入地址信息删除显示");
            deleteuseraddress(request,response);
        }
        else if ("/settings/user/updateuseraddress.do".equals(path))
        {
            System.out.println("进入地址信息修改");
            updateuseraddress(request,response);
        }
        else if ("/settings/user/logout.do".equals(path))
        {
            logout(request,response);
        }



    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        session.removeAttribute("seller");
        session.removeAttribute("user");
        session.removeAttribute("productcartList");
        session.removeAttribute("totalrentprice");
        session.removeAttribute("totalcartnum");
        session.removeAttribute("totalcartprice");
        try {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateuseraddress(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("进入地址信息修改操作");
        Map<String,String[]> properties=request.getParameterMap();
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        UserAddress userAddress=new UserAddress();
        User user=(User)request.getSession().getAttribute("user");
        try {
            BeanUtils.populate(userAddress,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        AddressBean addressBean=us.updateuseraddress(userAddress,user.getLoginAct());
        request.getSession().setAttribute("addressBean",addressBean);
        try {
            response.sendRedirect(request.getContextPath()+"/useraddress.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteuseraddress(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入地址信息删除操作");
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        User user=(User)request.getSession().getAttribute("user");
        String aid=request.getParameter("aid");
        AddressBean addressBean=us.deleteuseraddress(aid,user.getLoginAct());
        request.getSession().setAttribute("addressBean",addressBean);
        try {
            response.sendRedirect(request.getContextPath()+"/useraddress.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void finduseraddress(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("进入地址信息显示操作");
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        String loginAct=request.getParameter("loginAct");
        AddressBean addressBean=us.finduseraddress(loginAct);
        request.getSession().setAttribute("addressBean",addressBean);
        PrintJson.printJsonFlag(response,true);


    }

    private void useraddress(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入到用户地址的操作");
        Map<String,String[]> properties=request.getParameterMap();
        User user=(User)request.getSession().getAttribute("user");
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        UserAddress userAddress=new UserAddress();
        try {
            BeanUtils.populate(userAddress,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        userAddress.setAid(CommonsUtils.getUUid());
        userAddress.setLoginAct(user.getLoginAct());
       /* us.useraddress(userAddress);*/

        AddressBean addressBean=us.useraddress(userAddress,user.getLoginAct());


         request.getSession().setAttribute("addressBean",addressBean);
       /* try {
            request.getRequestDispatcher("/useraddress.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        /*try {
            response.sendRedirect(request.getContextPath()+"/useraddress.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }*/


    }

    private void userheadportrait(HttpServletRequest request, HttpServletResponse response) {
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        User user=(User)request.getSession().getAttribute("user");
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
                    user.setHeadportrait("userheadportrait/"+fileName);
                    in.close();
                    out.close();
                    item.delete();

                }
            }

            user=us.userheadportrait(user);
            request.getSession().setAttribute("user",user);
            response.sendRedirect(request.getContextPath()+"/userinformation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
   private void userinfo(HttpServletRequest request, HttpServletResponse response) {


        Map<String,String[]> properties=request.getParameterMap();
        User user=(User)request.getSession().getAttribute("user");
        try {
            BeanUtils.populate(user,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        user= us.userinfo(user);
        request.getSession().setAttribute("user",user);
        try {
            response.sendRedirect(request.getContextPath()+"/userinformation.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }



    private void register(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("进入到验证注册的操作");
        String registerAct=request.getParameter("registerAct");
        String registerPwd=request.getParameter("registerPwd1");
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        try {

            User user= us.register(registerAct,registerPwd);
           // request.getSession().setAttribute("user",user);
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

    private void login(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入到验证登录的操作");
        String loginAct=request.getParameter("loginAct");
        String loginPwd=request.getParameter("loginPwd");
        UserService us=(UserService) ServiceFactory.getService(new UserServiceImpl());
        try {

            User user= us.login(loginAct,loginPwd);
            request.getSession().setAttribute("user",user);
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
