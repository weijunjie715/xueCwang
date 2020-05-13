package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.AllMyWorkInfo;
import com.xue.bean.SysUser;
import com.xue.bean.TWork;
import com.xue.service.WorkService;
import org.apache.commons.lang3.StringUtils;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName WorkController
 * 描述 : 工作controller
 * @Date 2020/4/20 15:47
 */
@Controller
@RequestMapping("/work/")
public class WorkController extends BaseController {

    @Autowired
    private WorkService workService;

    /**
     * @Description 发布作业
     * @Date 2020/4/21 16:22
     **/
    @ResponseBody
    @RequestMapping("addWork")
    public String addWork(TWork work, HttpSession session){
        SysUser user = checkLogin(session);
        work.setuId(user.getSuId());
        //组装work数据
//        String s = workService.addWork(work);
        JSONObject res = new JSONObject();
        //执行用户信息入库操作
        res.put("msg","success");
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }

    /**
     * @Description type = 1 2 3 4
     * @Date 2020/4/13 9:20
     **/
    @ResponseBody
    @RequestMapping("getWorkListForPage")
    public String getWorkListForPage(String tag,HttpSession session, Integer curr, Integer limit, String type){
        tag = StringUtils.isBlank(tag)?"1":tag;
        SysUser user = checkLogin(session);
        JSONObject res = new JSONObject();
        curr = curr == null?1:curr;
        String uid = null;
        //获取对应的 学生 or 教师的作业列表数据
//        res.put("content",courseList);
//        res.put("pages",getPageSize(courseCount,limit));
        return JSONObject.toJSONString(res);
    }

    /**
     * @Description 获取学生作业列表
     * @Date 2020/5/11 14:50
     **/
    @RequestMapping("getSWorkList")
    @ResponseBody
    public String getSWorkList(HttpSession session, Integer curr, Integer limit, String type){
        SysUser user = checkLogin(session);
        JSONObject res = new JSONObject();
        curr = curr == null?1:curr;
        String uid = user.getSuId()+"";
        List<AllMyWorkInfo> sWorkList = workService.getSworkList(uid, (curr - 1) * limit, limit);
        Integer sWorkCount = workService.getSWorkCount(uid);
        res.put("content",sWorkList);
        res.put("pages",getPageSize(sWorkCount,limit));
        return JSONObject.toJSONString(res);
    }

    /**
     * @Description 获取学生教师作业列表
     * @Date 2020/5/11 14:50
     **/
    @RequestMapping("getTWorkList")
    @ResponseBody
    public String getTWorkList(HttpSession session, Integer curr, Integer limit, String type){
        SysUser user = checkLogin(session);
        JSONObject res = new JSONObject();
        curr = curr == null?1:curr;
        String uid = user.getSuId()+"";
        List<TWork> sWorkList = workService.getTworkList(uid, (curr - 1) * limit, limit);
        Integer sWorkCount = workService.getTWorkCount(uid);
        res.put("content",sWorkList);
        res.put("pages",getPageSize(sWorkCount,limit));
        return JSONObject.toJSONString(res);
    }

    /**
     * @Description 提交作业方法
     * @Author weijunjie
     * @Date 2020/5/13 17:45
     **/
    @ResponseBody
    @RequestMapping(value="addMyWork",method=RequestMethod.POST)
    public String userRegister(HttpServletResponse response,
                               HttpSession session, HttpServletRequest request,
                               @RequestParam(value="workFile",required=false)MultipartFile file,
                               SysUser sysUser) throws Exception {
        Map<String,Object> result = new HashMap<>();
        result.put("status",false);

        return null;
    }
}
