package com.hamburgerking.servlet;

import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.OrderDetail;
import com.hamburgerking.dao.GoodsDao;
import com.hamburgerking.dao.impl.GoodsDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String _gid = req.getParameter("gid");
        String _goodNums = req.getParameter("goodNums");
        int gid;
        if (_gid == null || "".equals(_gid)) {
            resp.sendRedirect("cart.jsp");
            return;
        } else {
            gid = Integer.parseInt(_gid);
        }

        int goodNums;
        if (_goodNums == null || "".equals(_goodNums)) {
            goodNums = 1;
        } else {
            goodNums = Integer.parseInt(_goodNums);
        }

        HttpSession session = req.getSession();
        List<OrderDetail> shopCart = (List<OrderDetail>) session.getAttribute("shopCart");

        boolean hasGood = false;
        if (shopCart == null) {
            shopCart = new ArrayList<>();
        } else {
            for(OrderDetail orderDetail : shopCart) {
                if (orderDetail.getGid() == gid) {
                    hasGood = true;
                    orderDetail.setNums(orderDetail.getNums() + goodNums);
                    orderDetail.setTotalPrice(Double.parseDouble(String.format("%.2f",orderDetail.getPrice() * orderDetail.getNums())));
                }
            }
        }

        if (!hasGood) {
            GoodsDao goodsDao = new GoodsDaoImpl();
            Good good = goodsDao.searchGoodsById(gid);
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setGid(good.getGid());
            orderDetail.setName(good.getGname());
            orderDetail.setPrice(good.getPrice());
            orderDetail.setNums(goodNums);
            orderDetail.setTotalPrice(Double.parseDouble(String.format("%.2f", good.getPrice() * orderDetail.getNums())));
            orderDetail.setImage(good.getImage());
            orderDetail.setDescription(good.getDescription());
            shopCart.add(orderDetail);
        }

        double allGoodsTotalPrice = 0;
        for (OrderDetail orderDetail : shopCart) {
            allGoodsTotalPrice += orderDetail.getTotalPrice();
        }

        session.setAttribute("shopCart", shopCart);
        session.setAttribute("allGoodsTotalPrice", String.format("%.2f", allGoodsTotalPrice));
        resp.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
