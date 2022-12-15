package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Good;
import com.hamburgerking.dao.GoodsDao;
import com.hamburgerking.dao.impl.GoodsDaoImpl;
import com.hamburgerking.service.GoodsService;

import java.util.ArrayList;

public class GoodsServiceImpl implements GoodsService {
    private GoodsDao  goodsDao = new GoodsDaoImpl();

    /**
     * 查询所有商品
     * @return 包含所有商品的集合
     */
    @Override
    public ArrayList<Good> findAllGoods() {
        return goodsDao.findAllGoods();
    }

    /**
     * 删除商品
     * @param gid
     * @return
     */
    @Override
    public boolean deleteGoods(String gid) {
        return goodsDao.deleteGoods(Integer.parseInt(gid));
    }


    @Override
    public ArrayList<Good> searchGood(String keyWord) {
        return goodsDao.searchGood(keyWord);
    }

    /**
     * 批量删除商品
     * @param gids
     * @return
     */
    @Override
    public void deleteSearchGoods(String[] gids) {
        //设置返回值
        boolean flag = false;
        //遍历数组
        for(String gid : gids){
            //调用删除单个商品
            goodsDao.deleteGoods(Integer.parseInt(gid));
        }
    }
}
