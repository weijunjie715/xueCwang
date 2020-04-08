package com.xue.controller;

import com.xue.bean.Course;
import com.xue.bean.SysResources;
import com.xue.bean.SysUser;
import com.xue.service.CourseService;
import com.xue.service.ResourcesService;
import com.xue.service.UserService;
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

    @Autowired
    private UserService userService;

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
        //首页名师
        List<SysUser> teacherListByType = userService.getUserListByType(0, 6, "0");
        model.addAttribute("teacherList",teacherListByType);
        //首页推荐伙伴信息
        List<SysUser> userListByType = userService.getUserListByType(0, 8, "1");
        model.addAttribute("userList",userListByType);
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

    /**
     * @Description 展示用户信息数据
     * @Date 2020/4/2 17:24
     **/
    @RequestMapping("showUserInfo")
    public String showUserInfo(String userId,HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //通过用户ID获取用户的信息数据
        SysUser userInfo = userService.getUserInfoByID(userId);
        if(null == userInfo){
            return "404";
        }else{
            model.addAttribute("userInfoShow",userInfo);
            return "student/userInfoPage";
        }

    }

    /**
     * @Description 课程列表页面
     * @Date 2020/4/7 13:12
     **/
    @RequestMapping("toCourseListPage")
    public String toCourseListPage(String userId,HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/courseListPage";
    }

    /**
     * @Description 课程内容页面数据
     * @Date 2020/4/7 15:28
     **/
    @RequestMapping("showCourseInfo")
    public String showCourseInfo(String courseId,HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        //通过用户ID获取课程信息数据
        Course courseInfo = courseService.getCourseInfo(courseId);
        if(null == courseInfo){
            return "404";
        }else{
            model.addAttribute("courseInfo",courseInfo);
            return "student/courseInfoPage";
        }

    }
}
