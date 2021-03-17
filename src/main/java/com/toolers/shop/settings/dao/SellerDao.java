package com.toolers.shop.settings.dao;

import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.domain.Seller;
import com.toolers.shop.settings.domain.UserAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SellerDao {
    Seller registerSelect(Seller seller);

    Seller register(Seller seller);

    Seller login(Map<String,String> map);

    void sellerinfo(Seller seller);

    Seller selectsellerinfo(Seller seller);

    void sellerheadportrait(Seller seller);

    Seller selectsellerheadportrait(Seller seller);

    void useraddress(UserAddress userAddress);

    int getCount(String loginAct);

    List<UserAddress> finduseraddress(@Param("loginAct")String loginAct, @Param("index")int index, @Param("currentCount")int currentCount);

    void deleteselleraddress(String aid);

    void updateselleraddress(UserAddress userAddress);

    List<Product> selectcheckproduct(@Param("sid")String sid, @Param("index")int index, @Param("currentCount")int currentCount);

    int getProudcutCount(String sid);

    void onsellproduct(@Param("sid")String sid,@Param("pid")String pid,@Param("sellflag")String sellflag);

    void deletesellproduct(@Param("sid")String sid,@Param("pid")String pid);

    void addsellproduct(Product product);

    List<Cart> selectsellerorder(String sid);

    Product findProductByPid(String pid2);

    void sellconfirmdeliver(String id);

    List<Cart> selectsellerordernodeliver(String sid);

    List<Cart> selectsellonget(String sid);

    List<Cart> selectsellordercomplete(String sid);

    void setproductinventory(@Param("sid")String sid,@Param("pid")String pid,@Param("inventory")String inventory);




/*
    Seller registerSelect(String registerAct);

    Seller register(Map<String,String> map);*/
}
