package com.czb.service;

import com.czb.bean.User;
import org.springframework.http.server.ServerHttpResponse;

public interface UserService {

    /*
    *  判断用户是否存在
    */
    public boolean isExistUser(String loginid);

    public User findPwdByUsername(String loginid) throws Exception;

    public Integer updateLoginTime(String loginid) throws Exception;

    public Integer updatePassword(String loginid, String newPassword) throws Exception;

}
