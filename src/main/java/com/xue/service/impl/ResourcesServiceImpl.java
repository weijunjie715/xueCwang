package com.xue.service.impl;

import com.xue.bean.SysResources;
import com.xue.mapper.SysResourcesMapper;
import com.xue.service.ResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ResourcesServiceImpl
 * 描述 : 资源service
 * @Date 2020/3/30 11:20
 */
@Service
public class ResourcesServiceImpl implements ResourcesService {

    @Autowired
    private SysResourcesMapper resourcesMapper;

    public List<SysResources> getResourcesByType(String type,Integer number){
        List<SysResources> sysResources = resourcesMapper.selectByType(type, number);
        return sysResources;
    }

    /**
     * @Description 插入资源数据 返回id
     * @Date 2020/3/31 17:27
     **/
    public int insertResourcesId(String url,String name,String type){
        try {
            SysResources sysResources = new SysResources();
            sysResources.setFile(url);
            sysResources.setSrName(name);
            sysResources.setFlag(1);
            sysResources.setSrType(type);
            sysResources.setSrIndex(getLastIndexByType(type));
            int i = resourcesMapper.insertForId(sysResources);
            return sysResources.getId();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }

    }

    /**
     * @Description 插入资源数据 返回id
     * @Date 2020/3/31 17:27
     **/
    public int insertResourcesId(String fileUrl,String fileType,String fileName,String type){
        try {
            SysResources resources = new SysResources();
            resources.setFlag(1);
            resources.setFile(fileUrl);
            resources.setSrName(fileName);
            resources.setRemarks(fileType);
            resources.setSrType(type);
            resources.setSrIndex(getLastIndexByType(type));
            int i = resourcesMapper.insertForId(resources);
            return resources.getId();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }

    }


    /**
     * @Description 获取类型图片的下标
     * @Date 2020/3/31 15:54
     **/
    public int getLastIndexByType(String type){
        int maxIndexByType = resourcesMapper.getMaxIndexByType(type);
        return maxIndexByType;
    }

    public SysResources getResourcesById(String id){
        return resourcesMapper.selectByPrimaryKey(Integer.parseInt(id));
    }

}
