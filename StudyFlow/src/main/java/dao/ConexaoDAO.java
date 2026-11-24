package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {

    public Connection conexaoBD() throws ClassNotFoundException {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/organizador_escolar_web"
                    + "?user=root&password=aluno&useSSL=false&serverTimezone=UTC";
            con = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println("Erro ao conectar: " + e.getMessage());
        }
        return con;
    }
}