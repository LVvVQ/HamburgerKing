package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Manager;
import com.hamburgerking.dao.ManagerDao;
import com.hamburgerking.dao.impl.ManagerDaoImpl;
import com.hamburgerking.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {
    ManagerDao managerDao = new ManagerDaoImpl();
    /**
     * 查找管理员是否存在
     * @param manager
     * @return
     */
    @Override
    public Manager searchManger(Manager manager) {
        return managerDao.searchManager(manager);
    }
}
