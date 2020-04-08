package com.xue.service.impl;

import com.xue.bean.SysResources;
import com.xue.bean.SysUser;
import com.xue.mapper.SysResourcesMapper;
import com.xue.mapper.SysUserMapper;
import com.xue.service.ResourcesService;
import com.xue.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName UserServiceImpl
 * 描述 :
 * @Date 2020/3/30 17:11
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private ResourcesService resourcesService;

    public SysUser userLogin(String code,String pwd){
        SysUser sysUser = sysUserMapper.userLogin(code, pwd);
        if(null == sysUser){
            return null;
        }else{
            return sysUser;
        }
    }

    /**
     * @Description 用户注册方法
     * @Date 2020/3/31 15:42
     **/
    public int userRegister(SysUser sysUser,String url){
        int i = 0;
        try {
            if(null != url){
                //执行文件路径上传保存操作
                int z = resourcesService.insertResourcesId(url, sysUser.getSuName(), "3");
                //插入用户表数据
                sysUser.setSuSrId(z);
                i = sysUserMapper.insert(sysUser);
            }else{
                sysUser.setSuSrId(13);
                i = sysUserMapper.insert(sysUser);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return i;
    }

    /**
     * @Description 账户信息判断 唯一性判断
     * @Date 2020/4/2 16:32
     **/
    public boolean checkedUser(SysUser sysUser){
        SysUser sysUser1 = sysUserMapper.checkUser(sysUser);
        if(null == sysUser){
            return true;
        }else{
            return false;
        }
    }

    /**
     * @Description 根据用户ID获取用户信息数据
     * @Date 2020/4/2 17:46
     **/
    public SysUser getUserInfoByID(String id){
        SysUser sysUser = sysUserMapper.selectByUUID(id);

        return sysUser;
    }

    /**
     * @Description 获取对应条件下的用户列表数据
     * @Date 2020/4/8 16:36
     **/
    public List<SysUser> getUserListByType(Integer curr,Integer limit,String type){
        List<SysUser> sysUsers = sysUserMapper.selectSysUsersByType(curr, limit, type);
        return sysUsers;
    }
}
