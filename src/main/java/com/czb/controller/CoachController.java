package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 15:13
 *  Description:
 */

import com.czb.bean.Coach;
import com.czb.service.CoachService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/coach")
public class CoachController {

    @Autowired
    private CoachService coachService;

    /*
     * 教练查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getAllCoach", method = RequestMethod.GET)
    public ModelAndView getAllCoach(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../coach/coachPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的教练信息
        List<Coach> coachs = coachService.getAllCoach(offset, limit);
        //获取总的记录数
        int totalItems = coachService.getCoachCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("coachs", coachs)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mav;
    }
    /*
     * 删除教练
     */
    @RequestMapping(value = "/deleteCoachById")
    @ResponseBody
    public JsonMsg deleteCoachById(@RequestParam("coach_id") String coach_id) throws Exception{
        String res = "";
        if (!"".equals(coach_id)){
            res = coachService.deleteCoachById(coach_id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("coach_modal_del_error", "教练删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("coach_modal_del_error", "教练删除异常");
    }
    /**
     * 更改教练信息
     * @param coach_id
     * @param coach
     * @return
     */
    @RequestMapping(value ="/updateCoach/{coach_id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateCoach(@PathVariable("coach_id") String coach_id, @ModelAttribute Coach coach,  HttpServletRequest request) throws Exception{
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("images/coach") + "\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
//        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename = null;
        if (coach.getFile() != null) {
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = coach.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            System.out.println("文件后缀名:"+suffixName);
            //获取设备名称
            String coach_name = "";
            Coach coach_mc = coachService.findCoachById(coach_id);
            coach_name = coach_mc.getCoach_name();
            //得到 文件名
            filename = coach_name + "." + suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            coach.getFile().transferTo(new File(localPath + filename));
//            coach.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/coach/" + filename;
            coach.setPic(sqlPath);
        }
        int res = 0;
        res = coachService.updateCoachById(coach_id, coach);
        if (res != 1){
            return JsonMsg.fail().addInfo("coach_update_error", "更改异常");
        }
        return JsonMsg.success();
    }
    /**
     * 查询输入的教练id是否重复
     * @param coach_id
     * @return
     */
    @RequestMapping(value = "/checkCoachIdExists", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg checkCoachIdExists(@RequestParam("coach_id") String coach_id) throws Exception{
//        System.out.println(coach_id);
        //对输入的姓名与邮箱格式进行验证
        String regCoachId = "(^[a-zA-Z0-9_-]{3,16}$)";
        if(!coach_id.matches(regCoachId)){
            return JsonMsg.fail().addInfo("coachId_reg_error", "请输入4-16位英文和数字组合");
        }
        Coach coach = coachService.findCoachById(coach_id);
//        System.out.println(coach);
        if (coach != null){
            return JsonMsg.fail().addInfo("coachId_reg_error", "教练ID重复");
        }else {
            return JsonMsg.success();
        }
    }
    /**
     * 新增教练
     * @param coach 新增的教练信息
     * @return
     */
    @RequestMapping(value = "/addCoach", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addCoach(@ModelAttribute Coach coach, HttpServletRequest request) throws Exception{
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath=request.getServletContext().getRealPath("images/coach")+"\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename=null;
        if(coach.getFile() != null){
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=coach.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            System.out.println("文件后缀名:"+suffixName);
            //得到 文件名
            filename=coach.getCoach_id()+"."+suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            coach.getFile().transferTo(new File(localPath+filename));
//            coach.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/coach/"+filename;
            coach.setPic(sqlPath);
        }
        int res = coachService.addCoach(coach);
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
        int totalItems = coachService.getCoachCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }
    /**
     * 查询所有教练id
     */
    @RequestMapping(value = "/getCoach_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getCoach_id() throws Exception{
        List<Coach> coach_idList = coachService.getCoach_id();
        if (coach_idList != null){
            return JsonMsg.success().addInfo("coach_idList", coach_idList);
        }
        return JsonMsg.fail();
    }
    /**
     * 根据教练id查询教练信息
     */
    @RequestMapping(value = "/getInfoByCoach_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getInfoByCoach_id(@RequestParam("coach_id") String coach_id) throws Exception{
        Coach coach = null;
        if (!"".equals(coach_id)){
            coach = coachService.findCoachById(coach_id);
        }
        if (coach != null){
//            System.out.println(coach.getPic());
            return JsonMsg.success().addInfo("coach",coach);
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
        Coach coach = coachService.getSexCount();
        int totalCount = coachService.getCoachCount();
        //将上述查询结果放在Model中，在JSP页面进行展示
        return JsonMsg.success().addInfo("maleCount", coach.getMaleCount())
                .addInfo("femaleCount", coach.getFemaleCount())
                .addInfo("other", (totalCount-coach.getFemaleCount()-coach.getMaleCount()));
//        return JsonMsg.success().addInfo("coach", coach)
//                                .addInfo("other", (totalCount-coach.getFemaleCount()-coach.getMaleCount()));
    }
    /**
     * 年龄统计
     */
    @RequestMapping(value = "/getAgeCount")
    @ResponseBody
    public JsonMsg getAgeCount() throws Exception{
        Coach coach = coachService.getAgeCount();
        int totalCount = coachService.getCoachCount();
        return JsonMsg.success().addInfo("ageCount", coach)
                .addInfo("other", (totalCount-coach.getAge0()-coach.getAge1()-coach.getAge6()-coach.getAge7()-coach.getAge8()-coach.getAge9()));
    }
}
