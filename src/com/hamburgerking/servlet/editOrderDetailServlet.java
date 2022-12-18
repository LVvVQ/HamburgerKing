package com.hamburgerking.servlet;

import com.hamburgerking.bean.OrderDetail;
import com.hamburgerking.bean.ResultInfo;
import com.hamburgerking.service.OrderService;
import com.hamburgerking.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editOrderDetailServlet")
public class editOrderDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDetail orderDetail = new OrderDetail();
        int did = Integer.parseInt(req.getParameter("did"));
        int oid = Integer.parseInt(req.getParameter("oid"));
        orderDetail.setDid(did);
        orderDetail.setOid(oid);
        orderDetail.setGid(Integer.parseInt(req.getParameter("gid")));
        orderDetail.setName(req.getParameter("name"));
        orderDetail.setNums(Integer.parseInt(req.getParameter("nums")));
        orderDetail.setPrice(Double.parseDouble(req.getParameter("price")));
        orderDetail.setDescription(req.getParameter("description"));
        OrderService orderService = new OrderServiceImpl();
        boolean editIsSuccess = orderService.editOrderDetail(orderDetail);
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setFlag(editIsSuccess);
        if (editIsSuccess) {
            resultInfo.setMsg("修改成功");
        } else {
            resultInfo.setMsg("修改失败");
        }
        req.setAttribute("resultInfo", resultInfo);
        req.getRequestDispatcher("/searchOrderDetailByPageServlet?oid="+oid).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
