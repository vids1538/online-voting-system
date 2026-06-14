<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<title>Add Candidate</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <div class="card shadow">

                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">
                        Add Candidate
                    </h3>
                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/AddCandidateServlet" method="post">

                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <label>Full Name</label>
                                <input
                                    type="text"
                                    name="fullName"
                                    class="form-control"
                                    placeholder="Rahul Kumar"
                                    required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Age</label>
                                <input
                                    type="number"
                                    name="age"
                                    min="18"
                                    max="100"
                                    class="form-control"
                                    required>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6 mb-3">

                                <label>Party Name</label>

                                <input
                                    type="text"
                                    name="partyName"
                                    class="form-control"
                                    placeholder="Example Party"
                                    required>

                            </div>

                            <div class="col-md-6 mb-3">

                                <label>Party Symbol Image</label>

                                <input
                                    type="text"
                                    name="partyImage"
                                    class="form-control"
                                    placeholder="lotus.png"
                                    required>

                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6 mb-3">

                                <label>Voter ID</label>

                                <input
                                    type="number"
                                    name="voterId"
                                    class="form-control"
                                    required>

                            </div>

                            <div class="col-md-6 mb-3">

                                <label>Mobile Number</label>

                                <input
                                    type="text"
                                    maxlength="10"
                                    pattern="[0-9]{10}"
                                    name="mobile"
                                    class="form-control"
                                    required>

                            </div>

                        </div>
                        
                        <div class="mb-3">

                            <label>Gender</label>

                            <select
                                name="gender"
                                class="form-select"
                                required>

                                <option value="">Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>

                            </select>

                        </div>

                        <div class="mb-3">

                            <label>Highest Qualification</label>

                            <input
                                type="text"
                                name="qualification"
                                class="form-control"
                                placeholder="BCA, MCA, B.Tech, MBA"
                                required>

                        </div>
                        
                        <div class="mb-3">

                            <label>Address</label>

                            <textarea
                                name="address"
                                rows="3"
                                class="form-control"
                                required></textarea>

                        </div>

                        <button
                            type="submit"
                            class="btn btn-success">

                            Add Candidate

                        </button>

                        

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>