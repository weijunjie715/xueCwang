package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.SysUser;
import com.xue.service.UserService;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
 * @ClassName UserController
 * 描述 :
 * @Date 2020/3/30 17:26
 */
@Controller
@RequestMapping("/user/")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("toPage")
    public String loginPage(){
        return "login";
    }

    @ResponseBody
    @RequestMapping("userLogin")
    public String userLogin(Model model, HttpSession session, HttpServletRequest request,
                            HttpServletResponse response, String code, String pwd){
        JSONObject res = new JSONObject();
        res.put("code","200");
        System.out.println(code+"______________"+pwd+"___________");
        SysUser sysUser = userLogin(session, code, pwd);
//        model.addAttribute("user",sysUser);
        if(null == sysUser){
            res.put("msg","失败");
            return JSONObject.toJSONString(res);
        }else{
            res.put("msg","success");
            return JSONObject.toJSONString(res);
        }
    }

    @RequestMapping("toSuccess")
    public String toSuccess(Model model, HttpSession session, HttpServletRequest request,
                            HttpServletResponse response){
        SysUser sysUser = checkLogin(session);
        model.addAttribute("userInfo",sysUser);
        return "loginSuccess";
    }

    /**
     * @Description 用户注册方法
     * @Date 2020/3/31 15:26
     **/
    @ResponseBody
    @RequestMapping(value="userRegister",method=RequestMethod.POST)
    public String userRegister(HttpServletResponse response,
                         HttpSession session, HttpServletRequest request,
                         @RequestParam(value="uploadfile",required=false)MultipartFile file,
                         SysUser sysUser) throws Exception {
        Map<String,Object> result = new HashMap<>();
        result.put("status",false);
        //先判断账号是否存在
        boolean b = userService.checkedUser(sysUser);
        if(!b){
            //直接返回账号已存在数据
            result.put("status",false);
            result.put("msg","账号已存在");
            return JSONObject.toJSONString(result);
        }
        request.setCharacterEncoding("UTF-8");
        String msg = "";
        String uuid = DateUtils.format(new Date(),"yyyyMMddHHmmssSSS");
        if(!file.isEmpty()){
            String s = saveFileImg(response, session, request, file, uuid);
            if("300".equals(s)){
                msg = "选择图片过大，请重新选择";
                result.put("msg",msg);
                return JSONObject.toJSONString(result);
            }else if("301".equals(s)){
                msg = "保存文件失败";
                result.put("msg",msg);
                return JSONObject.toJSONString(result);
            }else if("302".equals(s)){
                msg = "文件格式异常";
                result.put("msg",msg);
                return JSONObject.toJSONString(result);
            }else{
                msg = s;
            }
            //路径写入方法  组装保存用户对象入库操作
            sysUser.setSuUuid(uuid);
        }else{
            //路径写入方法  组装保存用户对象入库操作
            sysUser.setSuUuid(uuid);
        }
        //执行用户信息入库操作
        int i = userService.userRegister(sysUser, msg);
        if(i>=1){
            result.put("status",true);
            result.put("msg","注册成功");
        }else{
            result.put("status",false);
            result.put("msg","注册失败");
        }
        return JSONObject.toJSONString(result);
    }

    /**
     * @Description 获取用户列表信息
     * @Date 2020/4/9 14:16
     **/
    @ResponseBody
    @RequestMapping("getUserList")
    public String getUserList(Integer curr,Integer limit,String type,HttpSession session){
        if("3".equals(type)){
            //查看本人的好友信息数据
            SysUser user = checkLogin(session);
            //获取当前人对应的好友关系
            return null;
        }else{
            //获取符合条件的用户列表 1 = 学生  2 = 老师
            JSONObject res = new JSONObject();
            curr = curr == null?1:curr;
            List<SysUser> userListByType = userService.getUserListByType((curr-1) * 10, limit, type);
            int countByType = userService.getCountByType(type);
            res.put("content",userListByType);
            res.put("pages",getPageSize(countByType,limit));
            return JSONObject.toJSONString(res);
        }
    }

    /**
     * @Description 更新我的用户信息数据
     * @Date 2020/4/10 11:25
     **/
    @ResponseBody
    @RequestMapping("updateMyUserInfo")
    public String updateMyUserInfo(SysUser sysUser,HttpSession session,
                                 HttpServletResponse response, HttpServletRequest request,
                                 @RequestParam(value="uploadfile",required=false)MultipartFile file){
        //判断当前上传的文件是否为null
        Map<String,Object> result = new HashMap<>();
        result.put("status",false);
        try {
//
            //先判断账号是否存在
            request.setCharacterEncoding("UTF-8");
            String msg = null;
            String uuid = DateUtils.format(new Date(),"yyyyMMddHHmmssSSS");
            if(null != file && file.getSize() >0){
                String s = saveFileImg(response, session, request, file, uuid);
                if("300".equals(s)){
                    msg = "选择图片过大，请重新选择";
                    result.put("msg",msg);
                    return JSONObject.toJSONString(result);
                }else if("301".equals(s)){
                    msg = "保存文件失败";
                    result.put("msg",msg);
                    return JSONObject.toJSONString(result);
                }else if("302".equals(s)){
                    msg = "文件格式异常";
                    result.put("msg",msg);
                    return JSONObject.toJSONString(result);
                }else{
                    msg = s;
                }
            }else{
            }
            SysUser user = checkLogin(session);
            sysUser.setSuUuid(user.getSuUuid());
            //执行用户信息入库操作
            int i = userService.updateUserInfo(sysUser, msg);
            if(i>=1){
                loginOut(session);
                result.put("status",true);
                result.put("msg","修改成功");
            }else{
                result.put("status",false);
                result.put("msg","修改失败");
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return JSONObject.toJSONString(result);
    }

    /**
     * @Description 注销登录操作
     * @Date 2020/4/10 16:51
     **/
    @ResponseBody
    @RequestMapping("userLoginOut")
    public String userLoginOut(HttpSession session,
                               HttpServletResponse response, HttpServletRequest request){
        Map<String,Object> result = new HashMap<>();
        loginOut(session);
        result.put("status",true);
        result.put("msg","success");
        return JSONObject.toJSONString(result);
    }

    public void zzzz(){

    }
}
