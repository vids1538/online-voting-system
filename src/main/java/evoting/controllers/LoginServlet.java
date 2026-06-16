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
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // ================= GETTING LOGIN FORM DATA =================
        String emailOrUsername = request.getParameter("email");
        String password = request.getParameter("password");
        
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {
            // Database connection
            connection = DbConnection.getConnection();

            if(connection == null)
            {
                out.println("Database Connection Failed");
                return;
            }
            
            // ================= CHECK USERNAME OR EMAIL =================
            String query = "SELECT * FROM voters WHERE username=? OR email=?";
            ps = connection.prepareStatement(query);
            ps.setString(1, emailOrUsername);
            ps.setString(2, emailOrUsername);
            rs = ps.executeQuery();

            // ================= IF USER FOUND =================
            if(rs.next())
            {
                // Getting password from database
                String dbPassword = rs.getString("password");

                // ================= PASSWORD MATCH CHECK =================
                if(dbPassword.equals(password))
                {
                    // ✅ LOGIN SUCCESS - CREATE SESSION
                    HttpSession session = request.getSession();
                    
                    // Store voter info using CORRECT column names from your database
                    session.setAttribute("voter", rs.getString("username"));
                    session.setAttribute("voterId", rs.getInt("voter_id"));
                    session.setAttribute("voterName", rs.getString("full_name"));
                    session.setAttribute("voterEmail", rs.getString("email"));
                    session.setAttribute("voterNumber", rs.getString("voter_number"));
                    session.setAttribute("hasVoted", rs.getBoolean("has_voted"));
                    session.setAttribute("profilePicture", rs.getString("profile_picture")); // ✅ ADD THIS
                    
                    // ✅ Redirect to Voter Dashboard
                    response.sendRedirect(request.getContextPath() + "/pages/voterDashboard.jsp");
                }
                else
                {
                    // ❌ WRONG PASSWORD
                    out.println(
                        "<script>" +
                        "alert('Incorrect Password ❌');" +
                        "window.location='" + request.getContextPath() + "/pages/login.jsp';" +
                        "</script>"
                    );
                }
            }
            else
            {
                // ❌ USERNAME OR EMAIL NOT FOUND
                out.println(
                    "<script>" +
                    "alert('Username or Email Incorrect ❌');" +
                    "window.location='" + request.getContextPath() + "/pages/login.jsp';" +
                    "</script>"
                );
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            out.println(
                "<script>" +
                "alert('Login Error: " + e.getMessage().replace("'", "\\'") + "');" +
                "window.location='" + request.getContextPath() + "/pages/login.jsp';" +
                "</script>"
            );
        }
        finally
        {
            try
            {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(connection != null) connection.close();
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
            }
        }
    }
}