package evoting.controllers;

import evoting.DbConnection.DbConnection; // FOR USING CONNECTION OBJECT IN THIS SERVLET

import java.io.PrintWriter;  // to print on the browse

import jakarta.servlet.http.HttpSession;  // for passing the message in session body when user registers.

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


//@WebServlet("/RegisterServlet")
public  class Register extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	PrintWriter out =response.getWriter();
    	response.setContentType("text/html"); 
    	
    	String full_name = request.getParameter("fullname");
    	 // 2️⃣ Print data for debugging
    	System.out.println("======== DEBUG ========");
    	System.out.println(request.getParameter("fullname"));
    	System.out.println("=======================");
    	
    	String username = request.getParameter("username");
    	int age = Integer.parseInt(request.getParameter("age"));
    	String email =request.getParameter("email");  //inside string because it is an identifier, not calculation data
    	String voter_number =request.getParameter("voter_number");
    	String password = request.getParameter("password");// it  contains letters ,number ,symbol so string datatype
    	
    	  // 2️⃣ Print data for debugging
       
        System.out.println("USERNAME = " + username);
        System.out.println("AGE = " + age);
        System.out.println("EMAIL = " + email);
        System.out.println("VOTER = " + voter_number);
        System.out.println("PASSWORD = " + password);
   
    	Connection connection =null;
    	PreparedStatement ps = null;
    	
    	try {
    		
    	    connection = DbConnection.getConnection();  
    		if(connection == null)
    		{
    		    out.println("Database Connection Failed");
    		    return;
    		}
    		
    		String queryString = "INSERT INTO voters(full_name,username,age,email,voter_number, password) VALUES (?, ?, ?, ?, ?, ?)";
    		
    	    ps =connection.prepareStatement(queryString);
    		
    		ps.setString(1,full_name );
    		
    		ps.setString(2, username);

    		ps.setInt(3, age);
    		
    		ps.setString(4, email);

    		ps.setString(5, voter_number);

    		ps.setString(6, password);

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
    	    e.printStackTrace();

    	    String msg = e.getMessage();

    	    System.out.println(msg);

    	    if(msg.contains("email"))
    	    {
    	        out.println("<script>alert('Email already registered ❌');</script>");
    	    }
    	    else if(msg.contains("voter_number"))
    	    {
    	        out.println("<script>alert('Voter ID already registered ❌');</script>");
    	    }
    	    else
    	    {
    	        out.println("<script>alert('Something went wrong ❌');</script>");
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