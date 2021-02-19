package com.toolers.shop.settings.dao;

import com.toolers.shop.settings.domain.User;
import com.toolers.shop.settings.domain.UserAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {

    User login(Map<String, String> map);

    User registerSelect(String s);

    User register(Map<String,String> map);


    void userinfo(User u);

    User selectuserinfo(User user);

    void userheadportrait(User user);

    User selectuserheadportrait(User user);

    void useraddress(UserAddress userAddress);

    int getCount(String loginAct);



     List<UserAddress> finduseraddress(@Param("loginAct") String loginAct, @Param("index")int index, @Param("currentCount")int currentCount);

    void deleteuseraddress(String aid);

    void updateuseraddress(UserAddress userAddress);









    /*List<UserAddress> finduseraddress(AddressBean addressBean1);*/
}
