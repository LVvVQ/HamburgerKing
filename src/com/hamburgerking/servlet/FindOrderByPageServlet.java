package com.hamburgerking.servlet;

import com.hamburgerking.bean.Order;
import com.hamburgerking.bean.Page;
import com.hamburgerking.service.OrderService;
import com.hamburgerking.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/findOrderByPageServlet")
public class FindOrderByPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        //将currentPage、rows从字符串转为int
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        OrderService orderService = new OrderServiceImpl();
        //传入currentPage(当前页码)、rows(一页显示的行数)作为参数, 返回一个page对象
        //因为这里需要的是Order的数据,所以将这个Page的泛型初始化为Order类型,这样其中的list属性就可以存储Order类型的数据
        Page<Order> page = orderService.findOrderByPage(currentPage, rows);

        //将page对象传入到request域中
        req.setAttribute("page", page);
        req.getRequestDispatcher("orderManager.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
