package com.xue.mapper;

import com.xue.bean.AllMyWorkInfo;
import com.xue.bean.TMyWork;

import java.util.List;

public interface TMyWorkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TMyWork record);

    int insertSelective(TMyWork record);

    TMyWork selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMyWork record);

    int updateByPrimaryKey(TMyWork record);

    List<AllMyWorkInfo> getAllMyWork(String userId);
}