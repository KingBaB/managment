package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/19
 *  Time: 14:00
 *  Description:
 */

import com.czb.bean.Suggestion;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SuggestionDao {

    String TABLE_NAME = "tbl_suggestion";

    Integer insertSuggestion(@Param("suggestion") Suggestion suggestion);

    List<Suggestion> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    public Integer countSuggestion();
    /*
     * 删除信息
     */
    public String deleteSuggestionById(@Param("id") Integer id);
}
