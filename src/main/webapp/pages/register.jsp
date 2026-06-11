<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>eVoting Register</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!--  CSS -->
    <link rel="stylesheet"
          href="../css/login&register.css">
          
          <style>

    /* css for admin button just below login  */
    /* ---------------OR SECTION ---------------- */

    /* ================= OR SECTION ================= */

.or-section{

    margin-top:30px;
    margin-bottom:20px;

    display:flex;
    align-items:center;
    gap:15px;
}

.line{

    flex:1;
    height:1px;

    background:#9a9a9a;
}

.or-text{

    color:#666;
    font-size:18px;
}

/* ================= ADMIN SECTION ================= */

.admin-section{

    text-align:center;
}

/* ================= ADMIN LINK ================= */

.admin-link{

    text-decoration:none;

    color:#163da8;

    font-size:20px;
    font-weight:600;

    transition:0.3s;
}

.admin-link:hover{

    color:#2563eb;

    letter-spacing:1px;
}
    </style>
</head>
<body>
    
     <!--  NAVBAR  -->
    <nav class="navbar navbar-expand-lg custom-navbar">

        <div class="container">

            <!-- Logo -->
            <div>
                <a class="navbar-brand logo-text"
                   href="${pageContext.request.contextPath}/index.jsp">

                    E-VOTING
                </a>
            </div>

            <!-- Navbar Buttons -->
            <div class="nav-buttons">

                <!-- Login Button -->
                <a href="${pageContext.request.contextPath}/pages/login.jsp"
                   class="btn nav-btn">

                    Login

                </a>

                <!-- Register Button -->
                <a href="${pageContext.request.contextPath}/pages/register.jsp"
                   class="btn nav-btn register-btn">

                    Register

                </a>

            </div>

        </div>

    </nav>

    <!-- ================= REGISTER SECTION ================= -->

    <section class="register-section">

        <div class="register-card">

            <!-- Heading -->
            <h2>Create Your E-Voting Account</h2>

            <!-- Subtitle -->
            <p class="subtitle">
                Secure and modern online voting platform
            </p>

            <!-- Register Form -->
            <form  action="<%=request.getContextPath()%>/RegisterServlet"  method="post"  id="registerForm" > 
                 
                <!-- Full Name -->
                <div class="mb-3">

                    <input type="text"
                           class="form-control custom-input"
                           name="fullname"
                           id="fullname"
                           placeholder="Enter your name"
                           minlength="4"
                           onblur="nameCheck()"
                           required>
                           
                          <!-- Error message will appear here -->

                          <div id="nameerror"
                           style="color:red; font-size:14px; margin-top:5px;">
                          </div>
                          
                </div>

                <!-- Username -->
                <div class="mb-3">

                    <input type="text"
                           class="form-control custom-input"
                           name="username"
                           id="username"
                           placeholder="Username"
                          
                           minlength="4"
                           maxlength="15"
                           onblur="userCheck()"
                           required>
                           
                           <div id="usernameerror"
                           style="color:green; font-size:14px; margin-top:5px;">
                          </div>

                </div>

                <!-- Age -->
                <div class="mb-3">

                    <input type="number"
                           class="form-control custom-input"
                           name="age"
                           id="age"
                           oninput="ageCheck()"
                           placeholder="Age"
                           min="18"
                           max="120"
                          required>
                          
                          <div id="ageError"
                           style="color:green; font-size:14px; margin-top:5px;">
                          </div>

                </div>

                <!-- Email -->
                <div class="mb-3">

                    <input type="email"
                           class="form-control custom-input"
                           id="mail"
                           oninput="mailCheck()"
                           name="email"
                           placeholder="Email Address"
                           maxlength="100"
                           required>
                           <div id="mailError"
                           style="color:green; font-size:14px; margin-top:5px;">
                          </div>

                </div>

                <!-- Voter ID -->
                <div class="mb-3">

                    <input type="text"
                           class="form-control custom-input"
                           name="voterid"
                           placeholder="Enter 8-digit Voter ID"
                           id="voterid"
                           oninput="voterCheck()"
                           maxlength="8"
                           required>
                           <div id="voterIdError"
                           style="color:green; font-size:14px; margin-top:5px;">
                          </div>

                </div>

                <!-- Password -->
                <div class="mb-3">

                    <input type="password"
                           class="form-control custom-input"
                           id="password"
                           name="password"
                           placeholder="Password"
                           minlength="8"
                           maxlength="50"
                           required>

                </div>

                <!-- Register Button -->
                <button type="submit"
                        class="btn register-main-btn">

                    Register

                </button>
                 <!-- ================= ADMIN SECTION ================= -->

                <div class="or-section">

                 <div class="line"></div>

                  <div class="or-text">
                     OR
                   </div>

                 <div class="line"></div>

                 </div>

                 <div class="admin-section">

                 <a href="<%=request.getContextPath()%>/pages/adminLogin.jsp"
                  class="admin-link">

                 Admin Login

                  </a>

                   </div>
                <!-- ================= ADMIN SECTION close  ================= -->

            </form>

        </div>

    </section>

    <!-- ================= FOOTER ================= -->

    <footer class="footer-section">

        <div class="container">

            <div class="row">

                <!-- About -->
                <div class="col-md-3">

                    <h5>About</h5>

                    <p>
                        Modern secure online voting platform.
                    </p>

                </div>

                <!-- Quick Links -->
                <div class="col-md-3">

                    <h5>Quick Links</h5>

                    <ul>
                        <li>Home</li>
                        <li>Register</li>
                        <li>Login</li>
                    </ul>

                </div>

                <!-- Services -->
                <div class="col-md-3">

                    <h5>Services</h5>

                    <ul>
                        <li>Online Voting</li>
                        <li>Security</li>
                        <li>Support</li>
                    </ul>

                </div>

                <!-- Contact -->
                <div class="col-md-3">

                    <h5>Contact</h5>

                    <p>
                        support@evoting.com
                    </p>

                </div>

            </div>

            <hr>

            <!-- Copyright -->
            <p class="text-center">
                © 2026 eVoting Platform
            </p>

        </div>

    </footer>

    <!-- JS File -->
   
<script src="${pageContext.request.contextPath}/javaScript/register.js"></script>
</body>

</html>