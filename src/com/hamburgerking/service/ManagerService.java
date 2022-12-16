package com.hamburgerking.service;

import com.hamburgerking.bean.Manager;

public interface ManagerService {
    /**
     * 查找管理员是否存在
     * @param manager
     * @return
     */
    public boolean searchManger(Manager manager);
}
