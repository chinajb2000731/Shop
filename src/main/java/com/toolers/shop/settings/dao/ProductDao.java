package com.toolers.shop.settings.dao;

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



    /* List<Product> findcollectProductList(@Param("loginAct")String loginAct,@Param("flag") String flag);*/
}
