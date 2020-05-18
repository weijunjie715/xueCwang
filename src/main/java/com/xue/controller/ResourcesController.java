package com.xue.controller;

import com.alibaba.fastjson.JSONObject;
import com.xue.bean.SysResources;
import com.xue.bean.SysUser;
import com.xue.service.CourseService;
import com.xue.service.ResourcesService;
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
 * @ClassName ResourcesController
 * 描述 : 附件资源controller
 * @Date 2020/5/11 10:56
 */
@Controller
@RequestMapping("/resources/")
public class ResourcesController extends BaseController {

    @Autowired
    private ResourcesService resourcesService;

    /**
     * @Description 添加附件资源文件
     * @Date 2020/5/11 10:58
     **/
    @ResponseBody
    @RequestMapping(value="addResources",method=RequestMethod.POST)
    public String addResources(HttpServletResponse response,
                               HttpSession session, HttpServletRequest request,
                               @RequestParam(value="resourcesFile",required=false)MultipartFile uploadfile,
                               String fileType,String fileName,String suReason) throws Exception{
        //获取登陆用户信息数据
        SysUser sysUser = checkLogin(session);

        SysResources resources = new SysResources();
        resources.setOutId(sysUser.getSuId());
        resources.setSrType("5");
        Map<String,Object> result = new HashMap<>();
        result.put("status",false);
        if(uploadfile == null){
            result.put("msg","未选择文件，上传失败");
            return JSONObject.toJSONString(result);
        }
        //获取文件名 后缀信息  判断文件类型
        String originalFilename = uploadfile.getOriginalFilename();
        String suf = originalFilename.split("\\.")[1];
        String fName = originalFilename.split("\\.")[0];
        //判断文件类型  根据类型上传至不同的目录操作
        //上传文件至服务器 保存获取文件路径
        String uuid = DateUtils.format(new Date(),"yyyyMMddHHmmssSSS");
        String s = "";
        if("1".equals(fileType)){
            //视频
            if(!suf.equals("mp4")){
                result.put("msg","视频仅支持mp4文件");
                return JSONObject.toJSONString(result);
            }
            s = saveFileImg(response, session, request, uploadfile, uuid);
            resources.setUrl("1");
        }else if("2".equals(fileType)){
            //PPT
            if(!suf.equalsIgnoreCase("ppt")
                    && !suf.equalsIgnoreCase("pptx")
                    && !suf.equalsIgnoreCase("PPTX")
                    && !suf.equalsIgnoreCase("PPT")){
                result.put("msg","PPT文档格式仅支持ppt、pptx、PPTX、PPT");
                return JSONObject.toJSONString(result);
            }
            s = saveFile(response, session, request, uploadfile, uuid);
            resources.setUrl("3");
        }else{
            //文档
            if(!suf.equalsIgnoreCase("doc")
                    && !suf.equalsIgnoreCase("docx")
                    && !suf.equalsIgnoreCase("xls")
                    && !suf.equalsIgnoreCase("xlsx")
                    && !suf.equalsIgnoreCase("txt")){
                result.put("msg","文档格式仅支持doc、docx、xls、xlsx、txt");
                return JSONObject.toJSONString(result);
            }
            s = saveFile(response, session, request, uploadfile, uuid);
            resources.setUrl("3");
        }

        String msg = "";
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
        resources.setSrName(fileName+"."+suf);
        resources.setRemarks(suReason);
        resources.setFile(msg);
        resources.setFlag(1);
        //进入数据库保存操作
        resourcesService.insertResources(resources);
        result.put("status",true);
        result.put("msg","资源上传成功");
        return JSONObject.toJSONString(result);
    }

    /**
     * 功能描述: 根据资源ID下载对应的资源文件数据 <br>
     * @Return: void
     * @Date: 2020/5/17 13:54
     */
    @RequestMapping(value = "toDowResources")
    public void toDowResources(HttpServletResponse response,
                        HttpSession session, HttpServletRequest request,String rId) throws Exception{
        //获取作业对应的资源文件数据
        SysResources resources = resourcesService.getResourcesById(rId);
        download(resources.getSrName(),resources.getFile(),request,response);
    }

    /**
     * 功能描述: 展示当前提供资源下载的资源列表数据 <br>
     * @Return: void
     * @Date: 2020/5/17 13:54
     */
    @ResponseBody
    @RequestMapping(value = "showResourcesList")
    public String showResourcesList(HttpSession session, Integer curr, Integer limit) throws Exception{
        //获取作业对应的资源文件数据
        JSONObject res = new JSONObject();
        curr = curr == null?1:curr;
        List<SysResources> sWorkList = resourcesService.getResourcesList("5", (curr - 1) * limit, limit);
        Integer sWorkCount = resourcesService.getResourcesCount("5");
        res.put("content",sWorkList);
        res.put("pages",getPageSize(sWorkCount,limit));
        return JSONObject.toJSONString(res);
    }

}
