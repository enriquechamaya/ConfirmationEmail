package confirmationemail.dao;

import confirmationemail.bean.Persona;
import java.util.ArrayList;

public interface PersonaDAO {

    public ArrayList<Persona> listarPersona();

    public int registrarPersona(Persona p);

    public int actualizarPersona(Persona p);

    public int eliminarPersona(Persona p);

}
