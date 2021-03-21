package com.toolers.shop.settings.dao;

import com.toolers.shop.settings.domain.Cart;
import com.toolers.shop.settings.domain.Category;
import com.toolers.shop.settings.domain.Collect;
import com.toolers.shop.settings.domain.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductDao {
    List<Product> findNewProductList();

    List<Product> findSaleProductList();

    List<Product> findGroProductList();

    List<Product> findEssenceProductList();

    List<Product> findFastProductList();

    List<Category> findAllcategory();

    Product findProductByPid(String pid);

    void savecollect(Collect collect);

    Collect selectcollect(@Param("pid")String pid,@Param("loginAct") String loginAct,@Param("flag") String flag);

    List<Collect> findcollectProdictList(@Param("loginAct")String loginAct,@Param("flag") String flag);

    int getCount(@Param("loginAct")String loginAct,@Param("flag")String flag);

    List<Collect> findcollectProdictList1(@Param("loginAct")String loginAct,@Param("flag")String flag,@Param("index") int index, @Param("currentCount")int currentCount);

    void deletecollect(@Param("pid")String pid,@Param("loginAct")String loginAct,@Param("flag") String flag);

    Cart selectcart(@Param("pid")String pid,@Param("cid") String cid, @Param("flag")String flag);

    void updatecart(@Param("id")String id,@Param("i") int i);

    void addcart(Cart cart);

    List<Cart> findallshopcar(@Param("cid")String cid, @Param("flag")String flag);

    int getProudcutCount(String cid);

    List<Product> findProductByPage(@Param("cid")String cid, @Param("index")int index, @Param("currentCount")int currentCount);

    int getProductCountByKeyword(String keyword);

    List<Product> findProductByKeyword(@Param("keyword")String keyword,@Param("index") int index,@Param("currentCount") int currentCount);

    List<Cart> findallshoporder(@Param("cid")String cid, @Param("flag")String flag);

    void productconfirmorder(@Param("loginAct")String loginAct,@Param("pid") String pid, @Param("flag")String flag);

    void productconfirmorderrent(@Param("loginAct")String loginAct, @Param("pid")String pid,@Param("flag") String flag);

    void productget(@Param("loginAct")String loginAct, @Param("pid")String pid, @Param("flag")String flag);

    void deleteorder(String id);

    int getCountorder(@Param("cid")String cid,@Param("flag") String flag);

    List<Cart> findallnogetorder(@Param("cid")String cid, @Param("flag")String flag);

    List<Cart> findallnopayorder(@Param("cid")String cid, @Param("flag")String flag);

    List<Cart> findallSuccessfultransactions(@Param("cid")String cid,@Param("flag") String flag);

    void updaterentday(String id);

    void eviction(String id);



    /* List<Product> findcollectProductList(@Param("loginAct")String loginAct,@Param("flag") String flag);*/
}
