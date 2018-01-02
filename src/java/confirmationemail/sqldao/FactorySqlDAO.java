package confirmationemail.sqldao;

import confirmationemail.dao.FactoryDAO;
import confirmationemail.dao.PersonaDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FactorySqlDAO extends FactoryDAO {

    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("error driver sql -> " + e.getMessage());
        }
    }

    public static Connection obtenerConexion(String base) {
        String url, user, pwd;
        Connection cnx = null;
        if (base.equals("confirmation_email")) {
            url = "jdbc:sqlserver://localhost:1433;databaseName=confirmation_email";
            user = "sa";
            pwd = "S3rv1d0r";
            try {
                cnx = DriverManager.getConnection(url, user, pwd);
            } catch (SQLException ex) {
                System.out.println("Error al intentar conectarse a la base de datos -> " + base + ". error -> " + ex.getMessage() + "[" + ex.getErrorCode() + "]");
            }
        }
        return cnx;
    }

    @Override
    public PersonaDAO getPersonaDAO() {
        return new PersonaSqlDAO();
    }

}
