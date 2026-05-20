<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <!-- META -->
    <meta charset="UTF-8">

    <!-- TITLE -->
    <title>eVoting Login</title>

    <!-- BOOTSTRAP -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!-- CUSTOM CSS -->
    <link rel="stylesheet"
        href="../css/login&resigter.css">

</head>

<body>

    <!-- ================= NAVBAR ================= -->

    <nav class="navbar navbar-expand-lg custom-navbar fixed-top">

        <div class="container">

            <!-- LOGO -->
            <a class="navbar-brand logo-text" href="index.html">
                E-VOTING
            </a>

            <!-- NAV BUTTONS -->
            <div class="nav-buttons">

                <a href="${pageContext.request.contextPath}/pages/login.jsp"
                    class="btn nav-btn">
                    Login
                </a>

                <a href="${pageContext.request.contextPath}/pages/register.jsp"
                    class="btn nav-btn register-btn">
                    Register
                </a>

            </div>

        </div>

    </nav>

    <!-- ================= LOGIN SECTION ================= -->

    <section class="register-section">

        <div class="register-card">

            <!-- HEADING -->
            <h2>Welcome Back</h2>

            <p class="subtitle">
                Login to continue securely
            </p>

            <!-- LOGIN FORM -->
            <form action="LoginServlet" method="post">

                <!-- EMAIL / USERNAME -->
                <div class="mb-3">

                    <input type="text"
                        class="form-control custom-input"
                        name="email"
                        placeholder="Email or Username"
                        required>

                </div>

                <!-- PASSWORD -->
                <div class="mb-3">

                    <input type="password"
                        class="form-control custom-input"
                        name="password"
                        placeholder="Password"
                        minlength="8"
                        required>

                </div>

                <!-- LOGIN BUTTON -->
                <button type="submit"
                    class="btn register-main-btn">

                    Login

                </button>

            </form>

        </div>

    </section>

    <!-- ================= FOOTER ================= -->

    <footer class="footer-section">

        <div class="container">

            <div class="row">

                <!-- ABOUT -->
                <div class="col-md-3">

                    <h5>About</h5>

                    <p>
                        Modern secure online voting platform.
                    </p>

                </div>

                <!-- QUICK LINKS -->
                <div class="col-md-3">

                    <h5>Quick Links</h5>

                    <ul>
                        <li>Home</li>
                        <li>Register</li>
                        <li>Login</li>
                    </ul>

                </div>

                <!-- SERVICES -->
                <div class="col-md-3">

                    <h5>Services</h5>

                    <ul>
                        <li>Online Voting</li>
                        <li>Security</li>
                        <li>Support</li>
                    </ul>

                </div>

                <!-- CONTACT -->
                <div class="col-md-3">

                    <h5>Contact</h5>

                    <p>
                        support@evoting.com
                    </p>

                </div>

            </div>

            <hr>

            <!-- COPYRIGHT -->
            <p class="text-center">
                © 2026 eVoting Platform
            </p>

        </div>

    </footer>

    <!-- JS -->
    <script src="js/script.js"></script>

</body>

</html>