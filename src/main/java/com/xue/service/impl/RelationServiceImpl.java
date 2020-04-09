package com.xue.service.impl;

import com.xue.bean.Relation;
import com.xue.mapper.RelationMapper;
import com.xue.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    /**
     * @Description 添加关系方法
     * @Date 2020/4/9 16:53
     **/
    public void addRelation(Relation relation){

    }

    public List<Relation> getRelation(){
        return null;
    }

    /**
     * @Description 获取用户好友列表
     * @Date 2020/4/9 16:59
     **/
    public void getUserRelation(){

    }

    /**
     * @Description 获取用户课程列表
     * @Date 2020/4/9 16:59
     **/
    public void getCourseRelation(){

    }

}
