package com.czb.controller;

import com.czb.bean.Member;
import com.czb.bean.User;
import com.czb.service.MemberService;
import com.czb.service.UserService;
import com.czb.util.JsonMsg;
import com.czb.util.MD5Util;
import com.czb.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/test")
    public String test(){
        return "redirect:/error.html";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, @RequestParam("username") String username, @RequestParam("password") String password) throws Exception {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession(true);
        if(!userService.isExistUser(username)){
//            model.addAttribute("msg", "用户不存在");
            mav.setViewName("../login/login");
            mav.addObject("msg", "会员'"+username+"'不存在");
            return mav;
//            request.setAttribute("msg", "用户'"+username+"'不存在");
        }else{
            if(userService.findPwdByUsername(username).getPassword().equals(MD5Util.getMD5(password))){
                userService.updateLoginTime(username);

                request.getSession().setAttribute("username", username);
                session.setAttribute("username",username);
                session.setAttribute("logined","success");
                if(userService.findPwdByUsername(username).getRole().equals("管理员")){
                    mav.setViewName("redirect:../main/back_main.jsp");
                }else {
                    mav.setViewName("redirect:../main/front_main.jsp");
                }
                return mav;
//                return "login";
            }else {
                mav.setViewName("../login/login");
                mav.addObject("msg", "密码不正确！");
                return mav;
//                request.setAttribute("msg", "密码不正确！");
            }
        }
    }
    /**
     * 修改密码
     */
    @RequestMapping("/updatePassword")
    @ResponseBody
    public JsonMsg updatePassword(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword, HttpServletRequest request)throws Exception{
        int res = 0;
        HttpSession session = request.getSession(true);
        String username = String.valueOf(session.getAttribute("username"));
        if (!"".equals(username) || username != null) {
            if (userService.findPwdByUsername(username).getPassword().equals(MD5Util.getMD5(oldPassword))){
                newPassword = MD5Util.getMD5(newPassword);
                System.out.println("::::"+newPassword);
                res = userService.updatePassword(username, newPassword);
                memberService.updatePassword(username, newPassword);
                if(res == 1){
                    return JsonMsg.success().addInfo("status", "密码修改成功！");
                }else {
                    return JsonMsg.fail().addInfo("status", "密码修改失败！");
                }
            }else {
                return JsonMsg.fail().addInfo("status","原始密码不正确！");
            }
        }else {
            return JsonMsg.fail().addInfo("status","请重新登录！");
        }
    }
    /**
     * 退出
     */
    @RequestMapping("/logout")
    @ResponseBody
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession(true);
        session.setAttribute("logined","exit");
        session.setAttribute("username","");
        mav.setViewName("redirect:../login/login.jsp");
        return mav;
    }
    /**
     * 获取登录用户
     */
    @RequestMapping("/getUsername")
    @ResponseBody
    public ModelAndView getUsername(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession(true);
        session.setAttribute("logined","exit");
        session.setAttribute("username","");
        mav.setViewName("../login/login");
        return mav;
    }
    /**
     * 获取登录角色信息
     */
    @RequestMapping("/getUserInfo")
    @ResponseBody
    public JsonMsg getUserInfo(@RequestParam("loginid") String loginid){
        try {
            User user = userService.findPwdByUsername(loginid);
            Member member = memberService.findMemberById(loginid);
            return JsonMsg.success().addInfo("user", user).addInfo("member",member);
        }catch (Exception e){
            e.printStackTrace();
            return JsonMsg.fail().addInfo("error","未知角色");
        }
    }
    @RequestMapping("/myUser")
    @ResponseBody
    public ModelAndView myUser(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("../main/user/myUser");
        HttpSession session = request.getSession(true);
        String member_id = String.valueOf(session.getAttribute("username"));
        if (!"".equals(member_id) || member_id != null) {
            mav.addObject("member_id", member_id);
        }else {
            mav.addObject("status","请重新登录！");
        }

        return mav;
    }

}
