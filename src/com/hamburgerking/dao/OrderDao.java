package com.hamburgerking.dao;

import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.OrderDetail;

import java.util.ArrayList;
import java.util.List;

public interface OrderDao {
    /**
     * 查询一共有多少订单
     * @return 总订单量
     */
    int findTotalCount();
    int findTotalCount(int uid);

    int keywordSearchOfTotalCount(String keyword);

    /**
     * 分页查找订单
     * @param start 起始索引
     * @param rows 一页显示的行数
     * @return 订单集合
     */
    List<Order> findByPage(int start, int rows);
    List<Order> findByPage(int start, int rows, int uid);

    List<Order> searchOrder(String keyword, int start, int rows);

    boolean delOneOrderById(int oid);

    int insertOrder(Order order);

    boolean insertOrderDetail(int oid, OrderDetail orderDetail);

    Order findOrderByOid(int oid);

    boolean changeStatus(int oid, int status);

    boolean delOrderDetailByOid(int oid);
}
