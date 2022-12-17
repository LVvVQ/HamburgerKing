package com.hamburgerking.servlet;

import com.hamburgerking.bean.Manager;
import com.hamburgerking.service.ManagerService;
import com.hamburgerking.service.impl.ManagerServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/mangerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("utf-8");

        //获取参数
        String name = req.getParameter("managername");
        String password = req.getParameter("password");
        String checkcode = req.getParameter("checkCode");

        //封装对象
        Manager manager = new Manager();
        manager.setManagername(name);
        manager.setPassword(password);

        //判断验证码是否为正确
        HttpSession session = req.getSession();
        //取出存在session的验证码
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER"); //清除session中的验证码
        if(!checkcode.equalsIgnoreCase(checkcode_server)){
            //返回提示信息并结束此方法
            String msg = "checkCode error";
            req.setAttribute("msg",msg);
            req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
            return;
        }

        //调用service方法 判断是否登录成功
        ManagerService service = new ManagerServiceImpl();
        if(!service.searchManger(manager)){
            //登录失败 返回错误信息
            req.setAttribute("msg","The manager name or password is incorrect");
            req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
        }else {
            //登录成功
            //将用户存入session
            session.setAttribute("managername",name);
            req.getRequestDispatcher("searchGoodsByPageServlet").forward(req,resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
