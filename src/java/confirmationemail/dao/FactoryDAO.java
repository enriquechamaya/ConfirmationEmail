package confirmationemail.dao;

import confirmationemail.sqldao.FactorySqlDAO;

public abstract class FactoryDAO {

    public static final int SQLSERVER = 1;

    public static FactoryDAO getFactoryDAO(int sgbd) {
        switch (sgbd) {
            case SQLSERVER:
                return new FactorySqlDAO();
            default:
                return null;
        }
    }

    public abstract PersonaDAO getPersonaDAO();

}
