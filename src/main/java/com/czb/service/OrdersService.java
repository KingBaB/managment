package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/14
 *  Time: 16:43
 *  Description:
 */

import com.czb.bean.Orders;

import java.util.List;

public interface OrdersService {

    public Integer insertOrders(Orders orders) throws Exception;

    public Orders findOrdersById(Orders orders) throws Exception;

    public List<Orders> findOrdersByMember_Id(String member_id) throws Exception;

    public List<Orders> findOrderList() throws Exception;

    public List<Orders> getOrdersByMember_id(String member_id, Integer offset, Integer limit) throws Exception;

    public Integer getOrdersCount(String member_id) throws Exception;
}
