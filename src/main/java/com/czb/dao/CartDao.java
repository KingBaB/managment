package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/12
 *  Time: 17:07
 *  Description:
 */

import com.czb.bean.Cart;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CartDao {

    String TABLE_NAME = "tbl_cart";

    List<Cart> selectCartByMember_id(@Param("member_id") String member_id, @Param("offset") Integer offset, @Param("limit") Integer limit);

    @Select({"select count(*) from tbl_cart where member_id = ${member_id}"})
    Integer countCarts(@Param("member_id") String member_id);

    Integer insertCart(@Param("cart") Cart cart);

    String delCart(String id);

    /**
     * 判断会员是否已经添加购物车
     * @return
     */
    Cart selectCartById(@Param("cart") Cart cart);
}
