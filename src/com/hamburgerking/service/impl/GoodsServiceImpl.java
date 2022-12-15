package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Good;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.dao.GoodsDao;
import com.hamburgerking.dao.impl.CommentsDAOImpl;
import com.hamburgerking.dao.impl.GoodsDaoImpl;
import com.hamburgerking.service.CommentsService;
import com.hamburgerking.service.GoodsService;

import java.util.ArrayList;

public class GoodsServiceImpl implements GoodsService {
    private GoodsDao  goodsDao = new GoodsDaoImpl();
    private CommentsService commentsService = new CommentsServiceImpl();

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
    public void deleteGoods(String gid) {
        commentsService.deleteGoodOfComments(gid);
        goodsDao.deleteGoods(Integer.parseInt(gid));
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
        //遍历数组
        for(String gid : gids){
            commentsService.deleteGoodOfComments(gid);
            //调用删除单个商品
            goodsDao.deleteGoods(Integer.parseInt(gid));
        }
    }

    /**
     * 增加商品
     * @param good
     */
    @Override
    public boolean insertGood(Good good) {
        return goodsDao.insertGood(good);
    }

    /**
     * 根据gid查找商品
     * @param gid
     * @return
     */
    @Override
    public Good searchGoodsById(String gid) {
        return goodsDao.searchGoodsById(Integer.parseInt(gid));
    }

    /**
     * 修改商品
     * @param good
     * @return
     */
    @Override
    public boolean updateGoods(Good good) {
        return goodsDao.updateGoods(good);
    }
}
