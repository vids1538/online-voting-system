<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
 <!-- CSS File -->
   
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/login.css">
</head>
<body class="login-page">


    <div class="auth-container">

        <div class="auth-box">

            <h1>Login</h1>

            <form action="#" method="post">

                <input type="text"
                       name="username"
                       placeholder="Enter Username"
                       required>

                <input type="password"
                       name="password"
                       placeholder="Enter Password"
                       required>

                <button type="submit" class="btn">
                    Login
                </button>

                <a href="register.jsp" class="switch-link">
                    Don't have an account? Register
                </a>

            </form>

        </div>

    </div>
    <!-- this external js method will run for popup message and when user registers --> 
<script src="${pageContext.request.contextPath}/js/message.js"></script> 

 <!-- call function -->

   <script>

    // local js variable

    let message =
    "<%= session.getAttribute("successMessage") %>";


    // printing message

    alert(message);

</script>
<%

// remove message after showing once

session.removeAttribute("successMessage");

%>

</body>
</html>
