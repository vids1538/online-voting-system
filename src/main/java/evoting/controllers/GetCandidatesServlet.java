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

@WebServlet("/GetCandidatesServlet")
public class GetCandidatesServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer voterId = (Integer) session.getAttribute("voterId");
        String voterNumber = (String) session.getAttribute("voterNumber");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConnection.getConnection();
            
            // Check if voter already voted
            if(voterId != null) {
                String checkSql = "SELECT has_voted FROM voters WHERE voter_id = ?";
                ps = conn.prepareStatement(checkSql);
                ps.setInt(1, voterId);
                rs = ps.executeQuery();
                
                if(rs.next() && rs.getInt("has_voted") == 1) {
                    // Already voted - show message with voter number
                    out.println("<div class='already-voted-box'>");
                   // out.println("<div class='icon'>✅</div>");
                    out.println("<div class='title'> Thank you for voting. Your vote has been recorded successfully ✅.</div>");
                    out.println("<div class='sub'>Voter Number: " + voterNumber + "</div>");
                  //  out.println("<div class='sub'>Thank you for participating!</div>");
                    out.println("</div>");
                    return;
                }
            }
            
            // Fetch all candidates
            String query = "SELECT candidate_id, full_name, party_name FROM candidates ORDER BY party_name";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            boolean hasCandidates = false;
            
            // Generate simple tiles
            while(rs.next()) {
                hasCandidates = true;
                int candidateId = rs.getInt("candidate_id");
                String fullName = rs.getString("full_name");
                String partyName = rs.getString("party_name");
                
                out.println("<div class='candidate-tile'>");
                out.println("<div class='info'>");
                out.println("<span class='name'>" + fullName + "</span>");
                out.println("<span class='party'>" + partyName + "</span>");
                out.println("</div>");
                out.println("<button class='vote-btn-small' onclick='castVote(" + candidateId + ", \"" + partyName + "\")'>");
                out.println("Vote");
                out.println("</button>");
                out.println("</div>");
            }
            
            if(!hasCandidates) {
                out.println("<div class='no-candidates'>No candidates available for voting</div>");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red; text-align: center;'>Error loading candidates</p>");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}