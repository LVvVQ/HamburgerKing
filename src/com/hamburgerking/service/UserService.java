package com.hamburgerking.service;

import com.hamburgerking.bean.User;

public interface UserService {
    /**
     * 查找用户是否存在
     * @param user
     * @return
     */
    public User searchUser(User user);

    public boolean addUser(User user);

    public boolean shopping(int uid, double price);
}
