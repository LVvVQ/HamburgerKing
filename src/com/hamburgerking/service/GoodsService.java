package com.hamburgerking.service;

import com.hamburgerking.bean.Good;

import java.util.ArrayList;

public interface GoodsService {
    /**
     * 查询所有商品
     * @return 包含所有商品的集合
     */
    public ArrayList<Good> findAllGoods();
}
