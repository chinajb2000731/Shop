package com.toolers.shop.settings.service;

import com.toolers.shop.settings.domain.Product;

import java.util.List;

public interface ProductService {
    List<Product> findNewProductList();

    List<Product> findSaleProductList();
}
