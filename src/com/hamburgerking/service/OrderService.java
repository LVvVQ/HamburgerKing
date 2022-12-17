package com.hamburgerking.service;

import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.Page;

public interface OrderService {
    /**
     * 根据分页查找订单
     * @param currentPage 当前页码
     * @param rows 一页显示的行数
     * @return 存储Order类型的Page对象
     */
    Page<Order> findOrderByPage(int currentPage, int rows);

    Page<Order> searchOrder(String keyword, int currentPage, int rows);

    boolean delOneOrderById(int oid);
}
