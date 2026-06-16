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
            padding: 30px 24px;
            margin-top: 20px;
            text-align: center;
        }

        .winner-box .crown {
            font-size: 48px;
        }

        .winner-box .winner-name {
            font-size: 32px;
            font-weight: 700;
            color: #1e293b;
            margin-top: 5px;
        }

        .winner-box .winner-party {
            font-size: 18px;
            color: #475569;
        }

        .winner-box .winner-votes {
            font-size: 20px;
            color: #16a34a;
            font-weight: 600;
            margin-top: 10px;
        }

        .winner-box .no-votes {
            font-size: 18px;
            color: #f59e0b;
        }

        .table th {
            background-color: #1e293b;
            color: white;
        }

        .btn-declare {
            padding: 10px 30px;
            font-size: 16px;
            font-weight: 600;
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
        <h1 style="text-align: center;">🗳️ Election Results</h1>
        <p style="text-align: center;">View all candidates and declare the election winner.</p>
    </div>

    <div class="card shadow-sm p-4">
        
        <!-- Buttons -->
        <div class="mb-3 d-flex justify-content-between align-items-center">
            <div>
                <span class="badge bg-primary fs-6">
                    <i class="bi bi-people"></i> Total Votes Cast: 
                    <%
                        int totalVotes = 0;
                        Connection conn0 = null;
                        Statement stmt0 = null;
                        ResultSet rs0 = null;
                        try {
                            conn0 = DbConnection.getConnection();
                            stmt0 = conn0.createStatement();
                            rs0 = stmt0.executeQuery("SELECT COUNT(*) FROM votes");
                            if(rs0.next()) {
                                totalVotes = rs0.getInt(1);
                            }
                        } catch(Exception e) {
                            e.printStackTrace();
                        } finally {
                            if(rs0 != null) try { rs0.close(); } catch(Exception e) {}
                            if(stmt0 != null) try { stmt0.close(); } catch(Exception e) {}
                            if(conn0 != null) try { conn0.close(); } catch(Exception e) {}
                        }
                    %>
                    <%= totalVotes %>
                </span>
            </div>
            <div>
                <a href="results.jsp" class="btn btn-secondary me-2">
                    <i class="bi bi-arrow-repeat"></i> Refresh
                </a>
                <a href="results.jsp?declare=winner" class="btn btn-success btn-declare">
                    <i class="bi bi-trophy"></i> Declare Result
                </a>
            </div>
        </div>

        <!-- Candidates Table -->
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Candidate Name</th>
                        <th>Party Name</th>
                        <th>Votes</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        int totalCandidates = 0;
                        int rank = 1;
                        
                        try {
                            conn = DbConnection.getConnection();
                            stmt = conn.createStatement();
                            
                            // Query with vote_count from candidates table
                            String query = "SELECT candidate_id, full_name, party_name, vote_count " +
                                           "FROM candidates ORDER BY vote_count DESC";
                            rs = stmt.executeQuery(query);
                            
                            while(rs.next()) {
                                totalCandidates++;
                                int candidateId = rs.getInt("candidate_id");
                                String fullName = rs.getString("full_name");
                                String partyName = rs.getString("party_name");
                                int voteCount = rs.getInt("vote_count");
                                
                                // Rank badge
                                String rankBadge = "";
                                if(rank == 1) rankBadge = "🥇";
                                else if(rank == 2) rankBadge = "🥈";
                                else if(rank == 3) rankBadge = "🥉";
                                else rankBadge = "#" + rank;
                    %>
                                <tr>
                                    <td><%= rankBadge %></td>
                                    <td><strong><%= fullName %></strong></td>
                                    <td><%= partyName %></td>
                                    <td><span class="badge bg-primary"><%= voteCount %></span></td>
                                </tr>
                    <%
                                rank++;
                            }
                            
                            if(totalCandidates == 0) {
                    %>
                                <tr>
                                    <td colspan="4" class="text-center text-muted">
                                        No candidates found in the database.
                                    </td>
                                </tr>
                    <%
                            }
                            
                        } catch(Exception e) {
                            e.printStackTrace();
                    %>
                            <tr>
                                <td colspan="4" class="text-center text-danger">
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

        <!-- Winner Display -->
        <div class="winner-box">
            <%
                // Check if Declare Result button was clicked
                String declare = request.getParameter("declare");
                
                if(declare != null && declare.equals("winner")) {
                    // Calculate winner from candidates table
                    Connection conn2 = null;
                    Statement stmt2 = null;
                    ResultSet rs2 = null;
                    
                    try {
                        conn2 = DbConnection.getConnection();
                        stmt2 = conn2.createStatement();
                        
                        String winnerQuery = "SELECT full_name, party_name, vote_count FROM candidates " +
                                             "ORDER BY vote_count DESC LIMIT 1";
                        rs2 = stmt2.executeQuery(winnerQuery);
                        
                        if(rs2.next()) {
                            String winnerName = rs2.getString("full_name");
                            String winnerParty = rs2.getString("party_name");
                            int voteCount = rs2.getInt("vote_count");
                            
                            if(voteCount > 0) {
            %>
                                <div class="crown">🏆</div>
                                <div class="winner-name"><%= winnerName %></div>
                                <div class="winner-party"><%= winnerParty %></div>
                                <div class="winner-votes">Total Votes: <%= voteCount %></div>
            <%
                            } else {
            %>
                                <div class="crown">📢</div>
                                <div class="no-votes">No votes cast yet!</div>
                                <p style="color: #7f8c8d; margin-top: 10px;">Waiting for voters to cast their votes.</p>
            <%
                            }
                        } else {
            %>
                            <div class="crown">⚠️</div>
                            <div class="no-votes">No candidates found!</div>
            <%
                        }
                        
                    } catch(Exception e) {
                        e.printStackTrace();
            %>
                        <div class="crown">❌</div>
                        <div class="no-votes">Error fetching winner</div>
            <%
                    } finally {
                        if(rs2 != null) try { rs2.close(); } catch(Exception e) {}
                        if(stmt2 != null) try { stmt2.close(); } catch(Exception e) {}
                        if(conn2 != null) try { conn2.close(); } catch(Exception e) {}
                    }
                } else {
                    // Default message - before declaring result
            %>
                    <h4 style="color: #f59e0b;">Click "Declare Result" to see the winner</h4>
                    <p style="color: #7f8c8d;">The winner will be displayed here based on vote counts.</p>
            <%
                }
            %>
        </div>
        
        <!-- Total Candidates Count -->
        <div class="mt-3 d-flex justify-content-between align-items-center">
            <small class="text-muted">
                <i class="bi bi-person-badge"></i> Total Candidates: 
                <strong><%= totalCandidates %></strong>
            </small>
            <small class="text-muted">
                <i class="bi bi-calendar"></i> Last Updated: <%= new java.util.Date() %>
            </small>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>