package com.jesusdaniel.config;

import com.jesusdaniel.config.ConexionMySQL;
import java.sql.Connection;

public class TestConexion {
    public static void main(String[] args) {
        try (Connection conn = ConexionMySQL.getConnection()) {
            if (conn != null) {
                System.out.println("✅ Conexión exitosa a la base de datos.");
            } else {
                System.out.println("❌ No se pudo establecer la conexión.");
            }
        } catch (Exception e) {
            System.out.println("❌ Error al conectar: " + e.getMessage());
        }
    }
}
