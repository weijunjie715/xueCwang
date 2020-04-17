package com.xue.mapper;

import com.xue.bean.TMyWork;

public interface TMyWorkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TMyWork record);

    int insertSelective(TMyWork record);

    TMyWork selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMyWork record);

    int updateByPrimaryKey(TMyWork record);
}