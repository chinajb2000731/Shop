package com.toolers.shop.settings.service;

import com.toolers.shop.exception.RegisterException;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.domain.Seller;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.vo.AddressBean;
import com.toolers.shop.settings.vo.PageBean;

import javax.security.auth.login.LoginException;

public interface SellerService {
    Seller register(Seller seller) throws RegisterException;

    Seller login(String loginAct, String loginPwd)throws LoginException;

    Seller sellerinfo(Seller seller);

    Seller sellerheadportrait(Seller seller);

    AddressBean useraddress(UserAddress userAddress, String loginAct);

    AddressBean findselleraddress(String loginAct);

    AddressBean deleteselleraddress(String aid, String loginAct);

    AddressBean updateselleraddress(UserAddress userAddress, String loginAct);

    PageBean selectcheckproduct(String sid, int currentPage, int currentCount);

    void onsellproduct(String sid, String pid,String sellflag);

    void deletesellproduct(String sid, String pid);

    void addsellproduct(Product product);

    /*List<Product> selectcheckproduct(String sid,int index,int currentCount);*/
}
