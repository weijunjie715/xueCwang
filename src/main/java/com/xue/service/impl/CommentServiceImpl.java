package com.xue.service.impl;

import com.xue.bean.CourseComment;
import com.xue.mapper.CourseCommentMapper;
import com.xue.mapper.CourseMapper;
import com.xue.service.CommentService;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ClassName CommentServiceImpl
 * 描述 :
 * @Date 2020/4/7 16:32
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CourseCommentMapper commentMapper;

    @Autowired
    private CourseMapper courseMapper;

    //通过课程ID获取对应的课程评论信息
    public List<CourseComment> getCommentInfo(String courseId,String type,Integer start,Integer pageCount){
        List<CourseComment> courseComments = commentMapper.selectCommentByType(courseId, type, start, pageCount);
        return courseComments;
    }

    //获取对应的全部count
    public Integer getCommentInfo(String courseId,String type){
        return commentMapper.selectCountByType(courseId, type);
    }

    /**
     * @Description 添加课程评论信息
     * @Date 2020/4/8 14:41
     **/
    public String addCourseComment(CourseComment comment){
        comment.setCcType("1");
        comment.setCcFlag("1");
        comment.setCcTime(DateUtils.format(new Date(),"yyyy-MM-dd HH:mm"));
        int insert = commentMapper.insert(comment);
        //重新计算分数  添加至课程信息数据
        if(insert > 0){
            updateCourseScore(comment);
        }
        return "success";
    }

    /**
     * @Description 获取课程下所有评论的分数数据
     * @Date 2020/4/8 14:56
     **/
    public void updateCourseScore(CourseComment comment){
        Double courseScore = commentMapper.getCourseScore(comment.getcId() + "");
        //计算百分比分数信息
        Double all = courseScore*20;
        String score = all+"%";
        //更新课程分数数据入库
        int i = courseMapper.updateScoure(score, comment.getcId() + "");
    }
}
