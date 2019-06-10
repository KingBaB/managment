package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/6
 *  Time: 21:15
 *  Description:
 */

import com.czb.bean.Collections;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CollectionsDao {

    /**
     * 新增收藏夹信息
     */
    Integer insertCollections(@Param("collections") Collections collections);

    /**
     * 判断会员是否已收藏
     * @return
     */
    Collections selectCollectionsById(@Param("collections") Collections collections);

    List<Collections> selectCollections();
    /*
     * 获取健身课程信息(分页查询)
     */
    public List<Collections> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);

    List<Collections> selectCartByMember_id(@Param("member_id") String member_id, @Param("offset") Integer offset, @Param("limit") Integer limit);

    @Select({"select count(*) from tbl_collections where member_id = ${member_id}"})
    Integer countCarts(@Param("member_id") String member_id);

    String delCollections(String id);
}
