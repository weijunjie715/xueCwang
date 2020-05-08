package com.xue.mapper;

import com.xue.bean.Relation;
import com.xue.bean.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RelationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Relation record);

    int insertSelective(Relation record);

    Relation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Relation record);

    int updateByPrimaryKey(Relation record);

    Relation selectRelation(@Param("userId") Integer userId,
                            @Param("relationId") Integer relationId,
                            @Param("type") String type);

    List<Relation> selectRelations(@Param("userId") Integer userId,
                            @Param("relationId") Integer relationId,
                            @Param("type") String type);

}