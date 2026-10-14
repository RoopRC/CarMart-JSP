package carmart;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/carDetails")
public class CarDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String id =
                req.getParameter("id");

        if (id == null) {
            resp.sendRedirect("home");
            return;
        }

        try {

            int carId =
                    Integer.parseInt(id);

            CarDAO dao =
                    new CarDAOImpl();

            Car car =
                    dao.getCarById(carId);

            if (car == null) {
                resp.sendRedirect("home");
                return;
            }

            req.setAttribute("car", car);

            req.getRequestDispatcher(
                    "car-details.jsp"
            ).forward(req, resp);

        } catch (NumberFormatException |
                 ClassNotFoundException |
                 SQLException e) {

            throw new ServletException(
                    "Unable to load car",
                    e
            );
        }
    }
}