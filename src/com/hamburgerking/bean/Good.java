package com.hamburgerking.bean;

public class Good {
    private int gid;
    private String gname;
    private double price;
    private String image;
    private int stock;
    private String description;

    public Good() {
    }

    public Good(int gid, String gname, double price, String image, int stock, String description) {
        this.gid = gid;
        this.gname = gname;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.description = description;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Good{" +
                "gid=" + gid +
                ", gname='" + gname + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", stock=" + stock +
                ", description='" + description + '\'' +
                '}';
    }
}
