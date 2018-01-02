package confirmationemail.sqldao;

import confirmationemail.bean.Persona;
import confirmationemail.dao.PersonaDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

public class PersonaSqlDAO implements PersonaDAO {

    @Override
    public ArrayList<Persona> listarPersona() {
        ArrayList<Persona> listarPersona = new ArrayList<>();
        String base = "confirmation_email";
        String sql
                = "select "
                + "cod_persona codPersona, "
                + "apellido_paterno apellidoPaterno, "
                + "apellido_materno apellidoMaterno, "
                + "nombre, "
                + "tipo_documento.descripcion_corta codTipoDocumento, "
                + "nro_documento nroDocumento, "
                + "lower(correo) correo , "
                + "fecha_registro fechaRegistro, "
                + "persona.activo activo "
                + "from persona "
                + "inner join dbo.tipo_documento ON dbo.tipo_documento.cod_tipo_documento = dbo.persona.cod_tipo_documento "
                + "order by 2;";
        System.out.println("listarPersona -> " + sql);
        Connection cnx = FactorySqlDAO.obtenerConexion(base);
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Persona p = new Persona();
                p.setCodPersona(rs.getString("codPersona"));
                p.setApellidoPaterno(rs.getString("apellidoPaterno"));
                p.setApellidoMaterno(rs.getString("apellidoMaterno"));
                p.setNombre(rs.getString("nombre"));
                p.setCodTipoDocumento(rs.getString("codTipoDocumento"));
                p.setNroDocumento(rs.getString("nroDocumento"));
                p.setCorreo(rs.getString("correo"));
                p.setFechaRegistro(rs.getString("fechaRegistro"));
                p.setActivo(rs.getString("activo"));
                listarPersona.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error listarPersona -> " + e.getMessage());
        } finally {
            try {
                if (cnx != null) {
                    cnx.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error inseperado listarPersona -> " + e.getMessage());
            }
        }
        return listarPersona;
    }

    @Override
    public int registrarPersona(Persona p) {
        int registro = 0;
        int codPersona = 0;
        String base = "confirmation_email";
        String sql
                = "insert into persona (apellido_paterno,apellido_materno,nombre,cod_tipo_documento,nro_documento,correo,fecha_registro,activo) "
                + "VALUES (upper(?),upper(?),upper(?),?,upper(?),upper(?),getdate(),1)";
        System.out.println("registrarPersona -> " + sql);
        Connection cnx = FactorySqlDAO.obtenerConexion(base);
        PreparedStatement ps_persona = null, ps_persona_enlace = null;
        ResultSet rs = null;
        try {
            cnx.setAutoCommit(false);
            ps_persona = cnx.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps_persona.setString(1, p.getApellidoPaterno());
            ps_persona.setString(2, p.getApellidoMaterno());
            ps_persona.setString(3, p.getNombre());
            ps_persona.setString(4, p.getCodTipoDocumento());
            ps_persona.setString(5, p.getNroDocumento());
            ps_persona.setString(6, p.getCorreo());
            registro = ps_persona.executeUpdate();
            if (registro == 1) {
                rs = ps_persona.getGeneratedKeys();
                rs.next();
                codPersona = rs.getInt(1);
                System.out.println("nuevo codigo => " + codPersona);
                String sql_persona_enlace
                        = "insert into persona_enlace (cod_persona,codigo_verificacion,fecha_creacion,fecha_caducacion,activo) "
                        + "values (?,upper(?),getdate(),dateadd(mi, 2, getdate()),1)";
                System.out.println("registrarPersonaEnlace -> " + sql_persona_enlace);
                cnx.setAutoCommit(false);
                ps_persona_enlace = cnx.prepareStatement(sql_persona_enlace);
                ps_persona_enlace.setInt(1, codPersona);
                ps_persona_enlace.setString(2, generarCodigoAleatorio());
                registro = ps_persona_enlace.executeUpdate();
                if (registro == 1) {
                    cnx.commit();
                } else {
                    cnx.rollback();
                }
            } else {
                cnx.rollback();
            }
        } catch (SQLException e) {
            System.out.println("Error registrarPersona -> " + e.getMessage());
            if (cnx != null) {
                try {
                    cnx.rollback();
                } catch (SQLException ex) {
                    System.out.println("Error al deshacer los cambios (ROLLBACK) -> " + ex.getMessage());
                }
            }
        } finally {
            try {
                if (cnx != null) {
                    cnx.close();
                }
                if (ps_persona != null) {
                    ps_persona.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error inseperado registrarPersona -> " + e.getMessage());
            }
        }
        return registro;
    }

    @Override
    public int actualizarPersona(Persona p) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminarPersona(Persona p) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String generarCodigoAleatorio() {
        Random aleatorio = new Random();
        String alfa = "ABCDEFGHIJKLMNOPQRSTVWXYZ";
        String cadena = "";
        int numero;
        int forma;

        forma = (int) (aleatorio.nextDouble() * alfa.length() - 1 + 0);
        numero = (int) (aleatorio.nextDouble() * 99 + 100);
        cadena = cadena + alfa.charAt(forma) + numero;
        return cadena;
    }

    public static void main(String[] args) {
        PersonaSqlDAO metodo = new PersonaSqlDAO();
        System.out.println(metodo.listarPersona().get(0).getApellidoPaterno());
//        Persona p = new Persona();
//        p.setApellidoPaterno("chamaya");
//        p.setApellidoMaterno("de la cruz");
//        p.setNombre("enrique");
//        p.setCodTipoDocumento("1");
//        p.setNroDocumento("74075863");
//        p.setCorreo("echamaya.ti@sacooliveros.edu.pe");
//        System.out.println("-> " + metodo.registrarPersona(p));
//        System.out.println(metodo.generarCodigoAleatorio());
    }

}
