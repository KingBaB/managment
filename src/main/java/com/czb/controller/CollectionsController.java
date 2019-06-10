package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/6
 *  Time: 21:15
 *  Description:
 */

import com.czb.bean.Collections;
import com.czb.service.CollectionsService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/collections")
public class CollectionsController {
    @Autowired
    private CollectionsService collectionsService;

    @RequestMapping(value = "/addCollections", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg addCollections(@ModelAttribute Collections collections, HttpServletRequest request) throws Exception {
        Integer res = 0;
        if (collectionsService.findCollectionsById(collections) == null){
            if (collections.getCourse_id() != null) {
                res = collectionsService.addCollections(collections);
            }
            if (res == 1) {
                return JsonMsg.success().addInfo("status", "收藏成功！");
            } else {
                return JsonMsg.fail().addInfo("status", "收藏失败！");
            }
        }else {
            return JsonMsg.fail().addInfo("status", "亲，该课程已经收藏过了，无需再收藏！");
        }
    }
    @RequestMapping(value = "/getCollectionsByMember_id", method = RequestMethod.GET)
    public ModelAndView getCartByMember_id(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo, String member_id) throws Exception{
        ModelAndView mav = new ModelAndView("../collections/collectionsPage");
        int limit = 8;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的教练信息
        List<Collections> carts = collectionsService.getCartByMember_id(member_id,offset, limit);
        //获取总的记录数
        int totalItems = collectionsService.getCollectionsCount(member_id);
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
    /*
     * 删除收藏
     */
    @RequestMapping(value = "/delCollectionsById")
    @ResponseBody
    public JsonMsg delCollectionsById(@RequestParam("id") String id) throws Exception{
        String res = "";
        if (!"".equals(id)){
            res = collectionsService.delCart(id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("status", "删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success().addInfo("status", "删除成功");
        }
        return JsonMsg.fail().addInfo("status", "id不存在，删除异常");
    }
    @RequestMapping(value = "/payPage", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView payPage(@ModelAttribute("collections")Collections collections) throws Exception{
        ModelAndView mav = new ModelAndView("../cart/pay");
        collections = collectionsService.findCollectionsById(collections);
        mav.addObject("cart",collections);
        return mav;
    }
}
