package com.xue.service;

import com.xue.bean.Relation;
import com.xue.bean.SysUser;

import java.util.List;

/**
 * @ClassName RelationService
 * 描述 :
 * @Date 2020/4/9 16:50
 */
public interface RelationService {

    public List<SysUser> getUserRelation(Integer curr,Integer limit,SysUser sysUser);

    public void addRelation(Relation relation, SysUser user);

    public void getCourseRelation(Integer curr,Integer limit,SysUser sysUser);

    public Relation checkRelation(Integer userId,Integer relationId,String type);
}
