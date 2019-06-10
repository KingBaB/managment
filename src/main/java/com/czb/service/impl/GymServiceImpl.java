package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/28
 *  Time: 12:07
 *  Description:
 */

import com.czb.bean.Gym;
import com.czb.dao.GymDao;
import com.czb.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GymServiceImpl implements GymService {
    @Autowired
    private GymDao gymDao;

    @Override
    public List<Gym> getAllGym(Integer offset, Integer limit) throws Exception {
        return gymDao.selectByLimitAndOffset(offset, limit);
    }

    @Override
    public Integer getGymCount() throws Exception {
        return gymDao.countGyms();
    }
    /*
     * 删除健身房信息
     */
    public String deleteGymById(String gym_id){
        String status = "";
        try {
            gymDao.deleteGymById(gym_id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }
    /*
     * 修改健身房信息
     */
    public int updateGymById (String gym_id, Gym gym){
        try {
            gymDao.updateGymById(gym_id, gym);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /*
     * 判断新增的健身房id是否存在
     */
    @Override
    public Gym findGymById(String gym_id) throws Exception {
        return gymDao.selectGymById(gym_id);
    }
    /**
     * 新增健身房
     */
    @Override
    public Integer addGym(Gym gym){
        int res = 0;
        try{
            gymDao.insertGym(gym);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 获取所有健身房id
     */
    @Override
    public List<Gym> getGym_id() throws Exception {
        return gymDao.selectGym_id();
    }
}
