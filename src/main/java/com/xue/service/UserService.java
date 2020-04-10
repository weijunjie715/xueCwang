package com.xue.service;

import com.xue.bean.SysUser;

import java.util.List;

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

    public List<SysUser> getUserListByType(Integer curr, Integer limit, String type);

    public int getCountByType(String type);

    public int updateUserInfo(SysUser sysUser,String url);


}
