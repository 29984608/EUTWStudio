package com.thoughtWorks.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static String nowDateToYMDSMS() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(currentTime);
    }
}
