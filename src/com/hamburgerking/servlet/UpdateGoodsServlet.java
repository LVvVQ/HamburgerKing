package com.hamburgerking.servlet;

import com.hamburgerking.bean.Good;
import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/UpdateGoodsServlet")
@MultipartConfig
public class UpdateGoodsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置地址
        final String OutFilePath = req.getServletContext().getRealPath("/upload");//out目录下upload地址

        //设置编码
        req.setCharacterEncoding("utf-8");

        //获取普通表单对象
        String gid = req.getParameter("gid");
        String gname = req.getParameter("gname");
        String price = req.getParameter("price");
        String stock = req.getParameter("stock");
        String description = req.getParameter("description");

        //获取文件Part对象
        Part part = req.getPart("image");
        String filename = part.getSubmittedFileName();


        //设置UUID
        String uuid = UUID.randomUUID().toString();
        String uuidFilename = uuid + filename;

        //上传文件到指定目录
        part.write(OutFilePath + "\\" + uuidFilename); //上传到out目录下

        //封装对象
        Good good = new Good();
        good.setGid(Integer.parseInt(gid));
        good.setGname(gname);
        good.setPrice(Double.parseDouble(price));
        good.setImage("upload\\" + uuidFilename);
        good.setStock(Integer.parseInt(stock));
        good.setDescription(description);

        //调用service方法  传入good对象
        GoodsService service = new GoodsServiceImpl();
        String update_msg = ""; //提示消息
        if(service.updateGoods(good)){
            update_msg = "商品修改成功";
        }else{
            update_msg = "商品修改失败";
        }
        //将update_msg设置到request域
        req.setAttribute("insert_msg",update_msg);

        //有涉及到数据共享 采用请求转发到searchGoodServlet
        req.getRequestDispatcher("searchGoodsByPageServlet").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
