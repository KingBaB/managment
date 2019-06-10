package com.czb.dao;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/2
 *  Time: 22:52
 *  Description:
 */

import com.czb.bean.Message;
import com.czb.bean.Support;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MessageDao {

    String TABLE_NAME = "tbl_message";

    List<Message> selectMessage();
    /*
     * 获取健身会员信息(分页查询)
     */
    List<Message> selectByLimitAndOffset(@Param("offset") Integer offset, @Param("limit") Integer limit);
    List<Message> selectallMessage();
    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    Integer countMessages();

    Integer delMessageById(@Param("id") Integer id);

    Integer addSupportSum(@Param("id") Integer id);

    Integer subSupportSum(@Param("id") Integer id);

    Support selectSupportByMM(@Param("id") Integer id, @Param("member_id") String member_id);

    Integer insertSupportByMM(@Param("id") Integer id, @Param("member_id") String member_id);
    Integer delSupportByMM(@Param("id") Integer id, @Param("member_id") String member_id);

    Integer insertMessage(@Param("message") Message message);
}
