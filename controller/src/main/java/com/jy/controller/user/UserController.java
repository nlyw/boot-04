package com.jy.controller.user;

import com.jy.model.user.User;
import com.jy.service.user.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("user/insert")
    @ResponseBody
    String insertUser(User user) {
        userService.insertUser(user);
        return "{}";
    }

    @RequestMapping("toLogin")
    String toLoginPage() {
        return "login";
    }

    @RequestMapping("login")
    @ResponseBody
    Map<String, Object> login(User user) {
        Map<String, Object> map = new HashMap();

        try {
            // 获取Subject实例对象，用户实例（相当于获取到了自定义realm对象）
            Subject subject = SecurityUtils.getSubject();
            // 将用户名和密码封装到UsernamePasswordToken
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUserAccount(), user.getUserPwd());
            //调用login()方法，相当于调用realm中的认证（登陆）方法
            subject.login(token);
            //判断登陆状态是否成功
            //从subject中获取到用户信息
            Object o = subject.getPrincipals().getPrimaryPrincipal();
            if(null != o) {
                //登陆成功
                map.put("code", 1);
            }
        } catch (AuthenticationException authenticationException) {
            map.put("code", 0);
        } finally {
            return map;
        }
    }

    @RequestMapping("user/toList")
    String toUserListPage() {
        return "user/list";
    }

}
