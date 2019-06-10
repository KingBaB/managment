package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/6
 *  Time: 21:22
 *  Description:
 */

import com.czb.bean.Collections;
import com.czb.dao.CollectionsDao;
import com.czb.service.CollectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectionsServiceImpl implements CollectionsService {
    @Autowired
    private CollectionsDao collectionsDao;
    @Override
    public Integer addCollections(Collections collections) {
        try{
            collectionsDao.insertCollections(collections);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public Collections findCollectionsById(Collections collections) throws Exception {
        return collectionsDao.selectCollectionsById(collections);
    }

    @Override
    public List<Collections> getCartByMember_id(String member_id, Integer offset, Integer limit) throws Exception {
        return collectionsDao.selectCartByMember_id(member_id,offset,limit);
    }

    @Override
    public Integer getCollectionsCount(String member_id) throws Exception {
        return collectionsDao.countCarts(member_id);
    }

    @Override
    public String delCart(String id) throws Exception {
        String status = "";
        try {
            collectionsDao.delCollections(id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
            status = "error";
        }
        return status;
    }
}
