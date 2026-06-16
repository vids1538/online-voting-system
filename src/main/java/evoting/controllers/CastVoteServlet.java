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

@WebServlet("/CastVoteServlet")
public class CastVoteServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer voterId = (Integer) session.getAttribute("voterId");
        int candidateId = Integer.parseInt(request.getParameter("candidateId"));
        
        if(voterId == null) {
            response.getWriter().write("error");
            return;
        }
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConnection.getConnection();
            
            // Check if already voted
            String checkQuery = "SELECT has_voted FROM voters WHERE voter_id=?";
            ps = conn.prepareStatement(checkQuery);
            ps.setInt(1, voterId);
            rs = ps.executeQuery();
            
            if(rs.next() && rs.getBoolean("has_voted")) {
                response.getWriter().write("already_voted");
                return;
            }
            
            // Cast vote - Insert into votes table
            String insertQuery = "INSERT INTO votes (voter_id, candidate_id, vote_date) VALUES (?, ?, NOW())";
            ps = conn.prepareStatement(insertQuery);
            ps.setInt(1, voterId);
            ps.setInt(2, candidateId);
            ps.executeUpdate();
            
            // Update voter status
            String updateQuery = "UPDATE voters SET has_voted=1 WHERE voter_id=?";
            ps = conn.prepareStatement(updateQuery);
            ps.setInt(1, voterId);
            ps.executeUpdate();
            
            // Update session
            session.setAttribute("hasVoted", true);
            
            response.getWriter().write("success");
            
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