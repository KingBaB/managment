package com.czb.bean;
/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/6
 *  Time: 21:13
 *  Description: 收藏夹
 */

public class Collections {
    private Integer id;
    private String member_id;
    private String course_id;
    private Course course;
    private Member member;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }


    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
}
