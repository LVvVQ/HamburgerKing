package com.hamburgerking.servlet;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.ResultInfo;
import com.hamburgerking.bean.User;
import com.hamburgerking.service.CommentsService;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.CommentsServiceImpl;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/insertUserCommentsServlet")
public class InsertUserCommentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //设置编码
        request.setCharacterEncoding("utf-8");

        int gid= Integer.parseInt(request.getParameter("gid"));
        String content=request.getParameter("content");
        System.out.println("gid="+gid);
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();

        //System.out.println(uid);



        Comment comment=new Comment();
        comment.setGid(gid);
        comment.setContent(content);
        comment.setUid(uid);
        //调用service方法  传入good对象
        CommentsService service = new CommentsServiceImpl();
        String insert_msg = ""; //提示消息
        if(service.UserInsertComment(comment)){
            insert_msg = "评论插入成功";
        }else{
            insert_msg = "评论插入失败";
        }
        //将insert_msg设置到request域
        request.setAttribute("insert_msg",insert_msg);

        //有涉及到数据共享 采用请求转发到searchGoodServlet
        request.getRequestDispatcher("displayGoodsDetailServlet").forward(request,response);
    }
}
