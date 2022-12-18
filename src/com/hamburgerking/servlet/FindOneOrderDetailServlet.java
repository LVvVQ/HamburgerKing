package com.hamburgerking.servlet;

import com.hamburgerking.bean.OrderDetail;
import com.hamburgerking.service.OrderService;
import com.hamburgerking.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/findOneOrderDetailServlet")
public class FindOneOrderDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int did = Integer.parseInt(req.getParameter("did"));
        OrderService orderService = new OrderServiceImpl();
        OrderDetail orderDetail = orderService.findOneOrderDetail(did);
        req.setAttribute("orderDetail", orderDetail);
        req.getRequestDispatcher("updateOrderDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
