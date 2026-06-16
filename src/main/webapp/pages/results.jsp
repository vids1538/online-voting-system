<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="evoting.DbConnection.DbConnection" %>
<%
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Election Results</title>

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

        .winner-box {
            background: linear-gradient(135deg, #e8f5e9, #c8e6c9);
            border-radius: 12px;
            padding: 16px 24px;
            margin-top: 20px;
        }

        .table th {
            background-color: #1e293b;
            color: white;
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

<!-- ===== SIDEBAR with RESULTS ACTIVE (BLUE) ===== -->
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

    <a href="manageElection.jsp" class="sidebar-link">
        <i class="bi bi-check2-square"></i> Elections
    </a>

    <!-- RESULTS is ACTIVE (blue) on this page -->
    <a href="results.jsp" class="sidebar-link active">
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
        <h1>Election Results - Lok Sabha 2024</h1>
        <p>View all candidates and the election winner.</p>
    </div>

    <div class="card shadow-sm p-4">
        
        <!-- Refresh/Show Results Button -->
        <div class="mb-3 text-end">
            <a href="results.jsp" class="btn btn-primary">
                <i class="bi bi-arrow-repeat"></i> Refresh Results
            </a>
        </div>

        <!-- Candidates Table -->
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Candidate ID</th>
                        <th>Candidate Name</th>
                        <th>Party Name</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        String winner = "";
                        int maxVotes = -1;
                        int totalCandidates = 0;
                        
                        try {
                            conn = DbConnection.getConnection();
                            stmt = conn.createStatement();
                            
                            // Note: Your table doesn't have a vote_count column yet
                            // For now, displaying all candidates. Winner logic will work once you add vote_count
                            String query = "SELECT candidate_id, full_name, party_name, age, gender, qualification FROM candidates ORDER BY candidate_id";
                            rs = stmt.executeQuery(query);
                            
                            while(rs.next()) {
                                totalCandidates++;
                                int candidateId = rs.getInt("candidate_id");
                                String fullName = rs.getString("full_name");
                                String partyName = rs.getString("party_name");
                                
                    %>
                                <tr>
                                    <td><%= candidateId %></td>
                                    <td><%= fullName %></td>
                                    <td><%= partyName %></td>
                                   
                                </tr>
                    <%
                            }
                            
                            if(totalCandidates == 0) {
                    %>
                                <tr>
                                    <td colspan="6" class="text-center text-muted">
                                        No candidates found in the database.
                                    </td>
                                </tr>
                    <%
                            }
                            
                        } catch(Exception e) {
                            e.printStackTrace();
                    %>
                            <tr>
                                <td colspan="6" class="text-center text-danger">
                                    Error loading candidates: <%= e.getMessage() %>
                                </td>
                            </tr>
                    <%
                        } finally {
                            if(rs != null) try { rs.close(); } catch(Exception e) {}
                            if(stmt != null) try { stmt.close(); } catch(Exception e) {}
                            if(conn != null) try { conn.close(); } catch(Exception e) {}
                        }
                    %>
                </tbody>
            </table>
        </div>

        <hr>

        <!-- Winner Display - Currently showing message since no vote_count column -->
        <div class="winner-box">
            <h5 class="mb-2">🏆 Winner</h5>
            <%
                // Note: Since your candidates table doesn't have a vote_count column,
                // you need to add it to track votes.
                // Run this SQL in MySQL:
                // ALTER TABLE candidates ADD COLUMN vote_count INT DEFAULT 0;
                
                // Once you add vote_count column, use this code:
                /*
                try {
                    conn = DbConnection.getConnection();
                    String winnerQuery = "SELECT full_name, party_name, vote_count FROM candidates ORDER BY vote_count DESC LIMIT 1";
                    Statement winnerStmt = conn.createStatement();
                    ResultSet winnerRs = winnerStmt.executeQuery(winnerQuery);
                    if(winnerRs.next()) {
                        winner = winnerRs.getString("full_name");
                        int voteCount = winnerRs.getInt("vote_count");
                        out.println("<h4 class='text-success mb-0'>" + winner + "</h4>");
                        out.println("<small>Total Votes: " + voteCount + "</small>");
                    } else {
                        out.println("<h4 class='text-muted mb-0'>No votes cast yet</h4>");
                    }
                    winnerRs.close();
                    winnerStmt.close();
                    conn.close();
                } catch(Exception e) {
                    out.println("<h4 class='text-danger mb-0'>Error fetching winner</h4>");
                }
                */
            %>
            <h4 class="text-warning mb-0">⚠️ Vote counting pending</h4>
            <small class="text-muted">
                To enable winner declaration, add 'vote_count' column to candidates table:<br>
                <code>ALTER TABLE candidates ADD COLUMN vote_count INT DEFAULT 0;</code>
            </small>
        </div>
        
        <!-- Total Candidates Count -->
        <div class="mt-3 text-end">
            <small class="text-muted">
                <i class="bi bi-person-badge"></i> Total Candidates: 
                <strong><%= totalCandidates %></strong>
            </small>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>