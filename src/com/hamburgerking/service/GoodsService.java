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
    public void deleteGoods(String gids);

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

    /**
     * 根据gid查找商品
     * @param gid
     * @return
     */
    public Good searchGoodsById(String gid);

    /**
     * 修改商品
     * @param good
     * @return
     */
    public boolean updateGoods(Good good);
}
