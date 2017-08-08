package com.thoughtWorks.util.insertDataUtil;

import org.junit.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Date;

public class StatementDemo {
    Connection conn = null;
    Statement state = null;

    @Test
    public void test() throws Exception {
        try {
            conn = Dao.getDao();
            state = conn.createStatement();
            try {
                String encoding = "GBK";
                File file = new File("/home/ubuntu/IDEA/demo/ssm/demo/sql/s_tudent.sql");
                if (file.isFile() && file.exists()) { // 判断文件是否存在
                    InputStreamReader read = new InputStreamReader(
                            new FileInputStream(file), encoding);// 考虑到编码格式
                    BufferedReader bufferedReader = new BufferedReader(read);
                    String lineTxt = null;
                    System.out.println(new Date());
                    while ((lineTxt = bufferedReader.readLine()) != null) {
                        state.executeUpdate(lineTxt);
                    }
                    bufferedReader.close();
                    read.close();
                } else {
                    System.out.println("找不到指定的文件");
                }
            } catch (Exception e) {

                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println(new Date());
            Dao.close(state,conn);
        }
    }
}