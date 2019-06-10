package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 20:35
 *  Description:
 */

import com.czb.bean.Course;
import com.czb.dao.CourseDao;
import com.czb.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService{
    @Autowired
    private CourseDao courseDao;

    @Override
    public List<Course> getAllCourse(Integer offset, Integer limit) throws Exception {
        return courseDao.selectByLimitAndOffset(offset, limit);
    }

    @Override
    public Integer getCourseCount() throws Exception {
        return courseDao.countCourses();
    }
    /*
     * 删除课程信息
     */
    public String deleteCourseById(String course_id){
        String status = "";
        try {
            courseDao.deleteCourseById(course_id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }
    /*
     * 修改课程信息
     */
    public int updateCourseById (String course_id, Course course){
        try {
            courseDao.updateCourseById(course_id, course);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /*
     * 判断新增的课程id是否存在
     */
    @Override
    public Course findCourseById(String course_id) throws Exception {
        return courseDao.selectCourseById(course_id);
    }
    /**
     * 新增课程
     */
    @Override
    public Integer addCourse(Course course){
        int res = 0;
        try{
            courseDao.insertCourse(course);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 获取所有课程id
     */
    @Override
    public List<Course> getCourse_id() throws Exception {
        return courseDao.selectCourse_id();
    }

    @Override
    public List<Course> getCourse() throws Exception {
        return courseDao.selectCourse();
    }
}
