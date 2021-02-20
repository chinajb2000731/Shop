package com.toolers.shop.settings.dao;

import com.toolers.shop.settings.domain.Product;

import java.util.List;

public interface ProductDao {
    List<Product> findNewProductList();

    List<Product> findSaleProductList();
}
