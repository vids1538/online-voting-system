package evoting.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminEntryServlet")
public class AdminEntryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session != null &&
           session.getAttribute("admin") != null) {

            response.sendRedirect(
                request.getContextPath() +
                "/pages/adminDashboard.jsp"
            );

        } else {

            response.sendRedirect(
                request.getContextPath() +
                "/pages/adminLogin.jsp"
            );
        }
    }
}