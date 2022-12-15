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

    //老板插入数据
    public boolean ManagerInsertComment(Comment comment){//老板插入数据
        boolean result=false;
        Date date =new Date();
        SimpleDateFormat f=new SimpleDateFormat("yy-MM-dd HH:mm");//
        comment.setDate(f.format(date));
        sql="insert into comment(gid,date,content,mid)values(?,?,?,?)";
        try {
            conn=JDBCUtils.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getGid());
            pstmt.setString(2, comment.getDate());
            pstmt.setString(3, comment.getContent());
            pstmt.setInt(4,comment.getMid());
            System.out.print(sql);
            int flag=pstmt.executeUpdate();
            if(flag>0) {
                result=true;
            }
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(pstmt, conn);
        }
        return result;
    }
    //用户插入数据
    public boolean UserInsertComment(Comment comment){//用户插入数据
        boolean result=false;
        Date date =new Date();
        SimpleDateFormat f=new SimpleDateFormat("yy-MM-dd HH:mm");//
        comment.setDate(f.format(date));
        sql="insert into comment(gid,date,content,uid)values(?,?,?,?)";
        try {
            conn=JDBCUtils.getConnection();
            System.out.println("用户插入");
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getGid());
            pstmt.setString(2, comment.getDate());
            pstmt.setString(3, comment.getContent());
            pstmt.setInt(4,comment.getUid());
            System.out.print(sql);
            int flag=pstmt.executeUpdate();
            if(flag>0) {
                result=true;
            }
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(pstmt, conn);
            System.out.println("用户插入释放");
        }
        return result;
    }
    //删除评论
    public boolean deleteComments(int cid) {//删除评论
        try{
            conn = JDBCUtils.getConnection();
            String sql = "delete from comments where cid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cid);
            if(pstmt.executeUpdate() > 0)
                return true;
        }catch (SQLException e){
            System.out.println("deleteComments发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(stmt,conn);
        }
        return false;
    }

    /**
     * 删除商品的同时删除所有评论
     * @param gid 商品号
     * @return 是否删除成功
     */
    public boolean deleteGoodOfComments(int gid){
        try{
            conn = JDBCUtils.getConnection();
            String sql = "delete from comments where gid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,gid);
            if(pstmt.executeUpdate() > 0)
                return true;
        }catch (SQLException e){
            System.out.println("deleteComments发生错误，错误原因: " + e.getMessage());
        }finally {
            JDBCUtils.close(stmt,conn);
        }
        return false;
    }

    //显示用户评论
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
    //显示管理员评论
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
