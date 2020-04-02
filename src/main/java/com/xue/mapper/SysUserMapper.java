package com.xue.mapper;

import com.xue.bean.SysUser;
import org.apache.ibatis.annotations.Param;

public interface SysUserMapper {
    int deleteByPrimaryKey(Integer suId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer suId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    SysUser userLogin(@Param("code") String code, @Param("pwd") String pwd);

    SysUser checkUser(SysUser record);

}