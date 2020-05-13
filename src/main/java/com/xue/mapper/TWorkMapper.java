package com.xue.mapper;

import com.xue.bean.TWork;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TWorkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TWork record);

    int insertSelective(TWork record);

    TWork selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TWork record);

    int updateByPrimaryKey(TWork record);

    int insertForId(TWork record);

    List<TWork> getTWorkList(@Param("userId") String userId,
                             @Param("bNumber") Integer bNumber,
                             @Param("eNumber") Integer eNumber);

    int getTWorkCount(@Param("userId") String userId);
}