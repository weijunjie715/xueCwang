package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.Course;
import com.xue.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @ResponseBody
    @RequestMapping("getCourseListForPage")
    public String getCourseListForPage(Integer curr,Integer limit){
        JSONObject res = new JSONObject();
        curr = curr == null?1:curr;
        List<Course> courseList = courseService.getCourseForIndex((curr-1) * limit, limit);
        Integer courseCount = courseService.getCourseCount(new Course());
        res.put("content",courseList);
        res.put("pages",getPageSize(courseCount,limit));
        return JSONObject.toJSONString(res);
    }
}
