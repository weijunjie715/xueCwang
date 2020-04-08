package com.xue.mapper;

import com.xue.bean.CourseComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseCommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CourseComment record);

    int insertSelective(CourseComment record);

    CourseComment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseComment record);

    int updateByPrimaryKeyWithBLOBs(CourseComment record);

    int updateByPrimaryKey(CourseComment record);

    List<CourseComment> selectCommentByType(@Param("courseId") String courseId,
                                            @Param("type") String type,
                                            @Param("start") Integer start,
                                            @Param("pageCount") Integer pageCount);

    int selectCountByType(@Param("courseId") String courseId,
                          @Param("type") String type);

    Double getCourseScore(String courseId);
}