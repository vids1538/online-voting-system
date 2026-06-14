<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Voters</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f1f5f9;
            font-family: 'Poppins', sans-serif;
        }

        /* ----- Navbar (fixed, never breaks) ----- */
        .top-navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 56px;
            background: #1e293b;
            display: flex;
            align-items: center;
            padding: 0 24px;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.25);
        }

        .top-navbar .brand {
            color: #fff;
            font-weight: 700;
            font-size: 1.05rem;
            text-decoration: none;
        }

        .top-navbar .nav-right {
            margin-left: auto;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .btn-nav {
            padding: 6px 14px;
            border-radius: 8px;
            font-size: 0.82rem;
            font-weight: 500;
            text-decoration: none;
            transition: 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .btn-nav-outline {
            color: #fff;
            border: 1px solid rgba(255,255,255,0.3);
        }

        .btn-nav-outline:hover { background: rgba(255,255,255,0.1); color: #fff; }

        .btn-nav-danger { color: #fff; background: #e11d48; }
        .btn-nav-danger:hover { background: #be123c; color: #fff; }

        /* ----- Sidebar ----- */
        .sidebar {
            position: fixed;
            top: 56px;
            left: 0;
            width: 220px;
            height: calc(100vh - 56px);
            background: #1e293b;
            padding: 20px 0;
            z-index: 900;
            overflow-y: auto;
        }

        .sidebar-title {
            color: rgba(255,255,255,0.35);
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 1.4px;
            text-transform: uppercase;
            padding: 0 20px 14px;
        }

        .sidebar-link {
            display: flex;
            align-items: center;
            gap: 10px;
            color: rgba(255,255,255,0.6);
            text-decoration: none;
            padding: 10px 20px;
            margin: 2px 10px;
            border-radius: 8px;
            font-size: 0.875rem;
            transition: 0.2s;
        }

        .sidebar-link i { font-size: 1rem; width: 18px; }
        .sidebar-link:hover { background: rgba(255,255,255,0.08); color: #fff; }
        .sidebar-link.active { background: #2563eb; color: #fff; }

        .sidebar-divider {
            border-top: 1px solid rgba(255,255,255,0.08);
            margin: 10px 20px;
        }

        /* ----- Main Content ----- */
        .main-content {
            margin-left: 220px;
            margin-top: 56px;
            padding: 32px 40px;
            min-height: calc(100vh - 56px);
        }

        .page-header {
            margin-bottom: 32px;
        }

        .page-header h1 {
            font-size: 1.6rem;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 5px;
        }

        .page-header p {
            color: #94a3b8;
            font-size: 0.88rem;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        @media (max-width: 768px) {
            .sidebar { display: none; }
            .main-content { margin-left: 0; padding: 20px 16px; }
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<nav class="top-navbar">
    <a href="adminDashboard.jsp" class="brand">
        <i class="bi bi-shield-lock-fill me-2"></i>Admin Panel
    </a>
    <div class="nav-right">
        <a href="<%= request.getContextPath() %>/index.jsp" class="btn-nav btn-nav-outline">
            <i class="bi bi-house-door"></i> Home
        </a>
        <a href="<%= request.getContextPath() %>/logout" class="btn-nav btn-nav-danger">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</nav>

<!-- ===== SIDEBAR with VOTERS ACTIVE (BLUE) ===== -->
<aside class="sidebar">
    <div class="sidebar-title">Menu</div>

    <a href="adminDashboard.jsp" class="sidebar-link">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <a href="manageCandidates.jsp" class="sidebar-link">
        <i class="bi bi-person-badge"></i> Candidates
    </a>

    <!-- VOTERS is ACTIVE (blue) on this page -->
    <a href="manageVoters.jsp" class="sidebar-link active">
        <i class="bi bi-people-fill"></i> Voters
    </a>

    <a href="manageElection.jsp" class="sidebar-link">
        <i class="bi bi-check2-square"></i> Elections
    </a>

    <a href="results.jsp" class="sidebar-link">
        <i class="bi bi-bar-chart-fill"></i> Results
    </a>

    <div class="sidebar-divider"></div>

    <a href="<%= request.getContextPath() %>/logout" class="sidebar-link">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>
</aside>

<!-- ===== MAIN CONTENT (Ready for your voter management code) ===== -->
<main class="main-content">
    <div class="page-header">
        <h1>Manage Voters</h1>
        <p>Add, edit, or remove voters and track their voting status.</p>
    </div>

    <!-- Your Voter Management Content Goes Here -->
    <div class="card shadow-sm p-4">
        <p class="text-muted text-center mb-0">Voter management interface will be displayed here.</p>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>