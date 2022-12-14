package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
public class CommentsDAOImpl implements CommentsDAO {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    private PreparedStatement pstmt = null;
    private String sql;
    private ArrayList<Comment> comments = new ArrayList<>();

    //@Override
    public ArrayList<Comment> findOneGoodComment(int gid) {//显示用户评论
        sql="SELECT cid,users.uid,gid,users.username, date,content,avatar from comments , users " +
                "where comments.uid = users.uid and gid = ?";
        try {
            conn=JDBCUtils.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, gid);
            rs= pstmt.executeQuery();//保存查询结果
            comments.clear();
                while(rs.next()) {//访问已经查询的内容
                    Comment comment=new Comment();
                    comment.setCid(rs.getInt("cid"));
                    comment.setUid(rs.getInt("uid"));
                    comment.setGid(rs.getInt("gid"));
                    comment.setUsername(rs.getString("username"));
                    comment.setDate(rs.getString("date"));
                    comment.setContent(rs.getString("content"));
                    comment.setAvatar(rs.getString("avatar"));
                    comments.add(comment);
                }
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return comments;
    }
    public ArrayList<Comment> findManagerGoodComment(int gid) {//显示管理员评论
        sql="SELECT cid,managers.mid,gid,managers.managername, date,content,avatar from comments ," +
                "managers where comments.mid = managers.mid and gid = ?";
        try {
            conn=JDBCUtils.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, gid);
            rs= pstmt.executeQuery();//保存查询结果
            comments.clear();
            while(rs.next()) {//访问已经查询的内容
                Comment comment=new Comment();
                comment.setCid(rs.getInt("cid"));
                comment.setMid(rs.getInt("mid"));
                comment.setGid(rs.getInt("gid"));
                comment.setManagername(rs.getString("managername"));
                comment.setDate(rs.getString("date"));
                comment.setContent(rs.getString("content"));
                comment.setAvatar(rs.getString("avatar"));
                //comm.setGid(rs.getInt("Gid"));
                comments.add(comment);
            }
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return comments;
    }
}
