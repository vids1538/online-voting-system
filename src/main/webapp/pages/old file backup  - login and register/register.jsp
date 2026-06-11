<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport"  content="width=device-width, initial-scale=1.0">
         

    <title>Register</title>

    <!-- CSS File -->
   
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/register.css">
   
    
</head>

<body class="register-page">
 

    <div class="register-container">

        <h1>Registration</h1>

        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">

    <!-- FULL NAME -->

    <input type="text"
           id="fullname"
           name="full_name"
           placeholder="Enter Name"
           onkeyup="nameCheck()"
           required>

    <span id="nameerror"></span>


    <!-- USERNAME -->

    <input type="text"
           id="username"
           name="username"
           placeholder="Enter Username"
           onkeyup="userCheck()"
           required>

    <span id="usernameerror"></span>


    <!-- AGE -->

    <input type="number"
           id="age"
           name="age"
           placeholder="Enter Age"
           onkeyup="ageCheck()"
           required>

    <span id="ageerror"></span>


    <!-- EMAIL -->

    <input type="email"
           id="mail"
           name="email"
           placeholder="Enter Email"
           onkeyup="mailCheck()"
           required>

    <span id="mailError"></span>


    <!-- VOTER ID -->

    <input type="text"
       name="voter_number"
       id="voterid"
       maxlength="8"
       onkeyup="voterCheck()"
       oninput="this.value=this.value.replace(/[^0-9]/g,'')"
       required>

    <span id="voterIdError"></span>


    <!-- PASSWORD -->

    <input type="password"
           id="password"
           name="password"
           placeholder="Create Password"
           required>


    <button type="submit">
        Register
    </button>

</form>
        
        

    </div>



    <!-- Footer Include -->
 
    



    <!-- JS File -->
   
  <script src="../javaScript/register.js"></script>  
    

</body>

</html>