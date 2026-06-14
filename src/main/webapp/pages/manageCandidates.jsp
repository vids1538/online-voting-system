<%-- Session Guard --%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lok Sabha – Candidate Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>

        /* ----- Base ----- */
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f1f5f9;
        }

        /* ----- Navbar ----- */
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

        .btn-nav-outline { color: #fff; border: 1px solid rgba(255,255,255,0.3); }
        .btn-nav-outline:hover { background: rgba(255,255,255,0.1); color: #fff; }
        .btn-nav-danger  { color: #fff; background: #e11d48; }
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

        .sidebar-divider { border-top: 1px solid rgba(255,255,255,0.08); margin: 10px 20px; }

        /* ----- Main Content ----- */
        .main-content {
            margin-left: 220px;
            margin-top: 56px;
            padding: 48px 44px;
        }

       
        /* ----- Action Cards (Add / Delete / Update) ----- */
        .action-cards {
            display: flex;
            gap: 16px;
            margin-bottom: 36px;
            flex-wrap: wrap;
        }

        .action-card {
            flex: 1;
            min-width: 160px;
            border-radius: 14px;
            padding: 20px 22px;
            cursor: pointer;
            border: none;
            transition: transform 0.25s, box-shadow 0.25s;
            display: flex;
            align-items: center;
            gap: 14px;
            text-align: left;
            color: #fff;
            font-family: 'Poppins', sans-serif;
        }

        .action-card:hover {
            transform: translateY(-4px);
            color: #fff;
        }

        .action-card .ac-icon {
            width: 44px; height: 44px;
            border-radius: 10px;
            background: rgba(255,255,255,0.15);
            display: flex; align-items: center; justify-content: center;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .action-card .ac-label { font-size: 0.75rem; opacity: 0.75; }
        .action-card .ac-title { font-size: 0.95rem; font-weight: 600; }

        .ac-add    { background: linear-gradient(135deg, #2563eb, #1d4ed8); box-shadow: 0 8px 24px rgba(37,99,235,0.3); }
        .ac-add:hover { box-shadow: 0 14px 32px rgba(37,99,235,0.45); }

       
        /* ----- Candidate Table ----- */
        .table-section-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .table-section-title i { color: #2563eb; }

        .table-wrapper {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            overflow: hidden;
        }

        .candidate-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.83rem;
        }

        .candidate-table thead tr {
            background: linear-gradient(135deg, #1d4ed8, #1e3a8a);
            color: #fff;
        }

        .candidate-table thead th {
            padding: 13px 16px;
            font-weight: 600;
            font-size: 0.78rem;
            letter-spacing: 0.4px;
            white-space: nowrap;
        }

        .candidate-table tbody tr {
            border-bottom: 1px solid #f1f5f9;
            transition: background 0.15s;
        }

        .candidate-table tbody tr:hover { background: #f8faff; }
        .candidate-table tbody tr:last-child { border-bottom: none; }

        .candidate-table tbody td {
            padding: 12px 16px;
            color: #334155;
            vertical-align: middle;
        }

        .party-img {
            width: 34px; height: 34px;
            border-radius: 8px;
            object-fit: cover;
            border: 2px solid #e2e8f0;
        }

        .gender-badge {
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.72rem;
            font-weight: 500;
        }

        .badge-male   { background: #dbeafe; color: #1d4ed8; }
        .badge-female { background: #fce7f3; color: #be185d; }
        .badge-other  { background: #f3e8ff; color: #7c3aed; }

        .tbl-btn {
            border: none;
            padding: 5px 11px;
            border-radius: 7px;
            font-size: 0.75rem;
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s;
            font-family: 'Poppins', sans-serif;
        }

        .tbl-btn-edit   { background: #dbeafe; color: #1d4ed8; }
        .tbl-btn-edit:hover { background: #bfdbfe; }

        .tbl-btn-del    { background: #fee2e2; color: #dc2626; }
        .tbl-btn-del:hover { background: #fecaca; }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #94a3b8;
        }

        .empty-state i { font-size: 3rem; margin-bottom: 12px; display: block; }

        /* ----- Modal ----- */
        .modal-header-blue {
            background: linear-gradient(135deg, #1d4ed8, #1e3a8a);
            color: #fff;
            border-radius: 12px 12px 0 0;
            padding: 18px 24px;
        }

        .modal-header-blue .btn-close { filter: invert(1); }

        .modal-content {
            border: none;
            border-radius: 14px;
            overflow: hidden;
        }

        .modal-body { padding: 24px; }

        .form-label {
            font-size: 0.8rem;
            font-weight: 600;
            color: #475569;
            margin-bottom: 5px;
        }

        .form-control, .form-select {
            font-size: 0.85rem;
            border-radius: 9px;
            border: 1px solid #e2e8f0;
            padding: 9px 12px;
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus, .form-select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37,99,235,0.12);
        }

        .btn-submit {
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            color: #fff;
            border: none;
            padding: 10px 28px;
            border-radius: 9px;
            font-size: 0.875rem;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            transition: 0.2s;
        }

        .btn-submit:hover { background: linear-gradient(135deg, #1d4ed8, #1e3a8a); color: #fff; }

        /* ----- Responsive ----- */
        @media (max-width: 768px) {
            .sidebar      { display: none; }
            .main-content { margin-left: 0; padding: 24px 14px; }
            .hero-icon    { display: none; }
            .action-cards { flex-direction: column; }
        }

    </style>
</head>
<body>

<%-- ===================== DB CONNECTION ===================== --%>
<%
    /* ---- DB config ---- */
    String dbURL  = "jdbc:mysql://localhost:3306/e_voting";
    String dbUser = "root";
    String dbPass = "Cimage@123";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String dbError = null;
    int totalCandidates = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    } catch (Exception e) {
        dbError = e.getMessage();
    }

    /* -------- HANDLE FORM ACTIONS -------- */
    String action = request.getParameter("action");

    if (conn != null && "add".equals(action)) {
        try {
            ps = conn.prepareStatement(
                "INSERT INTO candidates (full_name, party_name, party_image, age, gender, address, voter_id, mobile, qualification) VALUES (?,?,?,?,?,?,?,?,?)"
            );
            ps.setString(1, request.getParameter("full_name"));
            ps.setString(2, request.getParameter("party_name"));
            ps.setString(3, request.getParameter("party_image"));
            ps.setInt   (4, Integer.parseInt(request.getParameter("age")));
            ps.setString(5, request.getParameter("gender"));
            ps.setString(6, request.getParameter("address"));
            ps.setString(7, request.getParameter("voter_id"));
            ps.setString(8, request.getParameter("mobile"));
            ps.setString(9, request.getParameter("qualification"));
            ps.executeUpdate();
        } catch (Exception e) 
        { 
      
        dbError = e.getMessage();  
        }
            
        finally { if (ps != null) ps.close(); }
    }

    if (conn != null && "update".equals(action)) {
        try {
            ps = conn.prepareStatement(
                "UPDATE candidates SET full_name=?, party_name=?, party_image=?, age=?, gender=?, address=?, voter_id=?, mobile=?, qualification=? WHERE candidate_id=?"
            );
            ps.setString(1, request.getParameter("full_name"));
            ps.setString(2, request.getParameter("party_name"));
            ps.setString(3, request.getParameter("party_image"));
            ps.setInt   (4, Integer.parseInt(request.getParameter("age")));
            ps.setString(5, request.getParameter("gender"));
            ps.setString(6, request.getParameter("address"));
            ps.setString(7, request.getParameter("voter_id"));
            ps.setString(8, request.getParameter("mobile"));
            ps.setString(9, request.getParameter("qualification"));
            ps.setInt   (10, Integer.parseInt(request.getParameter("candidate_id")));
            ps.executeUpdate();
        } catch (Exception e) { dbError = e.getMessage(); }
        finally { if (ps != null) ps.close(); }
    }

    if (conn != null && "delete".equals(action)) {
        try {
            ps = conn.prepareStatement("DELETE FROM candidates WHERE candidate_id=?");
            ps.setInt(1, Integer.parseInt(request.getParameter("candidate_id")));
            ps.executeUpdate();
        } catch (Exception e) { dbError = e.getMessage(); }
        finally { if (ps != null) ps.close(); }
    }

    /* ---- Fetch all candidates & count ---- */
    java.util.List<java.util.Map<String,String>> candidates = new java.util.ArrayList<>();
    if (conn != null) {
        try {
            ps = conn.prepareStatement("SELECT * FROM candidates ORDER BY created_at DESC");
            rs = ps.executeQuery();
            while (rs.next()) {
                java.util.Map<String,String> row = new java.util.LinkedHashMap<>();
                row.put("candidate_id",  rs.getString("candidate_id"));
                row.put("full_name",     rs.getString("full_name"));
                row.put("party_name",    rs.getString("party_name"));
                row.put("party_image",   rs.getString("party_image"));
                row.put("age",           rs.getString("age"));
                row.put("gender",        rs.getString("gender"));
                row.put("address",       rs.getString("address"));
                row.put("voter_id",      rs.getString("voter_id"));
                row.put("mobile",        rs.getString("mobile"));
                row.put("qualification", rs.getString("qualification"));
                row.put("created_at",    rs.getString("created_at"));
                candidates.add(row);
            }
            totalCandidates = candidates.size();
        } catch (Exception e) { dbError = e.getMessage(); }
        finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            conn.close();
        }
    }
%>

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
        <a href="manageCandidates.jsp" class="sidebar-link active">
            <i class="bi bi-person-badge"></i> Candidates
        </a>
        <a href="manageVoters.jsp" class="sidebar-link">
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

    <!-- ===== MAIN CONTENT ===== -->
    <main class="main-content">

        <!-- DB Error Banner -->
        <% if (dbError != null) { %>
        <div class="alert alert-danger rounded-3 mb-4" style="font-size:0.85rem;">
            <i class="bi bi-exclamation-triangle me-2"></i><strong>Database Error:</strong> <%= dbError %>
        </div>
        <% } %>

        
        <!-- ── Action Cards ── -->
        <div class="action-cards">

            <button class="action-card ac-add" data-bs-toggle="modal" data-bs-target="#addModal">
                <div class="ac-icon"><i class="bi bi-person-plus-fill"></i></div>
                <div>
                    <div class="ac-label">Candidate</div>
                    <div class="ac-title">Add Candidate</div>
                </div>
            </button>

        </div>

        <!-- ── Candidate Table ── -->
        <div class="table-section-title">
            <i class="bi bi-people-fill"></i> Live Candidates
        </div>

        <div class="table-wrapper">
            <table class="candidate-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Logo</th>
                        <th>Full Name</th>
                        <th>Party</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Voter ID</th>
                        <th>Mobile</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (candidates.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="11">
                            <div class="empty-state">
                                <i class="bi bi-inbox"></i>
                                No candidates found. Add your first candidate using the button above.
                            </div>
                        </td>
                    </tr>
                    <%
                        } else {
                            int sno = 1;
                            for (java.util.Map<String,String> c : candidates) {
                                String genderVal = c.get("gender") == null ? "" : c.get("gender");
                                String gBadge = genderVal.equalsIgnoreCase("Male")   ? "badge-male" :
                                                genderVal.equalsIgnoreCase("Female") ? "badge-female" : "badge-other";
                    %>
                    <tr>
                        <td><%= sno++ %></td>
                        <td><strong>#<%= c.get("candidate_id") %></strong></td>
                        <td>
                            <% if (c.get("party_image") != null && !c.get("party_image").isEmpty()) { %>
                                <img src="<%= c.get("party_image") %>" alt="party" class="party-img">
                            <% } else { %>
                                <div style="width:34px;height:34px;border-radius:8px;background:#e2e8f0;display:flex;align-items:center;justify-content:center;font-size:1rem;">🏳️</div>
                            <% } %>
                        </td>
                        <td><strong><%= c.get("full_name") %></strong></td>
                        <td><%= c.get("party_name") %></td>
                        <td><%= c.get("age") %></td>
                        <td><span class="gender-badge <%= gBadge %>"><%= genderVal %></span></td>
                        <td style="font-family:monospace;font-size:0.8rem;"><%= c.get("voter_id") %></td>
                        <td><%= c.get("mobile") %></td>
                        

<td>
    <button class="tbl-btn tbl-btn-edit"
        onclick="openEdit(
            '<%= c.get("candidate_id") %>',
            '<%= c.get("full_name").replace("'","\\'") %>',
            '<%= c.get("party_name").replace("'","\\'") %>',
            '<%= c.get("party_image") %>',
            '<%= c.get("age") %>',
            '<%= genderVal %>',
            '<%= c.get("address").replace("'","\\'") %>',
            '<%= c.get("voter_id") %>',
            '<%= c.get("mobile") %>',
            '<%= c.get("qualification").replace("'","\\'") %>'
        )">
        <i class="bi bi-pencil"></i> Edit
    </button>
</td>

<td>
    <button class="tbl-btn tbl-btn-del"
        onclick="openDelete(
            '<%= c.get("candidate_id") %>',
            '<%= c.get("full_name").replace("'","\\'") %>'
        )">
        <i class="bi bi-trash3"></i> Delete
    </button>
</td>
</tr>
                    <%
                         }   
                            
                        }
                    %>
                </tbody>
            </table>
        </div>

    </main>

    <!-- Footer -->
    


    <!-- ===========================
         MODAL: Add Candidate
         =========================== -->
    <div class="modal fade" id="addModal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header-blue d-flex justify-content-between align-items-center">
                    <h6 class="mb-0 fw-700"><i class="bi bi-person-plus-fill me-2"></i>Add New Candidate</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form method="post" action="lokSabhaElection.jsp">
                        <input type="hidden" name="action" value="add">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Full Name *</label>
                                <input type="text" name="full_name" class="form-control" required placeholder="e.g. Rajesh Kumar">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Party Name *</label>
                                <input type="text" name="party_name" class="form-control" required placeholder="e.g. Indian National Congress">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Party Logo URL</label>
                                <input type="text" name="party_image" class="form-control" placeholder="https://...">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Age *</label>
                                <input type="number" name="age" class="form-control" required min="25" max="100" placeholder="25">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Gender *</label>
                                <select name="gender" class="form-select" required>
                                    <option value="">Select</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Other</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Voter ID *</label>
                                <input type="text" name="voter_id" class="form-control" required placeholder="e.g. ABC1234567">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Mobile *</label>
                                <input type="text" name="mobile" class="form-control" required maxlength="10" placeholder="10-digit number">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Qualification *</label>
                                <input type="text" name="qualification" class="form-control" required placeholder="e.g. B.A., M.A., Ph.D.">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Address *</label>
                                <textarea name="address" class="form-control" rows="2" required placeholder="Full residential address"></textarea>
                            </div>
                        </div>
                        <div class="mt-4 d-flex justify-content-end gap-2">
                            <button type="button" class="btn btn-light rounded-3" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn-submit">Add Candidate</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

  <!-- ===========================
         MODAL: edit Candidate
         =========================== -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5>Edit Candidate</h5>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <form method="post"
                      action="lokSabhaElection.jsp">

                    <input type="hidden"
                           name="action"
                           value="update">

                    <input type="hidden"
                           name="candidate_id"
                           id="edit_id">

                    <div class="row g-3">

                        <div class="col-md-6">
                            <label>Full Name</label>
                            <input type="text"
                                   name="full_name"
                                   id="edit_full_name"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="col-md-6">
                            <label>Party Name</label>
                            <input type="text"
                                   name="party_name"
                                   id="edit_party_name"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="col-md-4">
                            <label>Age</label>
                            <input type="number"
                                   name="age"
                                   id="edit_age"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="col-md-4">
                            <label>Gender</label>
                            <select name="gender"
                                    id="edit_gender"
                                    class="form-select">
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label>Mobile</label>
                            <input type="text"
                                   name="mobile"
                                   id="edit_mobile"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="col-md-6">
                            <label>Voter ID</label>
                            <input type="text"
                                   name="voter_id"
                                   id="edit_voter_id"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="col-md-6">
                            <label>Party Logo URL</label>
                            <input type="text"
                                   name="party_image"
                                   id="edit_party_image"
                                   class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label>Qualification</label>
                            <input type="text"
                                   name="qualification"
                                   id="edit_qualification"
                                   class="form-control">
                        </div>

                        <div class="col-12">
                            <label>Address</label>
                            <textarea name="address"
                                      id="edit_address"
                                      class="form-control"></textarea>
                        </div>

                    </div>

                    <div class="mt-4 text-end">
                        <button type="submit"
                                class="btn btn-primary">
                            Save Changes
                        </button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>
  
  <!-- ===========================
         MODAL: delete Candidate
         =========================== -->
        
        <div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5>Delete Candidate</h5>
            </div>

            <div class="modal-body">
                Delete candidate:
                <strong id="del_name"></strong> ?
            </div>

            <div class="modal-footer">

                <form method="post" action="lokSabhaElection.jsp">

                    <input type="hidden"
                           name="action"
                           value="delete">

                    <input type="hidden"
                           name="candidate_id"
                           id="del_id">

                    <button type="submit"
                            class="btn btn-danger">
                        Delete
                    </button>

                </form>

            </div>

        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>

function openEdit(id, name, party, img, age, gender,
                  address, voterId, mobile, qualification) {

    document.getElementById('edit_id').value = id;
    document.getElementById('edit_full_name').value = name;
    document.getElementById('edit_party_name').value = party;
    document.getElementById('edit_party_image').value = img;
    document.getElementById('edit_age').value = age;
    document.getElementById('edit_gender').value = gender;
    document.getElementById('edit_address').value = address;
    document.getElementById('edit_voter_id').value = voterId;
    document.getElementById('edit_mobile').value = mobile;
    document.getElementById('edit_qualification').value = qualification;

    new bootstrap.Modal(
        document.getElementById('editModal')
    ).show();
}

function openDelete(id, name) {

    document.getElementById('del_id').value = id;
    document.getElementById('del_name').textContent = name;

    new bootstrap.Modal(
        document.getElementById('deleteModal')
    ).show();
}

</script>
   
</body>
</html>
