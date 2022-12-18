package com.hamburgerking.servlet;

import com.hamburgerking.bean.ResultInfo;
import com.hamburgerking.service.OrderService;
import com.hamburgerking.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delOneOrderDetailByIdServlet")
public class DelOneOrderDetailByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int did = Integer.parseInt(req.getParameter("did"));
        int oid = Integer.parseInt(req.getParameter("oid"));

        OrderService orderService = new OrderServiceImpl();
        boolean flag = orderService.delOneOrderDetailById(did);
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setFlag(flag);
        if (flag) {
            resultInfo.setMsg("删除成功");
        } else {
            resultInfo.setMsg("删除失败");
        }
        req.setAttribute("resultInfo", resultInfo);
        req.getRequestDispatcher("/searchOrderDetailByPageServlet?oid="+oid).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
