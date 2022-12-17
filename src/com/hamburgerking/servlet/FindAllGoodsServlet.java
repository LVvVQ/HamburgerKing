package com.hamburgerking.servlet;

import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.Page;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/findAllGoodsServlet")
public class FindAllGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("utf-8");

        //获取参数
        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页行数
        String keyWord = req.getParameter("keyWord");//查询关键字

        //查询内容为空 查询全部记录
        if(keyWord == null){
            keyWord = "";
        }

        //如果current、rows为空, 那就初始化为第一页和一页显示5行记录
        if (currentPage == null || "".equals(currentPage) ) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "12";
        }

        //调用service查询
        GoodsService service = new GoodsServiceImpl();
        Page<Good> page = service.findGoodsByPage(currentPage,rows,keyWord);

        //将Page存入request域
        req.setAttribute("page",page);
        //将keyWord存入request域
        req.setAttribute("keyWord",keyWord);

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
