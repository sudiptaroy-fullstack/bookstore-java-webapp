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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email=request.getParameter("email");
        String password=request.getParameter("password");

        UserDAO dao=new UserDAO();

        User user=dao.login(email,password);

        if(user!=null){

            HttpSession session=request.getSession();
            session.setAttribute("user",user);

            response.sendRedirect("home");

        }else{

            response.sendRedirect("login.jsp?error=true");

        }
    }
}