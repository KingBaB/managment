package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/19
 *  Time: 14:01
 *  Description:
 */

import com.czb.bean.Suggestion;
import com.czb.dao.SuggestionDao;
import com.czb.service.SuggestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SuggestionServiceImpl implements SuggestionService {
    @Autowired
    private SuggestionDao suggestionDao;

    @Override
    public Integer insertSuggestion(Suggestion suggestion) throws Exception {
        try{
            suggestionDao.insertSuggestion(suggestion);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("错误:::"+e);
            return 0;
        }
    }
    @Override
    public List<Suggestion> getAllSuggestion(Integer offset, Integer limit) throws Exception {
        return suggestionDao.selectByLimitAndOffset(offset, limit);
    }

    @Override
    public Integer getSuggestionCount() throws Exception {
        return suggestionDao.countSuggestion();
    }

    @Override
    public String deleteSuggestionById(Integer id) {
        String status = "";
        try {
            suggestionDao.deleteSuggestionById(id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }
}
