<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.card{
    border-radius:18px;
    transition:0.3s ease;
}

.card:hover{
    transform:translateY(-5px);
}

.rounded-circle{
    width:120px;
    height:120px;
    object-fit:cover;
}
</style>
</head>
<body>

<div class="container mt-5">

    <!-- Page Heading -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">
            <i class="bi bi-people-fill text-primary"></i>
            Temporary Candidates Card
        </h2>
        <p class="text-muted">
            Candidate information for demonstration purposes only.
        </p>
    </div>

    <div class="row g-4">

        <!-- Candidate 1 -->
        <div class="col-md-4">
            <div class="card shadow border-0 h-100">
                <div class="card-body text-center">
                    <!-- Candidate 1 -->
                   <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Rahul"
                     class="rounded-circle mb-3"
                     width="120" height="120"
                     alt="Candidate">

                    <h5 class="fw-bold">Rahul Kumar</h5>

                    <span class="badge bg-primary mb-2">
                        Progressive Party
                    </span>

                    <p class="text-muted mb-1">
                        <strong>Age:</strong> 35 Years
                    </p>

                    <p class="text-muted mb-1">
                        <strong>Education:</strong> B.Tech
                    </p>

                    <p class="small text-secondary">
                        Experienced social worker committed to
                        transparency and public welfare.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 2 -->
        <div class="col-md-4">
            <div class="card shadow border-0 h-100">
                <div class="card-body text-center">
                    <!-- Candidate 2 -->
<img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Priya"
     class="rounded-circle mb-3"
     width="120" height="120"
     alt="Candidate">

                    <h5 class="fw-bold">Priya Sharma</h5>

                    <span class="badge bg-success mb-2">
                        National Reform Party
                    </span>

                    <p class="text-muted mb-1">
                        <strong>Age:</strong> 32 Years
                    </p>

                    <p class="text-muted mb-1">
                        <strong>Education:</strong> MBA
                    </p>

                    <p class="small text-secondary">
                        Focused on digital governance,
                        education and youth development.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 3 -->
        <div class="col-md-4">
            <div class="card shadow border-0 h-100">
                <div class="card-body text-center">
                    <!-- Candidate 3 -->
<img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Amit"
     class="rounded-circle mb-3"
     width="120" height="120"
     alt="Candidate">

                    <h5 class="fw-bold">Amit Singh</h5>

                    <span class="badge bg-danger mb-2">
                        People's Unity Party
                    </span>

                    <p class="text-muted mb-1">
                        <strong>Age:</strong> 40 Years
                    </p>

                    <p class="text-muted mb-1">
                        <strong>Education:</strong> M.A.
                    </p>

                    <p class="small text-secondary">
                        Dedicated to infrastructure growth,
                        employment and rural development.
                    </p>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>