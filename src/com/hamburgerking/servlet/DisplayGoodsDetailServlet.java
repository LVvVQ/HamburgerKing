package com.hamburgerking.servlet;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.Page;
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

@WebServlet("/displayGoodsDetailServlet")
public class DisplayGoodsDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("utf-8");

        //获取参数
        String gid = req.getParameter("gid");

        //调用service方法
        GoodsService service = new GoodsServiceImpl();
        Good good = service.searchGoodsById(gid);

        //将good存入request域
        req.setAttribute("good",good);

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
        //gid= String.valueOf(Integer.parseInt(gid));
        CommentsService Commentsservice=new CommentsServiceImpl();
        Page<Comment> page = Commentsservice.findOrderByPage(Integer.parseInt(gid),currentPage, rows);

        //将page对象传入到request域中
        req.setAttribute("page", page);
        req.setAttribute("gid", gid);
        req.getRequestDispatcher("goodsDetail.jsp").forward(req,resp);


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
