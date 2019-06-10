package com.czb.service.impl;

import com.czb.bean.User;
import com.czb.dao.UserDao;
import com.czb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public boolean isExistUser(String loginid) {
        if (userDao.getPwdByusername(loginid) == null) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public User findPwdByUsername(String loginid) throws Exception {
        return userDao.getPwdByusername(loginid);
    }

    @Override
    public Integer updateLoginTime(String loginid) throws Exception {
        return userDao.updateLoginTime(loginid);
    }

    @Override
    public Integer updatePassword(String loginid, String newPassword) throws Exception {
        int res = 0;
        try {
            userDao.updatePassword(loginid, newPassword);
            res = 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }
}
