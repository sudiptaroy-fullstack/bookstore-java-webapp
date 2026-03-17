/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.User;
import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        // Check if email already exists
        if(dao.emailExists(email)){

            request.setAttribute("error",
            "Account already registered. Please login.");

            request.getRequestDispatcher("signup.jsp")
                   .forward(request,response);

            return;
        }

        // Create user object
        User user = new User(name,email,password);

        dao.registerUser(user);

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
