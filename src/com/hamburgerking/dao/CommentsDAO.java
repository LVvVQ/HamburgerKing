package com.hamburgerking.dao;

import com.hamburgerking.bean.Comment;

import java.util.ArrayList;


public interface CommentsDAO {

    public ArrayList<Comment> findOneGoodComment(int gid);
    public ArrayList<Comment> findManagerGoodComment(int gid);
    public boolean deleteComments(int cid);
    public boolean deleteGoodOfComments(int gid);
    public int checkGoodOfComment(int gid);
}
