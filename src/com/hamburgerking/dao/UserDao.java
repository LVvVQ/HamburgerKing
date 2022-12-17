package com.hamburgerking.dao;

import com.hamburgerking.bean.User;

/**
 * 查找用户是否存在
 */
public interface UserDao {
    public User searchUser(User user);
}
