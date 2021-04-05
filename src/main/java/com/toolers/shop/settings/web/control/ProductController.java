package com.toolers.shop.settings.web.control;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.settings.service.impl.ProductServiceImpl;
import com.toolers.shop.settings.vo.PageBean;
import com.toolers.shop.untils.AlipayConfig;
import com.toolers.shop.untils.CommonsUtils;
import com.toolers.shop.untils.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入商品控制器");
        String path=request.getServletPath();
        if ("/settings/prouduct/index".equals(path))
        {
            System.out.println("进入商品");
            index(request,response);
        }

      else if("/settings/product/productinfo.do".equals(path))
        {
            productinfo(request,response);
        }
       else if("/settings/product/collect.do".equals(path))
        {
             collect(request,response);
        }
      else if ("/settings/product/showcollect.do".equals(path))

        {
            showcollect(request,response);
        }
        else if("/settings/product/deletecollect.do".equals(path))
        {
            deletecollect(request,response);
        }
        else if("/settings/product/cart.do".equals(path))
        {
            cart(request,response);
        }
        else if("/settings/product/showcart.do".equals(path))
        {
            showcart(request,response);

        }
        else if("/settings/product/productlists.do".equals(path))
        {
            showproductlists(request,response);

        }
        else if("/settings/product/productsearch.do".equals(path))
        {

            productsearch(request,response);
        }
        else if("/settings/product/productorder.do".equals(path))
        {
            productorder(request,response);
        }
        else if ("/settings/product/productorderent.do".equals(path))
        {
            productorderent(request,response);
        }
        else if ("/settings/product/productget.do".equals(path))
        {
            productget(request,response);
        }
        else if("/settings/product/deleteorder.do".equals(path))
        {
            deleteorder(request,response);
        }
        else if("/settings/product/selectorder.do".equals(path))
        {
            selectorder(request,response);
        }
        else if("/settings/product/selectusercenterorder.do".equals(path))
        {
            selectusercenterorder(request,response);
        }
        else if("/settings/product/updaterentday.do".equals(path))
        {
            updaterentday(request,response);
        }
        else if("/settings/product/eviction.do".equals(path))
        {
            eviction(request,response);
        }
        else if ("/settings/product/productpay.do".equals(path))
        {
            productpay(request,response);
        }
    }

    private void productpay(HttpServletRequest request, HttpServletResponse response) {

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        try {
         /*   String out_trade_no = new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
            String out_trade_no =request.getParameter("id");*/
            String out_trade_no ="11111";

            /*String total_amount = new String(request.getParameter("pay").getBytes("ISO-8859-1"),"UTF-8");
            String total_amount =request.getParameter("pay");*/
            String total_amount ="1";
          /*  String subject = new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
            String subject =request.getParameter("id");*/
            String subject ="111";
            String body = "1111";


            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

            String result = alipayClient.pageExecute(alipayRequest).getBody();
            request.setAttribute("result",result);
            String form=null;
            form = alipayClient.pageExecute(alipayRequest).getBody();
            System.out.println(form);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
                request.getRequestDispatcher("/payment.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
        }

    }
    /*public void  productpay(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException {
        *//** 支付宝网关 **//*
        String URL = "https://openapi.alipaydev.com/gateway.do";

        *//** 应用id，如何获取请参考：https://opensupport.alipay.com/support/helpcenter/190/201602493024 **//*
        String APP_ID = "2021000117629951";

        *//** 应用私钥，如何获取请参考：https://opensupport.alipay.com/support/helpcenter/207/201602471154?ant_source=antsupport **//*
        String APP_PRIVATE_KEY = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALJXcy3k3hdohSrG1UOBgAXrqcHpy8TXmk4tSkP8hYAKkChX4O6oIz5zBxy3g2NzXw7/wXBrpKkP6TKKUPDARIFeuRB4ApDaB2/3R6ztyjJzrotRcAnmlbWTwj0GLj/7KXgTLwNJuS9quzYsIpDXgWu3tDlhj1ofk4eVhci4SnSJAgMBAAECgYAPvgprva0hEdfXa8+9crvzSdclR9b13DZBulu43pyGLeiFtyQizPK3e33gOg6+A5wbfdX8b3QMfFwQWwdECSTCxPdovfz2i0LL0NnhYRHDbrKJ7bh0fw3UbhwISm/70rvQi0P0P2jypjvagNhb1qoVX9538GLvmg5j0WG/zw2TgQJBANp7TqDGY8vOnHtbOlJGJwrhCeHf3b/LQrPc/RngB5m65VB+GosSwqKdrOflCzle43Kuy3da+08H3RD3QmkUGhECQQDQ94qj9aiN1K35QoIkbSTViDkSWcbV1rq+PkSMfKx3kvsPUGqQqckViOdy7sRHLrMyTzThRWh2RWYdHSRBQXr5AkBEG5hhSjcl+5yQX9oId9IH9CsufKkV9vkuNL+55zq3U6nUs9r2a7y9EMYr7BzZn5jr0U2gQX6CHoNtnIbZVujhAkEAkwhqW72BcPJhy04ZxkmprjmgdqIGvvXNBglIMFWVALnBv1/E668blvRybjNElhVs7ww+V/d/biCcngWgOe45+QJAbX4TeU1i+OG2iEtT70kN1tNi93ALv5seidpxxPAu048PQObU79OhHwUSZvc5uATt/5X+p+F2Dz623FxnJEqgtw==";
        *//** 支付宝公钥，如何获取请参考：https://opensupport.alipay.com/support/helpcenter/207/201602487431 **//*
        String ALIPAY_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";

        *//** 初始化 **//*
        AlipayClient alipayClient = new DefaultAlipayClient(URL,APP_ID,APP_PRIVATE_KEY,"json","UTF-8",ALIPAY_PUBLIC_KEY,"RSA");

        *//** 实例化具体API对应的request类，类名称和接口名称对应,当前调用接口名称：alipay.trade.wap.pay（手机网站支付） **//*
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        *//** 设置业务参数  **//*
        AlipayTradePagePayModel model = new AlipayTradePagePayModel();

        *//** 商户订单号,商户自定义，需保证在商户端不重复，如：20200612000001 **//*
        model.setOutTradeNo("20200612000001");

        *//** 销售产品码,固定值：FAST_INSTANT_TRADE_PAY **//*
        model.setProductCode("FAST_INSTANT_TRADE_PAY");

        *//** 订单标题 **//*
        model.setSubject("订单标题");

        *//** 订单金额，精确到小数点后两位 **//*
        model.setTotalAmount("0.01");

        *//** 订单描述 **//*
        model.setBody("订单描述");

        *//** 业务扩展参数 **//*
        //ExtendParams extendParams = new ExtendParams();

        *//** 系统商编号，填写服务商的PID，返佣参数传值前提：传值账号需要签约返佣协议，用于isv商户。 **//*
        //extendParams.setSysServiceProviderId("2088511****07846");

        *//** 花呗分期参数，传值前提：必须有该接口花呗收款准入条件，且需签约花呗分期 **//*
        *//** 指定可选期数，只支持3/6/12期，还款期数越长手续费越高 **//*
        // extendParams.setHbFqNum("3");

        *//** 指定花呗分期手续费承担方式，手续费可以由用户全承担（该值为0），也可以商户全承担（该值为100），但不可以共同承担，即不可取0和100外的其他值。 **//*
        //extendParams.setHbFqSellerPercent("0");

        //model.setExtendParams(extendParams);

        *//** 将业务参数传至request中 **//*
        alipayRequest.setBizModel(model);

        *//** 注：支付结果以异步通知为准，不能以同步返回为准，因为如果实际支付成功，但因为外力因素，如断网、断电等导致页面没有跳转，则无法接收到同步通知；**//*
        *//** 同步通知地址，以http或者https开头，支付完成后跳转的地址，用于用户视觉感知支付已成功，传值外网可以访问的地址，如果同步未跳转可参考该文档进行确认：https://opensupport.alipay.com/support/helpcenter/193/201602474937 **//*
        alipayRequest.setReturnUrl("");

        *//** 异步通知地址，以http或者https开头的，商户外网可以post访问的异步地址，用于接收支付宝返回的支付结果，如果未收到该通知可参考该文档进行确认：https://opensupport.alipay.com/support/helpcenter/193/201602475759 **//*
        alipayRequest.setNotifyUrl("");

        *//**第三方调用（服务商模式），传值app_auth_token后，会收款至授权app_auth_token对应商家账号，如何获传值app_auth_token请参考文档：https://opensupport.alipay.com/support/helpcenter/79/201602494631 **//*
        //alipayRequest.putOtherTextParam("app_auth_token", "传入获取到的app_auth_token值");

        String form = null;
        try {

            *//** 调用SDK生成表单form表单 **//*
            form = alipayClient.pageExecute(alipayRequest).getBody();

            *//** 调用SDK生成支付链接，可在浏览器打开链接进入支付页面 **//*
            //form = alipayClient.pageExecute(alipayRequest,"GET").getBody();

        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        *//** 获取接口调用结果，如果调用失败，可根据返回错误信息到该文档寻找排查方案：https://opensupport.alipay.com/support/helpcenter/93 **//*
        System.out.println(form);
        response.setContentType("text/html;charset=" + "utf-8");

        *//** 直接将完整的表单html输出到页面 **//*
        response.getWriter().write(form);
        response.getWriter().flush();
    }*/



    private void eviction(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("xxxxxxxxxxxxxxxxxxxx");
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String id=request.getParameter("id");
        String cid=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        us.eviction(id);
        List<Cart> shoporders=us.findallshoporder(cid,flag);
        List<Product> productcartList2=new ArrayList<Product>();
        int ordercount=us.getCountorder(cid,flag);
        Product product=null;
        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/user_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updaterentday(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String id=request.getParameter("id");
        String cid=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        us.updaterentday(id);
        List<Cart> shoporders=us.findallshoporder(cid,flag);
        List<Product> productcartList2=new ArrayList<Product>();
        int ordercount=us.getCountorder(cid,flag);
        Product product=null;
        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/user_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void selectusercenterorder(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String cid=request.getParameter("cid");
        String flag=request.getParameter("flag");
        List<Cart> shoporders=us.findallshoporder(cid,flag);
        List<Product> productcartList2=new ArrayList<Product>();
        int ordercount=us.getCountorder(cid,flag);
        Product product=null;
        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/usercenter.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/usercenter.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void selectorder(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String cid=request.getParameter("cid");
        String flag=request.getParameter("flag");
        String orderflagstr=request.getParameter("orderflag");
        int orderflag=Integer.parseInt(orderflagstr);


        if(orderflag==0)
        {
            List<Cart> shoporders=us.findallshoporder(cid,flag);
            List<Product> productcartList2=new ArrayList<Product>();
            int ordercount=us.getCountorder(cid,flag);
            Product product=null;
            if (shoporders==null)
            {
                request.getSession().setAttribute("productcartList2", productcartList2);
                request.getSession().setAttribute("ordercount",ordercount);
                try {
                    response.sendRedirect(request.getContextPath()+"/user_order.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {
                for (Cart c : shoporders) {
                    String pid2 = c.getPid();
                    product = us.findProductByPid(pid2);
                    product.setBuynum(c.getBuynum());
                    product.setIs_pay(c.getIs_pay());
                    product.setIs_get(c.getIs_get());
                    product.setIs_rent(c.getIs_rent());
                    product.setId(c.getId());
                    product.setIs_deliver(c.getIs_deliver());
                    product.setRentday(c.getRentday());
                    product.setIs_eviction(c.getIs_eviction());
                    productcartList2.add(product);
                }
            }
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }


        else if (orderflag==3)
        {

            List<Cart> shoporders=us.findallnogetorder(cid,flag);
            List<Product> productcartList2=new ArrayList<Product>();
            Product product=null;
            if (shoporders==null)
            {
                request.getSession().setAttribute("productcartList2", productcartList2);
                try {
                    response.sendRedirect(request.getContextPath()+"/user_order.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {
                for (Cart c : shoporders) {
                    String pid2 = c.getPid();
                    product = us.findProductByPid(pid2);
                    product.setBuynum(c.getBuynum());
                    product.setIs_pay(c.getIs_pay());
                    product.setIs_get(c.getIs_get());
                    product.setIs_rent(c.getIs_rent());
                    product.setId(c.getId());
                    product.setIs_deliver(c.getIs_deliver());
                    product.setRentday(c.getRentday());
                    product.setIs_eviction(c.getIs_eviction());
                    productcartList2.add(product);
                }
            }
            request.getSession().setAttribute("productcartList2", productcartList2);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        else if(orderflag==1)
        {
            System.out.println("11111");
            List<Cart> shoporders=us.findallnopayorder(cid,flag);
            List<Product> productcartList2=new ArrayList<Product>();
            Product product=null;
            if (shoporders==null)
            {
                request.getSession().setAttribute("productcartList2", productcartList2);
                try {
                    response.sendRedirect(request.getContextPath()+"/user_order.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {
                for (Cart c : shoporders) {
                    String pid2 = c.getPid();
                    product = us.findProductByPid(pid2);
                    product.setBuynum(c.getBuynum());
                    product.setIs_pay(c.getIs_pay());
                    product.setIs_get(c.getIs_get());
                    product.setIs_rent(c.getIs_rent());
                    product.setId(c.getId());
                    product.setIs_deliver(c.getIs_deliver());
                    product.setRentday(c.getRentday());
                    product.setIs_eviction(c.getIs_eviction());
                    productcartList2.add(product);
                }
            }
            request.getSession().setAttribute("productcartList2", productcartList2);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }


        else if(orderflag==5)
        {
            List<Cart> shoporders=us.findallSuccessfultransactions(cid,flag);
            List<Product> productcartList2=new ArrayList<Product>();
            Product product=null;
            if (shoporders==null)
            {
                request.getSession().setAttribute("productcartList2", productcartList2);
                try {
                    response.sendRedirect(request.getContextPath()+"/user_order.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {
                for (Cart c : shoporders) {
                    String pid2 = c.getPid();
                    product = us.findProductByPid(pid2);
                    product.setBuynum(c.getBuynum());
                    product.setIs_pay(c.getIs_pay());
                    product.setIs_get(c.getIs_get());
                    product.setIs_rent(c.getIs_rent());
                    product.setId(c.getId());
                    product.setIs_deliver(c.getIs_deliver());
                    product.setRentday(c.getRentday());
                    product.setIs_eviction(c.getIs_eviction());
                    productcartList2.add(product);
                }
            }
            request.getSession().setAttribute("productcartList2", productcartList2);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void deleteorder(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String id=request.getParameter("id");
        String loginAct=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        us.deleteorder(id);
        double totalprice=0;
        double totalnum=0;
        double totalrentprice=0;
        int ordercount=us.getCountorder(loginAct,flag);
        List<Cart> shopcarts=us.findallshopcar(loginAct,flag);
        List<Cart> shoporders=us.findallshoporder(loginAct,flag);
        List<Product> productcartList=new ArrayList<Product>();
        List<Product> productcartList2=new ArrayList<Product>();
        Product product=null;
        if (shopcarts==null)
        {
            request.getSession().setAttribute("productcartList", productcartList);
           /* try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            /*index(request,response);*/
        }
        else {
            for (Cart c : shopcarts) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                totalnum = totalnum + c.getBuynum();
                totalprice = totalprice + c.getBuynum() * product.getPrice();
                totalrentprice = totalrentprice + c.getBuynum() * product.getRent();
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList.add(product);
            }
        }

        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList", productcartList);
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("totalcartprice",totalprice);
        request.getSession().setAttribute("totalcartnum",totalnum);
        request.getSession().setAttribute("totalrentprice",totalrentprice);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/user_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void productorderent(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String loginAct=request.getParameter("loginAct");
        String pid=request.getParameter("pid");
        String flag=request.getParameter("flag");
        String id=request.getParameter("id");
      /*  us.productconfirmorderrent(loginAct,pid,flag);*/
        us.productconfirmorderrent2(id);
        double totalprice=0;
        double totalnum=0;
        double totalrentprice=0;
        int ordercount=us.getCountorder(loginAct,flag);
        List<Cart> shopcarts=us.findallshopcar(loginAct,flag);
        List<Cart> shoporders=us.findallshoporder(loginAct,flag);
        List<Product> productcartList=new ArrayList<Product>();
        List<Product> productcartList2=new ArrayList<Product>();
        Product product=null;
        if (shopcarts==null)
        {
            request.getSession().setAttribute("productcartList", productcartList);
           /* try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            /*index(request,response);*/
        }
        else {
            for (Cart c : shopcarts) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                totalnum = totalnum + c.getBuynum();
                totalprice = totalprice + c.getBuynum() * product.getPrice();
                totalrentprice = totalrentprice + c.getBuynum() * product.getRent();
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList.add(product);
            }
        }

        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList", productcartList);
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("totalcartprice",totalprice);
        request.getSession().setAttribute("totalcartnum",totalnum);
        request.getSession().setAttribute("totalrentprice",totalrentprice);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/user_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void productget(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String loginAct=request.getParameter("loginAct");
        String pid=request.getParameter("pid");
        String flag=request.getParameter("flag");
        String id=request.getParameter("id");
       /* us.productget(loginAct,pid,flag);*/
        us.productget2(id);
        double totalprice=0;
        double totalnum=0;
        double totalrentprice=0;
        int ordercount=us.getCountorder(loginAct,flag);
        List<Cart> shopcarts=us.findallshopcar(loginAct,flag);
        List<Cart> shoporders=us.findallshoporder(loginAct,flag);
        List<Product> productcartList=new ArrayList<Product>();
        List<Product> productcartList2=new ArrayList<Product>();
        Product product=null;
        if (shopcarts==null)
        {
            request.getSession().setAttribute("productcartList", productcartList);
           /* try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            /*index(request,response);*/
        }
        else {
            for (Cart c : shopcarts) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                totalnum = totalnum + c.getBuynum();
                totalprice = totalprice + c.getBuynum() * product.getPrice();
                totalrentprice = totalrentprice + c.getBuynum() * product.getRent();
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList.add(product);
            }
        }

        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList", productcartList);
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("totalcartprice",totalprice);
        request.getSession().setAttribute("totalcartnum",totalnum);
        request.getSession().setAttribute("totalrentprice",totalrentprice);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/user_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void productorder(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入订单界面");
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String loginAct=request.getParameter("loginAct");
        String pid=request.getParameter("pid");
        String flag=request.getParameter("flag");
        String id=request.getParameter("id");
      /*  us.productconfirmorder(loginAct,pid,flag);*/
        us.productconfirmorder2(id);
        /*us.productconfirmorder(loginAct,pid,flag);*/
        System.out.println(id);
        double totalprice=0;
        double totalnum=0;
        double totalrentprice=0;
        int ordercount=us.getCountorder(loginAct,flag);
        List<Cart> shopcarts=us.findallshopcar(loginAct,flag);
        List<Cart> shoporders=us.findallshoporder(loginAct,flag);
        List<Product> productcartList=new ArrayList<Product>();
        List<Product> productcartList2=new ArrayList<Product>();
        Product product=null;
        if (shopcarts==null)
        {
            request.getSession().setAttribute("productcartList", productcartList);
           /* try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            /*index(request,response);*/
        }
        else {
            for (Cart c : shopcarts) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                totalnum = totalnum + c.getBuynum();
                totalprice = totalprice + c.getBuynum() * product.getPrice();
                totalrentprice = totalrentprice + c.getBuynum() * product.getRent();
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList.add(product);
            }
        }

        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/user_order.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid2 = c.getPid();
                product = us.findProductByPid(pid2);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }
        request.getSession().setAttribute("productcartList", productcartList);
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("totalcartprice",totalprice);
        request.getSession().setAttribute("totalcartnum",totalnum);
        request.getSession().setAttribute("totalrentprice",totalrentprice);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/user_order.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void productsearch(HttpServletRequest request, HttpServletResponse response) {

        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String keyword=request.getParameter("keyword");
        String currentPageStr=request.getParameter("currentPage");
        if (currentPageStr==null)
        {
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);
        int currentCount=16;
        PageBean pageBean=us.findProductByKeyword(keyword,currentPage,currentCount);
        request.getSession().setAttribute("pageProductBean",pageBean);
        request.setAttribute("keyword",keyword);
        try {
            request.getRequestDispatcher("/product_lists.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showproductlists(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        //获得cid
        String cid=request.getParameter("cid");
        String currentPageStr=request.getParameter("currentPage");
        if (currentPageStr==null)
        {
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);
        int currentCount=16;
        PageBean pageBean=us.findProductByCid(cid,currentPage,currentCount);
        request.getSession().setAttribute("pageProductBean",pageBean);
        request.getSession().setAttribute("productcid",cid);
        try {
            request.getRequestDispatcher("/product_lists.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showcart(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String cid=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        double totalprice=0;
        double totalnum=0;
        double totalrentprice=0;
        int ordercount=us.getCountorder(cid,flag);
        List<Cart> shopcarts=us.findallshopcar(cid,flag);
        List<Cart> shoporders=us.findallshoporder(cid,flag);
        List<Product> productcartList=new ArrayList<Product>();
        List<Product> productcartList2=new ArrayList<Product>();
        Product product=null;
        if (shopcarts==null)
        {
            request.getSession().setAttribute("productcartList", productcartList);
           /* try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            /*index(request,response);*/
        }
        else {
            for (Cart c : shopcarts) {
                String pid = c.getPid();
                product = us.findProductByPid(pid);
                totalnum = totalnum + c.getBuynum();
                totalprice = totalprice + c.getBuynum() * product.getPrice();
                totalrentprice = totalrentprice + c.getBuynum() * product.getRent();
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList.add(product);
            }
        }
        if (shoporders==null)
        {
            request.getSession().setAttribute("productcartList2", productcartList2);
            request.getSession().setAttribute("ordercount",ordercount);
            try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            for (Cart c : shoporders) {
                String pid = c.getPid();
                product = us.findProductByPid(pid);
                product.setBuynum(c.getBuynum());
                product.setIs_pay(c.getIs_pay());
                product.setIs_get(c.getIs_get());
                product.setIs_rent(c.getIs_rent());
                product.setId(c.getId());
                product.setIs_deliver(c.getIs_deliver());
                product.setRentday(c.getRentday());
                product.setIs_eviction(c.getIs_eviction());
                productcartList2.add(product);
            }
        }

        request.getSession().setAttribute("productcartList", productcartList);
        request.getSession().setAttribute("productcartList2", productcartList2);
        request.getSession().setAttribute("totalcartprice",totalprice);
        request.getSession().setAttribute("totalcartnum",totalnum);
        request.getSession().setAttribute("totalrentprice",totalrentprice);
        request.getSession().setAttribute("ordercount",ordercount);
        try {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void cart(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String pid=request.getParameter("pid");
        String cid=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        String buyNumstr=request.getParameter("buyNum");
        int buyNum=Integer.parseInt(buyNumstr);
        Cart cart1=new Cart();
        Cart cart=us.selectcart(pid,cid,flag);
        if(cart!=null)
        {
            us.updatecart(cart.getId(),buyNum+cart.getBuynum());
        }
         else
        {
            cart1.setBuynum(buyNum);
            cart1.setCid(cid);
            cart1.setId(CommonsUtils.getUUid());
            cart1.setPid(pid);
            cart1.setFlag(flag);
            us.addcart(cart1);
        }
        showcart(request,response);

    }

    private void deletecollect(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String pid=request.getParameter("pid");
        String loginAct=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        us.deletecollect(pid,loginAct,flag);
        showcollect(request,response);
    }

    private void showcollect(HttpServletRequest request, HttpServletResponse response) {
        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null)
        {
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);
        int currentCount=4;
        int index=(currentPage-1)*currentCount;
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String loginAct=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
       /* List<Collect> collectProductList=us.findcollectProductList(loginAct,flag);*/
        List<Collect> collectProductList=us.findcollectProductList1(loginAct,flag,index,currentCount);
        List<Product> productList=new ArrayList<Product>();
        int totalcount=us.getCount(loginAct,flag);
        PageBean<Product> pageBean=new PageBean<Product>();
        Product product=null;
        for (Collect c:collectProductList)
        {

             String pid=c.getPid();
             product=us.findProductByPid(pid);
             productList.add(product);

        }
        int totalPage=(int) Math.ceil(1.0*totalcount/currentCount);
        pageBean.setList(productList);
        pageBean.setTotalcount(totalcount);
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        pageBean.setTotalPage(totalPage);
    /*    request.getSession().setAttribute("productList",productList);*/
        request.getSession().setAttribute("pageBean", pageBean);
        try {
            response.sendRedirect(request.getContextPath()+"/user_collect.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void collect(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        Collect collect=new Collect();
        String pid=request.getParameter("pid");
        String loginAct=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        collect.setPid(pid);
        collect.setLoginAct(loginAct);
        collect.setFlag(flag);
        collect.setId(CommonsUtils.getUUid());
        Collect collect1=us.selectcollect(pid,loginAct,flag);
        if (collect1==null) {
            us.savecollect(collect);
        }
        Product product= us.findProductByPid(pid);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("/product_info.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void productinfo(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        //获得商品PID
        String pid=request.getParameter("pid");
        Product product= us.findProductByPid(pid);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("/product_info.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        //准备商品显示---list<product>
        List<Product> newProductList=us.findNewProductList();
        List<Product> saleProductList=us.findSaleProductList();
        List<Product> grouProductList=us.findGrouProductList();
        List<Product> essenceProductList=us.findEssenceProductList();
        List<Product> fastProductList=us.findFastProductList();
        List<Category> categoryList=us.findAllcategory();
        request.getSession().setAttribute("newProductList",newProductList);
        request.getSession().setAttribute("saleProductList",saleProductList);
        request.getSession().setAttribute("grouProductList",grouProductList);
        request.getSession().setAttribute("essenceroductList",essenceProductList);
        request.getSession().setAttribute("fastProductList",fastProductList);
        request.getSession().setAttribute("categoryList",categoryList);
        try {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
