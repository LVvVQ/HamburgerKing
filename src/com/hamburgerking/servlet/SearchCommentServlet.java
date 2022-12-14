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
import java.util.ArrayList;

@WebServlet("/searchCommentServlet")
public class SearchCommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GoodsService service = new GoodsServiceImpl();
        String keyWord = req.getParameter("searchGoodName");
        if (keyWord == null) {
            keyWord = "";
        }

        ArrayList<Good> goods = service.searchGood(keyWord);
        req.setAttribute("goods",goods);
        req.getRequestDispatcher("commentManager.jsp").forward(req,resp);
    }
}
