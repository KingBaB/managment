package com.czb.bean;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/23
 *  Time: 14:32
 *  Description:
 */

import org.springframework.web.multipart.MultipartFile;

public class Coach {
    private String coach_id;
    private String coach_name;
    private String password;
    private String sex;
    private String birthday;
    private String pic;
    private String phone;
    private String email;
    private String address;
    private String create_date;
    private String update_date;
    private String last_time;
    private MultipartFile file;

    private int maleCount;
    private int femaleCount;
    private int age1;
    private int age0;
    private int age9;
    private int age8;
    private int age7;
    private int age6;
    private int age5;

    public String getCoach_id() {
        return coach_id;
    }

    public void setCoach_id(String coach_id) {
        this.coach_id = coach_id;
    }

    public String getCoach_name() {
        return coach_name;
    }

    public void setCoach_name(String coach_name) {
        this.coach_name = coach_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getLast_time() {
        return last_time;
    }

    public void setLast_time(String last_time) {
        this.last_time = last_time;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public int getMaleCount() {
        return maleCount;
    }

    public void setMaleCount(int maleCount) {
        this.maleCount = maleCount;
    }

    public int getFemaleCount() {
        return femaleCount;
    }

    public void setFemaleCount(int femaleCount) {
        this.femaleCount = femaleCount;
    }

    public int getAge1() {
        return age1;
    }

    public void setAge1(int age1) {
        this.age1 = age1;
    }

    public int getAge0() {
        return age0;
    }

    public void setAge0(int age0) {
        this.age0 = age0;
    }

    public int getAge9() {
        return age9;
    }

    public void setAge9(int age9) {
        this.age9 = age9;
    }

    public int getAge8() {
        return age8;
    }

    public void setAge8(int age8) {
        this.age8 = age8;
    }

    public int getAge7() {
        return age7;
    }

    public void setAge7(int age7) {
        this.age7 = age7;
    }

    public int getAge6() {
        return age6;
    }

    public void setAge6(int age6) {
        this.age6 = age6;
    }

    public int getAge5() {
        return age5;
    }

    public void setAge5(int age5) {
        this.age5 = age5;
    }
}
