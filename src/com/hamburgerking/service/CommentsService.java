package com.hamburgerking.service;

import com.hamburgerking.bean.Comment;

import java.util.ArrayList;

public interface CommentsService {
    public ArrayList<Comment> findOneGoodComment(int gid);
    public void deleteComments(String[] cid);
    public boolean deleteComment(String cid);
}
