package com.hamburgerking.service.impl;

import com.hamburgerking.bean.Good;
import com.hamburgerking.bean.Page;
import com.hamburgerking.dao.CommentsDAO;
import com.hamburgerking.dao.GoodsDao;
import com.hamburgerking.dao.impl.CommentsDAOImpl;
import com.hamburgerking.dao.impl.GoodsDaoImpl;
import com.hamburgerking.service.CommentsService;
import com.hamburgerking.service.GoodsService;

import java.util.ArrayList;
import java.util.List;

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
    public boolean deleteGoods(String gid) {
        if(commentsService.deleteGoodOfComments(gid) && goodsDao.deleteGoods(Integer.parseInt(gid))){
            return true;
        }else {
            return false;
        }
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
    public boolean deleteSearchGoods(String[] gids) {
        boolean flag = true;
        //遍历数组
        for(String gid : gids){
            if(!commentsService.deleteGoodOfComments(gid) | !goodsDao.deleteGoods(Integer.parseInt(gid))){
                flag = false;
            }
        }
        return  flag;
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

    /**
     * 分页查询
     * @param currentPage
     * @param rows
     * @return
     */
    @Override
    public Page<Good> findGoodsByPage(String currentPage, String rows, String keyWord) {

        int _currentPage = Integer.parseInt(currentPage);
        int _rows = Integer.parseInt(rows);

        if(_currentPage <= 0){
            _currentPage = 1;
        }

        //创建page对象
        Page<Good> page = new Page<>();

        page.setCurrentPage(_currentPage);//将_currentPage封装进对象

        //调用GoodsDao 查询总行数 totalCount
        int totalCount = goodsDao.findTotalCount(keyWord);

        page.setTotalCount(totalCount);//将totalCount封装进对象

        //调用dao查询List集合
        //计算开始索引
        int start = (_currentPage - 1) * _rows;
        List<Good> list = goodsDao.findByPage(start,_rows,keyWord);
        page.setList(list); //将list封装进对象

        //计算总页码数 totalPage
        int totalPage = (totalCount % _rows) == 0 ? (totalCount / _rows) : (totalCount / _rows + 1);
        page.setTotalPage(totalPage);//将totalPage封装进对象

        return page;
    }
}
