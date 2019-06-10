package com.czb.bean;/*
 *  Created by IntelliJ IDEA.
 *  User: cuizb
 *  Date: 2019/5/18
 *  Time: 21:10
 *  Description:
 */

import org.springframework.web.multipart.MultipartFile;

public class HomePic {
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
