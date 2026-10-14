package carmart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    @Override
    protected void doPost(
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

            HttpSession session =
                    req.getSession();

            List<Car> wishlist =
                    (List<Car>)
                    session.getAttribute("wishlist");

            if (wishlist == null) {

                wishlist =
                        new ArrayList<>();
            }

            // Toggle: if already in wishlist, remove; else add
            boolean found = false;

            for (int i = 0; i < wishlist.size(); i++) {

                if (wishlist.get(i).getId()
                        == car.getId()) {

                    wishlist.remove(i);
                    found = true;
                    break;
                }
            }

            if (!found) {
                wishlist.add(car);
            }

            session.setAttribute(
                    "wishlist",
                    wishlist
            );

            // Redirect back to the referring page
            String referer =
                    req.getHeader("Referer");

            if (referer != null) {
                resp.sendRedirect(referer);
            } else {
                resp.sendRedirect("home");
            }

        } catch (NumberFormatException |
                 ClassNotFoundException |
                 SQLException e) {

            throw new ServletException(
                    "Unable to update wishlist",
                    e
            );
        }
    }
}
