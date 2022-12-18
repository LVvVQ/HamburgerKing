package com.hamburgerking.servlet;

import com.hamburgerking.bean.OrderDetail;
import com.hamburgerking.bean.ResultInfo;
import com.hamburgerking.bean.User;
import com.hamburgerking.service.OrderService;
import com.hamburgerking.service.UserService;
import com.hamburgerking.service.impl.OrderServiceImpl;
import com.hamburgerking.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/createOrderServlet")
public class CreateOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        double allGoodsTotalPrice = Double.parseDouble(session.getAttribute("allGoodsTotalPrice").toString());
        List<OrderDetail> shopCart = (List<OrderDetail>)session.getAttribute("shopCart");
        UserService userService = new UserServiceImpl();
        OrderService orderService = new OrderServiceImpl();
        ResultInfo resultInfo = new ResultInfo();
        boolean shoppingIsSuccess = userService.shopping(uid, allGoodsTotalPrice);

        if (shoppingIsSuccess) {
            resultInfo.setMsg("结算成功");
            orderService.createOrder(uid, shopCart, 1);
        } else {
            orderService.createOrder(uid, shopCart, 0);
            resultInfo.setMsg("账户余额不足, 已生成订单");
        }
        shopCart.clear();
        allGoodsTotalPrice = 0;

        session.setAttribute("allGoodsTotalPrice", allGoodsTotalPrice);
        session.setAttribute("shopCart", shopCart);
        req.setAttribute("resultInfo", resultInfo);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
