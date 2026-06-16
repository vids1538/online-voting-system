<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

<style>

.footer-section{
background:#0F172A;
color:#E2E8F0;
padding:60px 0 20px;
margin-top:60px;
}

.footer-brand{
font-size:2rem;
font-weight:700;
color:#ffffff;
}

.footer-description{
margin-top:15px;
color:#CBD5E1;
line-height:1.8;
max-width:500px;
}

.footer-heading{
color:#ffffff;
margin-bottom:18px;
font-weight:600;
}

.footer-links{
list-style:none;
padding:0;
}

.footer-links li{
margin-bottom:12px;
}

.footer-links a{
color:#CBD5E1;
text-decoration:none;
transition:0.3s;
}

.footer-links a:hover

.contact-text{
color:#CBD5E1;
margin-bottom:18px;
}

.contact-btn{
display:inline-block;
background:#2563EB;
color:white;
text-decoration:none;
padding:10px 22px;
border-radius:8px;
transition:0.3s;
}

.contact-btn:hover{
background:#1D4ED8;
color:white;
}

.social-icons a{
display:inline-flex;
justify-content:center;
align-items:center;
width:42px;
height:42px;
border-radius:50%;
background:#1E293B;
color:white;
margin-right:10px;
text-decoration:none;
transition:0.3s;
}

.social-icons a:hover{
background:#2563EB;
transform:translateY(-3px);
}

.footer-divider{
border-color:rgba(255,255,255,.12);
margin:35px 0 20px;
}

.footer-bottom{
text-align:center;
color:#94A3B8;
}

.tech-stack{
margin-top:8px;
color:#60A5FA;
}

.copyright{
margin-top:8px;
}


</style>

<footer class="footer-section">


<div class="container">

    <div class="row align-items-start gy-4">

        <!-- Brand -->

        <div class="col-lg-5">

            <h3 class="footer-brand">
                E-Voting System
            </h3>

            <p class="footer-description">
                A secure, transparent and modern digital voting
                platform designed to make elections accessible,
                reliable and efficient for everyone.
            </p>


        </div>

        <!-- Quick Links -->

        <div class="col-lg-3 col-md-6">

            <h5 class="footer-heading">
                Quick Links
            </h5>

            <ul class="footer-links">

                <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>

                <li><a href="<%=request.getContextPath()%>/pages/about.jsp">About</a></li>

                <li><a href="<%=request.getContextPath()%>/pages/register.jsp">Register</a></li>

                <li><a href="<%=request.getContextPath()%>/pages/login.jsp">Login</a></li>

            </ul>

        </div>

        <!-- Contact + Social -->

        <div class="col-lg-4 col-md-6">

            <h5 class="footer-heading">
                Let's Connect
            </h5>

            <p class="contact-text">
                Have a question, suggestion, or feedback?
            </p>

            <a href="<%=request.getContextPath()%>/pages/ContactUs.jsp"
               class="contact-btn">
                Contact Us
            </a>

            <div class="social-icons mt-4">

                <a href="https://facebook.com" target="_blank">
                    <i class="bi bi-facebook"></i>
                </a>

                <a href="https://instagram.com" target="_blank">
                    <i class="bi bi-instagram"></i>
                </a>

                <a href="https://linkedin.com" target="_blank">
                    <i class="bi bi-linkedin"></i>
                </a>

                <a href="https://github.com" target="_blank">
                    <i class="bi bi-github"></i>
                </a>

            </div>

        </div>

    </div>

    <hr class="footer-divider">

    <div class="footer-bottom">

        <div>
            Developed by <strong>Vidya Sagar</strong>
        </div>

        <div class="tech-stack">
            Java • JSP • Servlets • JDBC • MySQL • Bootstrap
        </div>

        <div class="copyright">
            © 2026 E-Voting System. All Rights Reserved.
        </div>

    </div>

</div>
</footer>