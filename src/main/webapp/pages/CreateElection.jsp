<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>
<head>
    <title>Create Election</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>



<div class="container mt-5">

<div class="card shadow">

    <div class="card-header bg-primary text-white">
        <h3>Create Election</h3>
    </div>

    <div class="card-body">

        <form action="<%=request.getContextPath()%>/CreateElectionServlet" method="post">

            <div class="mb-3">
                <label class="form-label">Election Name</label>
                <input type="text"
                       name="electionName"
                       class="form-control"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Start Date</label>
                <input type="date"
                       name="startDate"
                       class="form-control"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">End Date</label>
                <input type="date"
                       name="endDate"
                       class="form-control"
                       required>
            </div>

            <button type="submit" class="btn btn-success">
                Create Election
            </button>

            <a href="manageElection.jsp"
               class="btn btn-secondary">
                Back
            </a>

        </form>

    </div>

</div>


</div>

</body>
</html>
