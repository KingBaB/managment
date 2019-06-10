package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/28
 *  Time: 12:04
 *  Description:
 */

import com.czb.bean.Gym;

import java.util.List;

public interface GymService {

    public List<Gym> getAllGym(Integer offset, Integer limit) throws Exception;

    public Integer getGymCount() throws Exception;

    public String deleteGymById(String id) throws Exception;

    public int updateGymById(String gym_id, Gym gym) throws Exception;

    public Gym findGymById(String gym_id) throws Exception;

    public Integer addGym(Gym gym) throws Exception;

    public List<Gym> getGym_id() throws Exception;
}
