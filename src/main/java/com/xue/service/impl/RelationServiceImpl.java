package com.xue.service.impl;

import com.xue.bean.Relation;
import com.xue.bean.SysUser;
import com.xue.mapper.RelationMapper;
import com.xue.mapper.SysUserMapper;
import com.xue.service.RelationService;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ClassName RelationServiceImpl
 * 描述 :
 * @Date 2020/4/9 16:50
 */
@Service
public class RelationServiceImpl implements RelationService {

    @Autowired
    private RelationMapper relationMapper;

    @Autowired
    private SysUserMapper userMapper;


    public List<Relation> getRelation(){
        return null;
    }

    /**
     * @Description 获取用户好友列表
     * @Date 2020/4/9 16:59
     **/
    public List<SysUser> getUserRelation(Integer curr,Integer limit,SysUser sysUser){
        List<SysUser> sysUsers = userMapper.selectSysUsersByUid(curr, limit, "1", sysUser.getSuId() + "");
        return sysUsers;
    }

    /**
     * @Description 获取用户课程列表
     * @Date 2020/4/9 16:59
     **/
    public void getCourseRelation(Integer curr,Integer limit,SysUser sysUser){

    }

    /**
     * @Description 获取用户作业
     * @Date 2020/4/9 16:59
     **/
    public void getCourseWork(){

    }

    /**
     * @Description 添加关系数据表
     * @Date 2020/4/14 10:46
     **/
    public void addRelation(Relation relation, SysUser user){
        relation.setUserId(user.getSuId());
        relation.setUpTime(DateUtils.format(new Date(),"yyyy-MM-dd HH:mm"));
        relationMapper.insert(relation);
    }

    /**
     * @Description ID关系验证
     * @Date 2020/4/14 11:49
     **/
    public Relation checkRelation(Integer userId,Integer relationId,String type){
        return relationMapper.selectRelation(userId, relationId, type);

    }

}
