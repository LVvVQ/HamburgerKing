package com.hamburgerking.servlet;

import com.hamburgerking.bean.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/delGoodFromCart")
public class DelGoodFromCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int gid = Integer.parseInt(req.getParameter("gid"));
        HttpSession session = req.getSession();
        List<OrderDetail> shopCart = (List<OrderDetail>) session.getAttribute("shopCart");
        double allGoodsTotalPrice = Double.parseDouble(session.getAttribute("allGoodsTotalPrice").toString());
        for(OrderDetail orderDetail : shopCart) {
            if (orderDetail.getGid() == gid) {
                allGoodsTotalPrice -= orderDetail.getTotalPrice();
            }
        }
        shopCart.removeIf(orderDetail -> orderDetail.getGid() == gid);
        session.setAttribute("allGoodsTotalPrice", String.format("%.2f", allGoodsTotalPrice));
        session.setAttribute("shopCart", shopCart);
        resp.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
