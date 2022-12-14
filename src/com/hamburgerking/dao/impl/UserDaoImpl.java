package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.User;
import com.hamburgerking.dao.UserDao;
import com.hamburgerking.service.UserService;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;

public class UserDaoImpl implements UserDao {
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<User> goods = new ArrayList<>();
    User user;

    /**
     * 查找用户是否存在
     * @param user
     * @return
     */
    @Override
    public User searchUser(User user) {
        String sql = "select * from users where username = ? and password = ?";
        try{
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getUsername());
            pstmt.setString(2, user.getPassword());
            rs = pstmt.executeQuery();
            if(rs.next()){
                user.setUid(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setBalance(rs.getDouble(4));
                user.setAvatar(rs.getString(5));
                return user;
            }
        }catch (SQLException e){
            System.out.println("searchUser发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(rs,pstmt,conn);
        }
        return null;
    }

    @Override
    public boolean addUser(User user) {
        String sql = "insert into users (username,password,balance,avatar) values (?,?,?,?)";
        try{
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getUsername());
            pstmt.setString(2,user.getPassword());
            pstmt.setDouble(3,user.getBalance());
            pstmt.setString(4,user.getAvatar());
            if(pstmt.executeUpdate() > 0){
                return true;
            }
        }catch (SQLException e){
            System.out.println("addUser发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(pstmt,conn);
        }
        return false;
    }

    @Override
    public boolean reduceBalance(int uid, double price) {

        try {
            conn = JDBCUtils.getConnection();
            String sql = "update users set balance = balance - ? where uid = ? and balance > ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, price);
            pstmt.setInt(2, uid);
            pstmt.setDouble(3, price);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
