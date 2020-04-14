package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.Relation;
import com.xue.bean.SysUser;
import com.xue.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @ClassName RelationController
 * 描述 : 关系controller
 * @Date 2020/4/9 16:36
 */
@Controller
@RequestMapping("/relation/")
public class RelationController extends BaseController {

    @Autowired
    private RelationService relationService;

    /**
     * @Description 添加关系
     * @Date 2020/4/13 9:06
     **/
    @ResponseBody
    @RequestMapping("addRelation")
    public String addRelation(HttpSession session, Relation relation){
        //获取当前登陆的用户信息数据
        SysUser user = checkLogin(session);
        JSONObject res = new JSONObject();
        //组装关系对象数据插入表
        relation.setUserId(user.getSuId());
        relationService.addRelation(relation,user);
        res.put("msg","success");
        res.put("code","200");
        return JSONObject.toJSONString(res);
    }

}
