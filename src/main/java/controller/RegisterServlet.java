/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        User user=new User(name,email,password);

        UserDAO dao=new UserDAO();

        if(dao.register(user)){

            response.sendRedirect("login.jsp");

        }else{

            response.sendRedirect("signup.jsp?error=true");

        }
    }
}