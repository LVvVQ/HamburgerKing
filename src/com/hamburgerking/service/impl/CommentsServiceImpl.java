package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.Page;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.dao.impl.CommentsDAOImpl;
import com.hamburgerking.service.CommentsService;

import java.util.ArrayList;
import java.util.List;

public class CommentsServiceImpl implements CommentsService {
    private CommentsDAO commentsDAO=new CommentsDAOImpl();

    @Override//显示评论功能
    public ArrayList<Comment> findOneGoodComment(int gid) {//用户评论+管理员评论
        ArrayList<Comment> a1=new ArrayList<Comment>();
        a1.addAll(commentsDAO.findOneGoodComment(gid));
        a1.addAll(commentsDAO.findManagerGoodComment(gid));
        return a1;
    }
    /**
     * 根据分页查找订单
     * @param currentPage 当前页码
     * @param rows 一页显示的行数
     * @return 存储Order类型的Page对象
     */
    @Override
    public Page<Comment> findOrderByPage(int gid, int currentPage, int rows) {
        //实例化一个Page对象, 之后返回给Servlet层
        Page<Comment> page = new Page<>();
        //将Servlet层传过来的currentPage(当前页码)赋值给page的currentPage属性
        page.setCurrentPage(currentPage);

        //调用findTotalCount方法来获取所有订单的数量
        int totalCount = commentsDAO.findTotalCount(gid);
        //设置page的总记录数属性
        page.setTotalCount(totalCount);
        //从第几条记录开始 假设请求的是第三页,一页显示5条记录, 所以start就为15,也就是稍后从数据库中的第15条开始查询5条记录
        int start = (currentPage - 1) * rows;
        //调用findByPage查找从第start条开始的rows条订单信息
        List<Comment> comments = commentsDAO.findByPage(gid,start, rows);
        //将返回的订单信息存储到page中的list集合中
        page.setList(comments);

        //总页数 = 所有的记录数/一页显示的行数,  除的尽就是刚好能显示完所有, 除不尽就多加一页显示
        int totalPage = (totalCount % rows) == 0 ? totalCount / rows : (totalCount / rows) + 1;
        //设置page的总页数属性
        page.setTotalPage(totalPage);

        return page;
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

    /**
     * 删除商品的同时删除所有评论
     * @param gid 商品号
     * @return 是否删除成功
     */
    public boolean deleteGoodOfComments(String gid){
        if (commentsDAO.checkGoodOfComment(Integer.parseInt(gid))==0)
            return true;
        return commentsDAO.deleteGoodOfComments(Integer.parseInt(gid));
    }
}
