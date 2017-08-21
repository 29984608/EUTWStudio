package com.thoughtWorks.util.insertDataUtil;

import org.junit.Test;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
public class TaskUtil {
    private Connection conn = null;
    private Statement state = null;
    @Test
    public void test() throws Exception {
        try {
            conn = Dao.getDao();
            state = conn.createStatement();
            File file = new File("/home/ubuntu/IDEA/demo/ssm/demo/sql/s_tudent.sql");
            if (file.isFile() && file.exists()) {
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file), "GBK");
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt;
                while ((lineTxt = bufferedReader.readLine()) != null) {
                    state.executeUpdate(lineTxt);
                }
                bufferedReader.close();
                read.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dao.close(state, conn);
        }
    }

    public void say(){
        String sql = "update t_student set gender ='F' where no ='105010000104'" ;
        try {
            conn = Dao.getDao();
            state = conn.createStatement();
            System.out.println("开始");
            int result = state.executeUpdate(sql);
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            Dao.close(state, conn);
        }
    }
}