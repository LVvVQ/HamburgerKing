package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.Page;
import com.hamburgerking.dao.OrderDao;
import com.hamburgerking.dao.impl.OrderDaoImpl;
import com.hamburgerking.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDaoImpl();

    /**
     * 根据分页查找订单
     * @param currentPage 当前页码
     * @param rows 一页显示的行数
     * @return 存储Order类型的Page对象
     */
    @Override
    public Page<Order> findOrderByPage(int currentPage, int rows) {
        //实例化一个Page对象, 之后返回给Servlet层
        Page<Order> page = new Page<>();
        //将Servlet层传过来的currentPage(当前页码)赋值给page的currentPage属性
        page.setCurrentPage(currentPage);

        //调用findTotalCount方法来获取所有订单的数量
        int totalCount = orderDao.findTotalCount();
        //设置page的总记录数属性
        page.setTotalCount(totalCount);
        //从第几条记录开始 假设请求的是第三页,一页显示5条记录, 所以start就为15,也就是稍后从数据库中的第15条开始查询5条记录
        int start = (currentPage - 1) * rows;
        //调用findByPage查找从第start条开始的rows条订单信息
        List<Order> orders = orderDao.findByPage(start, rows);
        //将返回的订单信息存储到page中的list集合中
        page.setList(orders);

        //总页数 = 所有的记录数/一页显示的行数,  除的尽就是刚好能显示完所有, 除不尽就多加一页显示
        int totalPage = (totalCount % rows) == 0 ? totalCount / rows : (totalCount / rows) + 1;
        //设置page的总页数属性
        page.setTotalPage(totalPage);

        return page;
    }

    @Override
    public Page<Order> searchOrder(String keyword, int currentPage, int rows) {
        Page<Order> page = new Page<>();
        page.setCurrentPage(currentPage);
        //调用findTotalCount方法来获取所有订单的数量
        int totalCount = orderDao.keywordSearchOfTotalCount(keyword);
        //设置page的总记录数属性
        page.setTotalCount(totalCount);
        //从第几条记录开始 假设请求的是第三页,一页显示5条记录, 所以start就为15,也就是稍后从数据库中的第15条开始查询5条记录
        int start = (currentPage - 1) * rows;
        //调用findByPage查找从第start条开始的rows条订单信息
        List<Order> orders = orderDao.searchOrder(keyword, start, rows);
        //将返回的订单信息存储到page中的list集合中
        page.setList(orders);

        //总页数 = 所有的记录数/一页显示的行数,  除的尽就是刚好能显示完所有, 除不尽就多加一页显示
        int totalPage = (totalCount % rows) == 0 ? totalCount / rows : (totalCount / rows) + 1;
        //设置page的总页数属性
        page.setTotalPage(totalPage);

        return page;
    }

    @Override
    public boolean delOneOrderById(int oid) {
        return orderDao.delOneOrderById(oid);
    }
}
