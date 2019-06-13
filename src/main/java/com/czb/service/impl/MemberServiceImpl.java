package com.czb.service.impl;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/4/11
 *  Time: 15:54
 *  Description:
 */

import com.czb.bean.Member;
import com.czb.dao.MemberDao;
import com.czb.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberDao memberDao;

    @Override
    public List<Member> getAllMember(Integer offset, Integer limit) throws Exception {
        return memberDao.selectByLimitAndOffset(offset, limit);
    }

    @Override
    public Integer getMemberCount() throws Exception {
        return memberDao.countMembers();
    }
    /*
     * 删除会员信息
     */
    public String deleteMemberById(String member_id){
        String status = "";
        try {
            memberDao.deleteMemberById(member_id);
            status = "success";
        }catch (Exception e){
            e.printStackTrace();
            status = "error";
        }
        return status;
    }
    /*
     * 修改会员信息
     */
    public int updateMemberById (String member_id, Member member){
        try {
            memberDao.updateMemberById(member_id, member);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /*
     * 判断新增的会员id是否存在
     */
    @Override
    public Member findMemberById(String member_id) throws Exception {
        return memberDao.selectMemberById(member_id);
    }
    @Override
    public List<Member> findMemberByMember_Id(String member_id) throws Exception {
        return memberDao.selectMemberByMember_Id(member_id);
    }
    /**
     * 新增会员
     */
    @Override
    public Integer addMember(Member member){
        int res = 0;
        try{
            memberDao.insertLogin(member);
            memberDao.insertMember(member);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 获取所有会员id
     */
    @Override
    public List<Member> getMember_id() throws Exception {
        return memberDao.selectMember_id();
    }
    /**
     * 性别统计
     */
    public Member getSexCount() throws Exception{
        return memberDao.selectSexCount();
    }
    /**
     * 年龄统计
     */
    public Member getAgeCount() throws Exception {
        return memberDao.selectAgeCount();
    }

    @Override
    public Integer updatePassword(String loginid, String newPassword) throws Exception {
        int res = 0;
        try {
            memberDao.updatePassword(loginid, newPassword);
            res = 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }
}
