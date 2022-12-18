package com.hamburgerking.servlet;

import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.ResultInfo;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;



import java.io.*;
import java.util.List;
import java.util.UUID;

@WebServlet("/insertGoodsServlet")
@MultipartConfig
public class InsertGoodsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置地址
        final String OutFilePath = request.getServletContext().getRealPath("/upload");//out目录下upload地址

        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取普通表单对象
        String gname = request.getParameter("gname");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String description = request.getParameter("description");

        if(description == null || "".equals(description)){
            description = "该商品暂无描述";
        }

        //获取文件Part对象
        Part part = request.getPart("image");
        String filename = part.getSubmittedFileName();


        //设置UUID
        String uuid = UUID.randomUUID().toString();
        String uuidFilename = uuid + filename;

        //上传文件到指定目录
        part.write(OutFilePath + "\\" + uuidFilename); //上传到out目录下

        //封装对象
        Good good = new Good();
        good.setGname(gname);
        good.setPrice(Double.parseDouble(price));
        good.setImage("upload\\" + uuidFilename);
        good.setStock(Integer.parseInt(stock));
        good.setDescription(description);

        //调用service方法  传入good对象
        GoodsService service = new GoodsServiceImpl();
        ResultInfo resultInfo = new ResultInfo();
        boolean flag = service.insertGood(good);

        resultInfo.setFlag(flag);
        if(flag){
            resultInfo.setMsg("插入成功");
        }else{
            resultInfo.setMsg("插入失败");
        }
        //将insert_msg设置到request域
        request.setAttribute("resultInfo",resultInfo);

        //有涉及到数据共享 采用请求转发到searchGoodServlet
        request.getRequestDispatcher("searchGoodsByPageServlet").forward(request,response);
    }
}