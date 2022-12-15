package com.CS01.SerWise;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckUser {

    public static boolean checkUserExists(String email) throws SQLException, ClassNotFoundException {
        boolean userExists = false;

        Connection conn= null;
        Statement statement = null;

        conn = DatabaseConnection.initializeDatabase();
        String query = "select count(*) from serwise.user where id = " + "'" + email + "'";

        try {
            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                if (resultSet.getInt("count(*)") > 0)
                    userExists = true;
                break;
            }
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // finally block used to close resources
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        return userExists;
    };
}
