package com.xue.mapper;

import com.xue.bean.SysResources;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysResourcesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysResources record);

    int insertSelective(SysResources record);

    SysResources selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysResources record);

    int updateByPrimaryKey(SysResources record);

    List<SysResources> selectByType(@Param("type") String type, @Param("number") Integer number);

    int getMaxIndexByType(@Param("type") String type);

    int insertForId(SysResources record);

    List<SysResources> selectByTypeForPage(@Param("type") String type,@Param("bNumber") Integer bNumber,
                                           @Param("eNumber") Integer eNumber);

    int selectByTypeForCount(@Param("type") String type);
}