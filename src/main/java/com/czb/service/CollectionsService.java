package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/6
 *  Time: 21:21
 *  Description:
 */

import com.czb.bean.Collections;

import java.util.List;

public interface CollectionsService {

    public Integer addCollections(Collections collections) throws Exception;

    public Collections findCollectionsById(Collections collections) throws Exception;

    public List<Collections> getCartByMember_id(String member_id, Integer offset, Integer limit) throws Exception;

    public Integer getCollectionsCount(String member_id) throws Exception;

    public String delCart(String id) throws Exception;
}
