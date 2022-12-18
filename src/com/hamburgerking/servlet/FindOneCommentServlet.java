package com.hamburgerking.servlet;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.Page;
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
        req.setCharacterEncoding("utf-8");

        //从前端jsp页面获取参数currentPage(当前页码)和rows(一页显示的行数)
        String _currentPage = req.getParameter("currentPage");
        String _rows = req.getParameter("rows");

        //如果current、rows为空, 那就初始化为第一页和一页显示5行记录, 避免下面从字符串转为int时候出现空指针异常
        if (_currentPage == null || "".equals(_currentPage)) {
            _currentPage = "1";
        }

        if (_rows == null || "".equals(_rows)) {
            _rows = "5";
        }

        //将currentPage、rows从字符串转为int
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        int gid=Integer.parseInt(req.getParameter("gid"));
        CommentsService Commentsservice=new CommentsServiceImpl();
        Page<Comment> page = Commentsservice.findOrderByPage(gid,currentPage, rows);

        //将page对象传入到request域中
        req.setAttribute("page", page);
        req.setAttribute("gid", gid);
        req.getRequestDispatcher("viewComment.jsp").forward(req,resp);




        /*CommentsService service=new CommentsServiceImpl();

        int gid=Integer.parseInt(req.getParameter("gid"));//获取前台数据转换成int
        //将参数传给前台
        ArrayList<Comment> comments=service.findOneGoodComment(gid);
        req.setAttribute("comments",comments);//items
        req.getRequestDispatcher("viewComment.jsp").forward(req,resp);*/
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
