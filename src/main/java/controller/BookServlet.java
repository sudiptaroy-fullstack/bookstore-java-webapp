package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookDAO dao = new BookDAO();

        String categoryIdStr = request.getParameter("categoryId");
        List<Book> books;

        if (categoryIdStr != null) {
            int categoryId = Integer.parseInt(categoryIdStr);
            books = dao.getBooksByCategoryId(categoryId);
        } else {
            books = dao.getAllBooks();
        }

        request.setAttribute("books", books);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    // ✅ doPost SUPPORT
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}