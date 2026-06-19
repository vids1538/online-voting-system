<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates - E-Voting</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<style>
    /* ===== PAGE SPECIFIC ===== */
    body {
        background: #f4f7fb;
        padding-top: 80px;  /* Navbar space */
    }
    
    .page-wrapper {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px 40px;
    }
    
    /* ===== HEADER ===== */
    .page-header {
        text-align: center;
        margin-bottom: 40px;
        padding: 30px 20px 20px;
        background: white;
        border-radius: 16px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.04);
    }
    
    .page-header h2 {
        font-size: 28px;
        font-weight: 700;
        color: #0b1b33;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }
    
    .page-header h2 i {
        color: #2563eb;
    }
    
    .page-header p {
        color: #6b7280;
        font-size: 15px;
        margin-top: 6px;
    }
    
    /* ===== CANDIDATE CARDS ===== */
    .candidate-card {
        border: none;
        border-radius: 16px;
        background: #ffffff;
        box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        transition: all 0.3s ease;
        height: 100%;
        overflow: hidden;
    }
    
    .candidate-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 32px rgba(0,0,0,0.10);
    }
    
    .candidate-card .card-body {
        padding: 28px 24px 24px;
        text-align: center;
    }
    
    /* ===== AVATAR ===== */
    .candidate-avatar {
        width: 110px;
        height: 110px;
        border-radius: 50%;
        object-fit: cover;
        margin: 0 auto 16px;
        border: 4px solid #eef2ff;
        display: block;
        background: #f3f6fa;
    }
    
    /* ===== CANDIDATE NAME ===== */
    .candidate-name {
        font-size: 19px;
        font-weight: 700;
        color: #0b1b33;
        margin-bottom: 4px;
    }
    
    /* ===== PARTY BADGE ===== */
    .party-badge {
        display: inline-block;
        padding: 4px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 600;
        margin-bottom: 14px;
    }
    
    .party-badge.blue { background: #eef2ff; color: #2563eb; }
    .party-badge.green { background: #ecfdf5; color: #059669; }
    .party-badge.red { background: #fef2f2; color: #dc2626; }
    .party-badge.purple { background: #f3e8ff; color: #7c3aed; }
    .party-badge.orange { background: #fff7ed; color: #ea580c; }
    
    /* ===== CANDIDATE DETAILS ===== */
    .candidate-detail {
        font-size: 14px;
        color: #4b5563;
        margin-bottom: 4px;
    }
    
    .candidate-detail strong {
        color: #0b1b33;
        font-weight: 600;
    }
    
    .candidate-bio {
        font-size: 13.5px;
        color: #6b7280;
        margin-top: 12px;
        padding-top: 12px;
        border-top: 1px solid #f0f2f5;
        line-height: 1.6;
    }
    
    /* ===== RESPONSIVE ===== */
    @media (max-width: 768px) {
        body {
            padding-top: 72px;
        }
        
        .page-header {
            padding: 20px 16px;
            margin-bottom: 28px;
        }
        
        .page-header h2 {
            font-size: 22px;
        }
        
        .candidate-card .card-body {
            padding: 20px 16px;
        }
        
        .candidate-avatar {
            width: 90px;
            height: 90px;
        }
        
        .candidate-name {
            font-size: 17px;
        }
    }
    
    @media (max-width: 480px) {
        .page-wrapper {
            padding: 0 12px 30px;
        }
        
        .page-header h2 {
            font-size: 19px;
        }
        
        .candidate-avatar {
            width: 80px;
            height: 80px;
        }
    }
</style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
    <jsp:include page="../jsp/components/navbar.jsp"/> 

<!-- ===== MAIN CONTENT ===== -->
<div class="page-wrapper">

    <!-- Page Header -->
    <div class="page-header">
        <h2>
            <i class="bi bi-person-badge"></i>
            Our Candidates
        </h2>
        <p>Candidate information for demonstration purposes only.</p>
    </div>

    <!-- Candidates Grid -->
    <div class="row g-4">

        <!-- Candidate 1 -->
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="candidate-card card">
                <div class="card-body">
                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Rahul"
                         class="candidate-avatar"
                         alt="Rahul Kumar">
                    
                    <h5 class="candidate-name">Rahul Kumar</h5>
                    <span class="party-badge blue">Progressive Party</span>
                    
                    <p class="candidate-detail"><strong>Age:</strong> 35 Years</p>
                    <p class="candidate-detail"><strong>Education:</strong> B.Tech</p>
                    
                    <p class="candidate-bio">
                        Experienced social worker committed to transparency and public welfare.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 2 -->
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="candidate-card card">
                <div class="card-body">
                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Priya"
                         class="candidate-avatar"
                         alt="Priya Sharma">
                    
                    <h5 class="candidate-name">Priya Sharma</h5>
                    <span class="party-badge green">National Reform Party</span>
                    
                    <p class="candidate-detail"><strong>Age:</strong> 32 Years</p>
                    <p class="candidate-detail"><strong>Education:</strong> MBA</p>
                    
                    <p class="candidate-bio">
                        Focused on digital governance, education and youth development.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 3 -->
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="candidate-card card">
                <div class="card-body">
                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Amit"
                         class="candidate-avatar"
                         alt="Amit Singh">
                    
                    <h5 class="candidate-name">Amit Singh</h5>
                    <span class="party-badge red">People's Unity Party</span>
                    
                    <p class="candidate-detail"><strong>Age:</strong> 40 Years</p>
                    <p class="candidate-detail"><strong>Education:</strong> M.A.</p>
                    
                    <p class="candidate-bio">
                        Dedicated to infrastructure growth, employment and rural development.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 4 (Extra for demo) -->
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="candidate-card card">
                <div class="card-body">
                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Meera"
                         class="candidate-avatar"
                         alt="Meera Patel">
                    
                    <h5 class="candidate-name">Meera Patel</h5>
                    <span class="party-badge purple">People's Alliance</span>
                    
                    <p class="candidate-detail"><strong>Age:</strong> 38 Years</p>
                    <p class="candidate-detail"><strong>Education:</strong> LLB</p>
                    
                    <p class="candidate-bio">
                        Human rights advocate focusing on social justice and equality.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 5 -->
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="candidate-card card">
                <div class="card-body">
                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Vikram"
                         class="candidate-avatar"
                         alt="Vikram Singh">
                    
                    <h5 class="candidate-name">Vikram Singh</h5>
                    <span class="party-badge orange">Development Front</span>
                    
                    <p class="candidate-detail"><strong>Age:</strong> 45 Years</p>
                    <p class="candidate-detail"><strong>Education:</strong> PhD</p>
                    
                    <p class="candidate-bio">
                        Economist and policy maker focused on sustainable development.
                    </p>
                </div>
            </div>
        </div>

        <!-- Candidate 6 -->
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="candidate-card card">
                <div class="card-body">
                    <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=Ananya"
                         class="candidate-avatar"
                         alt="Ananya Reddy">
                    
                    <h5 class="candidate-name">Ananya Reddy</h5>
                    <span class="party-badge blue">United India Party</span>
                    
                    <p class="candidate-detail"><strong>Age:</strong> 29 Years</p>
                    <p class="candidate-detail"><strong>Education:</strong> M.Com</p>
                    
                    <p class="candidate-bio">
                        Young leader focused on women empowerment and education reform.
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- ===== FOOTER ===== -->
<%@ include file="../jsp/components/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>