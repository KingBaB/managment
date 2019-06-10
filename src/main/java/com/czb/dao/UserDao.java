package com.czb.dao;

import com.czb.bean.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface UserDao {

    /*
     *  用户登录
     */
    public User getPwdByusername(String loginid);
    /**
     * 登录校验
     * @return
     */
//    User loginCheck(@Param("username") String username, @Param("password")String password);
    /**
     * 更新登录时间
     */
    Integer updateLoginTime(String loginid);
    /**
     * 修改密码
     */
    Integer updatePassword(@Param("loginid") String loginid, @Param("newPassword") String newPassword);

}
