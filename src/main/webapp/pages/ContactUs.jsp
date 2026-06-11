<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | E-Voting System</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
         body{
            background: linear-gradient(135deg,#0d6efd,#0b5ed7);
            min-height:100vh;
             }

         .main-content{
             padding:40px 15px;
             }
             
        .contact-card{
            background:#fff;
            border-radius:20px;
            overflow:hidden;
            box-shadow:0 15px 40px rgba(0,0,0,0.2);
        }

        .left-panel{
            background:#0d6efd;
            color:white;
            padding:40px;
            height:100%;
        }

        .left-panel h2{
            font-weight:700;
        }

        .icon-box{
            font-size:1.2rem;
            margin-bottom:15px;
        }

        .form-section{
            padding:40px;
        }

        .btn-send{
            background:#0d6efd;
            border:none;
            padding:12px;
            font-weight:600;
        }

        .btn-send:hover{
            background:#0b5ed7;
        }

        .form-control{
            border-radius:10px;
        }

        .vote-icon{
            font-size:60px;
            margin-bottom:20px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">

        <a class="navbar-brand fw-bold" href="#">
            <i class="bi bi-ballot-check-fill"></i>
            E-Voting System
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/pages/login.jsp">
                        <i class="bi bi-house-door-fill"></i>
                        Home
                    </a>
                </li>

               
            </ul>

        </div>

    </div>
</nav>




                    <!--alert message after contact us form... -->

<%
String successMessage =
    (String)request.getAttribute("successMessage");

String errorMessage =
    (String)request.getAttribute("errorMessage");
%>

<% if(successMessage != null){ %>

<div class="alert alert-success alert-dismissible fade show"
     role="alert">

    <%= successMessage %>

    <button type="button"
            class="btn-close"
            data-bs-dismiss="alert">
    </button>

</div>

<% } %>

<% if(errorMessage != null){ %>

<div class="alert alert-danger alert-dismissible fade show"
     role="alert">

    <%= errorMessage %>

    <button type="button"
            class="btn-close"
            data-bs-dismiss="alert">
    </button>

</div>

<% } %>








<div class= "main-content">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">

            <div class="contact-card">

                <div class="row g-0">

                    <!-- Left Section -->
                    <div class="col-md-5">
                        <div class="left-panel">

                            <div class="text-center">
                                <i class="bi bi-ballot-check vote-icon"></i>
                                <h2>E-Voting System</h2>
                                <p class="mt-3">
                                    Need assistance regarding voting,
                                    registration, elections, or technical issues?
                                    Contact our support team.
                                </p>
                            </div>

                            <hr>

                            <div class="icon-box">
                                <i class="bi bi-envelope-fill"></i>
                                support@evoting.com
                            </div>

                            <div class="icon-box">
                                <i class="bi bi-telephone-fill"></i>
                                +91 XXXXX XXXXX
                            </div>

                            <div class="icon-box">
                                <i class="bi bi-clock-fill"></i>
                                Support Available 24/7
                            </div>

                        </div>
                    </div>

                    <!-- Right Section -->
                    <div class="col-md-7">
                        <div class="form-section">

                            <h3 class="mb-4 fw-bold">
                                Contact Us
                            </h3>

                            <form action="${pageContext.request.contextPath}/ContactServlet"
                            method="post">

                                <div class="mb-3">
                                    <label class="form-label">
                                        Full Name
                                    </label>
                                    <input type="text"
                                           name="name"
                                           class="form-control"
                                           required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">
                                        Email Address
                                    </label>
                                    <input type="email"
                                           name="email"
                                           class="form-control"
                                           required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">
                                        Subject
                                    </label>
                                    <input type="text"
                                           name="subject"
                                           class="form-control"
                                           required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">
                                        Message
                                    </label>
                                    <textarea name="message"
                                              rows="5"
                                              class="form-control"
                                              required></textarea>
                                </div>

                                <button type="submit"
                                        class="btn btn-send text-white w-100">
                                    <i class="bi bi-send-fill"></i>
                                    Send Message
                                </button>

                            </form>

                        </div>
                    </div>

                </div>

            </div>
            </div>

        </div>
    </div>
</div>


<footer class="bg-dark text-light mt-5 py-4">
    <div class="container">

        <div class="row">

            <div class="col-md-6">
                <h5>
                    <i class="bi bi-ballot-check-fill"></i>
                    E-Voting System
                </h5>

                <p class="mb-0">
                    Secure, transparent and efficient
                    online voting platform.
                </p>
            </div>

            <div class="col-md-3">
                <h6>Quick Links</h6>

                <ul class="list-unstyled">
                    <li>
                        <a href="${pageContext.request.contextPath}/index.jsp"
                           class="text-decoration-none text-light">
                            Home
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp"
                           class="text-decoration-none text-light">
                            About Us
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-md-3">
                <h6>Security</h6>

                <p class="small mb-0">
                    All communications are securely
                    processed through the E-Voting System.
                </p>
            </div>

        </div>

        <hr>

        <div class="text-center">
            © 2026 E-Voting System. All Rights Reserved.
        </div>

    </div>
</footer>
</body>
</html>