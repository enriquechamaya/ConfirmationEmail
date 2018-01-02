package confirmationemail.service;

import confirmationemail.bean.Persona;
import confirmationemail.dao.FactoryDAO;
import confirmationemail.dao.PersonaDAO;
import java.util.ArrayList;

public class PersonaService {

    FactoryDAO factory = FactoryDAO.getFactoryDAO(FactoryDAO.SQLSERVER);
    PersonaDAO objPersona = factory.getPersonaDAO();

    public ArrayList<Persona> listarPersona() {
        ArrayList<Persona> listarPersona = null;
        try {
            listarPersona = objPersona.listarPersona();
        } catch (Exception e) {
            System.out.println("Error services listarPersona -> " + e.getMessage());
        }
        return listarPersona;
    }

    public int registrarPersona(Persona p) {
        int registrarPersona = 0;
        try {
            registrarPersona = objPersona.registrarPersona(p);
        } catch (Exception e) {
            System.out.println("Error services registrarPersona -> " + e.getMessage());
        }
        return registrarPersona;
    }

}
