package com.hamburgerking.servlet;

import com.hamburgerking.bean.ResultInfo;
import com.hamburgerking.bean.User;
import com.hamburgerking.service.UserService;
import com.hamburgerking.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.UUID;

/**
 * 用户注册
 * @MultipartConfig 代表支持文件上传
 */
@WebServlet("/userRegisterServlet")
@MultipartConfig
public class UserRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("utf-8");

        //设置文件上传地址
        final String OutFilePath = req.getServletContext().getRealPath("/upload");//out目录下upload地址

        //获取普通表单参数
        String name = req.getParameter("name"); //用户名
        String password = req.getParameter("password");//密码
        String confirmPassword = req.getParameter("ConfirmPassword"); //确认密码
        String checkCode = req.getParameter("checkCode"); //验证码

        //获取文件对象
        Part part = req.getPart("avatar");
        String avatar = part.getSubmittedFileName();//头像

        //验证确认密码是否等于密码
        if(!password.equals(confirmPassword)){
            req.setAttribute("msg","两次密码不一致"); //将提示信息存放到request域
            req.getRequestDispatcher("UserRegister.jsp").forward(req,resp);
            return; //结束该方法
        }

        //判断验证码是否相等
        //验证码存放再session域中 需要从session域里取
        HttpSession session = req.getSession(); //定义session对象
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER"); //取出验证码
        session.removeAttribute("CHECKCODE_SERVER"); //清除验证码
        if(!checkcode_server.equalsIgnoreCase(checkCode)){ //忽略大小写
            //返回提示信息并结束此方法
            String msg = "验证码错误";
            req.setAttribute("msg",msg);
            req.getRequestDispatcher("UserRegister.jsp").forward(req,resp);
            return;
        }


        //设置UUID
        String uuid = UUID.randomUUID().toString();
        String uuidAvatar = uuid + avatar;

        //上传文件到指定目录
        part.write(OutFilePath + "\\" + uuidAvatar); //上传到out目录下

        //封装user对象
        User user = new User();
        user.setUsername(name);
        user.setPassword(password);
        user.setBalance(0.0); //初始余额为0
        user.setAvatar("upload\\"  + uuidAvatar);

        //调用service方法 将user对象插入到数据库
        UserService service = new UserServiceImpl();
        ResultInfo resultInfo = new ResultInfo();
        boolean flag = service.addUser(user);

        resultInfo.setFlag(flag);

        if(flag){
            resultInfo.setMsg("注册成功");
        }else{
            resultInfo.setMsg("注册失败");
        }

        req.setAttribute("resultInfo",resultInfo);

        //返回到登录界面
        req.getRequestDispatcher("managerLogin.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
