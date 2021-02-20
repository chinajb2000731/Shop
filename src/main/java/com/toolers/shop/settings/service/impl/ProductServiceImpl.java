package com.toolers.shop.settings.service.impl;

import com.toolers.shop.settings.dao.ProductDao;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.untils.SqlSessionUtil;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    //private ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);

    public List<Product> findNewProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> newProductList=productDao.findNewProductList();
        return newProductList;

    }

    public List<Product> findSaleProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> saleProductList=productDao.findSaleProductList();
        return saleProductList;
    }

    public List<Product> findGrouProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> groProductList=productDao.findGroProductList();
        return groProductList;
    }

    public List<Product> findEssenceProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> essenceProductList=productDao.findEssenceProductList();
        return essenceProductList;
    }

    public List<Product> findFastProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> fastProductList=productDao.findFastProductList();
        return fastProductList;
    }
}
