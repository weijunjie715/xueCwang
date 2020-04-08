package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.Course;
import com.xue.bean.CourseComment;
import com.xue.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ClassName CommentController
 * 描述 : 评论controller
 * @Date 2020/4/7 15:49
 */
@RequestMapping("/comment/")
@Controller
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    /**
     * @Description 通过课程ID 获取对应的课程评论列表
     * @Date 2020/4/7 16:27
     **/
    @ResponseBody
    @RequestMapping("getCommentByCourseId")
    public String getCommentByCourseId(Integer curr,Integer limit,String courseId){
        curr = curr == null?1:curr;
        List<CourseComment> commentInfo = commentService.getCommentInfo(courseId, "1", (curr-1) * limit, limit);
        Integer count = commentService.getCommentInfo(courseId, "1");
        JSONObject res = new JSONObject();
        res.put("content",commentInfo);
        res.put("pages",getPageSize(count,limit));
        System.out.println(JSONObject.toJSONString(res));
        return JSONObject.toJSONString(res);
    }

    /**
     * @Description  添加课程评论信息
     * @Date 2020/4/8 14:39
     **/
    @ResponseBody
    @RequestMapping("addCourseComment")
    public String addCourseComment(CourseComment comment){
        JSONObject res = new JSONObject();
        System.out.println(JSONObject.toJSONString(comment));
        String s = commentService.addCourseComment(comment);
        res.put("msg",s);
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }
}
