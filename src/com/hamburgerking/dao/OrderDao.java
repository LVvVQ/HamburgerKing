package com.hamburgerking.dao;

import com.hamburgerking.bean.Order;

import java.util.List;

public interface OrderDao {
    /**
     * 查询一共有多少订单
     * @return 总订单量
     */
    int findTotalCount();

    /**
     * 分页查找订单
     * @param start 起始索引
     * @param rows 一页显示的行数
     * @return 订单集合
     */
    List<Order> findByPage(int start, int rows);
}
