package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.dao.impl.CommentsDAOImpl;
import com.hamburgerking.service.CommentsService;

import java.util.ArrayList;

public class CommentsServiceImpl implements CommentsService {
    private CommentsDAO commentsDAO=new CommentsDAOImpl();

    @Override//显示评论功能
    public ArrayList<Comment> findOneGoodComment(int gid) {//用户评论+管理员评论
        ArrayList<Comment> a1=new ArrayList<Comment>();
        a1.addAll(commentsDAO.findOneGoodComment(gid));
        a1.addAll(commentsDAO.findManagerGoodComment(gid));
        return a1;
    }
    //删除单个评论
    public boolean deleteComment(String cid) {
        return commentsDAO.deleteComments(Integer.parseInt(cid));
    }
    //删除多个评论
    public void deleteComments(String[] cids) {
        //设置返回值
        boolean flag = false;
        //遍历数组
        for(String cid : cids){
            //调用删除单个评论
            commentsDAO.deleteComments(Integer.parseInt(cid));
        }
    }

}
