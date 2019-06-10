package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 20:39
 *  Description:
 */

import com.czb.bean.Course;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CourseDao {
    String TABLE_NAME = "tbl_course";
    /*
     * 获取健身课程信息(分页查询)
     */
    public List<Course> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);
    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    public Integer countCourses();
    /*
    * 删除课程信息
    */
    public String deleteCourseById(@Param("course_id") String course_id);
    /*
     * 修改课程信息
     */
    public Integer updateCourseById(@Param("course_id") String course_id, @Param("course") Course course);
    /*
     * 判断课程id是否存在
     */
    public Course selectCourseById(@Param("course_id") String course_id);
    /**
     * 新增课程信息
     */
    public Integer insertCourse(@Param("course") Course course);
    /**
     * 获取所有课程id
     */
    public List<Course> selectCourse_id();
    /**
     * 获取课程信息
     */
    public List<Course> selectCourse();
}
