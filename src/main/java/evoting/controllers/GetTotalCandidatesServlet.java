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

@WebServlet("/GetTotalCandidatesServlet")
public class GetTotalCandidatesServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConnection.getConnection();
            String query = "SELECT COUNT(*) as total FROM candidates";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            if(rs.next()) {
                response.getWriter().write(String.valueOf(rs.getInt("total")));
            } else {
                response.getWriter().write("0");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().write("0");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}