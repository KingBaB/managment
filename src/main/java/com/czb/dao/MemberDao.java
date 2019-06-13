package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/11
 *  Time: 15:50
 *  Description:
 */

import com.czb.bean.Member;
import org.apache.ibatis.annotations.*;
import java.util.List;

public interface MemberDao {

    String TABLE_NAME = "tbl_member";

    /*
     * 获取健身会员信息(分页查询)
     */
    public List<Member> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);
    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    public Integer countMembers();
    /*
     * 删除会员信息
     */
    public String deleteMemberById(@Param("member_id") String member_id);
    /*
     * 修改会员信息
     */
    public Integer updateMemberById(@Param("member_id") String member_id, @Param("member") Member member);
    /*
     * 通过会员id查找信息，或者判断会员id是否存在
     */
    Member selectMemberById(@Param("member_id") String member_id);

    List<Member> selectMemberByMember_Id(@Param("member_id") String member_id);
    /**
     * 新增会员信息
     */
    public Integer insertMember(@Param("member") Member member);
    public Integer insertLogin(@Param("member") Member member);
    /**
     * 获取所有会员id
     */
    public List<Member> selectMember_id();
    /**
     * 性别统计
     */
    public Member selectSexCount();
    /**
     * 年龄统计
     */
    public Member selectAgeCount();
    /**
     * 修改密码
     */
    Integer updatePassword(@Param("loginid") String loginid, @Param("newPassword") String newPassword);


}
