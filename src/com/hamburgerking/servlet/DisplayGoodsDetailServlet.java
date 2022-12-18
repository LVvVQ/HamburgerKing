package com.hamburgerking.servlet;

import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.Page;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/displayGoodsDetailServlet")
public class DisplayGoodsDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("utf-8");

        //获取参数
        String gid = req.getParameter("gid");

        //调用service方法
        GoodsService service = new GoodsServiceImpl();
        Good good = service.searchGoodsById(gid);

        //将good存入request域
        req.setAttribute("good",good);


        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页行数
        String keyWord = req.getParameter("keyWord");//查询关键字

        //查询内容为空 查询全部记录
        if(keyWord == null){
            keyWord = "";
        }

        //如果current、rows为空, 那就初始化为第一页和一页显示5行记录
        if (currentPage == null || "".equals(currentPage) ) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "5";
        }

        //调用service查询
        GoodsService commentservice = new GoodsServiceImpl();
        Page<Good> page = commentservice.findGoodsByPage(currentPage,rows,keyWord);

        //将Page存入request域
        req.setAttribute("page",page);
        //将keyWord存入request域
        req.setAttribute("keyWord",keyWord);

        //返回到admin.jsp页面
        req.getRequestDispatcher("commentManager.jsp").forward(req,resp);
        //返回到GoodsDetail.jsp
        req.getRequestDispatcher("goodsDetail.jsp").forward(req,resp);


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
