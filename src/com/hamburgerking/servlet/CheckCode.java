package com.hamburgerking.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCode")
public class CheckCode extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int width = 100;
        int height = 50;
        //创建对象
        BufferedImage  image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //美化图片
        //填充背景色
        Graphics g = image.getGraphics();//画笔对象
        g.setColor(Color.CYAN); //设置画笔颜色
        g.fillRect(0,0,width,height);

        //边框
        g.setColor(Color.BLUE); //边框自带1像素
        g.drawRect(0,0,width-1,height-1);

        //写验证码
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; //验证码的所有值
        Random ran = new Random();

        String checkCode = "";
        for(int i = 1; i <= 4; i++){ //4位验证码
            int index = ran.nextInt(str.length());
            char ch = str.charAt(index); //随机获取一个值
            g.drawString(ch+"",width/5 * i,height/2);
            checkCode += ch;
        }

        //将验证码存入session
        req.getSession().setAttribute("CHECKCODE_SERVER",checkCode);
        //画干扰线
        g.setColor(Color.red);
        //随机生成坐标点
        for(int i = 0; i < 10; i++){
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);
            int y1 = ran.nextInt(height);
            int y2 = ran.nextInt(height);
            g.drawLine(x1,x2,y1,y2);
        }


        //将图片输出到页面显示
        ImageIO.write(image,"jpg",resp.getOutputStream());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
