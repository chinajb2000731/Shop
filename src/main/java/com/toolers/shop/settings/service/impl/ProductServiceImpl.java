package com.toolers.shop.settings.service.impl;

import com.toolers.shop.settings.dao.ProductDao;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.untils.SqlSessionUtil;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);

    public List<Product> findNewProductList() {

        List<Product> newProductList=productDao.findNewProductList();
        return newProductList;

    }
}
