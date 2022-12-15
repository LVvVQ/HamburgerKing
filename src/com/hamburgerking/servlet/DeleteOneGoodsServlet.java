package com.hamburgerking.servlet;

import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteOneGoodsServlet")
public class DeleteOneGoodsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取gid
        String id = req.getParameter("gid");

        //调用service删除
        GoodsService service = new GoodsServiceImpl();
        service.deleteGoods(id);

        //跳转至searchGoodServlet查询所有商品
        req.getRequestDispatcher("searchGoodServlet").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
