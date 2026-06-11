package evoting.controllers;

import evoting.DbConnection.DbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateElectionServlet")
public class CreateElectionServlet extends HttpServlet {
protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException{

    String electionName = request.getParameter("electionName");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    try {

        Connection con = DbConnection.getConnection();

        String sql =
                "INSERT INTO elections " +
                "(election_name, start_date, end_date) " +
                "VALUES (?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, electionName);
        ps.setString(2, startDate);
        ps.setString(3, endDate);

        // Default Status
      

        int row = ps.executeUpdate();

        if(row > 0){

            response.sendRedirect(
                request.getContextPath()
                + "/pages/manageElection.jsp?success=1"
            );

        }else{

            response.sendRedirect(
                request.getContextPath()
                + "/pages/manageElection.jsp?error=1"
            );
        }

        ps.close();
        con.close();

    } catch(Exception e){
        e.printStackTrace();
    }
}
}
