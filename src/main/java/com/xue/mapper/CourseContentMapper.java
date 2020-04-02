package com.xue.mapper;

import com.xue.bean.CourseContent;

public interface CourseContentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CourseContent record);

    int insertSelective(CourseContent record);

    CourseContent selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseContent record);

    int updateByPrimaryKeyWithBLOBs(CourseContent record);

    int updateByPrimaryKey(CourseContent record);
}