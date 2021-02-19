package com.toolers.shop.settings.dao;

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


/*
    Seller registerSelect(String registerAct);

    Seller register(Map<String,String> map);*/
}
