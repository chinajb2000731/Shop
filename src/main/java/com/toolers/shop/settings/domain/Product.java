package com.toolers.shop.settings.domain;

public class Product {

 /*`pid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rent` double(255, 0) NULL DEFAULT NULL,
  `price` double(255, 0) NULL DEFAULT NULL,
  `deposit` double(255, 0) NULL DEFAULT NULL,
  `pimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_new` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL*/
 private  String pid;
 private  String cid;
 private  String sid;
 private  String pname;
 private  double rent;
 private  double price;
 private  double deposit;
 private  String pimage;
 private  String pdesc;
 private  String is_new;
 private  String is_sale;
 private  String is_group;
 private  String is_essence;
 private  String is_fast;
 private  String inventory;
 private  int  buynum;
 private  Category category;
 private  String is_pay;
 private  String is_get;
 private  String is_rent;
 private  String is_deliver;
 private  String id;
 private  String check_flag;
 private  String sell_flag;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public String getIs_new() {
        return is_new;
    }

    public void setIs_new(String is_new) {
        this.is_new = is_new;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getIs_sale() {
        return is_sale;
    }

    public void setIs_sale(String is_sale) {
        this.is_sale = is_sale;
    }

    public String getIs_group() {
        return is_group;
    }

    public void setIs_group(String is_group) {
        this.is_group = is_group;
    }

    public String getIs_essence() {
        return is_essence;
    }

    public void setIs_essence(String is_essence) {
        this.is_essence = is_essence;
    }

    public String getIs_fast() {
        return is_fast;
    }

    public void setIs_fast(String is_fast) {
        this.is_fast = is_fast;
    }

    public String getInventory() {
        return inventory;
    }

    public void setInventory(String inventory) {
        this.inventory = inventory;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCheck_flag() {
        return check_flag;
    }

    public void setCheck_flag(String check_flag) {
        this.check_flag = check_flag;
    }

    public String getSell_flag() {
        return sell_flag;
    }

    public void setSell_flag(String sell_flag) {
        this.sell_flag = sell_flag;
    }

    public String getIs_deliver() {
        return is_deliver;
    }

    public void setIs_deliver(String is_deliver) {
        this.is_deliver = is_deliver;
    }
}
