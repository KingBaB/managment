package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/12
 *  Time: 17:13
 *  Description:
 */

import com.czb.bean.Cart;
import com.czb.service.CartService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @RequestMapping(value = "/getCartByMember_id", method = RequestMethod.GET)
    public ModelAndView getCartByMember_id(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo, String member_id) throws Exception{
        ModelAndView mav = new ModelAndView("../cart/cartPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的教练信息
        List<Cart> carts = cartService.getCartByMember_id(member_id,offset, limit);
        //获取总的记录数
        int totalItems = cartService.getCartCount(member_id);
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;

        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("carts", carts)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage)
                .addObject("member_id",member_id);
        return mav;
    }

    @RequestMapping(value = "/addCart", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addCart(@ModelAttribute Cart cart, HttpServletRequest request) throws Exception{
        int res = 0;
        if (cart.getCourse_id() != null || !"".equals(cart.getCourse_id())){
            if (cartService.findCartById(cart) == null){
                res = cartService.insertCart(cart);
            }else {
                return JsonMsg.fail().addInfo("status", "移入购物车失败，购物车已经存在！");
            }
            if (res == 1){
                return JsonMsg.success().addInfo("status", "移入购物车成功！");
            }else {
                return JsonMsg.fail().addInfo("status", "移入购物车失败2！");
            }
        }else {
            return JsonMsg.fail().addInfo("status", "移入购物车失败1！");
        }
    }
    /*
     * 删除购物车
     */
    @RequestMapping(value = "/delCartById")
    @ResponseBody
    public JsonMsg delCartById(@RequestParam("id") String id) throws Exception{
        String res = "";
        if (!"".equals(id)){
            res = cartService.delCart(id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("coach_modal_del_error", "删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("coach_modal_del_error", "删除异常");
    }

    /**
     * 付款页面
     * @param cart
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/payPage", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView payPage(@ModelAttribute("cart")Cart cart) throws Exception{
        ModelAndView mav = new ModelAndView("../cart/pay");
        cart = cartService.findCartById(cart);
        mav.addObject("cart",cart);
        return mav;
    }
    /**
     * 通过课程id和人员id获取购物车id并删除
     */
    @RequestMapping(value = "/delCartByCM", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg delCartByCM(@ModelAttribute("course_id")String course_id,@ModelAttribute("member_id")String member_id) throws Exception{
        Cart cart = new Cart();
        cart.setCourse_id(course_id);
        cart.setMember_id(member_id);
        return delCartById(String.valueOf(cartService.findCartById(cart).getId()));

    }
}
