package com.xue.mapper;

import com.xue.bean.AllMyWorkInfo;
import com.xue.bean.TMyWork;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TMyWorkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TMyWork record);

    int insertSelective(TMyWork record);

    TMyWork selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMyWork record);

    int updateByPrimaryKey(TMyWork record);

    List<AllMyWorkInfo> getSWorkList(@Param("userId") String userId,
                                     @Param("bNumber") Integer bNumber,
                                     @Param("eNumber") Integer eNumber);

    int getSWorkCount(@Param("userId") String userId);

    List<AllMyWorkInfo> getSWorkListByWId(@Param("wId") String wId,
                                     @Param("bNumber") Integer bNumber,
                                     @Param("eNumber") Integer eNumber);

    int getSWorkCountByWId(@Param("wId") String wId);

}