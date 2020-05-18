package com.xue.service;

import com.xue.bean.AllMyWorkInfo;
import com.xue.bean.SysResources;
import com.xue.bean.TWork;

import java.util.List;

/**
 * @ClassName WorkService
 * 描述 :
 * @Date 2020/4/16 11:00
 */
public interface WorkService {

    public String addWork(TWork work);
    public List<AllMyWorkInfo> getSworkList(String uid, Integer bNumber, Integer eNumber);

    public Integer getSWorkCount(String uid);

    public List<TWork> getTworkList(String uid,Integer bNumber,Integer eNumber);

    public Integer getTWorkCount(String uid);

    public List<AllMyWorkInfo> getWorkInfoByWId(String wId,Integer bNumber,Integer eNumber);

    public Integer getSWorkCountByWId(String wId);

    public String subMyWork(String fileUrl,String mwId,String fileType,String fileName);

    public SysResources getResourcesByWId(String mwId);

    public String updateSc(String mwId,String sc);

    public void updateWorkStatus();

}
