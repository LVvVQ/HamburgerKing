package com.hamburgerking.servlet;

import com.hamburgerking.bean.Comment;
import com.hamburgerking.bean.Good;
import com.hamburgerking.service.CommentsService;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.CommentsServiceImpl;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.UUID;
import com.hamburgerking.bean.Manager;

@WebServlet("/insertCommentsServlet")
public class InsertCommentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置地址
        //final String OutFilePath = request.getServletContext().getRealPath("/upload");//out目录下upload地址

        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取普通表单对象
       /* String gname = request.getParameter("gname");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String description = request.getParameter("description");*/
        int gid= Integer.parseInt(request.getParameter("gid"));
        String content=request.getParameter("content");

        HttpSession session = request.getSession();
        Manager manager = (Manager)session.getAttribute("manager");
        int mid = manager.getMid();
        System.out.println(gid);
        //System.out.println(mid);


        //封装对象
        /*Good good = new Good();
        good.setGname(gname);
        good.setPrice(Double.parseDouble(price));
        good.setImage("upload\\" + uuidFilename);
        good.setStock(Integer.parseInt(stock));
        good.setDescription(description);*/
        Comment comment=new Comment();
        comment.setGid(gid);
        comment.setContent(content);
        comment.setMid(mid);
        //调用service方法  传入good对象
        CommentsService service = new CommentsServiceImpl();
        String insert_msg = ""; //提示消息
        if(service.ManagerInsertComment(comment)){
            insert_msg = "评论插入成功";
        }else{
            insert_msg = "评论插入失败";
        }
        //将insert_msg设置到request域
        request.setAttribute("insert_msg",insert_msg);

        //有涉及到数据共享 采用请求转发到searchGoodServlet
        request.getRequestDispatcher("searchCommentServlet").forward(request,response);
    }
}
