package com.xue.controller;

import com.xue.bean.SysUser;
import com.xue.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

/**
 * @ClassName BaseController
 * 描述 :
 * @Date 2020/3/30 17:09
 */
public class BaseController {

    @Autowired
    private UserService userService;

    public SysUser userLogin(HttpSession session,String code,String pwd){
        SysUser sysUser = userService.userLogin(code, pwd);
        if(null != sysUser){
            session.setAttribute("userInfo",sysUser);
            return sysUser;
        }else{
            return null;
        }
    }

    public SysUser checkLogin(HttpSession session){
        SysUser userInfo = (SysUser)session.getAttribute("userInfo");
        if(null == userInfo){
            return null;
        }else{
            return userInfo;
        }

    }

    public boolean checkLoginJSON(HttpSession session){
        SysUser userInfo = (SysUser)session.getAttribute("userInfo");
        if(null == userInfo){
            return false;
        }else{
            return true;
        }
    }

    public Integer getPageSize(Integer count,Integer limit){
        if(count%limit == 0){
            return count/limit;
        }else{
            return ((count-(count%limit))/limit)+1;
        }
    }

    public void loginOut(HttpSession session){
        session.setAttribute("userInfo",null);
    }

    public static void main(String args[]){
        int count = 25;
        int limit = 10;
        if(count%limit == 0){
            System.out.println(count/limit);
        }else{
            System.out.println(((count-(count%limit))/limit)+1);
        }
    }


}
