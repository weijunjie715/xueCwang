package com.xue.service;

import com.xue.bean.CourseComment;

import java.util.List;

/**
 * @ClassName CommentService
 * 描述 :
 * @Date 2020/4/7 16:31
 */
public interface CommentService {

    public List<CourseComment> getCommentInfo(String courseId, String type, Integer start, Integer pageCount);

    public Integer getCommentInfo(String courseId,String type);
}
