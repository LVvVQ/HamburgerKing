package com.hamburgerking.dao;

import com.hamburgerking.bean.Comment;

import java.util.ArrayList;


public interface CommentsDAO {
    /**
     *显示评论
     * @return
     */
    //public ArrayList<Comment> ShowComment(int gid);
    //public boolean bossinsertcomment();
    public ArrayList<Comment> findOneGoodComment(int gid);
    public ArrayList<Comment> findManagerGoodComment(int gid);
}
