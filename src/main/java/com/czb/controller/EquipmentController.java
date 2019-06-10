package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/26
 *  Time: 16:48
 *  Description:
 */

import com.czb.bean.Equipment;
import com.czb.service.EquipmentService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
@Controller
@RequestMapping("/equipment")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    /*
     * 设备查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getAllEquipment", method = RequestMethod.GET)
    public ModelAndView getAllEquipment(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../equipment/equipmentPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的设备信息
        List<Equipment> equipments = equipmentService.getAllEquipment(offset, limit);
        //获取总的记录数
        int totalItems = equipmentService.getEquipmentCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("equipments", equipments)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mav;
    }
    /*
     * 删除设备
     */
    @RequestMapping(value = "/deleteEquipmentById")
    @ResponseBody
    public JsonMsg deleteEquipmentById(@RequestParam("equipment_id") String equipment_id) throws Exception{
        String res = "";
        if (!"".equals(equipment_id)){
            res = equipmentService.deleteEquipmentById(equipment_id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("equipment_modal_del_error", "设备删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("equipment_modal_del_error", "设备删除异常");
    }

    /**
     * 更改设备信息
     *
     * @param equipment_id
     * @param equipment
     * @return
     */
    @RequestMapping(value = "/updateEquipment/{equipment_id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateEquipment(@PathVariable("equipment_id") String equipment_id, @ModelAttribute Equipment equipment, HttpServletRequest request) throws Exception {
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("images/equipment") + "\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
//        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename = null;
        if (equipment.getFile() != null) {
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = equipment.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            System.out.println("文件后缀名:"+suffixName);
            //获取设备名称
            String equipment_name = "";
            Equipment equipment_mc = equipmentService.findEquipmentById(equipment_id);
            equipment_name = equipment_mc.getEquipment_name();
            //得到 文件名
            filename = equipment_name + "." + suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            equipment.getFile().transferTo(new File(localPath + filename));
//            equipment.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/equipment/" + filename;
            equipment.setPic(sqlPath);
        }
        int res = 0;
        res = equipmentService.updateEquipmentById(equipment_id, equipment);
        if (res != 1) {
            return JsonMsg.fail().addInfo("equipment_update_error", "更改异常");
        }
        return JsonMsg.success();
    }
    /**
     * 查询输入的设备id是否重复
     * @param equipment_id
     * @return
     */
    @RequestMapping(value = "/checkEquipmentIdExists", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg checkEquipmentIdExists(@RequestParam("equipment_id") String equipment_id) throws Exception{
//        System.out.println(equipment_id);
        //对输入的姓名与邮箱格式进行验证
//        x
        Equipment equipment = equipmentService.findEquipmentById(equipment_id);
//        System.out.println(equipment);
        if (equipment != null){
            return JsonMsg.fail().addInfo("equipmentId_reg_error", "设备ID重复");
        }else {
            return JsonMsg.success();
        }
    }
    /**
     * 新增设备
     * @param equipment 新增的设备信息
     * @return
     */
    @RequestMapping(value = "/addEquipment", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addEquipment(@ModelAttribute Equipment equipment, HttpServletRequest request) throws Exception{
        System.out.println(equipment.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath=request.getServletContext().getRealPath("images/equipment")+"\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename=null;
        if(equipment.getFile() != null){
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=equipment.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            System.out.println("文件后缀名:"+suffixName);
            //得到 文件名
            filename=equipment.getEquipment_name()+"."+suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            equipment.getFile().transferTo(new File(localPath+filename));
//            equipment.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/equipment/"+filename;
            equipment.setPic(sqlPath);
        }
        int res = equipmentService.addEquipment(equipment);
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
        int totalItems = equipmentService.getEquipmentCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }
    /**
     * 查询所有设备id
     */
    @RequestMapping(value = "/getEquipment_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getEquipment_id() throws Exception{
        List<Equipment> equipment_idList = equipmentService.getEquipment_id();
        if (equipment_idList != null){
            return JsonMsg.success().addInfo("equipment_idList", equipment_idList);
        }
        return JsonMsg.fail();
    }
    /**
     * 根据设备id查询设备信息
     */
    @RequestMapping(value = "/getInfoByEquipment_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getInfoByEquipment_id(@RequestParam("equipment_id") String equipment_id) throws Exception{
        Equipment equipment = null;
        if (!"".equals(equipment_id)){
            equipment = equipmentService.findEquipmentById(equipment_id);
        }
        if (equipment != null){
//            System.out.println(equipment.getPic());
            return JsonMsg.success().addInfo("equipment",equipment);
        }else {
            return JsonMsg.fail();
        }
    }
    /**
     * 获取信息
     */
    @RequestMapping(value = "/getEquipment", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getEquipment() throws Exception{
        List<Equipment> equipmentList = equipmentService.getEquipment();
        return JsonMsg.success().addInfo("equipmentList", equipmentList);
    }
}
