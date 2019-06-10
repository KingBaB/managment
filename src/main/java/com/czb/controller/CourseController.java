package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 20:44
 *  Description:
 */

import com.czb.bean.Cart;
import com.czb.bean.Course;
import com.czb.service.CourseService;
import com.czb.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    /*
     * 课程查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getAllCourse", method = RequestMethod.GET)
    public ModelAndView getAllCourse(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) throws Exception{
        ModelAndView mav = new ModelAndView("../course/coursePage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的课程信息
        List<Course> courses = courseService.getAllCourse(offset, limit);
        //获取总的记录数
        int totalItems = courseService.getCourseCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("courses", courses)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        System.out.println(courses.toArray().toString());
        return mav;
    }
    /*
     * 删除课程
     */
    @RequestMapping(value = "/deleteCourseById")
    @ResponseBody
    public JsonMsg deleteCourseById(@RequestParam("course_id") String course_id) throws Exception{
        String res = "";
        if (!"".equals(course_id)){
            res = courseService.deleteCourseById(course_id);
        }
        if (res.equals("error")){
            return JsonMsg.fail().addInfo("course_modal_del_error", "课程删除异常");
        }
        if (res.equals("success")){
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("course_modal_del_error", "课程删除异常");
    }

    /**
     * 更改课程信息
     *
     * @param course_id
     * @param course
     * @return
     */
    @RequestMapping(value = "/updateCourse/{course_id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateCourse(@PathVariable("course_id") String course_id, @ModelAttribute Course course, HttpServletRequest request) throws Exception {
        System.out.println(course_id);
        System.out.println(course.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("images/course") + "\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename = null;
        if (course.getFile() != null) {
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = course.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            System.out.println("文件后缀名:"+suffixName);
            //获取课程名称
            String course_name = "";
            Course course_mc = courseService.findCourseById(course_id);
            course_name = course_mc.getCourse_name();
            //得到 文件名
            filename = course_name + "." + suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            course.getFile().transferTo(new File(localPath + filename));
//            course.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            //把图片的相对路径保存至数据库
            sqlPath = "/images/course/" + filename;
            course.setPic(sqlPath);
        }

        int res = 0;
        res = courseService.updateCourseById(course_id, course);
        if (res != 1) {
            return JsonMsg.fail().addInfo("course_update_error", "更改异常");
        }
        return JsonMsg.success();
    }
    /**
     * 查询输入的课程id是否重复
     * @param course_id
     * @return
     */
    @RequestMapping(value = "/checkCourseIdExists", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg checkCourseIdExists(@RequestParam("course_id") String course_id) throws Exception{
//        System.out.println(course_id);
        //对输入的姓名与邮箱格式进行验证
        String regCourseId = "(^[a-zA-Z0-9_-]{3,16}$)";
        if(!course_id.matches(regCourseId)){
            return JsonMsg.fail().addInfo("courseId_reg_error", "请输入4-16位英文和数字组合");
        }
        Course course = courseService.findCourseById(course_id);
//        System.out.println(course);
        if (course != null){
            return JsonMsg.fail().addInfo("courseId_reg_error", "课程ID重复");
        }else {
            return JsonMsg.success();
        }
    }
    /**
     * 新增课程
     * @param course 新增的课程信息
     * @return
     */
    @RequestMapping(value = "/addCourse", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg addCourse(@ModelAttribute Course course, HttpServletRequest request) throws Exception{
        System.out.println(course.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath=request.getServletContext().getRealPath("images/course")+"\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename=null;
        if(course.getFile() != null){
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=course.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            System.out.println("文件后缀名:"+suffixName);
            //得到 文件名
            filename=course.getCourse_name()+"."+suffixName;
//            System.out.println("文件名:"+filename);
            //文件保存路径
            course.getFile().transferTo(new File(localPath+filename));
//            course.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/images/course/"+filename;
        course.setPic(sqlPath);
        int res = courseService.addCourse(course);
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
        int totalItems = courseService.getCourseCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }
    /**
     * 查询所有课程id
     */
    @RequestMapping(value = "/getCourse_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getCourse_id() throws Exception{
        List<Course> course_idList = courseService.getCourse_id();
        if (course_idList != null){
            return JsonMsg.success().addInfo("course_idList", course_idList);
        }
        return JsonMsg.fail();
    }
    /**
     * 根据课程id查询课程信息
     */
    @RequestMapping(value = "/getInfoByCourse_id", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getInfoByCourse_id(@RequestParam("course_id") String course_id) throws Exception{
        Course course = null;
        if (!"".equals(course_id)){
            course = courseService.findCourseById(course_id);
        }
        if (course != null){
//            System.out.println(course.getPic());
            return JsonMsg.success().addInfo("course",course);
        }else {
            return JsonMsg.fail();
        }
    }
    /**
     * 获取课程信息
     */
    @RequestMapping(value = "/getCourse", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getCourse() throws Exception{
        List<Course> courseList = courseService.getCourse();
        return JsonMsg.success().addInfo("courseList", courseList);
    }
    /*
         * 课程查询
         * @param pageNo 查询指定页码包含的数据
         * @return
         */
    @RequestMapping(value = "/getallCourse", method = RequestMethod.GET)
    public ModelAndView getallCourse(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,@RequestParam("member_id") String member_id) throws Exception{
        ModelAndView mav = new ModelAndView("../main/user/moreCourse");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获取指定页数包含的课程信息
        List<Course> courses = courseService.getAllCourse(offset, limit);
        //获取总的记录数
        int totalItems = courseService.getCourseCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;
        //将上述查询结果放在Model中，在JSP页面进行展示
        mav.addObject("courses", courses)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("member_id", member_id)
                .addObject("curPage", curPage);
        System.out.println(courses.toArray().toString());
        return mav;
    }
    @RequestMapping(value = "/courseDetail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView courseDetail(@ModelAttribute("course_id")String course_id,@ModelAttribute("member_id")String member_id) throws Exception{
//        System.out.println("课程id:::"+course_id);
        ModelAndView mav = new ModelAndView("../course/courseDetail");
        Course course = courseService.findCourseById(course_id);
        mav.addObject("cart",course)
            .addObject("member_id",member_id);
        return mav;
    }
}
