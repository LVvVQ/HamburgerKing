package com.hamburgerking.dao;

import com.hamburgerking.bean.Comment;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;


public interface CommentsDAO {

    public ArrayList<Comment> findOneGoodComment(int gid);
    public ArrayList<Comment> findManagerGoodComment(int gid);
    public boolean deleteComments(int cid);
    public boolean deleteGoodOfComments(int gid);
    public int checkGoodOfComment(int gid);



    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @return
     */
    public List<Comment> findByPage(int gid,int start, int rows);
    public int findTotalCount(int gid);
    public boolean ManagerInsertComment(Comment comment);
    public boolean UserInsertComment(Comment comment);
}
