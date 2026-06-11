package evoting.controllers;

import evoting.DbConnection.DbConnection; // FOR USING CONNECTION OBJECT IN THIS SERVLET


import java.io.IOException;
import java.io.PrintWriter;  // to print on the browse

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet
{

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {   
    	/**
    	 request.getParameterMap().forEach((key,value) ->
    	{
    	    System.out.println(key + " = " + java.util.Arrays.toString(value));
    	});
    	
    	######## this line was just for debugging ########
    	
    	 */
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // GETTING FORM DATA

        String full_name = request.getParameter("fullname");

        String username =  request.getParameter("username");

        int age =   Integer.parseInt(request.getParameter("age"));

        String email =  request.getParameter("email");

        String voter_number =  request.getParameter("voterid");

        String password =   request.getParameter("password");

     // -------------------- SERVER SIDE VALIDATION ---------------------

     // ================= USERNAME VALIDATION =================

     if(!username.matches("^[a-zA-Z0-9]{4,15}$"))
     {
    	 response.getWriter().println(

    			 "<script>" +

    			 "alert('Invalid Username ❌');" +

    			 "window.location='pages/register.jsp';" +

    			 "</script>"

    			 );

    			 return;

     }




     // ================= EMAIL VALIDATION =================

     // Basic email format check

   

     if(!email.matches("^[A-Za-z0-9+_.-]+@(.+)$"))
     {
    	 response.getWriter().println(

    			 "<script>" +

    			 "alert('Invalid Email Address ❌');" +

    			 "window.location='pages/register.jsp';" +

    			 "</script>"

    			 );

    			 return;
     }




     // ================= VOTER NUMBER VALIDATION =================

     if(!voter_number.matches("^[0-9]{8}$"))
     {
    	 response.getWriter().println(

    			 "<script>" +

    			 "alert('Invalid Voter ID ❌');" +

    			 "window.location='pages/register.jsp';" +

    			 "</script>"

    			 );

    			 return;

     }

        Connection connection = null;
        PreparedStatement ps = null;

        try
        {

            connection = DbConnection.getConnection();


            if(connection == null)
            {
                out.println("Database Connection Failed");
                return;
            }
            
         // DUPLICATE CHECK :- it will run a query to check duplicate entry from 
         // database ,if already exist then stop registration,and stay at registration 
          // form page

            String checkQuery = "SELECT * FROM voters WHERE username=? OR email=? OR voter_number=?";
            		

            		PreparedStatement checkPs = connection.prepareStatement(checkQuery);
            		
            		checkPs.setString(1, username);
            		checkPs.setString(2, email);
            		checkPs.setString(3, voter_number);

            		ResultSet rs = checkPs.executeQuery();

            		if(rs.next())
            		{
            			response.getWriter().println(

            					"<script>" +

            					"alert('Duplicate Data Found ❌ Registration Failed');" +

            					"window.location='pages/register.jsp';" +   // it will save the broken white page after popup alert message

            					"</script>"

            					);

            					return;

            		}
            // duplicate checking  ends here 
            
            String queryString = "INSERT INTO voters(full_name,username,age,email,voter_number,password) "  + "VALUES(?,?,?,?,?,?)";

            ps =  connection.prepareStatement(queryString);

            ps.setString(1, full_name);

            ps.setString(2, username);

            ps.setInt(3, age);

            ps.setString(4, email);

            ps.setString(5, voter_number);

            ps.setString(6, password);

            int rows = ps.executeUpdate();
            
            // success and failure  block with message in session body

            if(rows > 0)
            {
            	response.getWriter().println(

            			"<script>" +

            			"alert('Registration Successful ✅');" +

            			"window.location='pages/register.jsp';" +

            			"</script>"

            			);

            }
            else
            {
            	response.getWriter().println(

            			"<script>" +

            			"alert('Registration Failed ❌');" +

            			"window.location='pages/register.jsp';" + // used to save broken white page after popup

            			"</script>"

            			);

            }
            
            // success and failure block ends here.
            
        }

        catch(Exception e)
        {

            e.printStackTrace();

            String msg = e.getMessage();
            
            if( msg.contains("email"))
            {

                out.println("<script>alert('Email already registered ❌');</script>");
            }
            else if( msg.contains("voter_number"))
            {

                out.println(

                "<script>alert('Voter ID already registered ❌');</script>"
                );

            }

            else
            {

                out.println(

                "<script>alert('Something went wrong ❌');</script>"
                );

            }


            RequestDispatcher rd =   request.getRequestDispatcher("/pages/register.jsp");

            rd.include(request, response);

        }


        finally
        {

            try
            {

                if(ps != null)
                {
                    ps.close();
                }

                if(connection != null)
                {
                    connection.close();
                }

            }

            catch(Exception e)
            {

                System.out.println(
                e.getMessage()
                );

            }

        }

    }

}