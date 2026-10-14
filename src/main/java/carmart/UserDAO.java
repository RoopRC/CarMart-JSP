package carmart;

import java.sql.SQLException;

public interface UserDAO {

    User login(String email, String password)
            throws ClassNotFoundException, SQLException;

    void register(User user)
            throws ClassNotFoundException, SQLException;
}