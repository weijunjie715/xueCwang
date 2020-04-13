package com.xue.mapper;

import com.xue.bean.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer cId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> selectCourseInfo(@Param("bNumber") Integer bNumber,@Param("eNumber") Integer eNumber,
                                  @Param("type") String type,@Param("uid") String uid);

    Course getCourseById(@Param("courseId") String courseId);

    int getCountByCourse(Course record);

    int updateScoure(@Param("score") String score,@Param("cid") String cid);


}