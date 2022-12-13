package com.hamburgerking.servlet;

import com.hamburgerking.service.GoodsService;
import com.hamburgerking.service.impl.GoodsServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteGoodsServlet")
public class DeleteGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GoodsService goodsService = new GoodsServiceImpl();
        String[] goodIds = req.getParameterValues("goodId");//获取传入的goodId值
        for(String s : goodIds){
            System.out.println(s);
        }
        String gids = "" , msg = "";
        if(goodIds != null){
            for(int i = 0; i < goodIds.length; i++){
                if(i != goodIds.length-1){
                    gids += goodIds[i] + ',';
                }else{
                    gids += goodIds[i];
                }
            }
        }else{
            System.out.println("arrays is null");
        }

        if(goodsService.deleteGoods(gids)){
            msg = "delete OK";
        }else{
            msg = "delete is not OK";
        }

        req.setAttribute("msg",msg);
        req.getRequestDispatcher("searchGoodServlet").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
