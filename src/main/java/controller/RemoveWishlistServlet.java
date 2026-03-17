package controller;

import model.WishlistItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/remove-wishlist")
public class RemoveWishlistServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));

        HttpSession session = request.getSession();

        List<WishlistItem> wishlist =
                (List<WishlistItem>) session.getAttribute("wishlist");

        if (wishlist != null) {

            wishlist.removeIf(item -> item.getBookId() == bookId);

            session.setAttribute("wishlist", wishlist);
        }

        response.sendRedirect("wishlist");
    }
}