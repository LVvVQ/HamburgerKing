package com.hamburgerking.servlet;

import com.hamburgerking.bean.ResultInfo;
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

        //获取选中的gid
        String[] goodIds = req.getParameterValues("goodId");//获取传入的goodId值

        //调用service删除
        GoodsService service = new GoodsServiceImpl();
        boolean flag = service.deleteSearchGoods(goodIds);

        //设置返回结果对象
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setFlag(flag);

        if(flag){
            resultInfo.setMsg("删除成功");
        }else{
            resultInfo.setMsg("删除失败");
        }

        //将返回结果存入request
        req.setAttribute("resultInfo",resultInfo);

        //跳转至searchGoodServlet查询所有商品
        req.getRequestDispatcher("searchGoodsByPageServlet").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
