package com.xue.controller;

import com.xue.bean.Course;
import com.xue.bean.Relation;
import com.xue.bean.SysResources;
import com.xue.bean.SysUser;
import com.xue.service.CourseService;
import com.xue.service.RelationService;
import com.xue.service.ResourcesService;
import com.xue.service.UserService;
import org.apache.commons.lang3.StringUtils;
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

    @Autowired
    private RelationService relationService;

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
        List<Course> courseForIndex = courseService.getCourseForIndex(0, 6,"1",null);
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
            //添加当前登录信息
            SysUser sysUser = checkLogin(session);
            model.addAttribute("userInfo",sysUser);
            model.addAttribute("userInfoShow",userInfo);
            //添加当前数据好友信息
            if(null != sysUser){
                Relation relation = relationService.checkRelation(sysUser.getSuId(), userInfo.getSuId(), "1");
                if(null != relation){
                    model.addAttribute("relation","已添加");
                }
            }
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
     * @Description 教师列表页面
     * @Date 2020/4/7 13:12
     **/
    @RequestMapping("toTeacherListPage")
    public String toTeacherListPage(String userId,HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/teacherListPage";
    }

    /**
     * @Description 学生列表页面
     * @Date 2020/4/7 13:12
     **/
    @RequestMapping("toUserListPage")
    public String toUserListPage(String userId,HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/userListPage";
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
            if(null != sysUser){
                Relation relation = relationService.checkRelation(sysUser.getSuId(), courseInfo.getcId(), "2");
                if(null != relation){
                    model.addAttribute("relation","已订阅");
                }
            }
            model.addAttribute("courseInfo",courseInfo);
            return "student/courseInfoPage";
        }

    }

    /**
     * @Description 进入更新个人信息页面
     * @Date 2020/4/10 13:41
     **/
    @RequestMapping("toUpdateUserInfoPage")
    public String toUpdateUserInfoPage(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        //通过用户ID获取用户的信息数据
        if(null == sysUser){
            model.addAttribute("msg","数据异常");
            return "404";
        }
        SysUser userInfo = userService.getUserInfoByID(sysUser.getSuUuid());
        model.addAttribute("userInfoForUpdate",userInfo);
        return "student/userInfoUpdatePage";
    }

    /**
     * @Description 进入论坛问题列表页面
     * @Date 2020/4/10 13:41
     **/
    @RequestMapping("toBbsListPage")
    public String toBbsListPage(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/bbsListPage";
    }

    /**
     * @Description 进入论坛问题详情页面
     * @Date 2020/4/10 13:41
     **/
    @RequestMapping("toBbsInfoPage")
    public String toBbsInfoPage(String courseId,HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        //获取当前传入课程的数据信息
        if (StringUtils.isBlank(courseId)){
            return "404";
        }
        Course courseInfo = courseService.getCourseInfo(courseId);
        model.addAttribute("courseInfo",courseInfo);
        return "student/bbsInfoPage";
    }

    /**
     * @Description 进入关于我们页面
     * @Date 2020/4/10 13:41
     **/
    @RequestMapping("toAboutUsPage")
    public String toAboutUsPage(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model){
        //用户信息
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        //获取当前传入课程的数据信息
        return "student/aboutUsPage";
    }

    /**
     * @Description 学生访问关注课程列表页面
     * @Date 2020/4/16 9:44
     **/
    @RequestMapping("toUserCoursePage")
    public String toUserCoursePage(HttpSession session,Model model){
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/userCourseListPage";
    }

    /**
     * @Description 教师访问发布课程列表页面
     * @Date 2020/4/16 9:44
     **/
    @RequestMapping("toMyCoursePage")
    public String toTeacherCoursePage(HttpSession session,Model model){
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/myCourseListPage";
    }

    /**
     * @Description 教师访问发布课程列表页面
     * @Date 2020/4/16 9:44
     **/
    @RequestMapping("toMyBbsPage")
    public String toMyBbsPage(HttpSession session,Model model){
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/myBbsListPage";
    }

    /**
     * @Description 进入好友列表页面数据
     * @Date 2020/4/16 9:46
     **/
    public String toMyUserListPage(HttpSession session,Model model){

        return "";
    }

    /**
     * @Description 进入添加课程页面
     * @Date 2020/4/17 10:47
     **/
    @RequestMapping("toAddCoursePage")
    public String toAddCoursePage(HttpSession session,Model model){
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "student/addCoursePage";
    }

    /**
     * @Description 进入布置作业页面
     * @Date 2020/4/17 15:33
     **/
    @RequestMapping("toAddWorkPage")
    public String toAddWorkPage(){
        return "student/addWorkPage";
    }


    @RequestMapping("tocccc")
    public String toUpdateUserInfoPage1(){
        return "student/userInfoUpdatePage";
    }
}
