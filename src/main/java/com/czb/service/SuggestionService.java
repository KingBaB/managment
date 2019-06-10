package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/19
 *  Time: 14:01
 *  Description:
 */

import com.czb.bean.Suggestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SuggestionService {

    public Integer insertSuggestion(Suggestion suggestion) throws Exception;

    public List<Suggestion> getAllSuggestion(Integer offset, Integer limit) throws Exception;

    public Integer getSuggestionCount() throws Exception;

    public String deleteSuggestionById(Integer id);

}
