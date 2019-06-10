package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 20:33
 *  Description:
 */

import com.czb.bean.Course;

import java.util.List;

public interface CourseService {

    public List<Course> getAllCourse(Integer offset, Integer limit) throws Exception;

    public Integer getCourseCount() throws Exception;

    public String deleteCourseById(String course_id) throws Exception;

    public int updateCourseById(String course_id, Course course) throws Exception;

    public Course findCourseById(String course_id) throws Exception;

    public Integer addCourse(Course course) throws Exception;

    public List<Course> getCourse_id() throws Exception;

    public List<Course> getCourse() throws Exception;
}
