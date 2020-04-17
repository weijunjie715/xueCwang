package com.xue.controller;

import com.xue.bean.SysUser;
import com.xue.service.UserService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * @ClassName BaseController
 * 描述 :
 * @Date 2020/3/30 17:09
 */
public class BaseController {

    @Autowired
    private UserService userService;

    public SysUser userLogin(HttpSession session,String code,String pwd){
        SysUser sysUser = userService.userLogin(code, pwd);
        if(null != sysUser){
            session.setAttribute("userInfo",sysUser);
            return sysUser;
        }else{
            return null;
        }
    }

    public SysUser checkLogin(HttpSession session){
        SysUser userInfo = (SysUser)session.getAttribute("userInfo");
        if(null == userInfo){
            return null;
        }else{
            return userInfo;
        }

    }

    public boolean checkLoginJSON(HttpSession session){
        SysUser userInfo = (SysUser)session.getAttribute("userInfo");
        if(null == userInfo){
            return false;
        }else{
            return true;
        }
    }

    public Integer getPageSize(Integer count,Integer limit){
        if(count%limit == 0){
            return count/limit;
        }else{
            return ((count-(count%limit))/limit)+1;
        }
    }

    public void loginOut(HttpSession session){
        session.setAttribute("userInfo",null);
    }

    public static void main(String args[]){
        int count = 25;
        int limit = 10;
        if(count%limit == 0){
            System.out.println(count/limit);
        }else{
            System.out.println(((count-(count%limit))/limit)+1);
        }
    }

    /**
     * @Description 保存上传头像图片
     * @Date 2020/3/31 15:37
     **/
    public String saveFile(HttpServletResponse response, HttpSession session,
                           HttpServletRequest request, MultipartFile file, String uuid) throws Exception{
        request.setCharacterEncoding("UTF-8");
        String filePath = "";
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
            return "300";
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
                return "301";
            }
            filePath = basePath + File.separator + targetPath + File.separator + newName;
            return filePath;
        }else{
            return "302";
        }
    }

}
