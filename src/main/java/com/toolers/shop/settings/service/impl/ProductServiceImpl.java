package com.toolers.shop.settings.service.impl;

import com.toolers.shop.settings.dao.ProductDao;
import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;
import com.toolers.shop.settings.service.ProductService;
import com.toolers.shop.settings.vo.PageBean;
import com.toolers.shop.untils.SqlSessionUtil;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    //private ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);

    public List<Product> findNewProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> newProductList=productDao.findNewProductList();
        return newProductList;

    }

    public List<Product> findSaleProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> saleProductList=productDao.findSaleProductList();
        return saleProductList;
    }

    public List<Product> findGrouProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> groProductList=productDao.findGroProductList();
        return groProductList;
    }

    public List<Product> findEssenceProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> essenceProductList=productDao.findEssenceProductList();
        return essenceProductList;
    }

    public List<Product> findFastProductList() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Product> fastProductList=productDao.findFastProductList();
        return fastProductList;
    }

    public List<Category> findAllcategory() {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Category> categoryList=productDao.findAllcategory();
        return categoryList;
    }

    public Product findProductByPid(String pid) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        Product product=productDao.findProductByPid(pid);
        return product;
    }

    public void savecollect(Collect collect) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        productDao.savecollect(collect);
    }

    public Collect selectcollect(String pid, String loginAct, String flag) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        Collect collect=productDao.selectcollect(pid,loginAct,flag);
        return collect;
    }

    public List<Collect> findcollectProductList(String loginAct, String flag) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Collect> findcollectProductList=productDao.findcollectProdictList(loginAct,flag);
        return findcollectProductList;
    }

    public int getCount(String loginAct, String flag) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        int totalcount=0;
        totalcount= productDao.getCount(loginAct,flag);
        return totalcount;
    }

    public List<Collect> findcollectProductList1(String loginAct, String flag, int index, int currentCount) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Collect> findcollectProductList=productDao.findcollectProdictList1(loginAct,flag,index,currentCount);
        return findcollectProductList;
    }

    public void deletecollect(String pid, String loginAct, String flag) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        productDao.deletecollect(pid,loginAct,flag);

    }

    public Cart selectcart(String pid, String cid, String flag) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        Cart cart=productDao.selectcart(pid,cid,flag);
        return cart;
    }

    public void updatecart(String id, int i) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        productDao.updatecart(id,i);
    }

    public void addcart(Cart cart) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        productDao.addcart(cart);
    }

    public List<Cart> findallshopcar(String cid, String flag) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        List<Cart> shopcarts=productDao.findallshopcar(cid,flag);
        return shopcarts;
    }

    public PageBean findProductByCid(String cid,int currentPage,int currentCount) {
        ProductDao productDao=SqlSessionUtil.getSqlSession().getMapper(ProductDao.class);
        PageBean<Product> pageBean=new PageBean<Product>();


        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalCount=productDao.getProudcutCount(cid);
        pageBean.setTotalcount(totalCount);
        int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        int index=(currentPage-1)*currentCount;
        List<Product> list= productDao.findProductByPage(cid,index,currentCount);
        pageBean.setList(list);
        return pageBean;
    }

}
