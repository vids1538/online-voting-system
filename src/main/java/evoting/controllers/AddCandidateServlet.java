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

@WebServlet("/AddCandidateServlet")
public class AddCandidateServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String fullName =
                    request.getParameter("fullName");

            int age =
                    Integer.parseInt(
                            request.getParameter("age"));

            String gender =
                    request.getParameter("gender");

            String address =
                    request.getParameter("address");

            String partyName =
                    request.getParameter("partyName");

            String partyImage =
                    request.getParameter("partyImage");

            String voterId = request.getParameter("voterId");

            String mobile =
                    request.getParameter("mobile");

            String qualification =
                    request.getParameter("qualification");

            Connection con = DbConnection.getConnection(); 

            String sql =
                    "INSERT INTO candidates(full_name,age,gender,address,party_name,party_image,voter_id,mobile,qualification) VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, fullName);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, address);
            ps.setString(5, partyName);
            ps.setString(6, partyImage);
            ps.setString(7, voterId);
            ps.setString(8, mobile);
            ps.setString(9, qualification);

            ps.executeUpdate();

            response.sendRedirect(
                    request.getContextPath()
                    + "/pages/manageCandidates.jsp?success=1");

        }
        catch(Exception e) {

            e.printStackTrace();

            response.sendRedirect(  request.getContextPath() +
                    "/pages/manageCandidates.jsp?success=1");
        }
    }
}