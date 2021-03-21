package com.toolers.shop.settings.domain;

public class Cart {
    private  String id;
    private  String pid;
    private  String cid;
    private  int buynum;
    private  String flag;
    private  String is_pay;
    private  String is_get;
    private  String is_rent;
    private String  is_deliver;
    private  int rentday;
    private  String is_eviction;
    private  Product product;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getIs_pay() {
        return is_pay;
    }

    public void setIs_pay(String is_pay) {
        this.is_pay = is_pay;
    }

    public String getIs_get() {
        return is_get;
    }

    public void setIs_get(String is_get) {
        this.is_get = is_get;
    }

    public String getIs_rent() {
        return is_rent;
    }

    public void setIs_rent(String is_rent) {
        this.is_rent = is_rent;
    }

    public String getIs_deliver() {
        return is_deliver;
    }

    public void setIs_deliver(String is_deliver) {
        this.is_deliver = is_deliver;
    }

    public int getRentday() {
        return rentday;
    }

    public void setRentday(int rentday) {
        this.rentday = rentday;
    }

    public String getIs_eviction() {
        return is_eviction;
    }

    public void setIs_eviction(String is_eviction) {
        this.is_eviction = is_eviction;
    }
}
