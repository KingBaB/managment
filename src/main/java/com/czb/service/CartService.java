package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/12
 *  Time: 17:11
 *  Description:
 */

import com.czb.bean.Cart;

import java.util.List;

public interface CartService {

    public List<Cart> getCartByMember_id(String member_id, Integer offset, Integer limit) throws Exception;

    public Integer getCartCount(String member_id) throws Exception;

    public Integer insertCart(Cart cart) throws Exception;

    public String delCart(String id) throws Exception;

    public Cart findCartById(Cart cart) throws Exception;
}
