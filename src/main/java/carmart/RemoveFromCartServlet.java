package carmart;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws IOException {

        String id =
                req.getParameter("id");

        if (id != null) {

            int carId =
                    Integer.parseInt(id);

            HttpSession session =
                    req.getSession(false);

            if (session != null) {

                List<CartItem> cart =
                        (List<CartItem>)
                        session.getAttribute("cart");

                if (cart != null) {

                    cart.removeIf(
                            item ->
                            item.getCar().getId()
                            == carId
                    );
                }
            }
        }

        resp.sendRedirect("cart");
    }
}