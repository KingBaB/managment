package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 14:55
 *  Description: 教练
 */

import com.czb.bean.Coach;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CoachDao {
    String TABLE_NAME = "tbl_coach";
    /*
     * 获取健身教练信息(分页查询)
     */
    public List<Coach> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);
    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    public Integer countCoachs();
    /*
    * 删除教练信息
    */
    public String deleteCoachById(@Param("coach_id") String coach_id);
    /*
     * 修改教练信息
     */
    public Integer updateCoachById(@Param("coach_id") String coach_id, @Param("coach") Coach coach);
    /*
     * 判断教练id是否存在
     */
    public Coach selectCoachById(@Param("coach_id") String coach_id);
    /**
     * 新增教练信息
     */
    public Integer insertCoach(@Param("coach") Coach coach);
    public Integer insertLogin(@Param("coach") Coach coach);
    /**
     * 获取所有教练id
     */
    public List<Coach> selectCoach_id();
    /**
     * 性别统计
     */
    public Coach selectSexCount();
    /**
     * 年龄统计
     */
    public Coach selectAgeCount();
}
