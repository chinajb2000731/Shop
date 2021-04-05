package com.toolers.shop.settings.service;

import com.toolers.shop.exception.RegisterException;
import com.toolers.shop.settings.domain.*;
import com.toolers.shop.settings.vo.AddressBean;
import com.toolers.shop.settings.vo.PageBean;

import javax.security.auth.login.LoginException;
import java.util.List;

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

    List<Cart> selectsellerorder(String sid);

    Product findProductByPid(String pid2);

    void sellconfirmdeliver(String id);

    List<Cart> selectsellerordernodeliver(String sid);

    List<Cart> selectsellonget(String sid);

    List<Cart> selectsellordercomplete(String sid);

    void setproductinventory(String sid, String pid, String inventory);

    void adddeliveryaddress(SellerDelivery sellerDelivery);

    List<SellerDelivery> selectdeliveryaddress(String sid);

    int selectdeliverycount(String sid);

    void deletedeliveryaddress(String id);

    void updatedeliveryaddress(SellerDelivery sellerDelivery);

    void updateeviction(String id);

    void sellshop(Shop shop);

    List<Shop> selectsellershop(String sid);

    int getshoptotalcount(String sid);

    int getonshoptotalcount(String sid);



    /*List<Product> selectcheckproduct(String sid,int index,int currentCount);*/
}
