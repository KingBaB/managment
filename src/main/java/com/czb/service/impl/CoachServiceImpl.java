package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 15:06
 *  Description:
 */

import com.czb.bean.Coach;
import com.czb.dao.CoachDao;
import com.czb.service.CoachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachServiceImpl implements CoachService{

    @Autowired
    private CoachDao coachDao;

    @Override
    public List<Coach> getAllCoach(Integer offset, Integer limit) throws Exception {
        return coachDao.selectByLimitAndOffset(offset, limit);
    }

    @Override
    public Integer getCoachCount() throws Exception {
        return coachDao.countCoachs();
    }
    /*
     * 删除教练信息
     */
    public String deleteCoachById(String coach_id){
        String status = "";
        try {
            coachDao.deleteCoachById(coach_id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }
    /*
     * 修改教练信息
     */
    public int updateCoachById (String coach_id, Coach coach){
        try {
            coachDao.updateCoachById(coach_id, coach);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /*
     * 判断新增的教练id是否存在
     */
    @Override
    public Coach findCoachById(String coach_id) throws Exception {
        return coachDao.selectCoachById(coach_id);
    }
    /**
     * 新增教练
     */
    @Override
    public Integer addCoach(Coach coach){
        int res = 0;
        try{
            coachDao.insertCoach(coach);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 获取所有教练id
     */
    @Override
    public List<Coach> getCoach_id() throws Exception {
        return coachDao.selectCoach_id();
    }
    /**
     * 性别统计
     */
    public Coach getSexCount() throws Exception{
        return coachDao.selectSexCount();
    }
    /**
     * 年龄统计
     */
    public Coach getAgeCount() throws Exception {
        return coachDao.selectAgeCount();
    }
}
