package com.hamburgerking.dao;


import com.hamburgerking.bean.Good;

import java.util.ArrayList;
import java.util.List;

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

    /**
     * 增加商品
     * @param good
     */
    public boolean insertGood(Good good);

    /**
     * 更具gid查找商品
     * @param gid
     * @return
     */
    public Good searchGoodsById(int gid);

    /**
     * 修改商品
     * @param good
     * @return
     */
    public boolean updateGoods(Good good);

    /**
     * 查询总记录数
     * @return
     */
    int findTotalCount(String keyWord);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @return
     */
    List<Good> findByPage(int start, int rows,String keyWord);
}
