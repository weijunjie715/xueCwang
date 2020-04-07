package com.xue.service.impl;

import com.xue.bean.Course;
import com.xue.mapper.CourseMapper;
import com.xue.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CourseServiceImpl
 * 描述 :
 * @Author weijunjie
 * @Date 2020/3/30 15:21
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    /**
     * @Description 获取首页需要展示的课程列表数据信息
     * @Date 2020/3/30 15:22
     **/
    public List<Course> getCourseForIndex(Integer bNumber, Integer eNumber){
        List<Course> courses = courseMapper.selectCourseInfo(bNumber, eNumber);
        return courses;
    }

    /**
     * @Description 获取课程信息数据
     * @Date 2020/4/7 9:06
     **/
    public Course getCourseInfo(String courseId){
        Course courseById = courseMapper.getCourseById(courseId);
        return courseById;
    }

    /**
     * @Description 获取当前课程总数
     * @Date 2020/4/7 11:19
     **/
    public Integer getCourseCount(Course course){
        int courseCount = courseMapper.getCountByCourse(course);
        return courseCount;
    }
}
