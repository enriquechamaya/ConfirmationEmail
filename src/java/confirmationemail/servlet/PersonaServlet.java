package confirmationemail.servlet;

import confirmationemail.bean.Persona;
import confirmationemail.service.PersonaService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;

public class PersonaServlet extends HttpServlet {

    private static final long serialVersionUID = 5557532931536455460L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("listarPersona")) {
            listarPersona(request, response);
        } else if (accion.equals("registrarPersona")) {
            registrarPersona(request, response);
        }
    }

    private void listarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        PersonaService service = new PersonaService();
        ArrayList<Persona> listarPersona = service.listarPersona();
        JSONArray jsonPersona = new JSONArray(listarPersona);
        out.print(jsonPersona);
    }

    private void registrarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
    }

}
