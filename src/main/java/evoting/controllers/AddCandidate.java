package evoting.controllers;

import evoting.DbConnection.DbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCandidateServlet")
public class AddCandidate extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().println("""
            <!DOCTYPE html>
            <html>
            <head>
                <title>Add Candidate</title>

                <style>
                    body{
                        font-family:Arial,sans-serif;
                        background:#f4f6f9;
                        padding:30px;
                    }

                    .container{
                        width:500px;
                        margin:auto;
                        background:white;
                        padding:25px;
                        border-radius:10px;
                        box-shadow:0 0 10px rgba(0,0,0,0.1);
                    }

                    h2{
                        text-align:center;
                        margin-bottom:20px;
                    }

                    input,select,textarea{
                        width:100%;
                        padding:10px;
                        margin-top:5px;
                        margin-bottom:15px;
                    }

                    button{
                        width:100%;
                        padding:12px;
                        background:#28a745;
                        color:white;
                        border:none;
                        border-radius:5px;
                        cursor:pointer;
                    }

                    button:hover{
                        background:#218838;
                    }
                </style>
            </head>

            <body>

            <div class="container">

                <h2>Add Candidate</h2>

                <form method="post" action="AddCandidateServlet">

                    <label>Full Name</label>
                    <input type="text" name="fullName" required>

                    <label>Party Name</label>
                    <input type="text" name="partyName" required>

                    <label>Party Image Path</label>
                    <input type="text" name="partyImage"
                           placeholder="images/lotus.png" required>

                    <label>Age</label>
                    <input type="number" name="age" min="18" required>

                    <label>Gender</label>
                    <select name="gender" required>
                        <option value="">Select</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>

                    <label>Address</label>
                    <textarea name="address" required></textarea>

                    <label>Voter ID</label>
                    <input type="text" name="voterId" required>

                    <label>Mobile</label>
                    <input type="text" name="mobile"
                           maxlength="10" required>

                    <label>Qualification</label>
                    <input type="text" name="qualification" required>

                    <button type="submit">
                        Add Candidate
                    </button>

                </form>

            </div>

            </body>
            </html>
        """);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String partyName = request.getParameter("partyName");
        String partyImage = request.getParameter("partyImage");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String voterId = request.getParameter("voterId");
        String mobile = request.getParameter("mobile");
        String qualification = request.getParameter("qualification");

        String sql = """
            INSERT INTO candidates
            (
                full_name,
                party_name,
                party_image,
                age,
                gender,
                address,
                voter_id,
                mobile,
                qualification
            )
            VALUES
            (?,?,?,?,?,?,?,?,?)
            """;

        try (
                Connection con = DbConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, fullName);
            ps.setString(2, partyName);
            ps.setString(3, partyImage);
            ps.setInt(4, age);
            ps.setString(5, gender);
            ps.setString(6, address);
            ps.setString(7, voterId);
            ps.setString(8, mobile);
            ps.setString(9, qualification);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                response.setContentType("text/html");

                response.getWriter().println("""
                    <script>
                        alert('Candidate Added Successfully');
                        window.location='ManageCandidatesServlet';
                    </script>
                """);

            } else {

                throw new SQLException(
                        "Candidate insertion failed.");
            }

        } catch (NumberFormatException e) {

            response.getWriter().println("""
                <h3>Invalid Age Entered</h3>
            """);

        } catch (SQLException e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h3>Database Error : "
                            + e.getMessage()
                            + "</h3>");

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h3>Unexpected Error : "
                            + e.getMessage()
                            + "</h3>");
        }
    }
}