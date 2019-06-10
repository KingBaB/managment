package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/12
 *  Time: 17:11
 *  Description:
 */

import com.czb.bean.Cart;
import com.czb.dao.CartDao;
import com.czb.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;

    @Override
    public List<Cart> getCartByMember_id(String member_id, Integer offset, Integer limit) throws Exception {
        return cartDao.selectCartByMember_id(member_id,offset,limit);
    }

    @Override
    public Integer getCartCount(String member_id) throws Exception {
        return cartDao.countCarts(member_id);
    }

    @Override
    public Integer insertCart(Cart cart) throws Exception {
        int res = 0;
        try{
            cartDao.insertCart(cart);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public String delCart(String id) throws Exception {
        String status = "";
        try {
            cartDao.delCart(id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }

    @Override
    public Cart findCartById(Cart cart) throws Exception {
        return cartDao.selectCartById(cart);
    }
}
