/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {

            for (CartItem item : cart) {

                if (item.getBookId() == bookId) {

                    if ("increase".equals(action)) {

                        item.setQuantity(item.getQuantity() + 1);

                    } else if ("decrease".equals(action)) {

                        int qty = item.getQuantity() - 1;

                        if (qty <= 0) {
                            cart.remove(item);
                        } else {
                            item.setQuantity(qty);
                        }

                    }

                    break;
                }
            }

            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart");
    }
}