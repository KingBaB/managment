package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/11
 *  Time: 16:04
 *  Description:
 */

import com.alibaba.fastjson.JSONObject;
import com.czb.bean.Member;
import com.czb.service.MemberService;
import com.czb.util.JsonMsg;
import com.czb.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    /*
     * 会员查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getAllMember", method = RequestMethod.GET)
    public ModelAndView getAllMember(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../member/memberPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的会员信息
        List<Member> members = memberService.getAllMember(offset, limit);
        //获取总的记录数
        int totalItems = memberService.getMemberCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("members", members)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mav;
    }
    /*
     * 删除会员
     */
    @RequestMapping(value = "/deleteMemberById")
    @ResponseBody
    public JsonMsg deleteMemberById(@RequestParam("member_id") String member_id) throws Exception{
        String res = "";
        if (!"".equals(member_id)){
            res = memberService.deleteMemberById(member_id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("member_modal_del_error", "会员删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("member_modal_del_error", "会员删除异常");
    }
    /**
     * 更改员工信息
     * @param member_id
     * @param member
     * @return
     */
    @RequestMapping(value ="/updateMember/{member_id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateMember(@PathVariable("member_id") String member_id, @ModelAttribute Member member, HttpServletRequest request) throws Exception{
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("images/member") + "\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
//        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename = null;
        if (member.getFile() != null) {
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = member.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            System.out.println("文件后缀名:"+suffixName);
            //获取设备名称
            String member_name = "";
            Member member_mc = memberService.findMemberById(member_id);
            member_name = member_mc.getMember_name();
            //得到 文件名
            filename = member_name + "." + suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            member.getFile().transferTo(new File(localPath + filename));
//            member.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/member/" + filename;
            member.setPic(sqlPath);
        }
        int res = 0;
        res = memberService.updateMemberById(member_id, member);
//        System.out.println("___"+res);
//        System.out.println(member_id);
//        System.out.println(JSONObject.toJSONString(member));
        if (res != 1){
            return JsonMsg.fail().addInfo("member_update_error", "更改异常");
        }
        return JsonMsg.success();
    }
    /**
     * 查询输入的会员id是否重复
     * @param member_id
     * @return
     */
    @RequestMapping(value = "/checkMemberIdExists", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg checkMemberIdExists(@RequestParam("member_id") String member_id) throws Exception{
//        System.out.println(member_id);
        //对输入的姓名与邮箱格式进行验证
        String regMemberId = "(^[a-zA-Z0-9_-]{3,16}$)";
        if(!member_id.matches(regMemberId)){
            return JsonMsg.fail().addInfo("memberId_reg_error", "请输入4-16位英文和数字组合");
        }
        Member member = memberService.findMemberById(member_id);
//        System.out.println(member);
        if (member != null){
            return JsonMsg.fail().addInfo("memberId_reg_error", "会员ID重复");
        }else {
            return JsonMsg.success();
        }
    }
    /**
     * 新增会员
     * @param member 新增的会员信息
     * @return
     */
    @RequestMapping(value = "/addMember", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addMember(@ModelAttribute Member member, HttpServletRequest request) throws Exception{
        System.out.println(member.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath=request.getServletContext().getRealPath("images/member")+"\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename=null;
        if(member.getFile() != null){
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=member.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            System.out.println("文件后缀名:"+suffixName);
            //得到 文件名
            filename=member.getMember_id()+"."+suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            member.getFile().transferTo(new File(localPath+filename));
//            member.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/member/"+filename;
            member.setPic(sqlPath);
        }
        member.setPassword(MD5Util.getMD5(member.getPassword()));
        System.out.println(member.getPassword());
        int res = memberService.addMember(member);
        if (res == 1){
            return JsonMsg.success();
        }else {
            return JsonMsg.fail();
        }
    }
    /**
     * 新增记录后，获取最新页数
     */
    @RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getTotalPage() throws Exception{
        int totalItems = memberService.getMemberCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }
    /**
     * 查询所有会员id
     */
    @RequestMapping(value = "/getMember_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getMember_id() throws Exception{
        List<Member> member_idList = memberService.getMember_id();
        if (member_idList != null){
            return JsonMsg.success().addInfo("member_idList", member_idList);
        }
        return JsonMsg.fail();
    }
    /**
     * 根据会员id查询会员信息
     */
    @RequestMapping(value = "/getInfoByMember_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getInfoByMember_id(@RequestParam("member_id") String member_id) throws Exception{
        Member member = null;
        if (!"".equals(member_id)){
            member = memberService.findMemberById(member_id);
        }
        if (member != null){
//            System.out.println(member.getPic());
            return JsonMsg.success().addInfo("member",member);
        }else {
            return JsonMsg.fail();
        }
    }
    /**
     * 性别统计
     */
    @RequestMapping(value = "/getSexCount")
    @ResponseBody
    public JsonMsg getSexCount() throws Exception {
        Member member = memberService.getSexCount();
        int totalCount = memberService.getMemberCount();
        //将上述查询结果放在Model中，在JSP页面进行展示
        return JsonMsg.success().addInfo("maleCount", member.getMaleCount())
                                .addInfo("femaleCount", member.getFemaleCount())
                                .addInfo("other", (totalCount-member.getFemaleCount()-member.getMaleCount()));
//        return JsonMsg.success().addInfo("member", member)
//                                .addInfo("other", (totalCount-member.getFemaleCount()-member.getMaleCount()));
    }
    /**
     * 年龄统计
     */
    @RequestMapping(value = "/getAgeCount")
    @ResponseBody
    public JsonMsg getAgeCount() throws Exception{
        Member member = memberService.getAgeCount();
        int totalCount = memberService.getMemberCount();
        return JsonMsg.success().addInfo("ageCount", member)
                                .addInfo("other", (totalCount-member.getAge0()-member.getAge1()-member.getAge6()-member.getAge7()-member.getAge8()-member.getAge9()));
    }
    /*
     * 会员查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getMemberByMember_id", method = RequestMethod.GET)
    public ModelAndView getMemberByMember_id(@RequestParam("member_id") String member_id) throws Exception{
        ModelAndView mav = new ModelAndView("../member/memberSearchPage");
//        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
//        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的会员信息
        List<Member> members = memberService.findMemberByMember_Id(member_id);
//        //获取总的记录数
//        int totalItems = memberService.getMemberCount();
//        //获取总的页数
//        int temp = totalItems / limit;
//        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
//        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("members", members);
//                .addObject("totalItems", totalItems)
//                .addObject("totalPages", totalPages)
//                .addObject("curPage", curPage);
        return mav;
    }
}
