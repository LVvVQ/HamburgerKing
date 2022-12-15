package com.hamburgerking.dao;


import com.hamburgerking.bean.Good;

import java.util.ArrayList;

public interface GoodsDao {
    /**
     * 查询所有商品
     * @return 包含所有商品的集合
     */
    public ArrayList<Good> findAllGoods();

    /**
     * 删除商品
     * @param gid
     * @return
     */
    public boolean deleteGoods(int gid);

    public ArrayList<Good> searchGood(String keyWord);
}
