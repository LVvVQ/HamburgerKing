package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Good;
import com.hamburgerking.dao.GoodsDao;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;

public class GoodsDaoImpl implements GoodsDao {
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
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

    /**
     * 删除商品
     * @param gid
     * @return
     */
    @Override
    public boolean deleteGoods(int gid) {
        try{
            conn = JDBCUtils.getConnection();
            String sql = "delete from goods where gid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,gid);
            if(pstmt.executeUpdate() > 0)
                return true;
        }catch (SQLException e){
            System.out.println("deleteGoods发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(stmt,conn);
        }
        return false;
    }

    @Override
    public ArrayList<Good> searchGood(String keyWord) {
        try{
            String sql = "select * from goods where gname like ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyWord + "%");
            rs = pstmt.executeQuery();
            goods.clear();

            while (rs.next()){
                good = new Good();
                good.setGid(rs.getInt("gid"));
                good.setGname(rs.getString("gname"));
                good.setPrice(rs.getDouble("price"));
                good.setImage(rs.getString("image"));
                good.setStock(rs.getInt("stock"));
                good.setDescription(rs.getString("description"));
                goods.add(good);
            }
        }catch (SQLException e){
            System.out.println("searchGood发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(pstmt,conn);
        }

        return goods;
    }

    /**
     * 增加商品
     * @param good
     * @return
     */
    @Override
    public boolean insertGood(Good good) {
        String sql = "INSERT INTO goods (gname,price,image,stock,description) values (?,?,?,?,?);";
        try{
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,good.getGname());
            pstmt.setDouble(2,good.getPrice());
            pstmt.setString(3,good.getImage());
            pstmt.setInt(4,good.getStock());
            pstmt.setString(5,good.getDescription());
            if(pstmt.executeUpdate() > 0){
                return true;
            }
        }catch(SQLException e){
            System.out.println("insertGood发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(pstmt,conn);
        }
        return false;
    }

    /**
     * 根据gid查找商品
     * @param gid
     * @return
     */
    @Override
    public Good searchGoodsById(int gid) {
        String sql = "select * from goods where gid = ?";
        try{
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,gid);
            rs = pstmt.executeQuery();
            if(rs.next()){
                Good good = new Good();
                good.setGid(rs.getInt("gid"));
                good.setGname(rs.getString("gname"));
                good.setPrice(rs.getDouble("price"));
                good.setImage(rs.getString("image"));
                good.setStock(rs.getInt("stock"));
                good.setDescription(rs.getString("description"));
                return good;
            }
        }catch (SQLException e){
            System.out.println("searchGoodsById发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(rs,pstmt,conn);
        }
        return null;
    }

    /**
     * 修改商品
     * @param good
     * @return
     */
    @Override
    public boolean updateGoods(Good good) {
       String sql = "update goods set gname = ?, price = ?, image = ?, stock = ?, description = ? where gid = ?";
       try{
           conn = JDBCUtils.getConnection();
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1,good.getGname());
           pstmt.setDouble(2,good.getPrice());
           pstmt.setString(3, good.getImage());
           pstmt.setInt(4,good.getStock());
           pstmt.setString(5, good.getDescription());
           pstmt.setInt(6,good.getGid());
           if(pstmt.executeUpdate() > 0){
               return true;
           }
       }catch (SQLException e){
           System.out.println("updateGoods发生错误，错误原因: " + e.getMessage());
       }finally {
           JDBCUtils.close(pstmt,conn);
       }
       return false;
    }
}
