<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Voting System - Secure Digital Voting</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <style>
        /* ===== BODY ===== */
        body {
            background: #f4f7fb;
            padding-top: 68px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        /* ===== PAGE WRAPPER ===== */
        .home-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            body {
                padding-top: 64px;
            }
        }
    </style>
</head>
<body>

    <!-- ===== NAVBAR ===== -->
    <jsp:include page="/jsp/components/navbar.jsp"/>  
    
    <!-- ===== HERO SECTION ===== -->
    <jsp:include page="/jsp/components/hero.jsp"/>
    
    <!-- ===== FEATURES SECTION ===== -->
    <jsp:include page="/jsp/components/features.jsp"/>  
    
    <!-- ===== STATS SECTION ===== -->
    
    
    <!-- ===== FOOTER ===== -->
    <jsp:include page="/jsp/components/footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>