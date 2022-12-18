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
@WebServlet("/deleteCommentsServlet")
public class DeleteCommentsServlet extends HttpServlet  {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取选中的gid
        String[] commentIds = req.getParameterValues("commentId");//获取传入的goodId值

        //调用service删除
        CommentsService service = new CommentsServiceImpl();
        service.deleteComments(commentIds);

        //跳转至searchGoodServlet查询所有商品
        //findOneCommentServlet
        //req.getRequestDispatcher("findOneCommentServlet").forward(req,resp);
        req.getRequestDispatcher("searchCommentServlet").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
