package com.hamburgerking.servlet;

import com.hamburgerking.bean.OrderDetail;
import com.hamburgerking.bean.Page;
import com.hamburgerking.service.OrderService;
import com.hamburgerking.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/searchOrderDetailByPageServlet")
public class SearchOrderDetailByPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int oid = Integer.parseInt(req.getParameter("oid"));
        OrderService orderService = new OrderServiceImpl();

        //从前端jsp页面获取参数currentPage(当前页码)和rows(一页显示的行数)
        String _currentPage = req.getParameter("currentPage");
        String _rows = req.getParameter("rows");

        //如果current、rows为空, 那就初始化为第一页和一页显示5行记录, 避免下面从字符串转为int时候出现空指针异常
        if (_currentPage == null || "".equals(_currentPage)) {
            _currentPage = "1";
        }

        if (_rows == null || "".equals(_rows)) {
            _rows = "5";
        }
        String keyword = req.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }

        //将currentPage、rows从字符串转为int
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        Page<OrderDetail> page = orderService.searchOrderDetailByGoodName(keyword, currentPage, rows, oid);
        req.setAttribute("oid", oid);
        req.setAttribute("keyword", keyword);
        req.setAttribute("page", page);
        req.getRequestDispatcher("orderDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
