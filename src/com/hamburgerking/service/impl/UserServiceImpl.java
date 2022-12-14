package com.hamburgerking.service.impl;

import com.hamburgerking.bean.User;
import com.hamburgerking.dao.UserDao;
import com.hamburgerking.dao.impl.UserDaoImpl;
import com.hamburgerking.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User searchUser(User user) {
        return userDao.searchUser(user);
    }

    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public boolean shopping(int uid, double price) {
        return userDao.reduceBalance(uid, price);
    }
}
