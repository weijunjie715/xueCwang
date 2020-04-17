package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.Course;
import com.xue.bean.SysUser;
import com.xue.service.CourseService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName CourseController
 * 描述 :
 * @Date 2020/4/7 11:14
 */
@RequestMapping("/course/")
@Controller
public class CourseController extends BaseController {

    @Autowired
    private CourseService courseService;

    /**
     * @Description type = 1 2 3 4
     * @Date 2020/4/13 9:20
     **/
    @ResponseBody
    @RequestMapping("getCourseListForPage")
    public String getCourseListForPage(String tag,HttpSession session, Integer curr, Integer limit, String type){
        tag = StringUtils.isBlank(tag)?"1":tag;
        SysUser user = checkLogin(session);
        JSONObject res = new JSONObject();
        curr = curr == null?1:curr;
        String uid = null;
        Course course = new Course();
        //获取查询信息数据
        if("1".equals(type)){
            //课程
            type = "1";
            course.setcFlag("1");
        }else if("2".equals(type)){
            //论坛
            type = "1";
            if(null != user.getSuId()){
                uid = user.getSuId()+"";
            }
            course.setcFlag("1");
            course.setcSuId(user.getSuId());
        }else if("3".equals(type)){
            //论坛
            type = "2";
            course.setcFlag("2");
        }else if("4".equals(type)){
            type = "2";

            if(null != user.getSuId()){
                uid = user.getSuId()+"";
            }
            course.setcFlag("1");
            course.setcSuId(user.getSuId());
        }
        List<Course> courseList = new ArrayList<>();
        Integer courseCount = 0;
        if("1".equals(tag)){
            //正常课程  论坛列表
            courseList = courseService.getCourseForIndex((curr-1) * limit, limit,type,uid);
            courseCount = courseService.getCourseCount(course);
        }else if("2".equals(tag)){

            //用户关注课程
            courseList = courseService.getUserCourse((curr-1) * limit, limit,user.getSuId()+"",null,"2");
            courseCount = courseService.getUserCourseCount(user.getSuId()+"",null,"2");
        }

        res.put("content",courseList);
        res.put("pages",getPageSize(courseCount,limit));
        return JSONObject.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("addCourse")
    public String addCourse(Course course,HttpSession session){
        SysUser user = checkLogin(session);
        course.setcSuId(user.getSuId());
        course.setcAuthor(user.getSuName());
        JSONObject res = new JSONObject();
        String s = courseService.addCourse(course);
        res.put("msg",s);
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }

}
