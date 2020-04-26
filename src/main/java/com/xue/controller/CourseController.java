package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.Course;
import com.xue.bean.SysUser;
import com.xue.service.CourseService;
import org.apache.commons.lang3.StringUtils;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
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

    /**
     * @Description 课程讨论问题新增
     * @Date 2020/4/17 13:58
     **/
    @ResponseBody
    @RequestMapping("addCourse")
    public String addCourse(Course course,HttpServletResponse response,
                            HttpSession session, HttpServletRequest request,
                            @RequestParam(value="uploadfile",required=false)MultipartFile file) throws Exception{
        SysUser user = checkLogin(session);
        course.setcSuId(user.getSuId());
        course.setcAuthor(user.getSuName());
        JSONObject res = new JSONObject();
        request.setCharacterEncoding("UTF-8");
        String msg = "";
        String uuid = DateUtils.format(new Date(),"yyyyMMddHHmmssSSS");
        if(null != file && file.getSize() >0){
            String s = saveFile(response, session, request, file, uuid);
            if("300".equals(s)){
                msg = "选择图片过大，请重新选择";
                res.put("msg",msg);
                return JSONObject.toJSONString(res);
            }else if("301".equals(s)){
                msg = "保存文件失败";
                res.put("msg",msg);
                return JSONObject.toJSONString(res);
            }else if("302".equals(s)){
                msg = "文件格式异常";
                res.put("msg",msg);
                return JSONObject.toJSONString(res);
            }else{
                msg = s;
            }
        }
        //执行用户信息入库操作
        String s = courseService.addCourse(course,msg);
        res.put("msg",s);
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }

    /**
     * @Description 课程讨论问题新增
     * @Date 2020/4/17 13:58
     **/
    @ResponseBody
    @RequestMapping("addBbs")
    public String addBbs(Course course,HttpServletResponse response,
                            HttpSession session, HttpServletRequest request) throws Exception{
        SysUser user = checkLogin(session);
        course.setcSuId(user.getSuId());
        course.setcAuthor(user.getSuName());
        JSONObject res = new JSONObject();
        //执行用户信息入库操作
        String s = courseService.addCourse(course,"");
        res.put("msg",s);
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }

}
