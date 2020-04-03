package com.xue.service;

import com.xue.bean.SysUser;

/**
 * @ClassName UserService
 * 描述 :
 * @Date 2020/3/30 17:10
 */
public interface UserService {

    SysUser userLogin(String code, String pwd);

    int userRegister(SysUser sysUser,String url);

    public boolean checkedUser(SysUser sysUser);

    public SysUser getUserInfoByID(String id);
}
