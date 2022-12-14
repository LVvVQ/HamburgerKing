package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.dao.impl.CommentsDAOImpl;
import com.hamburgerking.service.CommentsService;

import java.util.ArrayList;

public class CommentsServiceImpl implements CommentsService {
    private CommentsDAO commentsDAO=new CommentsDAOImpl();

    @Override
    public ArrayList<Comment> findOneGoodComment(int gid) {//用户评论+管理员评论
        ArrayList<Comment> a1=new ArrayList<Comment>();
        a1.addAll(commentsDAO.findOneGoodComment(gid));
        a1.addAll(commentsDAO.findManagerGoodComment(gid));
        return a1;
    }


}
