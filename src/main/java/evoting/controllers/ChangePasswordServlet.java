package evoting.controllers;

import evoting.DbConnection.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer voterId = (Integer) session.getAttribute("voterId");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        
        if(voterId == null) {
            response.getWriter().write("error");
            return;
        }
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConnection.getConnection();
            
            // Verify current password
            String checkQuery = "SELECT password FROM voters WHERE voter_id=?";
            ps = conn.prepareStatement(checkQuery);
            ps.setInt(1, voterId);
            rs = ps.executeQuery();
            
            if(rs.next()) {
                String dbPassword = rs.getString("password");
                
                if(dbPassword.equals(currentPassword)) {
                    // Update password
                    String updateQuery = "UPDATE voters SET password=? WHERE voter_id=?";
                    ps = conn.prepareStatement(updateQuery);
                    ps.setString(1, newPassword);
                    ps.setInt(2, voterId);
                    
                    int updated = ps.executeUpdate();
                    
                    if(updated > 0) {
                        response.getWriter().write("success");
                    } else {
                        response.getWriter().write("error");
                    }
                } else {
                    response.getWriter().write("incorrect");
                }
            } else {
                response.getWriter().write("error");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}