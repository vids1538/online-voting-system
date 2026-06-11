package evoting.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import evoting.DbConnection.DbConnection;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try {

            Connection con = DbConnection.getConnection();

            String sql =
                    "INSERT INTO contact_messages " +
                    "(name, email, subject, message) " +
                    "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);

            int rows = ps.executeUpdate();

            if(rows > 0){

                request.setAttribute(
                    "successMessage",
                    "Your message has been sent successfully!"
                );

            }else{

                request.setAttribute(
                    "errorMessage",
                    "Unable to send message."
                );
            }

            response.sendRedirect(
            	    request.getContextPath()
            	    + "/pages/contact.jsp?success=true"
            	);
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "contact.jsp?error=Database Error"
            );
        }
    }
}

