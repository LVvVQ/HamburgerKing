package com.hamburgerking.servlet;

import com.hamburgerking.service.CommentsService;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.CommentsServiceImpl;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/DeleteOneCommentServlet")
public class DeleteOneCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取gid
        String id = req.getParameter("cid");

        //调用service删除

        CommentsService service = new CommentsServiceImpl();
        service.deleteComment(id);
        //跳转至searchGoodServlet查询所有商品
        req.getRequestDispatcher("searchCommentServlet").forward(req,resp);
    }
}
