package carmart;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String email =
                req.getParameter("email");

        String password =
                req.getParameter("password");

        try {

            UserDAO dao =
                    new UserDAOImpl();

            User user =
                    dao.login(email, password);

            if (user != null) {

                HttpSession session =
                        req.getSession();

                session.setAttribute(
                        "loggedUser",
                        user
                );

                resp.sendRedirect("home");

            } else {

                req.setAttribute(
                        "error",
                        "Invalid email or password"
                );

                req.getRequestDispatcher(
                        "login.jsp"
                ).forward(req, resp);
            }

        } catch (ClassNotFoundException |
                 SQLException e) {

            throw new ServletException(
                    "Login error",
                    e
            );
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher(
                "login.jsp"
        ).forward(req, resp);
    }
}