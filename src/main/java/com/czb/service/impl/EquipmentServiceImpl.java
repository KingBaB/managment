package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/26
 *  Time: 16:45
 *  Description:
 */

import com.czb.bean.Equipment;
import com.czb.dao.EquipmentDao;
import com.czb.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EquipmentServiceImpl implements EquipmentService {
    @Autowired
    private EquipmentDao equipmentDao;

    @Override
    public List<Equipment> getAllEquipment(Integer offset, Integer limit) throws Exception {
        return equipmentDao.selectByLimitAndOffset(offset, limit);
    }

    @Override
    public Integer getEquipmentCount() throws Exception {
        return equipmentDao.countEquipments();
    }
    /*
     * 删除设备信息
     */
    public String deleteEquipmentById(String equipment_id){
        String status = "";
        try {
            equipmentDao.deleteEquipmentById(equipment_id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }
    /*
     * 修改设备信息
     */
    public int updateEquipmentById (String equipment_id, Equipment equipment){
        try {
            equipmentDao.updateEquipmentById(equipment_id, equipment);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /*
     * 判断新增的设备id是否存在
     */
    @Override
    public Equipment findEquipmentById(String equipment_id) throws Exception {
        return equipmentDao.selectEquipmentById(equipment_id);
    }
    /**
     * 新增设备
     */
    @Override
    public Integer addEquipment(Equipment equipment){
        int res = 0;
        try{
            equipmentDao.insertEquipment(equipment);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 获取所有设备id
     */
    @Override
    public List<Equipment> getEquipment_id() throws Exception {
        return equipmentDao.selectEquipment_id();
    }

    @Override
    public List<Equipment> getEquipment() throws Exception {
        return equipmentDao.selectEquipment();
    }
}
