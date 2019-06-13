package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/14
 *  Time: 16:44
 *  Description:
 */

import com.czb.bean.Orders;
import com.czb.dao.OrdersDao;
import com.czb.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService{
    @Autowired
    private OrdersDao ordersDao;

    @Override
    public Integer insertOrders(Orders orders) throws Exception {
        int res = 0;
        try{
            ordersDao.insertOrders(orders);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("错误:::"+e);
            return 0;
        }
    }
    @Override
    public Orders findOrdersById(Orders orders) throws Exception {
        return ordersDao.selectOrdersById(orders);
    }
    @Override
    public List<Orders> findOrdersByMember_Id(String member_id) throws Exception {
        return ordersDao.selectOrdersByMember_Id(member_id);
    }
    @Override
    public List<Orders> findOrderList() throws Exception {
        return ordersDao.selectOrderList();
    }

    @Override
    public List<Orders> getOrdersByMember_id(String member_id, Integer offset, Integer limit) throws Exception {
        return ordersDao.selectOrdersByMember_id(member_id,offset,limit);
    }

    @Override
    public Integer getOrdersCount(String member_id) throws Exception {
        return ordersDao.countOrders(member_id);
    }
}
