package service;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import presentation.model.User;
import util.C3P0Utils;

import java.sql.SQLException;

public class UserDAO {

    private static String sql;
    private static Object[] params;

    public static Boolean find(String username, String password) {

        QueryRunner qr = new QueryRunner();

        sql = "SELECT * FROM user WHERE name = ? AND password = ?";
        params = new Object[] { username, password };
        User foundUser = new User();
        ResultSetHandler<User> resultSetHandler = new BeanHandler<User>(User.class);

        try {
             foundUser = qr.query(C3P0Utils.getConnection(), sql, resultSetHandler, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return foundUser != null;

    }
}
