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

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

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

            List<CartItem> cart =
                    (List<CartItem>)
                    session.getAttribute("cart");

            if (cart == null) {

                cart =
                        new ArrayList<>();
            }

            boolean found = false;

            for (CartItem item : cart) {

                if (item.getCar().getId()
                        == car.getId()) {

                    item.increaseQuantity();
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(
                        new CartItem(car)
                );
            }

            session.setAttribute(
                    "cart",
                    cart
            );

            resp.sendRedirect("cart");

        } catch (NumberFormatException |
                 ClassNotFoundException |
                 SQLException e) {

            throw new ServletException(
                    "Unable to add car to cart",
                    e
            );
        }
    }
}