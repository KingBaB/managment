package com.czb.controller;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/18
 *  Time: 21:10
 *  Description:
 */

import com.czb.bean.HomePic;
import com.czb.util.JsonMsg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@RequestMapping("/pic")
public class UpdatePic {

    @RequestMapping(value = "/updatePic", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateEquipment(@ModelAttribute HomePic homePic, HttpServletRequest request) throws Exception {
        System.out.println(homePic.getFile());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("images/main") + "\\";
//        String localPath2="F:\\project\\managment\\src\\main\\webapp\\images\\head\\";
//        System.out.println(localPath);
//        String localPath = request.getContextPath();
        //定义 文件名
        String filename = null;
        if (homePic.getFile() != null) {
            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = homePic.getFile().getContentType();
//            System.out.println("文件类型:"+contentType);
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            System.out.println("文件后缀名:"+suffixName);
            //得到 文件名
            filename = "bann2.jpg";
            //文件保存路径
            homePic.getFile().transferTo(new File(localPath + filename));
//            equipment.getFile().transferTo(new File(localPath2+filename));
//            System.out.println("保存路径："+localPath+filename);
            return JsonMsg.success().addInfo("status","更改成功！");
        }else {
            return JsonMsg.fail().addInfo("status","更改失败！");
        }

    }

}
