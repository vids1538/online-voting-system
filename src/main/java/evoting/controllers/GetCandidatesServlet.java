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

@WebServlet("/GetCandidatesServlet")
public class GetCandidatesServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConnection.getConnection();
            String query = "SELECT * FROM candidates ORDER BY party_name";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                out.println("<div style='border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 5px;'>");
                out.println("<div style='font-weight: bold; font-size: 18px;'>" + rs.getString("candidate_name") + "</div>");
                out.println("<div>Party: " + rs.getString("party_name") + "</div>");
                out.println("<div>Symbol: " + rs.getString("symbol") + "</div>");
                out.println("<button onclick='castVote(" + rs.getInt("candidate_id") + ")' style='background: #27ae60; color: white; border: none; padding: 8px 20px; border-radius: 5px; margin-top: 10px; cursor: pointer;'>Vote</button>");
                out.println("</div>");
            }
            
            if(!rs.isBeforeFirst()) {
                out.println("<p>No candidates available</p>");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<p>Error loading candidates</p>");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}