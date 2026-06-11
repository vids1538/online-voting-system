package evoting.controllers;

import java.io.IOException;

import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        String username = request.getParameter("username");

        String password = request.getParameter("password");

        if(username.equals("admin")
                && password.equals("admin123"))
        {
            HttpSession session = request.getSession();

            session.setAttribute("admin", username);

            response.sendRedirect(
                request.getContextPath()
                + "/pages/adminDashboard.jsp"
            );
        }
        
        
        else
        {
            response.getWriter().println(
                "Invalid Admin Credentials"
            );
        }
    }
}