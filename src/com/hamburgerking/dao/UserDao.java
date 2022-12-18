package com.hamburgerking.dao;

import com.hamburgerking.bean.User;


public interface UserDao {

    /**
     * 查找用户是否存在
     * @param user
     * @return
     */
    public User searchUser(User user);

    /**
     * 增加用户
     * @param user
     * @return
     */
    public boolean addUser(User user);

    public boolean reduceBalance(int uid, double price);
}
