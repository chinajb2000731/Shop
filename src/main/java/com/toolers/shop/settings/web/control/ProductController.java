package com.toolers.shop.settings.web.control;

import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.settings.service.impl.ProductServiceImpl;
import com.toolers.shop.settings.vo.PageBean;
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

    }

    private void showproductlists(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入商品列表");
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        //获得cid
        String cid=request.getParameter("cid");
        String currentPageStr=request.getParameter("currentPage");
        if (currentPageStr==null)
        {
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);;
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
        List<Cart> shopcarts=us.findallshopcar(cid,flag);
        List<Product> productcartList=new ArrayList<Product>();
        Product product=null;
        if (shopcarts==null)
        {
            request.getSession().setAttribute("productcartList", productcartList);
            try {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
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
                productcartList.add(product);
            }
        }
        request.getSession().setAttribute("productcartList", productcartList);
        request.getSession().setAttribute("totalcartprice",totalprice);
        request.getSession().setAttribute("totalcartnum",totalnum);
        request.getSession().setAttribute("totalrentprice",totalrentprice);
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
