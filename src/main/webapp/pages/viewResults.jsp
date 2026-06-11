<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Election Results</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <h2>📊 Election Results</h2>

    <table class="table table-bordered bg-white">

        <thead class="table-dark">
            <tr>
                <th>Candidate</th>
                <th>Votes</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>Amit Kumar</td>
                <td>250</td>
            </tr>

            <tr>
                <td>Rahul Kumar</td>
                <td>180</td>
            </tr>
        </tbody>

    </table>

    <div class="alert alert-success">
        <strong>Winner:</strong> Amit Kumar
    </div>

</div>

</body>
</html>