package carmart;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String name =
                req.getParameter("name");

        String email =
                req.getParameter("email");

        String password =
                req.getParameter("password");

        if (name == null || email == null
                || password == null
                || name.trim().isEmpty()
                || email.trim().isEmpty()
                || password.trim().isEmpty()) {

            req.setAttribute(
                    "error",
                    "All fields are required"
            );

            req.setAttribute("showRegister", true);

            req.getRequestDispatcher(
                    "login.jsp"
            ).forward(req, resp);

            return;
        }

        try {

            UserDAO dao =
                    new UserDAOImpl();

            // Check if user already exists
            User existing =
                    dao.login(email, password);

            if (existing != null) {

                req.setAttribute(
                        "error",
                        "An account with this email already exists"
                );

                req.setAttribute("showRegister", true);

                req.getRequestDispatcher(
                        "login.jsp"
                ).forward(req, resp);

                return;
            }

            User user = new User();
            user.setName(name.trim());
            user.setEmail(email.trim());
            user.setPassword(password.trim());

            dao.register(user);

            HttpSession session =
                    req.getSession();

            session.setAttribute(
                    "loggedUser",
                    user
            );

            resp.sendRedirect("home");

        } catch (ClassNotFoundException |
                 SQLException e) {

            throw new ServletException(
                    "Registration error",
                    e
            );
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("showRegister", true);

        req.getRequestDispatcher(
                "login.jsp"
        ).forward(req, resp);
    }
}
