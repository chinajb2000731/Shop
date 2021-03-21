package com.toolers.shop.settings.service;

import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.vo.PageBean;

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

    Cart selectcart(String pid, String cid, String flag);

    void updatecart(String id, int i);

    void addcart(Cart cart);

    List<Cart> findallshopcar(String cid, String flag);

    PageBean findProductByCid(String cid,int currentPage,int currentCount);

    PageBean findProductByKeyword(String keyword, int currentPage, int currentCount);

    List<Cart> findallshoporder(String cid, String flag);

    void productconfirmorder(String loginAct, String pid, String flag);

    void productconfirmorderrent(String loginAct, String pid, String flag);

    void productget(String loginAct, String pid, String flag);

    void deleteorder(String id);

    int getCountorder(String cid, String flag);

    List<Cart> findallnogetorder(String cid, String flag);

    List<Cart> findallnopayorder(String cid, String flag);

    List<Cart> findallSuccessfultransactions(String cid, String flag);

    void updaterentday(String id);

    void eviction(String id);
}
