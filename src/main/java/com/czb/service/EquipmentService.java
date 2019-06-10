package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/26
 *  Time: 16:44
 *  Description:
 */

import com.czb.bean.Equipment;

import java.util.List;

public interface EquipmentService {

    public List<Equipment> getAllEquipment(Integer offset, Integer limit) throws Exception;

    public Integer getEquipmentCount() throws Exception;

    public String deleteEquipmentById(String equipment_id) throws Exception;

    public int updateEquipmentById(String equipment_id, Equipment equipment) throws Exception;

    public Equipment findEquipmentById(String equipment_id) throws Exception;

    public Integer addEquipment(Equipment equipment) throws Exception;

    public List<Equipment> getEquipment_id() throws Exception;

    public List<Equipment> getEquipment() throws Exception;

}
