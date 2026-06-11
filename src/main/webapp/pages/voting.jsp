<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voting Dashboard</title>

<style>

body{
    font-family: Arial;
    background:#f4f4f4;
    margin:0;
    padding:0;
}

.container{
    width:80%;
    margin:auto;
    margin-top:40px;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0px 0px 10px gray;
}

h1{
    text-align:center;
    color:#333;
}

.card{
    border:1px solid #ddd;
    padding:20px;
    margin-top:20px;
    border-radius:8px;
}

button{
    padding:10px 20px;
    border:none;
    background:green;
    color:white;
    border-radius:5px;
    cursor:pointer;
}

.logout{
    background:red;
}

</style>

</head>

<body>

<div class="container">

    <h1>🗳️ Online Voting System</h1>

    <h3>
        Welcome,
        <%= session.getAttribute("username") %>
    </h3>

    <div class="card">

        <h2>Candidate 1</h2>
        <p>Party : ABC Party</p>

        <form action="../VoteServlet" method="post">
            <input type="hidden" name="candidate"
            value="Candidate1">

            <button type="submit">
                Vote
            </button>
        </form>

    </div>

    <div class="card">

        <h2>Candidate 2</h2>
        <p>Party : XYZ Party</p>

        <form action="../VoteServlet" method="post">

            <input type="hidden"
            name="candidate"
            value="Candidate2">

            <button type="submit">
                Vote
            </button>

        </form>

    </div>

    <br>

    <form action="../LogoutServlet" method="post">

        <button class="logout">
            Logout
        </button>

    </form>

</div>

</body>
</html>