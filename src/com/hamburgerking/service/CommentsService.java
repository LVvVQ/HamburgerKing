package com.hamburgerking.service;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.Page;

import java.util.ArrayList;

public interface CommentsService {
    public ArrayList<Comment> findOneGoodComment(int gid);
    public void deleteComments(String[] cid);
    public boolean deleteComment(String cid);
    public boolean deleteGoodOfComments(String gid);
    public Page<Comment> findOrderByPage(int gid, int currentPage, int rows);
}
