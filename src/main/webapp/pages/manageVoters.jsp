<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Voters</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body{
            background:#f4f6f9;
        }

        .sidebar{
            position:fixed;
            left:0;
            top:0;
            width:250px;
            height:100vh;
            background:#212529;
        }

        .sidebar h2{
            color:white;
            text-align:center;
            padding:25px 0;
            border-bottom:1px solid #444;
        }

        .sidebar-link{
            display:block;
            color:white;
            text-decoration:none;
            padding:15px 20px;
            margin:5px 10px;
            border-radius:10px;
        }

        .sidebar-link:hover{
            background:#0d6efd;
            color:white;
        }

        .active{
            background:#0d6efd;
        }

        .main-content{
            margin-left:250px;
            padding:30px;
        }

        .card{
            border:none;
            border-radius:15px;
        }
    </style>
</head>
<body>

<!-- admin navbar special  -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold" href="adminDashboard.jsp">
            🗳 E-Voting Admin
        </a>

        <div class="ms-auto d-flex align-items-center">

            <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-house-door-fill"></i> Home
            </a>

            <a href="<%=request.getContextPath()%>/logout"
               class="sidebar-link">
               <i class="bi bi-box-arrow-right"></i>
                 Logout
            </a>

        </div>

    </div>
</nav>
<!-- admin navbar end  -->

<div class="sidebar">

    <h2>Admin Panel</h2>

    <a href="adminDashboard.jsp" class="sidebar-link">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <a href="manageCandidates.jsp" class="sidebar-link">
        <i class="bi bi-person-badge"></i> Candidates
    </a>

    <a href="manageVoters.jsp" class="sidebar-link active">
        <i class="bi bi-people-fill"></i> Voters
    </a>

    <a href="manageElection.jsp" class="sidebar-link">
        <i class="bi bi-check2-square"></i> Election
    </a>

    <a href="results.jsp" class="sidebar-link">
        <i class="bi bi-bar-chart-fill"></i> Results
    </a>

      <a href="<%=request.getContextPath()%>/logout"
               class="sidebar-link">
               <i class="bi bi-box-arrow-right"></i>
                Logout
     </a>

</div>

<div class="main-content">

    <h2 class="mb-4">Manage Voters</h2>

    <!-- Voters Table -->
    <div class="card shadow-sm p-3">

        <table class="table table-hover">

            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Voting Status</th>
                </tr>
            </thead>

            <tbody>

                <tr>
                    <td>1</td>
                    <td>Rahul Kumar</td>
                    <td>rahul@gmail.com</td>
                    <td>
                        <span class="badge bg-success">
                            Voted
                        </span>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>Aman Singh</td>
                    <td>aman@gmail.com</td>
                    <td>
                        <span class="badge bg-danger">
                            Not Voted
                        </span>
                    </td>
                </tr>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>