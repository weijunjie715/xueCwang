package com.xue.service;

import com.xue.bean.SysResources;

import java.util.List;

/**
 * @ClassName ResourcesService
 * 描述 :
 * @Date 2020/3/30 11:19
 */
public interface ResourcesService {

    public List<SysResources> getResourcesByType(String type, Integer number);

    public int insertResourcesId(String url,String name,String type);

    public int insertResourcesId(String fileUrl,String fileType,String fileName,String type);

    public SysResources getResourcesById(String id);

    public Integer insertResources(SysResources sysResources);

    public Integer getResourcesCount(String type);

    public List<SysResources> getResourcesList(String type,Integer bNumber,Integer eNumber);
}
