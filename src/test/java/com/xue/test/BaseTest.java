package com.xue.test;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.CourseComment;
import com.xue.bean.CourseContent;
import com.xue.bean.SysResources;
import com.xue.bean.SysUser;
import com.xue.mapper.CourseCommentMapper;
import com.xue.mapper.CourseContentMapper;
import com.xue.mapper.SysResourcesMapper;
import com.xue.mapper.SysUserMapper;
import com.xue.util.ChineseName;
import com.xue.util.RandomValueUtil;
import org.apache.tools.ant.util.DateUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;
import java.util.List;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:applicationContext.xml"
})
@WebAppConfiguration
public class BaseTest {

    @Autowired
    private SysResourcesMapper sysResourcesMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private CourseContentMapper courseContentMapper;

    @Autowired
    private CourseCommentMapper courseCommentMapper;
//    @Test
    public void test1(){
        List<SysResources> sysResources = sysResourcesMapper.selectByType("1", 5);
        System.out.println(JSONObject.toJSONString(sysResources));
    }

    /**
     * @Description 添加用户信息数据
     * @Date 2020/4/7 15:27
     **/
//    @Test
    public void testAddRes(){
        //添加用户头像
        /*for(int i = 1;i<31;i++){
            SysResources sysResources = new SysResources();
            sysResources.setSrType("3");
            sysResources.setSrName("p"+i);
            sysResources.setFile("static/img/img3/p"+i+".jpg");
            sysResources.setFlag(1);
            sysResourcesMapper.insert(sysResources);
        }*/
        //添加用户信息
        for(int i = 2;i<50;i++){
            SysUser sysUser = new SysUser();
            String uuid = DateUtils.format(new Date(),"yyyyMMddHHmmssSSS");
            sysUser.setSuUuid(uuid);
            //获取一个随机的图片资源数据
            Random random = new Random();
            int id = random.nextInt(29);
            sysUser.setSuSrId(id+46);
            sysUser.setSuBirthday("2000-01-01");
            sysUser.setSuEmail(RandomValueUtil.getEmail(8,10));
            sysUser.setSuCode("test100000"+i);
            sysUser.setSuPhone(RandomValueUtil.getTelephone());
            sysUser.setSuSex((i%2)+"");
            if(i>40){
                sysUser.setSuRole("0");
            }else{
                sysUser.setSuRole("1");
            }
            sysUser.setSuReason(ChineseName.createCourseComment());
            sysUser.setSuName(RandomValueUtil.getChineseName());
            sysUser.setSuPwd("123123");
            sysUserMapper.insert(sysUser);
        }

    }

    /**
     * @Description 添加文章内容数据
     * @Date 2020/4/7 15:26
     **/
//    @Test
    public void testAddCourseContent(){
        //添加用户信息
        for(int i = 2;i<=25;i++){
            CourseContent courseContent = new CourseContent();
            courseContent.setCourseId(i);
            courseContent.setCourseContent(ChineseName.createCourseContent());
            courseContentMapper.insert(courseContent);
        }
    }
    /**
     * @Description 随机添加用户评论数据
     * @Date 2020/4/7 15:26
     **/
//    @Test
    public void testAddComment(){
        //添加用户评论
        //遍历课程
        for(int i = 1;i<=25;i++){
            //随机评论条数
            Random random = new Random();
            int j = random.nextInt(15);
            for(int z = 1;z<=j;z++){
                //获取随机一个用户信息数据
                Random rd = new Random();
                int uId = rd.nextInt(50)+1;
                //组装评论数据信息
                CourseComment cc = new CourseComment();
                cc.setCcFlag("1");
                cc.setCcUserId(uId);
                cc.setcId(i);
                cc.setCcTime("2020-04-07 16:15");
                cc.setCcComment(ChineseName.createCourseComment());
                cc.setCcScoure("4");
                cc.setCcType("1");
                courseCommentMapper.insert(cc);
            }
        }
    }

}
