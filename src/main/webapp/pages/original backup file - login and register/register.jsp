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

        <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return validateForm()" >

            <input type="text"
                   name="name"
                   placeholder="Enter Name"
                   required>

            <input type="number"
                   name="age"
                   placeholder="Enter Age"
                   required>
             
            <input type="email"
                   name="email"
                   placeholder="Enter Email"
                   required>
                   
            <input type="text"
                   name="voterid"
                   placeholder="Enter Voter ID"
                   required>

            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Create Password"
                   required>

            <button type="submit" >
                Register
            </button>

        </form>
        
        

    </div>



    <!-- Footer Include -->
 
    



    <!-- JS File -->
   
    <script src="../javaScript/register.js"></script>
    

</body>

</html>