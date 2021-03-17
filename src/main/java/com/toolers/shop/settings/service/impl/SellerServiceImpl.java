package com.toolers.shop.settings.service.impl;

import com.toolers.shop.exception.RegisterException;
import com.toolers.shop.settings.dao.SellerDao;
import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.domain.Seller;
import com.toolers.shop.settings.domain.UserAddress;
import com.toolers.shop.settings.service.SellerService;
import com.toolers.shop.settings.vo.AddressBean;
import com.toolers.shop.settings.vo.PageBean;
import com.toolers.shop.untils.SqlSessionUtil;

import javax.security.auth.login.LoginException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SellerServiceImpl implements SellerService {

   /* private SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);*/

    public Seller register(Seller seller) throws RegisterException{

        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        Seller seller1=sellerDao.registerSelect(seller);
        if (seller1!=null)
        {
            throw new RegisterException("账号以存在");
        }
        seller1=sellerDao.register(seller);
        return seller1;
    }

    public Seller login(String loginAct, String loginPwd) throws LoginException{
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        Map<String,String> map=new HashMap<String,String>();
        map.put("loginAct",loginAct);
        map.put("loginPwd",loginPwd);
        Seller seller =  sellerDao.login(map);
        if(seller==null)
        {
            throw new LoginException("账号密码错误");
        }
        return seller;
    }

    public Seller sellerinfo(Seller seller) {

        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.sellerinfo(seller);
        Seller seller1=sellerDao.selectsellerinfo(seller);
        return seller1;
    }

    public Seller sellerheadportrait(Seller seller) {

        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.sellerheadportrait(seller);
        Seller seller1=sellerDao. selectsellerheadportrait(seller);
        return seller1;
    }

    public AddressBean useraddress(UserAddress userAddress, String loginAct) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.useraddress(userAddress);
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=sellerDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=sellerDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;


    }

    public AddressBean findselleraddress(String loginAct) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        //封装一个 AddressBean返回给web
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=sellerDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=sellerDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;
    }

    public AddressBean deleteselleraddress(String aid, String loginAct) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.deleteselleraddress(aid);
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=sellerDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=sellerDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;
    }

    public AddressBean updateselleraddress(UserAddress userAddress, String loginAct) {

        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.updateselleraddress(userAddress);
        AddressBean<UserAddress> addressBean=new AddressBean<UserAddress>();
        int currentPage=1;
        int currentCount=15;
        //封装当前页
        addressBean.setCurrentPage(currentPage);
        //封装每页显示条数
        addressBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount=sellerDao.getCount(loginAct);
        addressBean.setTotalcount(totalCount);
        //封装总页数
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        addressBean.setTotalPage(totalPage);
        //当前页显示的数据
        //当前页与起始索引index的关系
        int index=(currentPage-1)*currentCount;
        List<UserAddress> list=sellerDao.finduseraddress(loginAct,index,currentCount);

        addressBean.setList(list);

        return addressBean;
    }

    public PageBean selectcheckproduct(String sid, int currentPage, int currentCount) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        PageBean<Product> pageBean=new PageBean<Product>();

        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalCount=sellerDao.getProudcutCount(sid);
        pageBean.setTotalcount(totalCount);
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        int index=(currentPage-1)*currentCount;
        List<Product> list= sellerDao.selectcheckproduct(sid,index,currentCount);
        pageBean.setList(list);
        return pageBean;
    }

    public void onsellproduct(String sid, String pid,String sellflag) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.onsellproduct(sid,pid,sellflag);
    }

    public void deletesellproduct(String sid, String pid) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.deletesellproduct(sid,pid);
    }

    public void addsellproduct(Product product) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.addsellproduct(product);
    }

    public List<Cart> selectsellerorder(String sid) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        List<Cart> cartList=sellerDao.selectsellerorder(sid);

        return cartList;
    }

    public Product findProductByPid(String pid2) {

        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        Product product=sellerDao.findProductByPid(pid2);
        return product;
    }

    public void sellconfirmdeliver(String id) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.sellconfirmdeliver(id);
    }

    public List<Cart> selectsellerordernodeliver(String sid) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        List<Cart> cartList=sellerDao.selectsellerordernodeliver(sid);
        return cartList;
    }

    public List<Cart> selectsellonget(String sid) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        List<Cart> cartList=sellerDao.selectsellonget(sid);
        return cartList;
    }

    public List<Cart> selectsellordercomplete(String sid) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        List<Cart> cartList=sellerDao.selectsellordercomplete(sid);
        return cartList;
    }

    public void setproductinventory(String sid, String pid, String inventory) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        sellerDao.setproductinventory(sid,pid,inventory);
    }



    /*public List<Product> selectcheckproduct(String sid,int index,int currentCount) {
        SellerDao sellerDao=SqlSessionUtil.getSqlSession().getMapper(SellerDao.class);
        List<Product> productList=sellerDao.selectcheckproduct(sid,index,currentCount);
        return productList;
    }*/

}
