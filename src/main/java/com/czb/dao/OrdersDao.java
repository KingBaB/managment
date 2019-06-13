package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/14
 *  Time: 16:42
 *  Description:
 */

import com.czb.bean.Orders;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrdersDao {

    Integer insertOrders(@Param("orders") Orders orders);

    Orders selectOrdersById(@Param("orders") Orders orders);

    List<Orders> selectOrdersByMember_Id(@Param("member_id") String member_id);

    List<Orders> selectOrderList();

    List<Orders> selectOrdersByMember_id(@Param("member_id") String member_id, @Param("offset") Integer offset, @Param("limit") Integer limit);

    @Select({"select count(*) from tbl_orders where member_id = ${member_id}"})
    Integer countOrders(@Param("member_id") String member_id);
}
