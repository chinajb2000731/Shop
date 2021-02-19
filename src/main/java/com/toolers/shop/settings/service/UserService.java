package com.toolers.shop.settings.service;

import com.toolers.shop.exception.RegisterException;
import com.toolers.shop.settings.domain.User;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.vo.AddressBean;

import javax.security.auth.login.LoginException;

public interface UserService {

    User login(String loginAct, String loginPwd) throws LoginException;

    User register(String registerAct, String registerPwd) throws RegisterException;

    User userinfo(User user);

    User userheadportrait(User user);

   /* void useraddress(UserAddress userAddress);*/

    /*AddressBean finduseraddress(String loginAct);*/

    AddressBean finduseraddress(String loginAct);

    AddressBean useraddress(UserAddress userAddress, String loginAct);

    AddressBean deleteuseraddress(String aid, String loginAct);

    AddressBean updateuseraddress(UserAddress userAddress, String loginAct);
}
