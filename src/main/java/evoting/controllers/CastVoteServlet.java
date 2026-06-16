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
        String voterNumber = (String) session.getAttribute("voterNumber");
        
        // Check if voter is logged in
        if(voterId == null || voterNumber == null) {
            response.getWriter().write("error");
            return;
        }
        
        // Get candidate ID from request
        String candidateIdParam = request.getParameter("candidateId");
        if(candidateIdParam == null || candidateIdParam.isEmpty()) {
            response.getWriter().write("error");
            return;
        }
        
        int candidateId = 0;
        try {
            candidateId = Integer.parseInt(candidateIdParam);
        } catch(NumberFormatException e) {
            response.getWriter().write("error");
            return;
        }
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConnection.getConnection();
            
            // STEP 1: Check if voter already voted
            String checkSql = "SELECT has_voted FROM voters WHERE voter_id = ?";
            ps = conn.prepareStatement(checkSql);
            ps.setInt(1, voterId);
            rs = ps.executeQuery();
            
            if(rs.next()) {
                int hasVoted = rs.getInt("has_voted");
                if(hasVoted == 1) {
                    response.getWriter().write("already_voted");
                    return;
                }
            } else {
                response.getWriter().write("error");
                return;
            }
            
            // Close previous statements
            rs.close();
            ps.close();
            
            // STEP 2: Insert vote with voter_number
            String insertSql = "INSERT INTO votes (voter_id, voter_number, candidate_id) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(insertSql);
            ps.setInt(1, voterId);
            ps.setString(2, voterNumber);
            ps.setInt(3, candidateId);
            
            int rowsInserted = ps.executeUpdate();
            
            if(rowsInserted > 0) {
                // STEP 3: Update voter's has_voted status
                String updateSql = "UPDATE voters SET has_voted = 1 WHERE voter_id = ?";
                ps = conn.prepareStatement(updateSql);
                ps.setInt(1, voterId);
                ps.executeUpdate();
                
                // STEP 4: Update session
                session.setAttribute("hasVoted", true);
                
                response.getWriter().write("success");
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