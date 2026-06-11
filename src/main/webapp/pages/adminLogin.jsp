<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#7f7f7f;
}

/* ================= NAVBAR ================= */

.navbar{
    width:100%;
    height:70px;
    background:#c9e6e6;

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:0px 40px;
}

.logo{
    font-size:28px;
    font-weight:bold;
    color:#0b39b6;
}

.nav-buttons{
    display:flex;
    gap:15px;
}

.nav-buttons a{
    text-decoration:none;
    padding:14px 28px;
    border-radius:30px;
    font-size:18px;
    transition:0.3s;
}

.voter-btn{
    background:white;
    color:black;
}

.home-btn{
    background:#2563eb;
    color:white;
}

.voter-btn:hover,
.home-btn:hover{
    transform:scale(1.05);
}

/* ================= LOGIN CONTAINER ================= */

.main{

    width:100%;

    min-height:calc(100vh - 90px);

    display:flex;

    justify-content:center;

    align-items:flex-start;

    padding-top:40px;
}

.login-box{

    width:450px;
    background:#d8e4f6;

    padding:35px;

    border-radius:35px;

    box-shadow:0px 15px 45px rgba(0,0,0,0.5);

    text-align:center;
}

/* ================= ICON ================= */

.icon{
    font-size:70px;
    color:#163da8;
    margin-bottom:10px;
}

/* ================= TITLE ================= */

.title{
    font-size:38px;
    color:#163da8;
    font-weight:bold;
}

.subtitle{
    margin-top:15px;
    font-size:16px;
    color:#555;
    margin-bottom:40px;
}

/* ================= INPUTS ================= */

.input-box{
    width:100%;
    margin-bottom:25px;
}

.input-box input{

    width:100%;
    padding:16px;

    border:none;
    outline:none;

    border-radius:20px;

    font-size:18px;

    background:white;
}

/* ================= BUTTON ================= */

.login-btn{

    width:100%;
    padding:16px;

    border:none;
    border-radius:20px;

    background:#2563eb;

    color:white;
    font-size:22px;
    font-weight:bold;

    cursor:pointer;

    transition:0.3s;
}

.login-btn:hover{
    background:#1748b8;
    transform:scale(1.02);
}

/* ================= EXTRA ================= */

.or-section{

    margin-top:35px;
    margin-bottom:20px;

    display:flex;
    align-items:center;
    gap:15px;
}

.line{
    flex:1;
    height:1px;
    background:#999;
}

.or-text{
    color:#555;
    font-size:18px;
}

.back-home{

    text-decoration:none;
    color:#163da8;

    font-size:22px;
    font-weight:bold;
}

/* ================= MESSAGE ================= */

.message{
    margin-bottom:20px;
    font-size:20px;
    font-weight:bold;
}

.error{
    color:red;
}

.success{
    color:green;
}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">
        E-VOTING
    </div>

    <div class="nav-buttons">

        <a href="<%=request.getContextPath()%>/pages/login.jsp"
        class="voter-btn">

            Voter Login

        </a>

        <a href="<%=request.getContextPath()%>/index.jsp"
        class="home-btn">

            Back to Home

        </a>

    </div>

</div>

<!-- ================= MAIN SECTION ================= -->

<div class="main">

    <div class="login-box">

        <div class="icon">
            🛡️
        </div>

        <div class="title">
            Admin Login
        </div>

        <div class="subtitle">
            Login to access admin panel
        </div>

        <!-- ================= MESSAGE ================= -->

        <%
        String error =
        (String)request.getAttribute("error");

        String success =
        (String)request.getAttribute("success");

        if(error != null)
        {
        %>

            <div class="message error">
                <%= error %>
            </div>

        <%
        }

        if(success != null)
        {
        %>

            <div class="message success">
                <%= success %>
            </div>

        <%
        }
        %>

        <!-- ================= FORM ================= -->

        <form action="<%=request.getContextPath()%>/AdminLogin"
        method="post">

            <div class="input-box">

                <input type="text"
                name="username"
                placeholder="Enter Username"
                required>

            </div>

            <div class="input-box">

                <input type="password"
                name="password"
                placeholder="Enter Password"
                required>

            </div>

            <button type="submit"
            class="login-btn">

                Login

            </button>

        </form>

        <!-- ================= OR SECTION ================= -->

        <div class="or-section">

            <div class="line"></div>

            <div class="or-text">
                OR
            </div>

            <div class="line"></div>

        </div>

        <a href="<%=request.getContextPath()%>/index.jsp"
        class="back-home">

            Back to Home

        </a>

    </div>

</div>

</body>
</html>