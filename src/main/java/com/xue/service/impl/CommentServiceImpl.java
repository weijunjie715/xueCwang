package com.xue.service.impl;

import com.xue.bean.CourseComment;
import com.xue.mapper.CourseCommentMapper;
import com.xue.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    //通过课程ID获取对应的课程评论信息
    public List<CourseComment> getCommentInfo(String courseId,String type,Integer start,Integer pageCount){
        List<CourseComment> courseComments = commentMapper.selectCommentByType(courseId, type, start, pageCount);
        return courseComments;
    }

    //获取对应的全部count
    public Integer getCommentInfo(String courseId,String type){
        return commentMapper.selectCountByType(courseId, type);
    }
}
