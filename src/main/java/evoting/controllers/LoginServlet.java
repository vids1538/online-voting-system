package evoting.controllers;

import evoting.DbConnection.DbConnection;

import java.io.IOException;
import java.io.PrintWriter;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet
{
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
    
{
    response.setContentType("text/html");

    PrintWriter out = response.getWriter();


    // ================= GETTING LOGIN FORM DATA =================

    // User can enter username OR email

    String emailOrUsername = request.getParameter("email");
    String password = request.getParameter("password");
    
    
    
    Connection connection = null;
    PreparedStatement ps = null;

    ResultSet rs = null;


    try
    {

        //  database connection 

        connection = DbConnection.getConnection();

        if(connection == null)
        {
            out.println("Database Connection Failed");
            return;
        }
        
        // ================= check username or email =================

        String query = "SELECT * FROM voters WHERE username=? OR email=?";

        ps = connection.prepareStatement(query);

        ps.setString(1, emailOrUsername);

        ps.setString(2, emailOrUsername);


        rs = ps.executeQuery();


        // ================= if USER FOUND =================

        if(rs.next())
        {

            // Getting password from database

            String dbPassword =
            rs.getString("password");


            // ================= PASSWORD MATCH CHECK =================

            if(dbPassword.equals(password))
            {

                // LOGIN SUCCESS

                response.sendRedirect(

                request.getContextPath()

                + "/pages/voting.jsp"

                );

            }

            else
            {

                // WRONG PASSWORD

                response.getWriter().println(

                "<script>" +

                "alert('Incorrect Password ❌');" +

                "window.location='pages/login.jsp';" +

                "</script>"

                );

            }

        }

        else
        {

            // USERNAME OR EMAIL NOT FOUND

            response.getWriter().println(

            "<script>" +

            "alert('Username or Email Incorrect ❌');" +

            "window.location='pages/login.jsp';" +

            "</script>"

            );

        }

    }

    catch(Exception e)
    {

        e.printStackTrace();

        response.getWriter().println(

        "<script>" +

        "alert('Something Went Wrong ❌');" +

        "window.location='pages/login.jsp';" +

        "</script>"

        );

    }


    finally
    {

        try
        {

            if(rs != null)
            {
                rs.close();
            }

            if(ps != null)
            {
                ps.close();
            }

            if(connection != null)
            {
                connection.close();
            }

        }

        catch(Exception e)
        {

            System.out.println(
            e.getMessage()
            );

        }

    }

}
}
