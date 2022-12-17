package com.hamburgerking.dao;

import com.hamburgerking.bean.Manager;

public interface ManagerDao {
    /**
     * 查找管理员是否存在
     * @param manager
     * @return
     */
    public Manager searchManager(Manager manager);
}
