package com.jesusdaniel.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMySQL {
    private static final String URL = "jdbc:mysql://localhost:3306/actividad4";
    private static final String USER = "root";
    private static final String PASSWORD = "Daniel260722";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

