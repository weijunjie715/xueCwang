package com.xue.controller;

import com.xue.bean.Course;
import com.xue.bean.SysResources;
import com.xue.bean.SysUser;
import com.xue.service.CourseService;
import com.xue.service.ResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName PageController
 * 描述 : 页面跳转controller
 * @Date 2020/3/30 10:20
 */
@Controller
@RequestMapping("/")
public class PageController extends BaseController {

    @Autowired
    private ResourcesService resourcesService;

    @Autowired
    private CourseService courseService;

    /**
     * @Description 返回主页
     * @Date 2020/3/30 10:24
     **/
    @RequestMapping("toIndex")
    public String toIndex(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //轮播图
        List<SysResources> resourcesByType = resourcesService.getResourcesByType("1", 5);
        model.addAttribute("photoList",resourcesByType);
        //首页课程
        List<Course> courseForIndex = courseService.getCourseForIndex(0, 6);
        model.addAttribute("courseList",courseForIndex);
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/studentIndex";
    }

    /**
     * @Description 进入注册页面
     * @Date 2020/3/30 10:24
     **/
    @RequestMapping("toRegister")
    public String toRegister(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        return "student/userRegisterPage";
    }

}
