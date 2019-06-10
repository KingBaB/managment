package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/2
 *  Time: 22:52
 *  Description:
 */

import com.czb.bean.Message;
import com.czb.bean.Support;

import java.util.List;

public interface MessageService {

    public List<Message> findMessage();

    public List<Message> getAllMessage(Integer offset, Integer limit) throws Exception;

    public List<Message> getallMessage() throws Exception;

    public Integer getMessageCount() throws Exception;

    public Integer addSupportSum(Integer id)throws Exception;

    public Integer subSupportSum(Integer id)throws Exception;

    public Support selectSupportByMM(Integer id, String member_id)throws Exception;

    public Integer insertSupportByMM(Integer id, String member_id)throws Exception;
    public Integer delSupportByMM(Integer id, String member_id)throws Exception;

    public Integer addMessage(Message message)throws Exception;

    public Integer delMessageById(Integer id)throws Exception;
}
