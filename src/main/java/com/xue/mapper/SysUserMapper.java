package com.xue.mapper;

import com.xue.bean.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserMapper {
    int deleteByPrimaryKey(Integer suId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer suId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    SysUser userLogin(@Param("code") String code, @Param("pwd") String pwd);

    SysUser checkUser(SysUser record);

    SysUser selectByUUID(String id);

    List<SysUser> selectSysUsersByType(@Param("curr") Integer curr,@Param("limit") Integer limit,@Param("type") String type);

    int getCountByType(@Param("type") String type);

    int updateByUuid(SysUser record);

    List<SysUser> selectSysUsersByUid(@Param("curr") Integer curr,@Param("limit") Integer limit,
                        @Param("type") String type,@Param("uid") String uid);
}