package evoting.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import evoting.DbConnection.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddElectionServlet")
public class AddElectionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String electionName = request.getParameter("electionName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        try {

            Connection conn = DbConnection.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO elections "
                  + "(election_name,start_date,end_date,status) "
                  + "VALUES (?,?,?,?)");

            ps.setString(1, electionName);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.setString(4, "Active");

            int result = ps.executeUpdate();

            if(result > 0) {
                response.sendRedirect("manageElection.jsp");
            }
            else {
                response.getWriter().println("Election not added!");
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}