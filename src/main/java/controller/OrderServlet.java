/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DBUtil;

import model.CartItem;

@WebServlet("/place-order")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<CartItem> cart
                = (List<CartItem>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {

            try {

                Connection conn = DBUtil.getConnection();

                for (CartItem item : cart) {

                    String sql
                            = "UPDATE books SET stock = stock - ? WHERE id = ?";

                    PreparedStatement ps
                            = conn.prepareStatement(sql);

                    ps.setInt(1, item.getQuantity());
                    ps.setInt(2, item.getBookId());

                    ps.executeUpdate();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        // clear cart
        session.removeAttribute("cart");

        // redirect to success page
        response.sendRedirect("order-success.jsp");

    }
}
