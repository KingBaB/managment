package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/14
 *  Time: 16:46
 *  Description:
 */

import com.czb.bean.Orders;
import com.czb.service.OrdersService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    @RequestMapping(value = "/getOrdersByMember_id", method = RequestMethod.GET)
    public ModelAndView getCartByMember_id(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo, String member_id) throws Exception{
        ModelAndView mav = new ModelAndView("../order/orderPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的教练信息
        List<Orders> orders = ordersService.getOrdersByMember_id(member_id,offset, limit);
        //获取总的记录数
        int totalItems = ordersService.getOrdersCount(member_id);
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;

        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("orders", orders)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage)
                .addObject("member_id",member_id);
        return mav;
    }
    @RequestMapping(value = "/addOrders", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg addCart(@ModelAttribute Orders orders, HttpServletRequest request) throws Exception{
        System.out.println("课程id ："+orders.getCourse_id());
        String order_id = "";
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        order_id ="czb0000" + sdf.format(now);
        int res = 0;
        if (orders.getCourse_id() != null || !"".equals(orders.getCourse_id())){
            if (ordersService.findOrdersById(orders) == null){
                orders.setOrders_id(order_id);
                res = ordersService.insertOrders(orders);
            }else {
                return JsonMsg.fail().addInfo("status", "购买失败，订单已经存在！");
            }
            if (res == 1){
                return JsonMsg.success().addInfo("status", "购买成功！");
            }else {
                return JsonMsg.fail().addInfo("status", "购买失败2！");
            }
        }else {
            return JsonMsg.fail().addInfo("status", "购买失败1！");
        }
    }
}
