package com.toolers.shop.settings.service;

import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;

import java.util.List;

public interface ProductService {
    List<Product> findNewProductList();

    List<Product> findSaleProductList();

    List<Product> findGrouProductList();

    List<Product> findEssenceProductList();

    List<Product> findFastProductList();

    List<Category> findAllcategory();

    Product findProductByPid(String pid);

    void savecollect(Collect collect);

    Collect selectcollect(String pid, String loginAct, String flag);

    List<Collect> findcollectProductList(String loginAct, String flag);

    int getCount(String loginAct, String flag);

    List<Collect> findcollectProductList1(String loginAct, String flag, int index, int currentCount);

    void deletecollect(String pid, String loginAct, String flag);
}
