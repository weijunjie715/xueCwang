package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.SysUser;
import com.xue.bean.TWork;
import com.xue.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

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
        String s = workService.addWork(work);
        JSONObject res = new JSONObject();
        //执行用户信息入库操作
        res.put("msg",s);
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }
}
