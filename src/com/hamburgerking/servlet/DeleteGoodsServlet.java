package com.hamburgerking.servlet;

import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteGoodsServlet")
public class DeleteGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取选中的gid
        String[] goodIds = req.getParameterValues("goodId");//获取传入的goodId值

        //调用service删除
        GoodsService service = new GoodsServiceImpl();
        service.deleteSearchGoods(goodIds);

        //跳转至searchGoodServlet查询所有商品
        req.getRequestDispatcher("searchGoodsByPageServlet").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
