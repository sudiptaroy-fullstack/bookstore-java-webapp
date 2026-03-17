package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("HomeServlet HIT");

        BookDAO dao = new BookDAO();
        

        // ✅ CORRECT category mapping
        List<Book> bestSellers = dao.getBooksByCategoryId(1);
        List<Book> newArrivals = dao.getBooksByCategoryId(2);
        List<Book> worldClassics = dao.getBooksByCategoryId(3);
        List<Book> mangaManhwa = dao.getBooksByCategoryId(4);
        List<Book> comics = dao.getBooksByCategoryId(5);

        request.setAttribute("bestSellers", bestSellers);
        request.setAttribute("newArrivals", newArrivals);
        request.setAttribute("worldClassics", worldClassics);
        request.setAttribute("mangaManhwa", mangaManhwa);
        request.setAttribute("comics", comics);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
