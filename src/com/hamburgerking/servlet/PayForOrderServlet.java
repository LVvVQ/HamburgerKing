package com.hamburgerking.servlet;

import com.hamburgerking.bean.Order;
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

@WebServlet("/payForOrderServlet")
public class PayForOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        int oid = Integer.parseInt(req.getParameter("oid"));
        OrderService orderService = new OrderServiceImpl();
        Order order = orderService.findOrderByOid(oid);
        UserService userService = new UserServiceImpl();
        boolean shoppingIsSuccess = userService.shopping(user.getUid(), order.getTotalPrice());
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setFlag(shoppingIsSuccess);
        if (shoppingIsSuccess) {
            orderService.changeStatus(oid, 1);
            resultInfo.setMsg("支付成功");
        } else {
            resultInfo.setMsg("支付失败, 账户余额不足");
        }
        req.setAttribute("resultInfo", resultInfo);
        req.getRequestDispatcher("checkMyOrderServlet").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
