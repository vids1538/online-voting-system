package evoting.controllers;

import evoting.DbConnection.DbConnection; // FOR USING CONNECTION OBJECT IN THIS SERVLET

import java.io.PrintWriter;  // to print on the browse

import jakarta.servlet.http.HttpSession;  // for passing the message in session body when user registers.

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegisterServlet")
public  class Register extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	PrintWriter out =response.getWriter();
    	response.setContentType("text/html"); // 
    	
    	String name =request.getParameter("name");
    	int age = Integer.parseInt(request.getParameter("age"));
    	String email =request.getParameter("email");  //inside string because it is an identifier, not calculation data
    	String voter_id =request.getParameter("voterid");
    	String password = request.getParameter("password");// it  contains letters ,number ,symbol so string datatype
   
    	Connection connection =null;
    	PreparedStatement ps = null;
    	
    	try {
    		
    	    connection = DbConnection.getConnection();  
    		if(connection == null)
    		{
    		    out.println("Database Connection Failed");
    		    return;
    		}
    		
    		String queryString = "INSERT INTO users(name, age,email, voter_id, password) VALUES (?, ?, ?, ?, ?)";
    		
    	    ps =connection.prepareStatement(queryString);
    		
    		ps.setString(1, name);

    		ps.setInt(2, age);
    		
    		ps.setString(3, email);

    		ps.setString(4, voter_id);

    		ps.setString(5, password);

    		int rows = ps.executeUpdate();
    		if(rows > 0)
    		{
    			 HttpSession session = request.getSession();
                    // storing message inside session 
    			    session.setAttribute(
    			    "successMessage",
    			    "Registered Successfully "
    			    );
    			    
    		    response.sendRedirect(
    		    request.getContextPath() + "/pages/login.jsp"
    		    );
    		    
    		}
    		else
    		{
    		    response.sendRedirect(
    		    request.getContextPath() + "/pages/register.jsp"
    		    );
    		}
    		
    	}catch(Exception e)
    	{
    	    String msg = e.getMessage();

    	    if(msg.contains("email"))
    	    {
    	        out.println(
    	        "<script>alert('Email already registered ❌');</script>"
    	        );
    	    }
    	    else if(msg.contains("voter_id"))
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

    	    RequestDispatcher rd =
    	    request.getRequestDispatcher("/pages/register.jsp");

    	    rd.include(request, response);
    	} 	
    	
    	finally  // this finally block will execute at any how 
    	{
    	    try
    	    {
    	        if(ps != null)  // checks preparedStatement object - ps if it is not equal to null ps.close for resource free.
    	        {
    	            ps.close();
    	        }

    	        if(connection != null) // if connection is not equal to null then close connection.
    	        {
    	            connection.close();
    	        }
    	    }
    	    catch(Exception e)
    	    {
    	        System.out.println(e.getMessage());
    	    }
    	}
    }
}