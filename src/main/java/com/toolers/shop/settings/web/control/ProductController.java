package com.toolers.shop.settings.web.control;

import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.settings.service.impl.ProductServiceImpl;
import com.toolers.shop.untils.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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








    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        ProductService us=(ProductService) ServiceFactory.getService(new ProductServiceImpl());
        //准备商品显示---list<product>
        List<Product> newProductList=us.findNewProductList();
        List<Product> saleProductList=us.findSaleProductList();
        List<Product> grouProductList=us.findGrouProductList();
        List<Product> essenceProductList=us.findEssenceProductList();
        List<Product> fastProductList=us.findFastProductList();
        request.setAttribute("newProductList",newProductList);
        request.setAttribute("saleProductList",saleProductList);
        request.setAttribute("grouProductList",grouProductList);
        request.setAttribute("essenceroductList",essenceProductList);
        request.setAttribute("fastProductList",fastProductList);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
