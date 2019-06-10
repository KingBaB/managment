package com.czb.util;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/6/8
 *  Time: 15:26
 *  Description:
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserUtil {

    public static String getSession(HttpServletRequest request){
        HttpSession session = request.getSession(true);
        String member_id = String.valueOf(session.getAttribute("username"));
        return member_id;
    }
}
