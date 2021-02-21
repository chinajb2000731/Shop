package com.toolers.shop.settings.dao;

import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Product;

import java.util.List;

public interface ProductDao {
    List<Product> findNewProductList();

    List<Product> findSaleProductList();

    List<Product> findGroProductList();

    List<Product> findEssenceProductList();

    List<Product> findFastProductList();

    List<Category> findAllcategory();

    Product findProductByPid(String pid);
}
