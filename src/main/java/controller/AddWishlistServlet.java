package controller;

import dao.BookDAO;
import model.Book;
import model.WishlistItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-wishlist")
public class AddWishlistServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));

        HttpSession session = request.getSession();

        List<WishlistItem> wishlist =
                (List<WishlistItem>) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        BookDAO dao = new BookDAO();
        Book book = dao.getBookById(bookId);

        boolean exists = false;

        for (WishlistItem item : wishlist) {
            if (item.getBookId() == bookId) {
                exists = true;
                break;
            }
        }

        if (!exists) {
            wishlist.add(new WishlistItem(
                    book.getId(),
                    book.getTitle(),
                    book.getAuthor(),
                    book.getPrice(),
                    book.getImage()
            ));
        }

        session.setAttribute("wishlist", wishlist);

        response.sendRedirect("wishlist");
    }
}