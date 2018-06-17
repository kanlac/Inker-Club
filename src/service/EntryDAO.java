package service;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import presentation.model.Entry;
import util.C3P0Utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class EntryDAO {

    private static QueryRunner qr;
    private static int rows;
    private static String sql;
    private static Object[] params;
    private static Connection conn;

    /**
     * Updates.
     */

    public static Boolean insert(String title, String author, String content) {
        // convert utilDate to sqlDate...
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        String datetime = sqlDate.toString() + " " + sqlTime.toString();

        sql = "INSERT INTO entry (title, date, author, content) VALUES (?, ?, ?, ?)";
        params = new Object[] { title, datetime, author, content };

        return executeUpdate(sql, params) > 0;
    }

    public static Boolean update(int e_id, String title, String content) {
        sql = "UPDATE entry SET title = ?, content = ? WHERE e_id = ?";
        params = new Object[] { title, content, e_id };

        return executeUpdate(sql, params) > 0;
    }

    public static Boolean delete(int e_id) {
        sql = "DELETE FROM entry WHERE e_id = ?";
        params = new Object[] { e_id };

        return executeUpdate(sql, params) > 0;
    }

    /** private */
    private static int executeUpdate(String sql, Object[] params) {

        qr = new QueryRunner();
        rows = 0;

        try {
            conn = C3P0Utils.getConnection();
            rows = qr.update(conn, sql, params);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rows;
    }

    /**
     * Queries.
     */

    public static Entry getEntry(int id) {

        qr = new QueryRunner();
        sql = "SELECT * FROM entry WHERE e_id = ?";
        params = new Object[] { id };
        Entry entry = new Entry();

        try {
            conn = C3P0Utils.getConnection();
            entry = qr.query(conn, sql, new BeanHandler<>(Entry.class), params);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entry;
    }

    public static Entry getEntry(String title) {

        qr = new QueryRunner();
        sql = "SELECT * FROM entry WHERE title = ?";
        params = new Object[] { title };
        Entry rBean = new Entry();

        try {
            conn = C3P0Utils.getConnection();
            rBean = qr.query(C3P0Utils.getConnection(), sql, new BeanHandler<>(Entry.class), params);
            conn = C3P0Utils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rBean;
    }

    public static List<Entry> getLatestEntries(int limit) {

        qr = new QueryRunner();
        sql = "SELECT * FROM entry ORDER BY date DESC LIMIT ?";
        params = new Object[] { limit };
        List<Entry> beanList = null;

        try {
            conn = C3P0Utils.getConnection();
            beanList = qr.query(conn, sql, new BeanListHandler<>(Entry.class), params);
            conn = C3P0Utils.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beanList;
    }

    public static List<Entry> getAllEntries() {

        qr = new QueryRunner();
        sql = "SELECT * FROM entry ORDER BY date DESC";
        List<Entry> beanList = null;

        try {
            conn = C3P0Utils.getConnection();
            beanList = qr.query(conn, sql, new BeanListHandler<>(Entry.class));
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beanList;
    }

}
