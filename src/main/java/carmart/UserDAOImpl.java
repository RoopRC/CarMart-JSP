package carmart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {

    @Override
    public User login(
            String email,
            String password)
            throws ClassNotFoundException, SQLException {

        User user = null;

        Connection con =
                DBConnection.getConnection();

        String sql =
                "SELECT * FROM users " +
                "WHERE email = ? AND password = ?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs =
                ps.executeQuery();

        if (rs.next()) {

            user = new User();

            user.setId(
                    rs.getInt("id")
            );

            user.setName(
                    rs.getString("name")
            );

            user.setEmail(
                    rs.getString("email")
            );

            user.setPassword(
                    rs.getString("password")
            );
        }

        rs.close();
        ps.close();
        con.close();

        return user;
    }

    @Override
    public void register(User user)
            throws ClassNotFoundException, SQLException {

        Connection con =
                DBConnection.getConnection();

        String sql =
                "INSERT INTO users (name, email, password) " +
                "VALUES (?, ?, ?)";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());

        ps.executeUpdate();

        ps.close();
        con.close();
    }
}