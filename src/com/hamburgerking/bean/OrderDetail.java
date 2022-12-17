package com.hamburgerking.bean;

public class OrderDetail {
    private int oid;
    private int gid;
    private String name;
    private int nums;
    private double price;
    private double totalPrice;
    private String image;
    private String description;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int gid, String name, int nums, double price, double totalPrice, String image, String description) {
        this.oid = oid;
        this.gid = gid;
        this.name = name;
        this.nums = nums;
        this.price = price;
        this.totalPrice = totalPrice;
        this.image = image;
        this.description = description;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNums() {
        return nums;
    }

    public void setNums(int nums) {
        this.nums = nums;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "oid=" + oid +
                ", nums=" + nums +
                ", price=" + price +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
