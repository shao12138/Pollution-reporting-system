package Test.Dao;

import java.sql.*;

public class mapDao {
    private Connection connection;
    private String driver;
    private String url;
    private String username;
    private String password;

    public mapDao() {
    }

    public mapDao(String driver, String url, String username, String password) {
        this.driver = driver;
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws Exception {
        if (connection == null) {
            Class.forName(this.driver);
            connection = DriverManager.getConnection(url, username, password);
        }
        return connection;
    }

    public boolean insert(String sql, Object... args) throws Exception {
        PreparedStatement statement = getConnection().prepareStatement(sql);
        for (int i = 0; i < args.length; i++) {
            statement.setObject(i + 1, args[i]);
        }
        if (statement.executeUpdate() != 1) {
            return false;
        }
        return true;
    }

    public ResultSet query(String sql, Object... args) throws Exception {
        PreparedStatement statement = getConnection().prepareStatement(sql);
        for (int i = 0; i < args.length; i++) {
            statement.setObject(i + 1, args[i]);
        }
        return statement.executeQuery();
    }

    public void modify(String sql, Object... args) throws Exception {
        PreparedStatement statement = getConnection().prepareStatement(sql);
        for (int i = 0; i < args.length; i++) {
            statement.setObject(i + 1, args[i]);
        }
        statement.executeUpdate();
        statement.close();
    }

    public void closeConn() throws Exception {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}
