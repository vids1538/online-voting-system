<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>
<!-- these above line will prevent access without  login  -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    

    <style>
        body{
            background:#f4f6f9;
        }

        .sidebar{
           position:fixed;
           left:0;
           top:56px;      /* navbar height */
           width:250px;
           height:calc(100vh - 56px);
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
            transition:0.3s;
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
         margin-top:20px;
         padding:30px;
}

        .dashboard-card{
            height:220px;
            border:none;
            border-radius:20px;
            cursor:pointer;
            transition:0.3s;
        }

        .dashboard-card:hover{
            transform:translateY(-5px);
            box-shadow:0 8px 20px rgba(0,0,0,0.15);
        }

        .card-icon{
            font-size:55px;
        }
    </style>
</head>
<body>

<%
if(request.getParameter("success") != null){
%>

<script>
    alert("Election Created Successfully!");
</script>

<%
}
%>

<%
if(request.getParameter("error") != null){
%>

<script>
    alert("Election Creation Failed!");
</script>

<%
}
%>



<!-- admin navbar special  -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container-fluid">

      
        
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
 
<!-- Sidebar -->
<div class="sidebar">

    <h2>Admin Panel</h2>
    
    

    <a href="adminDashboard.jsp" class="sidebar-link active">
        <i class="bi bi-speedometer2"></i>
        Dashboard
    </a>

    <a href="manageCandidates.jsp" class="sidebar-link">
        <i class="bi bi-person-badge"></i>
        Candidates
    </a>

    <a href="manageVoters.jsp" class="sidebar-link">
        <i class="bi bi-people-fill"></i>
        Voters
    </a>

    <a href="manageElection.jsp" class="sidebar-link active">
        <i class="bi bi-check2-square"></i> Election
    </a>

    <a href="results.jsp" class="sidebar-link">
        <i class="bi bi-bar-chart-fill"></i>
        Results
    </a>

      <a href="<%=request.getContextPath()%>/logout"
               class="sidebar-link">
               <i class="bi bi-box-arrow-right"></i>
                Logout
     </a>

</div>

<!-- Main Content -->
<div class="main-content">

<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="fw-bold">Manage Elections</h2>

    <a href="CreateElection.jsp" class="btn btn-primary">
        + Create Election
    </a>
</div>

<div class="card shadow-sm">
    <div class="card-header bg-dark text-white">
        <h5 class="mb-0">Election List</h5>
    </div>

    <div class="card-body">

        <table class="table table-bordered table-hover align-middle">

            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Election Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                    <th width="280">Actions</th>
                </tr>
            </thead>

            <tbody>

                <!-- Database Loop Here -->

                <tr>
                    <td>1</td>
                    <td>Lok Sabha Election 2026</td>
                    <td>01-07-2026</td>
                    <td>15-07-2026</td>
                    <td>
                        <span class="badge bg-success">
                            Active
                        </span>
                    </td>

                    <td>

                        <a href="editElection.jsp?id=1"
                           class="btn btn-warning btn-sm">
                            Edit
                        </a>

                        <a href="#"
                           class="btn btn-danger btn-sm"
                           onclick="return confirmDelete();">
                            Delete
                        </a>

                        <a href="manageCandidates.jsp?electionId=1"
                           class="btn btn-info btn-sm text-white">
                            Show Candidates
                        </a>

                    </td>
                </tr>

            </tbody>

        </table>

    </div>
</div>

</div>




<script>
function confirmDelete() {
    return confirm("Are you sure you want to delete this election?");
}
</script>


</body>
</html>