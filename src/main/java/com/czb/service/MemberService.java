package com.czb.service;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/11
 *  Time: 15:53
 *  Description:
 */

import com.czb.bean.Member;

import java.util.List;

public interface MemberService {

    public List<Member> getAllMember(Integer offset, Integer limit) throws Exception;

    public Integer getMemberCount() throws Exception;

    public String deleteMemberById(String member_id) throws Exception;

    public int updateMemberById(String member_id, Member member) throws Exception;

    public Member findMemberById(String member_id) throws Exception;

    public List<Member> findMemberByMember_Id(String member_id) throws Exception;

    public Integer addMember(Member member) throws Exception;

    public List<Member> getMember_id() throws Exception;

    public Member getSexCount() throws Exception;

    public Member getAgeCount() throws Exception;

    public Integer updatePassword(String loginid, String newPassword) throws Exception;
}
