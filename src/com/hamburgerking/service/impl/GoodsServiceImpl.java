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

    @Override
    public boolean deleteGoods(String gids) {
        return goodsDao.deleteGoods(gids);
    }

    @Override
    public ArrayList<Good> searchGood(String keyWord) {
        return goodsDao.searchGood(keyWord);
    }
}
