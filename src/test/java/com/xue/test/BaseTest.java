package com.xue.test;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.SysResources;
import com.xue.mapper.SysResourcesMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:applicationContext.xml"
})
@WebAppConfiguration
public class BaseTest {

    @Autowired
    private SysResourcesMapper sysResourcesMapper;
    @Test
    public void test1(){
        List<SysResources> sysResources = sysResourcesMapper.selectByType("1", 5);
        System.out.println(JSONObject.toJSONString(sysResources));
    }
}
