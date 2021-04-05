package com.toolers.shop.settings.service.impl;


import com.toolers.shop.exception.RegisterException;
import com.toolers.shop.settings.dao.UserDao;
import com.toolers.shop.settings.domain.User;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.service.UserService;
import com.toolers.shop.settings.vo.AddressBean;
import com.toolers.shop.untils.SqlSessionUtil;

import javax.security.auth.login.LoginException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {

    private UserDao userDao=SqlSessionUtil.getSqlSession().getMapper(UserDao.class);



    public User login(String loginAct, String loginPwd) throws LoginException {

        Map<String,String> map=new HashMap<String,String>();
        map.put("loginAct",loginAct);
        map.put("loginPwd",loginPwd);
        User user =  userDao.login(map);
        if(user==null)
        {
            throw new LoginException("账号密码错误");
        }



        return user;
    }

    public User register(String registerAct, String registerPwd)  throws RegisterException {

        Map<String,String> map=new HashMap<String,String>();
        map.put("registerAct",registerAct);
        map.put("registerPwd",registerPwd);

        User user=userDao.registerSelect(registerAct);

        if (user!=null)
        {
            throw new RegisterException("账号已存在");
        }
        user=userDao.register(map);
        return user;
    }

    public User userinfo(User user) {

         userDao.userinfo(user);
         User user1= userDao.selectuserinfo(user);


        return user1;
    }

    public User userheadportrait(User user) {

        userDao. userheadportrait(user);
        User user1=userDao. selectuserheadportrait(user);
        return user1;
    }

    public void useraddress(UserAddress userAddress) {
        userDao.useraddress(userAddress);
    }


    public AddressBean finduseraddress(String loginAct) {

        //封装一个 AddressBean返回给web
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=userDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
         List<UserAddress> list=userDao.finduseraddress(loginAct,index,currentCount);

         addressBean.setList(list);

        return addressBean;
    }

    public AddressBean useraddress(UserAddress userAddress, String loginAct) {
        userDao.useraddress(userAddress);
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=userDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=userDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;

    }

    public AddressBean deleteuseraddress(String aid, String loginAct) {


        userDao.deleteuseraddress(aid);
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=userDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=userDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;
    }

    public AddressBean updateuseraddress(UserAddress userAddress, String loginAct) {

        userDao.updateuseraddress(userAddress);
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=userDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=userDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;

    }

}
