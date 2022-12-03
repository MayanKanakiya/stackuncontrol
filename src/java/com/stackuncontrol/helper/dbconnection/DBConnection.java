package com.stackuncontrol.helper.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection isConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackuncontrol", "root", "");
        } catch (Exception e) {
            System.out.println("Database Connection Error");
        }
        return con;
    }

}
