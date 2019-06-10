package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/2
 *  Time: 22:52
 *  Description:
 */

import com.czb.bean.Message;
import com.czb.bean.Support;
import com.czb.dao.MessageDao;
import com.czb.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService{
    @Autowired
    private MessageDao messageDao;
    @Override
    public List<Message> findMessage() {
        return messageDao.selectMessage();
    }

    @Override
    public List<Message> getAllMessage(Integer offset, Integer limit) throws Exception {
        return messageDao.selectByLimitAndOffset(offset, limit);
    }
    @Override
    public List<Message> getallMessage() throws Exception {
        return messageDao.selectallMessage();
    }

    @Override
    public Integer getMessageCount() throws Exception {
        return messageDao.countMessages();
    }

    @Override
    public Integer addSupportSum(Integer id) throws Exception {
        try {
            messageDao.addSupportSum(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    @Override
    public Integer subSupportSum(Integer id) throws Exception {
        try {
            messageDao.subSupportSum(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public Support selectSupportByMM(Integer id, String member_id) throws Exception {
        return messageDao.selectSupportByMM(id,member_id);
    }

    @Override
    public Integer insertSupportByMM(Integer id, String member_id) throws Exception {
        return messageDao.insertSupportByMM(id,member_id);
    }

    @Override
    public Integer delSupportByMM(Integer id, String member_id) throws Exception {
        return messageDao.delSupportByMM(id,member_id);
    }

    @Override
    public Integer addMessage(Message message) throws Exception {
        int res = 0;
        try{
            messageDao.insertMessage(message);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public Integer delMessageById(Integer id) throws Exception {
        int res = 0;
        try {
            messageDao.delMessageById(id);
            res = 1;
        }catch (Exception e){
            e.printStackTrace();
            res = 0;
        }
        return res;
    }
}
