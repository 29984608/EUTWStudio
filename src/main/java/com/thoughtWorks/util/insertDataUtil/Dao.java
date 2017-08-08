package com.thoughtWorks.util.insertDataUtil;

import org.junit.Test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by pc on 17-5-1.
 */
public class Dao {
    static String user = "root";
    static String password = "root";
    static String url = "jdbc:mysql://192.168.1.112:3306/stuInfo?useUnicode=true&characterEncoding=GBK";

    public static Connection getDao() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;
    }

    public static void close(Statement state, Connection conn){
        if(null != state){
            try {
                state.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(null != conn){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}