package com.hamburgerking.servlet;

import com.hamburgerking.bean.Good;
import com.hamburgerking.service.GoodsService;
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

        //返回到GoodsDetail.jsp
        req.getRequestDispatcher("goodsDetail.jsp").forward(req,resp);


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
