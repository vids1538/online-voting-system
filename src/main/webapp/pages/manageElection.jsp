<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Manage Elections</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f1f5f9;
        }

        /* ----- Navbar (fixed, never breaks) ----- */
        .top-navbar {
            position: fixed;
            top: 0; left: 0; right: 0;
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
            top: 56px; left: 0;
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

        .page-header { margin-bottom: 36px; }

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

        /* ----- Election Cards ----- */
        .election-card {
            position: relative;
            height: 300px;
            border-radius: 22px;
            overflow: hidden;
            display: block;
            text-decoration: none;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .election-card .card-default {
            position: absolute;
            inset: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding: 30px;
            transition: opacity 0.3s ease;
        }

        .election-card .card-hover {
            position: absolute;
            inset: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 32px 28px;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .election-card:hover .card-default { opacity: 0; }
        .election-card:hover .card-hover { opacity: 1; }
        .election-card:hover { transform: translateY(-6px); box-shadow: 0 20px 30px -12px rgba(0,0,0,0.3); }

        /* Lok Sabha */
        .card-loksabha {
            background: linear-gradient(145deg, #1d4ed8, #1e3a8a);
            box-shadow: 0 14px 28px rgba(29, 78, 216, 0.3);
        }
        .card-loksabha:hover { background: linear-gradient(145deg, #2563eb, #1e40af); }

        /* Vidhan Sabha */
        .card-vidhansabha {
            background: linear-gradient(145deg, #0e7490, #164e63);
            box-shadow: 0 14px 28px rgba(14, 116, 144, 0.3);
        }
        .card-vidhansabha:hover { background: linear-gradient(145deg, #0891b2, #155e75); }

        .card-emoji { font-size: 3rem; display: block; line-height: 1; }
        .card-name { font-size: 1.3rem; font-weight: 700; color: #fff; text-align: center; }
        .card-tag { font-size: 0.75rem; color: rgba(255,255,255,0.65); text-align: center; }

        .hover-title { font-size: 1.1rem; font-weight: 700; color: #fff; margin-bottom: 10px; }
        .hover-desc { font-size: 0.8rem; color: rgba(255,255,255,0.8); line-height: 1.5; margin-bottom: 18px; }
        .hover-meta { display: flex; gap: 12px; justify-content: center; flex-wrap: wrap; margin-bottom: 20px; }
        .hover-meta span {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-size: 0.7rem;
            color: rgba(255,255,255,0.7);
            background: rgba(255,255,255,0.1);
            padding: 4px 10px;
            border-radius: 8px;
        }
        .hover-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            background: #fff;
            color: #1e293b;
            padding: 8px 22px;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 600;
            text-decoration: none;
        }
        .card-loksabha .hover-btn:hover { background: #dbeafe; }
        .card-vidhansabha .hover-btn:hover { background: #cffafe; }

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

    <!-- ===== SIDEBAR ===== -->
    <aside class="sidebar">
        <div class="sidebar-title">Menu</div>

        <a href="adminDashboard.jsp" class="sidebar-link">
            <i class="bi bi-speedometer2"></i> Dashboard
        </a>
        <a href="manageCandidates.jsp" class="sidebar-link">
            <i class="bi bi-person-badge"></i> Candidates
        </a>
        <a href="manageVoters.jsp" class="sidebar-link">
            <i class="bi bi-people-fill"></i> Voters
        </a>
        <!-- Elections button is now ACTIVE (blue) because this is the election management page -->
        <a href="manageElection.jsp" class="sidebar-link active">
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

    <!-- ===== MAIN CONTENT ===== -->
    <main class="main-content">

        <div class="page-header">
            <h1>Select Election</h1>
            <p>Choose an election type to manage candidates and voting.</p>
        </div>

        <div class="row g-4 justify-content-center">

            <!-- Lok Sabha -->
            <div class="col-lg-5 col-md-6">
                <a href="lokSabhaElection.jsp" class="election-card card-loksabha">
                    <div class="card-default">
                        <span class="card-emoji">🏛️</span>
                        <div class="card-name">Lok Sabha Election</div>
                        <div class="card-tag">National Election</div>
                    </div>
                    <div class="card-hover">
                        <div class="hover-title">Elect Your Member of Parliament</div>
                        <div class="hover-desc">
                            Vote to elect Members of Parliament (MPs) who represent
                            your constituency in the Parliament of India.
                        </div>
                        <div class="hover-meta">
                            <span><i class="bi bi-clock"></i> 5-Year Term</span>
                            <span><i class="bi bi-building"></i> Central Govt</span>
                            <span><i class="bi bi-geo-alt"></i> Constituency</span>
                        </div>
                        <span class="hover-btn">
                            Manage Election <i class="bi bi-arrow-right"></i>
                        </span>
                    </div>
                </a>
            </div>

            <!-- Vidhan Sabha -->
            <div class="col-lg-5 col-md-6">
                <a href="vidhanSabhaElection.jsp" class="election-card card-vidhansabha">
                    <div class="card-default">
                        <span class="card-emoji">🏢</span>
                        <div class="card-name">Vidhan Sabha Election</div>
                        <div class="card-tag">State Election</div>
                    </div>
                    <div class="card-hover">
                        <div class="hover-title">Elect Your Member of Legislative Assembly</div>
                        <div class="hover-desc">
                            Vote to elect Members of Legislative Assembly (MLAs) who represent
                            your constituency in the State Assembly.
                        </div>
                        <div class="hover-meta">
                            <span><i class="bi bi-clock"></i> 5-Year Term</span>
                            <span><i class="bi bi-map"></i> State Govt</span>
                            <span><i class="bi bi-geo-alt"></i> Constituency</span>
                        </div>
                        <span class="hover-btn">
                            Manage Election <i class="bi bi-arrow-right"></i>
                        </span>
                    </div>
                </a>
            </div>

        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>