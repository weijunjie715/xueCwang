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
}
