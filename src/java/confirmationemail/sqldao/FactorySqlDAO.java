package confirmationemail.sqldao;

import confirmationemail.dao.FactoryDAO;

public class FactorySqlDAO extends FactoryDAO {

    static {
        try {
            Class.forName("");
        } catch (ClassNotFoundException e) {
            
        }
    }

}
