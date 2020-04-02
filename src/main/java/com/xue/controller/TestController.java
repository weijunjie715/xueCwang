package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.SysUser;
import org.apache.commons.io.FilenameUtils;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/upload/")
@Controller
public class TestController {

    @RequestMapping("test")
    public String testPage(){
        System.out.println("-----------------11111111111");
        return "404";
    }

    @ResponseBody
    @RequestMapping(value="stuImg",method=RequestMethod.POST)
    public String stuImg(HttpServletResponse response,
                      HttpSession session, HttpServletRequest request,
                      @RequestParam(value="uploadfile-2",required=false)MultipartFile file,
                      SysUser sysUser) throws UnsupportedEncodingException {
        Map<String,Object> result = new HashMap<>();
        request.setCharacterEncoding("UTF-8");
        String filePath = "";
        String msg = "";
        String uuid = DateUtils.format(new Date(),"yyyyMMddHHmmssSSS");
        //定义文件保存的位置   放到 tomcat 下的 upload 文件夹中的 images 文件夹中
        String targetPath = "upload"+File.separator + "images";

        String path = request.getSession().getServletContext().getRealPath("/");

        //获取 url + 端口号 + 项目名
        String indexPath = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+indexPath+"/";
        System.out.println(" basePath ："  + basePath);
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        //获取源文件文件名
        String oldName= file.getOriginalFilename();
        //获取源文件名后缀
        String prefixName = FilenameUtils.getExtension(oldName);
        String newName = uuid + "." + prefixName;
        int fileMaxSize = 1024000;
        //判断上传大小不得超过 1M
        if(file.getSize()>fileMaxSize){
            msg = "上传文件不得大于1M";
        }else if(prefixName.equalsIgnoreCase("jpg")
                || prefixName.equalsIgnoreCase("png")
                || prefixName.equalsIgnoreCase("jpeg")
                || prefixName.equalsIgnoreCase("gif")){
            //判断上传格式
            //定义新的文件名，当前系统时间+随机数+固定后缀，
            //RandomUtils需要引入jar文件commons-lang.jar
            //String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"personer.jpg";
            //创建新的文件，用于接收用户上传的文件流
            File targetFile = new File(path + targetPath, newName);
            if(!targetFile.exists()){
                targetFile.mkdirs();
            }
            //将上传的文件保存
            try {
                file.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }

            filePath = basePath + File.separator + targetPath + File.separator + newName;
        }else{
            msg ="图片格式不正确！";
        }

        System.out.println(filePath);
        result.put("status",true);
        result.put("msg",msg);
        return JSONObject.toJSONString(result);
    }

}
