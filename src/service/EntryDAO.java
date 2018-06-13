package service;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import presentation.model.Entry;
import util.C3P0Utils;

import java.sql.SQLException;
import java.util.List;

public class EntryDAO {

    private static QueryRunner qr;
    private static int rows;
    private static String sql;
    private static Object[] params;

    /**
     * Updates.
     */

    public static Boolean insert(Entry entry) {

        // convert utilDate to sqlDate...
        //        java.util.Date utilDate = new java.util.Date();
//        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());

//        String datetime = sqlDate.toString() + " " + sqlTime.toString();

        qr = new QueryRunner();
        rows = 0;
        sql = "INSERT INTO entry (title, date, author, content) VALUES (?, ?, ?, ?)";
        params = new Object[] {
            entry.getTitle(), entry.getDate(), entry.getAuthor(), entry.getContent()
        };

        try {
            rows = qr.update(C3P0Utils.getConnection(), sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rows > 0;
    }

    public static Boolean update(Entry entry) {

        qr = new QueryRunner();
        rows = 0;
        sql = "UPDATE books SET title = ?, content = ? WHERE e_id = ?";
        params = new Object[] {
            entry.getTitle(), entry.getContent(), entry.getE_id()
        };

        try {
            rows = qr.update(C3P0Utils.getConnection(), sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rows > 0;
    }

    public static Boolean delete(Entry entry) {

        qr = new QueryRunner();
        rows = 0;
        sql = "DELETE FROM entry WHERE e_id = ?";
        params = new Object[] {
            entry.getE_id()
        };

        try {
            rows = qr.update(C3P0Utils.getConnection(), sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rows > 0;
    }

    /**
     * Queries.
     */

    public static Entry getEntry(int id) {

        qr = new QueryRunner();
        sql = "SELECT * FROM entry WHERE e_id = ?";
        params = new Object[] { id };
        Entry rBean = new Entry();

        try {
            rBean = (Entry) qr.query(C3P0Utils.getConnection(), sql, new BeanHandler<>(Entry.class), params);
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
            beanList = qr.query(C3P0Utils.getConnection(), sql, new BeanListHandler<>(Entry.class), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beanList;
    }

}
