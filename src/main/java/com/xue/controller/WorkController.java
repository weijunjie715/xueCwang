package com.xue.controller;

import com.xue.bean.TWork;
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
public class WorkController {

    /**
     * @Description 发布作业
     * @Date 2020/4/21 16:22
     **/
    @ResponseBody
    @RequestMapping("addWork")
    public void addWork(TWork work, HttpSession session){

    }
}
