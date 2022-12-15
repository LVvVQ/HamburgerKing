package com.hamburgerking.service;

import com.hamburgerking.bean.Good;

import java.util.ArrayList;

public interface GoodsService {
    /**
     * 查询所有商品
     * @return 包含所有商品的集合
     */
    public ArrayList<Good> findAllGoods();

    /**
     * 删除商品
     * @param gids
     * @return
     */
    public boolean deleteGoods(String gids);

    public ArrayList<Good> searchGood(String keyWord);

    /**
     * 批量删除商品
     * @param gids
     * @return
     */
    public void deleteSearchGoods(String[] gids);

    /**
     * 增加商品
     * @param good
     */
    public boolean insertGood(Good good);
}
