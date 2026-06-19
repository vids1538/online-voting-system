<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Online Voting System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<style>
    /* ===== BODY ===== */
    body {
        background: #f4f7fb;
        padding-top: 80px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .page-wrapper {
        max-width: 1100px;
        margin: 0 auto;
        padding: 0 20px 40px;
    }
    
    /* ===== HERO SECTION ===== */
    .hero-about {
        background: linear-gradient(135deg, #0f172a 0%, #1e3a5f 40%, #2563eb 100%);
        border-radius: 20px;
        padding: 50px 40px;
        text-align: center;
        box-shadow: 0 8px 32px rgba(0,0,0,0.12);
        margin-bottom: 32px;
        position: relative;
        overflow: hidden;
    }
    
    .hero-about::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -20%;
        width: 400px;
        height: 400px;
        background: rgba(37, 99, 235, 0.08);
        border-radius: 50%;
    }
    
    .hero-about::after {
        content: '';
        position: absolute;
        bottom: -40%;
        left: -10%;
        width: 300px;
        height: 300px;
        background: rgba(37, 99, 235, 0.06);
        border-radius: 50%;
    }
    
    .hero-about h1 {
        font-size: 36px;
        font-weight: 800;
        color: #ffffff;
        position: relative;
        z-index: 1;
    }
    
    .hero-about h1 i {
        color: #60a5fa;
        margin-right: 12px;
    }
    
    .hero-about .lead {
        font-size: 18px;
        color: #94a3b8 !important;
        margin-top: 10px;
        position: relative;
        z-index: 1;
        font-weight: 400;
    }
    
    .hero-badge {
        display: inline-block;
        background: rgba(37, 99, 235, 0.2);
        color: #60a5fa;
        padding: 4px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 600;
        margin-top: 12px;
        position: relative;
        z-index: 1;
        border: 1px solid rgba(37, 99, 235, 0.2);
    }
    
    /* ===== ABOUT CARD ===== */
    .about-card {
        background: #ffffff;
        border: none;
        border-radius: 20px;
        box-shadow: 0 2px 16px rgba(0,0,0,0.06);
        overflow: hidden;
    }
    
    .about-card .card-body {
        padding: 40px 44px;
    }
    
    /* ===== SECTION HEADERS ===== */
    .section-title {
        font-size: 20px;
        font-weight: 700;
        color: #0b1b33;
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 16px;
    }
    
    .section-title .icon {
        width: 36px;
        height: 36px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
    }
    
    .icon-blue { background: #eef2ff; color: #2563eb; }
    .icon-red { background: #fef2f2; color: #dc2626; }
    .icon-green { background: #ecfdf5; color: #059669; }
    .icon-purple { background: #f3e8ff; color: #7c3aed; }
    .icon-orange { background: #fff7ed; color: #ea580c; }
    .icon-cyan { background: #ecfeff; color: #0891b2; }
    
    /* ===== PARAGRAPH ===== */
    .about-card p {
        color: #4b5563;
        font-size: 15px;
        line-height: 1.8;
    }
    
    /* ===== LIST ===== */
    .feature-list {
        list-style: none;
        padding: 0;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 8px 24px;
    }
    
    .feature-list li {
        padding: 6px 0;
        color: #4b5563;
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .feature-list li i {
        color: #2563eb;
        font-size: 16px;
        width: 20px;
    }
    
    /* ===== DIVIDER ===== */
    .section-divider {
        border: none;
        border-top: 2px solid #f1f4f9;
        margin: 28px 0;
    }
    
    /* ===== TABLE ===== */
    .info-table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 12px;
        overflow: hidden;
    }
    
    .info-table tr {
        border-bottom: 1px solid #f1f4f9;
    }
    
    .info-table tr:last-child {
        border-bottom: none;
    }
    
    .info-table th {
        background: #f8fafc;
        color: #0b1b33;
        font-weight: 600;
        font-size: 14px;
        padding: 12px 20px;
        text-align: left;
        width: 140px;
    }
    
    .info-table td {
        color: #4b5563;
        font-size: 14px;
        padding: 12px 20px;
        background: #ffffff;
    }
    
    /* ===== VISION BOX ===== */
    .vision-box {
        background: linear-gradient(135deg, #eef2ff, #e0e7ff);
        border-radius: 16px;
        padding: 24px 28px;
        margin-top: 8px;
    }
    
    .vision-box p {
        color: #1e293b !important;
        font-size: 15px;
        font-weight: 500;
        margin: 0;
        line-height: 1.8;
    }
    
    /* ===== FOOTER ===== */
    .footer-about {
        text-align: center;
        margin-top: 32px;
        padding: 20px;
        color: #94a3b8;
        font-size: 14px;
        border-top: 1px solid #e9edf4;
    }
    
    .footer-about strong {
        color: #0b1b33;
    }
    
    /* ===== RESPONSIVE ===== */
    @media (max-width: 768px) {
        body {
            padding-top: 72px;
        }
        
        .hero-about {
            padding: 32px 20px;
        }
        
        .hero-about h1 {
            font-size: 26px;
        }
        
        .hero-about .lead {
            font-size: 15px;
        }
        
        .about-card .card-body {
            padding: 24px 20px;
        }
        
        .section-title {
            font-size: 17px;
        }
        
        .feature-list {
            grid-template-columns: 1fr;
        }
        
        .info-table th {
            width: 100px;
            font-size: 13px;
            padding: 10px 14px;
        }
        
        .info-table td {
            font-size: 13px;
            padding: 10px 14px;
        }
        
        .vision-box {
            padding: 18px 20px;
        }
    }
    
    @media (max-width: 480px) {
        .page-wrapper {
            padding: 0 12px 30px;
        }
        
        .hero-about h1 {
            font-size: 22px;
        }
        
        .about-card .card-body {
            padding: 18px 14px;
        }
        
        .info-table th {
            width: 80px;
            font-size: 12px;
            padding: 8px 10px;
        }
        
        .info-table td {
            font-size: 12px;
            padding: 8px 10px;
        }
    }
</style>

</head>
<body>

<!-- ===== NAVBAR ===== -->
<jsp:include page="../jsp/components/navbar.jsp"/>

<!-- ===== MAIN CONTENT ===== -->
<div class="page-wrapper">

    <!-- Hero Section -->
    <div class="hero-about">
        <h1>
            <i class="bi bi-shield-check"></i> E-voting
        </h1>
        <p class="lead">
            Secure, Transparent and Efficient Digital Election Management Platform
        </p>
        <span class="hero-badge">
            <i class="bi bi-star-fill"></i> BCA Final Year Project
        </span>
    </div>

    <!-- About Card -->
    <div class="about-card card">
        <div class="card-body">

            <!-- Project Overview -->
            <h3 class="section-title">
                <span class="icon icon-blue"><i class="bi bi-info-circle-fill"></i></span>
                Project Overview
            </h3>
            <p>
                The Online Voting System is a web-based application developed to
                facilitate secure and efficient digital voting. The system enables
                administrators to manage elections, candidates, voters and results
                while providing a streamlined and transparent voting process.
            </p>

            <hr class="section-divider">

            <!-- Project Objectives -->
            <h3 class="section-title">
                <span class="icon icon-red"><i class="bi bi-bullseye"></i></span>
                Project Objectives
            </h3>
            <ul class="feature-list">
                <li><i class="bi bi-check-circle-fill"></i> Provide a secure online voting platform</li>
                <li><i class="bi bi-check-circle-fill"></i> Reduce manual voting errors</li>
                <li><i class="bi bi-check-circle-fill"></i> Improve transparency in elections</li>
                <li><i class="bi bi-check-circle-fill"></i> Generate election results efficiently</li>
                <li><i class="bi bi-check-circle-fill"></i> Simplify election administration</li>
            </ul>

            <hr class="section-divider">

            <!-- Key Features -->
            <h3 class="section-title">
                <span class="icon icon-green"><i class="bi bi-check-circle-fill"></i></span>
                Key Features
            </h3>
            <ul class="feature-list">
                <li><i class="bi bi-shield-lock-fill"></i> Admin Authentication</li>
                <li><i class="bi bi-calendar-event-fill"></i> Election Management</li>
                <li><i class="bi bi-person-badge-fill"></i> Candidate Management</li>
                <li><i class="bi bi-person-plus-fill"></i> Voter Registration</li>
                <li><i class="bi bi-check2-square"></i> Vote Casting</li>
                <li><i class="bi bi-bar-chart-fill"></i> Automatic Result Generation</li>
                <li><i class="bi bi-key-fill"></i> Session-Based Security</li>
            </ul>

            <hr class="section-divider">

            <!-- Technologies -->
            <h3 class="section-title">
                <span class="icon icon-purple"><i class="bi bi-cpu-fill"></i></span>
                Technologies Used
            </h3>
            <table class="info-table">
                <tr>
                    <th>Frontend</th>
                    <td>HTML, CSS, Bootstrap, JSP</td>
                </tr>
                <tr>
                    <th>Backend</th>
                    <td>Java Servlets (Jakarta EE 10.1)</td>
                </tr>
                <tr>
                    <th>Database</th>
                    <td>MySQL 8.0</td>
                </tr>
                <tr>
                    <th>Server</th>
                    <td>Apache Tomcat 10.1</td>
                </tr>
            </table>

            <hr class="section-divider">

            <!-- Developer Information -->
            <h3 class="section-title">
                <span class="icon icon-orange"><i class="bi bi-person-fill"></i></span>
                Developer Information
            </h3>
            <table class="info-table">
                <tr>
                    <th>Name</th>
                    <td><strong>Vidya Sagar</strong></td>
                </tr>
                <tr>
                    <th>Course</th>
                    <td>Bachelor of Computer Applications (BCA)</td>
                </tr>
                <tr>
                    <th>College</th>
                    <td>CIMAGE Professional College</td>
                </tr>
                <tr>
                    <th>Academic Session</th>
                    <td>2025 - 2026</td>
                </tr>
            </table>

            <hr class="section-divider">

            <!-- Vision Statement -->
            <h3 class="section-title">
                <span class="icon icon-cyan"><i class="bi bi-lightbulb-fill"></i></span>
                Vision Statement
            </h3>
            <div class="vision-box">
                <p>
                    <i class="bi bi-quote" style="color: #2563eb; font-size: 20px;"></i>
                    Our vision is to provide a reliable, transparent and user-friendly
                    digital voting solution that promotes fair elections through modern
                    web technologies while ensuring efficiency, accessibility and trust.
                </p>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <div class="footer-about">
        <p>
            © 2026 <strong>Online Voting System</strong> | BCA Final Year Project
        </p>
    </div>

</div>

<!-- ===== FOOTER COMPONENT ===== -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>