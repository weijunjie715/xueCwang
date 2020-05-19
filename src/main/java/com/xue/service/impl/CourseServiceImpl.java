package com.xue.service.impl;

import com.xue.bean.Course;
import com.xue.bean.CourseContent;
import com.xue.mapper.CourseContentMapper;
import com.xue.mapper.CourseMapper;
import com.xue.service.CourseService;
import com.xue.service.ResourcesService;
import org.apache.commons.lang3.StringUtils;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ClassName CourseServiceImpl
 * 描述 :
 * @Date 2020/3/30 15:21
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private CourseContentMapper contentMapper;

    @Autowired
    private ResourcesService resourcesService;

    /**
     * @Description 获取首页需要展示的课程列表数据信息
     * @Date 2020/3/30 15:22
     **/
    public List<Course> getCourseForIndex(Integer bNumber, Integer eNumber,String type,String uid){
        List<Course> courses = courseMapper.selectCourseInfo(bNumber, eNumber,type,uid);
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

    /**
     * @Description 添加课程信息数据
     * @Date 2020/4/13 15:46
     **/
    public String addCourse(Course course,String msg){
        if(StringUtils.isNotBlank(msg)){
            int z = resourcesService.insertResourcesId(msg, course.getcName(), "3");
            course.setcSrId(z);
        }
        course.setcUptime(DateUtils.format(new Date(),"yyyy-MM-dd HH:mm"));
        int i = courseMapper.insertForId(course);
        //插入描述表
        CourseContent courseContent = new CourseContent();
        courseContent.setCourseId(course.getcId());
        courseContent.setCourseContent(course.getCourseContent());
        int insert = contentMapper.insert(courseContent);
        return "success";
    }

    /**
     * @Description 获取用户关注的课程学习列表
     * @Date 2020/4/16 13:53
     **/
    public List<Course> getUserCourse(Integer bNumber,Integer eNumber,String uId,String courseType,String rType){
        return courseMapper.selectRelationCourse(bNumber, eNumber, uId, rType);
    }

    public Integer getUserCourseCount(String uId,String courseType,String rType){
        return courseMapper.getUserCourseCount(uId,rType);
    }

    /**
     * @Description 获取用户关注的课程学习列表
     * @Date 2020/4/16 13:53
     **/
    public List<Course> getMyBbsList(Integer bNumber,Integer eNumber,String uId,String courseType){
        return courseMapper.selectCourseInfo(bNumber, eNumber, uId, courseType);
    }

    public Integer getMyBbsCount(Integer uId,String courseType){
        Course course = new Course();
        course.setcFlag(courseType);
        course.setcSuId(uId);
        return courseMapper.getCountByCourse(course);
    }
}
