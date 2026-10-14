package carmart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/", "/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            CarDAO dao = new CarDAOImpl();

            List<Car> cars =
                    dao.getAllCars();

            req.setAttribute("cars", cars);

            req.getRequestDispatcher(
                    "home.jsp"
            ).forward(req, resp);

        } catch (ClassNotFoundException |
                 SQLException e) {

            throw new ServletException(
                    "Database error",
                    e
            );
        }
    }
}