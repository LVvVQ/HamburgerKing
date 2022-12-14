package com.hamburgerking.servlet;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Good;
import com.hamburgerking.service.CommentsService;
import com.hamburgerking.service.impl.CommentsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/findOneCommentServlet")//前台检索
public class FindOneCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CommentsService service=new CommentsServiceImpl();
        int gid=Integer.parseInt(req.getParameter("gid"));//获取前台数据转换成int
        //将参数传给前台
        ArrayList<Comment> comments=service.findOneGoodComment(gid);
        req.setAttribute("comments",comments);//items
        req.getRequestDispatcher("viewComment.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
