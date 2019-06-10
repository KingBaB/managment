package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/19
 *  Time: 14:04
 *  Description:
 */

import com.czb.bean.Suggestion;
import com.czb.service.SuggestionService;
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
@RequestMapping("/suggestion")
public class SuggestionController {

    @Autowired
    private SuggestionService suggestionService;

    @RequestMapping(value = "/addSuggestion", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg addCart(@ModelAttribute Suggestion suggestion, HttpServletRequest request) throws Exception{
        System.out.println(suggestion.getName()+"::"+suggestion.getEmail()+"::"+suggestion.getSuggestion());
        int res = 0;
        if (!"".equals(suggestion.getEmail()) && suggestion.getEmail() != null){
            if(!"".equals(suggestion.getName()) && suggestion.getName() != null){
                if(!"".equals(suggestion.getSuggestion()) && suggestion.getSuggestion() != null){
                    res = suggestionService.insertSuggestion(suggestion);
                    return JsonMsg.success().addInfo("status","发送成功,稍后我们会联系你！");
                }else {
                    return JsonMsg.fail().addInfo("status","发送失败，请输入您的建议！");
                }
            }else {
                return JsonMsg.fail().addInfo("status", "发送失败，请填入正确的姓名！");
            }
        }else {
            return JsonMsg.fail().addInfo("status", "发送失败，请填入正确的邮箱地址！");
        }
    }
    @RequestMapping("/getAllSuggestion")
    @ResponseBody
    public ModelAndView getAllSuggestion(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../suggestion/suggestionPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的会员信息
        List<Suggestion> suggestions = suggestionService.getAllSuggestion(offset, limit);
        //获取总的记录数
        int totalItems = suggestionService.getSuggestionCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("suggestions", suggestions)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mav;
    }
    /*
    * 删除会员
    */
    @RequestMapping(value = "/delSuggestionById")
    @ResponseBody
    public JsonMsg delSuggestionById(@RequestParam("id") Integer id) throws Exception{
        String res = "";
        if (!"".equals(id)){
            res = suggestionService.deleteSuggestionById(id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("status", "删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success().addInfo("status","删除成功");
        }
        return JsonMsg.fail().addInfo("status", "删除异常");
    }
}
