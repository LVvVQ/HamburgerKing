package com.hamburgerking.dao.impl;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.util.JDBCUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CommentsDaoImpl implements CommentsDAO {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    private PreparedStatement pstmt = null;
    private String sql;
    private ArrayList<Comment> comments = new ArrayList<>();

    //老板插入数据
    public boolean ManagerInsertComment(Comment comment){//老板插入数据
        boolean result=false;
        sql="insert into comments(gid,date,content,mid)values(?,?,?,?)";
        try {
            conn=JDBCUtils.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getGid());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            pstmt.setString(2, simpleDateFormat.format(new Date()));
            pstmt.setString(3, comment.getContent());
            pstmt.setInt(4,comment.getMid());
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
        sql="insert into comments(gid,date,content,uid)values(?,?,?,?)";
        try {
            conn=JDBCUtils.getConnection();
            System.out.println("用户插入");
            System.out.println("comment"+comment.getUid());
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getGid());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            pstmt.setString(2, simpleDateFormat.format(new Date()));
            pstmt.setString(3, comment.getContent());
            pstmt.setInt(4,comment.getUid());
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
            JDBCUtils.close(pstmt,conn);
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
            JDBCUtils.close(pstmt,conn);
        }
        return false;
    }

    /**
     * 判断一个商品有多少评论
     * @param gid
     * @return 评论数量
     */
    public int checkGoodOfComment(int gid){
        int a = 0;
        try {
            conn=JDBCUtils.getConnection();
            sql="SELECT COUNT(*) FROM comments,goods WHERE comments.gid=goods.gid and goods.gid=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, gid);
            rs= pstmt.executeQuery();
            rs.next();
            a=rs.getInt(1);
            return a;
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return a;
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
                comments.add(comment);
            }
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return comments;
    }

    /**
     * 分页查询所有商品
     * @param start
     * @param rows
     * @return
     */
    @Override
    public List<Comment> findByPage(int gid,int start, int rows) {

        try {
            //两表连接查询获取需要的订单数据，然后根据oid排序, limit之后设置从第start条记录开始, 查rows条
            String sql = "SELECT cid,users.uid,gid,username, date,content,users.avatar  AS useravatar, " +
                    "managers.mid,managername,managers.avatar as manageravatar " +
                    "FROM  comments                         " +
                    "LEFT JOIN users ON users.uid=comments.uid " +
                    "left JOIN managers ON managers.mid=comments.mid " +
                    "WHERE gid=? limit ? , ?";
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, gid);
            pstmt.setInt(2, start);
            pstmt.setInt(3, rows);
            rs = pstmt.executeQuery();
            comments.clear();
            while (rs.next()) {
                Comment comment=new Comment();
                comment.setCid(rs.getInt("cid"));
                comment.setUid(rs.getInt("uid"));
                comment.setGid(rs.getInt("gid"));
                comment.setUsername(rs.getString("username"));
                comment.setDate(rs.getString("date"));
                comment.setContent(rs.getString("content"));
                comment.setAvatar(rs.getString("useravatar"));
                comment.setMid(rs.getInt("mid"));
                comment.setManagername(rs.getString("managername"));
                comment.setAvatar2(rs.getString("manageravatar"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return comments;
    }

    /**
     * 查询一共有多少订单
     * @return 总订单量
     */
    @Override
    public int findTotalCount(int gid) {
        try {
            String sql = "select count(*) as countComments from comments where gid=?";
            conn = JDBCUtils.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            rs.next();
            int totalCount = rs.getInt(1);
            return totalCount;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, pstmt, conn);
        }
        return 0;
    }
}
