package service;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import presentation.model.User;
import util.C3P0Utils;

import java.sql.SQLException;

public class UserDAO {

    private static String sql;
    private static Object[] params;

    // 测试是否可用
    public static Boolean login(String username, String password) {

        System.out.println("qqqqq");
        QueryRunner qr = new QueryRunner();

        sql = "SELECT * FROM user WHERE name = ? AND password = ?";
        params = new Object[] { username, password };
        Object[] userObj = null;

        try {
             userObj = qr.query(C3P0Utils.getConnection(), sql, new ArrayHandler(), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (userObj != null) {
            System.out.println("return true");
        } else {
            System.out.println("return false");
        }
        return userObj != null;

    }
}
