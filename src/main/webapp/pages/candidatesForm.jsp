<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Candidates</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

<style>

.page-title{
    font-weight:700;
    color:#1E293B;
}

.custom-card{
    border:none;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,.08);
}

.table img{
    object-fit:cover;
}

.table thead{
    background:#1E293B;
    color:white;
}

.btn-add{
    background:#16A34A;
    border:none;
}

.btn-delete{
    background:#DC2626;
    border:none;
}

.btn-add:hover{
    background:#15803D;
}

.btn-delete:hover{
    background:#B91C1C;
}

</style>

</head>

<body>

<div class="container-fluid p-4">

<!-- Heading + Buttons -->

<div class="d-flex justify-content-between align-items-center mb-4">

```
<h2 class="page-title">
    <i class="bi bi-people-fill"></i>
    Candidates
</h2>

<div>

    <a href="add-candidate.jsp"
       class="btn btn-add text-white">

        <i class="bi bi-plus-circle"></i>
        Add Candidate

    </a>

    <button
        class="btn btn-delete text-white"
        data-bs-toggle="modal"
        data-bs-target="#deleteModal">

        <i class="bi bi-trash"></i>
        Delete Candidate

    </button>

</div>
```

</div>

<!-- Success Messages -->

<%
String success =
request.getParameter("success");

String deleted =
request.getParameter("deleted");
%>

<% if("1".equals(success)){ %>

<div class="alert alert-success alert-dismissible fade show">

Candidate Added Successfully

<button
    type="button"
    class="btn-close"
    data-bs-dismiss="alert">
</button>

</div>

<% } %>

<% if("1".equals(deleted)){ %>

<div class="alert alert-danger alert-dismissible fade show">

Candidate Deleted Successfully

<button
    type="button"
    class="btn-close"
    data-bs-dismiss="alert">
</button>

</div>

<% } %>

<!-- Table Card -->

<div class="card custom-card">

<div class="card-body">

<div class="table-responsive">

<table class="table table-hover align-middle">

<thead>

<tr>

<th>ID</th>

<th>Party Symbol</th>

<th>Name</th>

<th>Party</th>

<th>Age</th>

<th>Gender</th>

<th>Mobile</th>

<th>Qualification</th>

<th>Voter ID</th>

<th>Created At</th>

</tr>

</thead>


</tbody>

</table>

</div>

</div>

</div>

</div>

<!-- Delete Modal -->

<div
class="modal fade"
id="deleteModal"
tabindex="-1">

<div class="modal-dialog">

<div class="modal-content">

<form
action="DeleteCandidateServlet"
method="post">

<div class="modal-header">

<h5 class="modal-title">

Delete Candidate

</h5>

<button
type="button"
class="btn-close"
data-bs-dismiss="modal"> </button>

</div>

<div class="modal-body">

<label class="form-label">

Enter Candidate ID

</label>

<input
type="number"
name="candidateId"
class="form-control"
placeholder="Candidate ID"
required>

</div>

<div class="modal-footer">

<button
type="button"
class="btn btn-secondary"
data-bs-dismiss="modal">

Cancel

</button>

<button
type="submit"
class="btn btn-danger">

Delete Candidate

</button>

</div>

</form>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
