package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/28
 *  Time: 12:12
 *  Description:
 */


import com.czb.bean.Gym;
import com.czb.service.GymService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/gym")
public class GymController {

    @Autowired
    private GymService gymService;

    /*
     * 健身房查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getAllGym", method = RequestMethod.GET)
    public ModelAndView getAllGym(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../gym/gymPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的健身房信息
        List<Gym> gyms = gymService.getAllGym(offset, limit);
        //获取总的记录数
        int totalItems = gymService.getGymCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("gyms", gyms)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mav;
    }
    /*
     * 删除健身房
     */
    @RequestMapping(value = "/deleteGymById")
    @ResponseBody
    public JsonMsg deleteGymById(@RequestParam("gym_id") String gym_id) throws Exception{
        String res = "";
        if (!"".equals(gym_id)){
            res = gymService.deleteGymById(gym_id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("gym_modal_del_error", "健身房删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("gym_modal_del_error", "健身房删除异常");
    }

    /**
     * 更改健身房信息
     *
     * @param gym_id
     * @param gym
     * @return
     */
    @RequestMapping(value = "/updateGym/{gym_id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateGym(@PathVariable("gym_id") String gym_id, @ModelAttribute Gym gym, HttpServletRequest request) throws Exception {
        System.out.println(gym_id);
        System.out.println(gym.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("images/gym") + "\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
//        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename = null;
        if (gym.getFile() != null) {
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = gym.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            System.out.println("文件后缀名:"+suffixName);
            //获取健身房名称
            String gym_name = "";
            Gym gym_mc = gymService.findGymById(gym_id);
            gym_name = gym_mc.getGym_name();
            //得到 文件名
            filename = gym_name + "." + suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            gym.getFile().transferTo(new File(localPath + filename));
//            gym.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            sqlPath = "/images/gym/" + filename;
            gym.setPic(sqlPath);
        }
        //把图片的相对路径保存至数据库
        int res = 0;
        res = gymService.updateGymById(gym_id, gym);
        if (res != 1) {
            return JsonMsg.fail().addInfo("gym_update_error", "更改异常");
        }
        return JsonMsg.success();
    }
    /**
     * 查询输入的健身房id是否重复
     * @param gym_id
     * @return
     */
    @RequestMapping(value = "/checkGymIdExists", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg checkGymIdExists(@RequestParam("gym_id") String gym_id) throws Exception{
//        System.out.println(gym_id);
        //对输入的姓名与邮箱格式进行验证
//        x
        Gym gym = gymService.findGymById(gym_id);
//        System.out.println(gym);
        if (gym != null){
            return JsonMsg.fail().addInfo("gymId_reg_error", "健身房ID重复");
        }else {
            return JsonMsg.success();
        }
    }
    /**
     * 新增健身房
     * @param gym 新增的健身房信息
     * @return
     */
    @RequestMapping(value = "/addGym", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addGym(@ModelAttribute Gym gym, HttpServletRequest request) throws Exception{
        System.out.println(gym.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath=request.getServletContext().getRealPath("images/head")+"\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename=null;
        if(gym.getFile() != null){
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=gym.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            System.out.println("文件后缀名:"+suffixName);
            //得到 文件名
            filename=gym.getGym_name()+"."+suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            gym.getFile().transferTo(new File(localPath+filename));
//            gym.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
        }else {
            return JsonMsg.fail();
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/images/head/"+filename;
        gym.setPic(sqlPath);
        int res = gymService.addGym(gym);
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
        int totalItems = gymService.getGymCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }
    /**
     * 查询所有健身房id
     */
    @RequestMapping(value = "/getGym_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getGym_id() throws Exception{
        List<Gym> gym_idList = gymService.getGym_id();
        if (gym_idList != null){
            return JsonMsg.success().addInfo("gym_idList", gym_idList);
        }
        return JsonMsg.fail();
    }
    /**
     * 根据健身房id查询健身房信息
     */
    @RequestMapping(value = "/getInfoByGym_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getInfoByGym_id(@RequestParam("gym_id") String gym_id) throws Exception{
        Gym gym = null;
        if (!"".equals(gym_id)){
            gym = gymService.findGymById(gym_id);
        }
        if (gym != null){
//            System.out.println(gym.getPic());
            return JsonMsg.success().addInfo("gym",gym);
        }else {
            return JsonMsg.fail();
        }
    }
}
