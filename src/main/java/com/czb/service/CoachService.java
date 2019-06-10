package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 15:06
 *  Description: 健身教练接口
 */

import com.czb.bean.Coach;

import java.util.List;

public interface CoachService {

    public List<Coach> getAllCoach(Integer offset, Integer limit) throws Exception;

    public Integer getCoachCount() throws Exception;

    public String deleteCoachById(String coach_id) throws Exception;

    public int updateCoachById(String coach_id, Coach coach) throws Exception;

    public Coach findCoachById(String coach_id) throws Exception;

    public Integer addCoach(Coach coach) throws Exception;

    public List<Coach> getCoach_id() throws Exception;

    public Coach getSexCount() throws Exception;

    public Coach getAgeCount() throws Exception;
}
