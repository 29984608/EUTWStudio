package com.thoughtWorks.util.insertDataUtil;

import org.junit.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;

public class StatementDemo {
    @Test
    public void test() throws Exception {
        Connection conn = null;
        Statement state = null;
        try {
            conn = Dao.getDao();
            state = conn.createStatement();
            try {
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dao.close(state, conn);
        }
    }
}