package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.OrderDetail;
import com.hamburgerking.dao.OrderDao;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    public int findTotalCount(int uid) {
        try {
            String sql = "select count(*) as countOrders from orders where uid = ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
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
                order.setDate(rs.getString("date"));
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
    public List<Order> findByPage(int start, int rows, int uid) {
        try {
            //两表连接查询获取需要的订单数据，然后根据oid排序, limit之后设置从第start条记录开始, 查rows条
            String sql = "select oid, users.uid, username, status, date, nums, totalprice " +
                    "from orders join users " +
                    "on orders.uid = users.uid " +
                    "where orders.uid = ? " +
                    "order by status, date desc " +
                    "limit ?, ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
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
                order.setDate(rs.getString("date"));
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
                order.setDate(rs.getString("date"));
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

    @Override
    public boolean delOneOrderById(int oid) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "delete from orders where oid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oid);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(pstmt, conn);
        }

        return false;
    }

    @Override
    public int insertOrder(Order order) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "insert into Orders(uid, status, date, nums, totalPrice) values(?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, order.getUid());
            pstmt.setInt(2, order.getStatus());

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
            pstmt.setString(3, simpleDateFormat.format(new Date()));
            pstmt.setInt(4, order.getNums());
            pstmt.setDouble(5, order.getTotalPrice());
            pstmt.executeUpdate();
            String sql2 = "select last_insert_id() as oid";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql2);
            rs.next();
            return rs.getInt("oid");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, stmt, conn);
            JDBCUtils.close(pstmt, conn);
        }

        return -1;
    }

    @Override
    public boolean insertOrderDetail(int oid, OrderDetail orderDetail) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "insert into orderdetails(oid, gid, nums, price, totalprice, image, description) values (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oid);
            pstmt.setInt(2, orderDetail.getGid());
            pstmt.setInt(3, orderDetail.getNums());
            pstmt.setDouble(4, orderDetail.getPrice());
            pstmt.setDouble(5, orderDetail.getTotalPrice());
            pstmt.setString(6, orderDetail.getImage());
            pstmt.setString(7, orderDetail.getDescription());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(pstmt, conn);
        }

        return false;
    }

    @Override
    public Order findOrderByOid(int oid) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "select * from orders where oid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oid);
            rs = pstmt.executeQuery();
            Order order = new Order();
            while (rs.next()) {
                order.setOid(rs.getInt("oid"));
                order.setUid(rs.getInt("uid"));
                order.setStatus(rs.getInt("status"));
                order.setDate(rs.getString("date"));
                order.setNums(rs.getInt("nums"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
            }
            return order;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return null;
    }

    @Override
    public boolean changeStatus(int oid, int status) {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "update orders set status = ? where oid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, status);
            pstmt.setInt(2, oid);
            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(pstmt, conn);
        }
        return false;
    }
}
