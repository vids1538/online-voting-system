<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentPage = request.getRequestURI();
%>

<!-- ========== PROFESSIONAL NAVBAR ========== -->
<header class="navbar-pro">
    <div class="container-pro">
        
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/index.jsp" class="logo-pro">
            <svg class="logo-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
               <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
               <polyline points="9 12 11 14 15 10"/>
            </svg>
            <span class="logo-text">E-Voting</span>
            <span class="logo-badge">v1.0</span>
        </a>

        <!-- Navigation -->
        <nav class="nav-pro">
            <ul class="nav-list-pro">
                <li><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link-pro <%= currentPage.contains("index.jsp") ? "active" : "" %>">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/aboutUs.jsp" class="nav-link-pro <%= currentPage.contains("aboutUs.jsp") ? "active" : "" %>">About</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/candidates.jsp" class="nav-link-pro <%= currentPage.contains("candidates.jsp") ? "active" : "" %>">Candidates</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/ContactUs.jsp" class="nav-link-pro <%= currentPage.contains("ContactUs.jsp") ? "active" : "" %>">Contact</a></li>
            </ul>
        </nav>

        <!-- Actions -->
        <div class="actions-pro">
            <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn-pro btn-outline">Log in</a>
            <a href="${pageContext.request.contextPath}/pages/register.jsp" class="btn-pro btn-primary">Register</a>
            <a href="${pageContext.request.contextPath}/AdminEntryServlet" class="btn-pro btn-ghost">Admin</a>
        </div>

        <!-- Mobile Toggle -->
        <button class="toggle-pro" id="togglePro" aria-label="Menu">
            <span></span><span></span><span></span>
        </button>
    </div>

    <!-- Mobile Menu -->
    <div class="mobile-pro" id="mobilePro">
        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp">About</a>
        <a href="${pageContext.request.contextPath}/pages/candidates.jsp">Candidates</a>
        <a href="${pageContext.request.contextPath}/pages/ContactUs.jsp">Contact</a>
        <hr>
        <a href="${pageContext.request.contextPath}/pages/login.jsp">Log in</a>
        <a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>
        <a href="${pageContext.request.contextPath}/AdminEntryServlet">Admin</a>
    </div>
</header>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const toggle = document.getElementById('togglePro');
        const mobile = document.getElementById('mobilePro');
        
        toggle.addEventListener('click', function() {
            this.classList.toggle('active');
            mobile.classList.toggle('open');
        });
        
        mobile.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function() {
                toggle.classList.remove('active');
                mobile.classList.remove('open');
            });
        });
    });
</script>