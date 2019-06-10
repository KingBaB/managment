package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/2
 *  Time: 22:51
 *  Description:
 */

import com.czb.bean.Message;
import com.czb.bean.Support;
import com.czb.service.MessageService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    @RequestMapping("/findMessage")
    @ResponseBody
    public JsonMsg findMessage(){
        List<Message> message = messageService.findMessage();
        if (message != null){
            return JsonMsg.success().addInfo("messageList", message);
        }
        return JsonMsg.fail();
    }
    @RequestMapping("/getAllMessage")
    @ResponseBody
    public ModelAndView getAllMember(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,@RequestParam("member_id") String  member_id) throws Exception{
        ModelAndView mav = new ModelAndView("../main/user/moreMessage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的会员信息
        List<Message> messages = messageService.getAllMessage(offset, limit);
        //获取总的记录数
        int totalItems = messageService.getMessageCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("messages", messages)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("member_id", member_id)
                .addObject("curPage", curPage);
        return mav;
    }
    @RequestMapping("/addSupportSum")
    @ResponseBody
    public JsonMsg updateSupportSum(@RequestParam("id") Integer id,@RequestParam("member_id") String  member_id) throws Exception{
        int res = 0;
        res = messageService.addSupportSum(id);
        if (res != 1) {
            return JsonMsg.fail().addInfo("status", "点赞异常");
        }
        return JsonMsg.success();
    }
    @RequestMapping("/subSupportSum")
    @ResponseBody
    public JsonMsg subSupportSum(@RequestParam("id") Integer id,@RequestParam("member_id") String  member_id) throws Exception{
        int res = 0;
        res = messageService.subSupportSum(id);
        if (res != 1) {
            return JsonMsg.fail().addInfo("status", "点赞异常");
        }
        return JsonMsg.success();
    }
    /**
     * 是否点过赞
     */
    @RequestMapping("/selectSupport")
    @ResponseBody
    public JsonMsg selectSupport(@RequestParam("id") Integer id,@RequestParam("member_id") String  member_id) throws Exception{
        if (messageService.selectSupportByMM(id, member_id) != null){
            return JsonMsg.success().addInfo("status","Y");
        }else {
            return JsonMsg.success().addInfo("status","N");
        }
    }
    @RequestMapping("/getallMessage")
    @ResponseBody
    public JsonMsg getallMessage () throws Exception{
        List<Message> messages = messageService.getallMessage();
        return JsonMsg.success().addInfo("messageList",messages);
    }
    @RequestMapping("/insertSupportByMM")
    @ResponseBody
    public JsonMsg insertSupportByMM (@RequestParam("id") Integer id,@RequestParam("member_id") String  member_id) throws Exception{
        messageService.insertSupportByMM(id,member_id);
        return JsonMsg.success();
    }
    @RequestMapping("/delSupportByMM")
    @ResponseBody
    public JsonMsg delSupportByMM (@RequestParam("id") Integer id,@RequestParam("member_id") String  member_id) throws Exception{
        messageService.delSupportByMM(id,member_id);
        return JsonMsg.success();
    }
    /**
     * 添加留言评论
     */
    @RequestMapping("/addMessage")
    @ResponseBody
    public JsonMsg addMessage(@ModelAttribute Message message) throws Exception{
        int res = messageService.addMessage(message);
        if (res == 1){
            return JsonMsg.success().addInfo("status","留言成功！");
        }else {
            return JsonMsg.fail().addInfo("status","留言失败！");
        }

    }
    @RequestMapping("/getAllMessage2")
    @ResponseBody
    public ModelAndView getAllMessage2(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../message/messagePage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的会员信息
        List<Message> messages = messageService.getAllMessage(offset, limit);
        //获取总的记录数
        int totalItems = messageService.getMessageCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("messages", messages)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mav;
    }
    @RequestMapping("/delMessageById")
    @ResponseBody
    public JsonMsg delMessageById(@RequestParam("id") Integer id) throws Exception{
        int res = messageService.delMessageById(id);
        if(res==1){
            return JsonMsg.success().addInfo("status","删除成功！");
        }else {
            return JsonMsg.fail().addInfo("status","删除失败！");
        }
    }
}
