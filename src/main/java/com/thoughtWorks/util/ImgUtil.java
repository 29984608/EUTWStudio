package com.thoughtWorks.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class ImgUtil {

    private static String getSuffixName(String imgName) {
        return imgName.substring(imgName.lastIndexOf("."), imgName.length());
    }

    public static String saveImg(MultipartFile file, String dir) {
//        String fileSuffix = getSuffixName(file.getOriginalFilename());
        String filePath = dir + UUID.randomUUID().toString() + ".jpg";

        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return filePath;
    }

}
