package service;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import presentation.model.User;
import util.C3P0Utils;

import java.sql.Connection;
import java.sql.SQLException;

public class UserDAO {

    private static String sql;
    private static Object[] params;
    private static QueryRunner qr;
    private static Connection conn;

    public static Boolean find(String username) {

        qr = new QueryRunner();
        sql = "SELECT * FROM user WHERE name = ?";
        params = new Object[] { username };
        Object[] found = null;

        try {
            conn = C3P0Utils.getConnection();
            found = qr.query(conn, sql, new ArrayHandler(), params);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return found != null;
    }

    public static Boolean login(String username, String password) {

        qr = new QueryRunner();
        sql = "SELECT * FROM user WHERE name = ? AND password = ?";
        params = new Object[] { username, password };
        User foundUser = new User();
        ResultSetHandler<User> resultSetHandler = new BeanHandler<>(User.class);

        try {
            conn = C3P0Utils.getConnection();
            foundUser = qr.query(conn, sql, resultSetHandler, params);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return foundUser != null;

    }

    public static Boolean register(String username, String password) {

        qr = new QueryRunner();
        sql = "INSERT INTO user (name, password) VALUES (?, ?)";
        params = new Object[] { username, password };
        int row = 0;

        try {
            conn = C3P0Utils.getConnection();
            row = qr.update(conn, sql, params);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return row > 0;
    }

}
