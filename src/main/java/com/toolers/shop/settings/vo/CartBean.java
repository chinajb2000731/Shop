package com.toolers.shop.settings.vo;

import com.toolers.shop.settings.domain.Product;

public class CartBean {
    private  int buynum;
    private Product product;

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
