package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Good;
import com.hamburgerking.dao.GoodsDao;
import com.hamburgerking.util.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GoodsDaoImpl implements GoodsDao {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ArrayList<Good> goods = new ArrayList<>();
    Good good;

    /**
     * 查询所有商品
     * @return 包含所有商品的集合
     */
    @Override
    public ArrayList<Good> findAllGoods() {
        try {
            conn = JDBCUtils.getConnection();
            String sql = "select * from goods";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            goods.clear();

            //将查询结果集封装成good对象, 添加到goods集合中返回
            while(rs.next()) {
                good = new Good();
                good.setGid(rs.getInt("gid"));
                good.setGname(rs.getString("gname"));
                good.setPrice(rs.getDouble("price"));
                good.setImage(rs.getString("image"));
                good.setStock(rs.getInt("stock"));
                good.setDescription(rs.getString("description"));
                goods.add(good);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, stmt, conn);
        }
        return goods;
    }
}
