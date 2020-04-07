package com.xue.service;

import com.xue.bean.Course;

import java.util.List;

/**
 * @ClassName CourseService
 * 描述 : 课程相关service
 * @Date 2020/3/30 15:21
 */
public interface CourseService {

    public List<Course> getCourseForIndex(Integer bNumber, Integer eNumber);

    public Course getCourseInfo(String courseId);

    public Integer getCourseCount(Course course);
}
