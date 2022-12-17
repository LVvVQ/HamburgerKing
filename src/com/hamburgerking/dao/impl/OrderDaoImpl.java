package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Order;
import com.hamburgerking.dao.OrderDao;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    private Connection conn = null;
    private Statement stmt = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    ArrayList<Order> orders = new ArrayList<>();

    /**
     * 查询一共有多少订单
     * @return 总订单量
     */
    @Override
    public int findTotalCount() {
        try {
            String sql = "select count(*) as countOrders from orders";
            conn = JDBCUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            rs.next();
            int totalCount = rs.getInt(1);
            return totalCount;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, stmt, conn);
        }
        return 0;
    }

    @Override
    public int keywordSearchOfTotalCount(String keyword) {
        try {
            String sql = "select count(*) from orders where oid like ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            rs.next();
            int totalCount = rs.getInt(1);
            return totalCount;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, stmt, conn);
        }
        return 0;
    }

    /**
     * 分页查找订单
     * @param start 起始索引
     * @param rows 一页显示的行数
     * @return 订单集合
     */
    @Override
    public List<Order> findByPage(int start, int rows) {
        try {
            //两表连接查询获取需要的订单数据，然后根据oid排序, limit之后设置从第start条记录开始, 查rows条
            String sql = "select oid, users.uid, username, status, date, nums, totalprice " +
                    "from orders join users " +
                    "on orders.uid = users.uid " +
                    "order by oid " +
                    "limit ?, ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, rows);
            rs = pstmt.executeQuery();
            orders.clear();
            while (rs.next()) {
                Order order = new Order();
                order.setOid(rs.getInt("oid"));
                order.setUid(rs.getInt("uid"));
                order.setUsername(rs.getString("username"));
                order.setStatus(rs.getInt("status"));
                order.setDate(rs.getDate("date"));
                order.setNums(rs.getInt("nums"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, stmt, conn);
        }
        return orders;
    }

    @Override
    public List<Order> searchOrder(String keyword, int start, int rows) {
        try {
            String sql = "select oid, users.uid, username, status, date, nums, totalprice " +
                    "from orders join users " +
                    "on orders.uid = users.uid " +
                    "where oid like ? " +
                    "order by oid " +
                    "limit ?, ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setInt(2, start);
            pstmt.setInt(3, rows);
            rs = pstmt.executeQuery();
            orders.clear();
            while (rs.next()) {
                Order order = new Order();
                order.setOid(rs.getInt("oid"));
                order.setUid(rs.getInt("uid"));
                order.setUsername(rs.getString("username"));
                order.setStatus(rs.getInt("status"));
                order.setDate(rs.getDate("date"));
                order.setNums(rs.getInt("nums"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return orders;
    }
}
