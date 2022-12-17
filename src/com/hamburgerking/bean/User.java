package com.hamburgerking.bean;

public class User {
    private int uid;
    private String username;
    private String password;
    private double balance;
    private String avatar;

    public User(int uid, String username, String password, double balance, String avatar) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.balance = balance;
        this.avatar = avatar;
    }

    public User() {
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", balance=" + balance +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
