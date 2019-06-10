package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/28
 *  Time: 11:50
 *  Description:
 */

import com.czb.bean.Gym;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GymDao {
    String TABLE_NAME = "tbl_gym";
    /*
     * 获取健身课程信息(分页查询)
     */
    public List<Gym> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);
    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    public Integer countGyms();
    /*
    * 删除课程信息
    */
    public String deleteGymById(@Param("gym_id") String gym_id);
    /*
     * 修改课程信息
     */
    public Integer updateGymById(@Param("gym_id") String gym_id, @Param("gym") Gym gym);
    /*
     * 判断课程id是否存在
     */
    public Gym selectGymById(@Param("gym_id") String gym_id);
    /**
     * 新增课程信息
     */
    public Integer insertGym(@Param("gym") Gym gym);
    /**
     * 获取所有课程id
     */
    public List<Gym> selectGym_id();
}
