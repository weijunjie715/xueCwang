package com.xue.service.impl;

import com.xue.bean.AllMyWorkInfo;
import com.xue.bean.Relation;
import com.xue.bean.TMyWork;
import com.xue.bean.TWork;
import com.xue.mapper.RelationMapper;
import com.xue.mapper.TMyWorkMapper;
import com.xue.mapper.TWorkMapper;
import com.xue.service.WorkService;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ClassName WorkServiceImpl
 * 描述 :
 * @Date 2020/4/16 11:00
 */
@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    private TWorkMapper workMapper;

    @Autowired
    private RelationMapper relationMapper;

    @Autowired
    private TMyWorkMapper myWorkMapper;

    /**
     * @Description 布置添加作业
     * @Date 2020/4/24 15:29
     **/
    public String addWork(TWork work){
        work.setwUptime(DateUtils.format(new Date(),"yyyy-MM-dd"));
        int i = workMapper.insertForId(work);
        allocationWork(work,i);
        return "success";
    }

    /**
     * @Description 分配工作数据
     * @Date 2020/5/7 15:50
     **/
    public void allocationWork(TWork work,Integer wId){
        //获取课程对应的订阅列表人数数据
        List<Relation> relations = relationMapper.selectRelations(null, work.getcId(), "2");
        //遍历添加作业列表信息
        for(Relation relation:relations){
            TMyWork myWork = new TMyWork();
            myWork.setSuId(relation.getUserId());
            myWork.setwId(wId);
            myWork.setwName(work.getwName());
            myWork.setwCommon(work.getwComment());
            myWork.setwStatus("0");
            myWork.setwUptime(DateUtils.format(new Date(),"yyyy-MM-dd"));
            myWorkMapper.insert(myWork);
        }
    }

    /**
     * @Description 获取学生作业列表数据
     * @Date 2020/5/11 16:46
     **/
    public List<AllMyWorkInfo> getSworkList(String uid,Integer bNumber,Integer eNumber){
        return myWorkMapper.getSWorkList(uid,bNumber,eNumber);
    }

    public Integer getSWorkCount(String uid){
        return myWorkMapper.getSWorkCount(uid);
    }

    /**
     * @Description 获取教师作业展示列表数据
     * @Date 2020/5/11 16:59
     **/
    public List<TWork> getTworkList(String uid,Integer bNumber,Integer eNumber){
        return workMapper.getTWorkList(uid,bNumber,eNumber);
    }

    public Integer getTWorkCount(String uid){
        return workMapper.getTWorkCount(uid);
    }

    /**
     * @Description 教师获取对应作业下的完成情况
     * @Date 2020/5/12 10:40
     **/
    public List<AllMyWorkInfo> getWorkInfoByWId(String wId,Integer bNumber,Integer eNumber){
        return myWorkMapper.getSWorkListByWId(wId,bNumber,eNumber);
    }

    public Integer getSWorkCountByWId(String wId){
        return myWorkMapper.getSWorkCountByWId(wId);
    }


}
