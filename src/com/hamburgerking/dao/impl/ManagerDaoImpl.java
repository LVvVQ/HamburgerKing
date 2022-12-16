package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.Manager;
import com.hamburgerking.dao.ManagerDao;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;

public class ManagerDaoImpl implements ManagerDao {
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<Manager> goods = new ArrayList<>();
    Manager manager;
    /**
     * 查找管理员是否存在
     * @param manager
     * @return
     */
    @Override
    public boolean searchManager(Manager manager) {
        String sql = "select * from managers where managername = ? and password = ?";
        try{
           conn = JDBCUtils.getConnection();
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1,manager.getManagername());
           pstmt.setString(2,manager.getPassword());
           rs = pstmt.executeQuery();
           if(rs.next()){
               return true;
           }
        }catch (SQLException e){
            System.out.println("searchManager发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(rs,pstmt,conn);
        }
        return false;
    }
}
