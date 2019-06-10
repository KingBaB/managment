package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/26
 *  Time: 16:42
 *  Description:
 */

import com.czb.bean.Equipment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface EquipmentDao {
    String TABLE_NAME = "tbl_equipment";
    /*
     * 获取健身课程信息(分页查询)
     */
    public List<Equipment> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);
    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    public Integer countEquipments();
    /*
    * 删除课程信息
    */
    public String deleteEquipmentById(@Param("equipment_id") String equipment_id);
    /*
     * 修改课程信息
     */
    public Integer updateEquipmentById(@Param("equipment_id") String equipment_id, @Param("equipment") Equipment equipment);
    /*
     * 判断课程id是否存在
     */
    public Equipment selectEquipmentById(@Param("equipment_id") String equipment_id);
    /**
     * 新增课程信息
     */
    public Integer insertEquipment(@Param("equipment") Equipment equipment);
    /**
     * 获取所有课程id
     */
    public List<Equipment> selectEquipment_id();
    /**
     * 获取设备信息
     */
    public List<Equipment> selectEquipment();
}
