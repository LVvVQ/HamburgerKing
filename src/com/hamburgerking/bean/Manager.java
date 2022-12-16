package com.hamburgerking.bean;

public class Manager {
    private int mid;
    private String managername;
    private String password;
    private String avatar;

    public Manager(int mid, String managername, String password, String avatar) {
        this.mid = mid;
        this.managername = managername;
        this.password = password;
        this.avatar = avatar;
    }

    public Manager() {
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "mid=" + mid +
                ", managername='" + managername + '\'' +
                ", password='" + password + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
