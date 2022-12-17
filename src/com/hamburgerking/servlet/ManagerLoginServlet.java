package com.hamburgerking.servlet;

import com.hamburgerking.bean.Manager;
import com.hamburgerking.bean.User;
import com.hamburgerking.service.ManagerService;
import com.hamburgerking.service.UserService;
import com.hamburgerking.service.impl.ManagerServiceImpl;
import com.hamburgerking.service.impl.UserServiceImpl;
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
        String identity = req.getParameter("identity"); //登录身份

        //判断验证码是否为正确
        HttpSession session = req.getSession();
        //取出存在session的验证码
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER"); //清除session中的验证码
        if(!checkcode.equalsIgnoreCase(checkcode_server)){
            //返回提示信息并结束此方法
            String msg = "验证码错误";
            req.setAttribute("msg",msg);
            req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
            return;
        }

        if("admin".equals(identity)){
            //封装管理员对象
            Manager manager = new Manager();
            manager.setManagername(name);
            manager.setPassword(password);

            //调用service方法 判断是否登录成功
            ManagerService service = new ManagerServiceImpl();
            Manager _manager = service.searchManger(manager);
            if(_manager == null){
                //登录失败 返回错误信息
                req.setAttribute("msg","管理员账号或密码错误");
                req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
            }else {
                //登录成功
                //将用户存入session
                session.setAttribute("manager",_manager);
                req.getRequestDispatcher("searchGoodsByPageServlet").forward(req,resp);
            }
        }else if("user".equals(identity)){
            //封装用户对象
            User user = new User();
            user.setUsername(name);
            user.setPassword(password);

            //调用service方法 判断是否登录成功
            UserService service = new UserServiceImpl();
            User _user = service.searchUser(user);
            if(_user == null){
                req.setAttribute("msg","用户账号或密码错误");
                req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
            }else{
                session.setAttribute("user",_user);
                req.getRequestDispatcher("findAllGoodsServlet").forward(req,resp);
            }
        }else{
            req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
        }




    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
