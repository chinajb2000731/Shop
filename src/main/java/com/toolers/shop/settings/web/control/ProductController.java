package com.toolers.shop.settings.web.control;

import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.settings.service.impl.ProductServiceImpl;
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


    }

    private void showcollect(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入收藏");
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        String loginAct=request.getParameter("loginAct");
        String flag=request.getParameter("flag");
        List<Collect> collectProductList=us.findcollectProductList(loginAct,flag);
        List<Product> productList=new ArrayList<Product>();
        Product product=null;
        for (Collect c:collectProductList)
        {

             String pid=c.getPid();
             product=us.findProductByPid(pid);
             productList.add(product);

        }
        for (Product p:productList)
        {
            System.out.println(p.getPid());
            System.out.println("======");
        }
        request.getSession().setAttribute("productList",productList);
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
        request.setAttribute("newProductList",newProductList);
        request.setAttribute("saleProductList",saleProductList);
        request.setAttribute("grouProductList",grouProductList);
        request.setAttribute("essenceroductList",essenceProductList);
        request.setAttribute("fastProductList",fastProductList);
        request.setAttribute("categoryList",categoryList);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
