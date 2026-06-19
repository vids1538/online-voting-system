<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | E-Voting System</title>

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
            padding-top: 80px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .page-wrapper {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px 40px;
        }
        
        
        /* ===== CONTACT CARD ===== */
        .contact-card {
            background: #ffffff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 2px 16px rgba(0,0,0,0.06);
        }
        
        /* ===== LEFT PANEL ===== */
        .left-panel {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 60%, #1e3a5f 100%);
            color: white;
            padding: 40px 36px;
            height: 100%;
            position: relative;
            overflow: hidden;
        }
        
        .left-panel::before {
            content: '';
            position: absolute;
            top: -30%;
            right: -30%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(37, 99, 235, 0.15), transparent 70%);
            border-radius: 50%;
        }
        
        .left-panel .vote-icon {
            font-size: 52px;
            margin-bottom: 16px;
            display: inline-block;
            position: relative;
            z-index: 1;
            animation: pulse-icon 2s ease-in-out infinite;
        }
        
        @keyframes pulse-icon {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05) rotate(3deg); }
        }
        
        .left-panel h2 {
            font-weight: 700;
            font-size: 26px;
            position: relative;
            z-index: 1;
        }
        
        .left-panel p {
            color: #94a3b8;
            font-size: 15px;
            line-height: 1.7;
            position: relative;
            z-index: 1;
        }
        
        .left-panel hr {
            border-color: rgba(255,255,255,0.08);
            margin: 20px 0;
            position: relative;
            z-index: 1;
        }
        
        .contact-info {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 14px;
            color: #e2e8f0;
            font-size: 14px;
            position: relative;
            z-index: 1;
        }
        
        .contact-info i {
            width: 36px;
            height: 36px;
            background: rgba(37, 99, 235, 0.2);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #60a5fa;
            font-size: 16px;
            flex-shrink: 0;
        }
        
        .contact-info span {
            color: #cbd5e1;
        }
        
        .contact-info strong {
            color: #ffffff;
        }
        
        /* ===== RIGHT SECTION (FORM) ===== */
        .form-section {
            padding: 40px 44px;
        }
        
        .form-section h3 {
            font-size: 22px;
            font-weight: 700;
            color: #0b1b33;
            margin-bottom: 24px;
        }
        
        .form-section h3 i {
            color: #2563eb;
            margin-right: 10px;
        }
        
        .form-label {
            font-weight: 600;
            font-size: 14px;
            color: #1e293b;
        }
        
        .form-control {
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            padding: 10px 14px;
            font-size: 14px;
            transition: all 0.2s ease;
            background: #f8fafc;
        }
        
        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
            background: #ffffff;
        }
        
        .btn-send {
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            border: none;
            padding: 12px;
            font-weight: 600;
            border-radius: 10px;
            color: #ffffff;
            transition: all 0.3s ease;
            font-size: 15px;
        }
        
        .btn-send:hover {
            background: linear-gradient(135deg, #1d4ed8, #1a3a8a);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(37, 99, 235, 0.35);
        }
        
        .btn-send i {
            margin-right: 8px;
        }
        
        /* ===== ALERT MESSAGES ===== */
        .alert-custom {
            border-radius: 12px;
            padding: 16px 20px;
            margin-bottom: 20px;
            border: none;
        }
        
        .alert-success-custom {
            background: #ecfdf5;
            color: #065f46;
            border-left: 4px solid #059669;
        }
        
        .alert-danger-custom {
            background: #fef2f2;
            color: #991b1b;
            border-left: 4px solid #dc2626;
        }
        
        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            body {
                padding-top: 72px;
            }
            
            .hero-contact {
                padding: 28px 20px;
            }
            
            .hero-contact h1 {
                font-size: 24px;
            }
            
            .hero-contact .lead {
                font-size: 15px;
            }
            
            .left-panel {
                padding: 28px 24px;
            }
            
            .form-section {
                padding: 24px 20px;
            }
            
            .form-section h3 {
                font-size: 19px;
            }
        }
        
        @media (max-width: 480px) {
            .page-wrapper {
                padding: 0 12px 30px;
            }
            
            .hero-contact {
                padding: 20px 16px;
            }
            
            .hero-contact h1 {
                font-size: 20px;
            }
            
            .left-panel {
                padding: 20px 16px;
            }
            
            .left-panel .vote-icon {
                font-size: 40px;
            }
            
            .left-panel h2 {
                font-size: 20px;
            }
            
            .form-section {
                padding: 18px 14px;
            }
            
            .contact-info {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<jsp:include page="../jsp/components/navbar.jsp"/>

<!-- ===== MAIN CONTENT ===== -->
<div class="page-wrapper">

    

    <!-- Alert Messages -->
    <%
        String successMessage = (String) request.getAttribute("successMessage");
        String errorMessage = (String) request.getAttribute("errorMessage");
    %>

    <% if (successMessage != null) { %>
        <div class="alert-custom alert-success-custom alert-dismissible fade show" role="alert">
            <i class="bi bi-check-circle-fill me-2"></i>
            <%= successMessage %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <% if (errorMessage != null) { %>
        <div class="alert-custom alert-danger-custom alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-circle-fill me-2"></i>
            <%= errorMessage %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <!-- Contact Card -->
    <div class="contact-card">
        <div class="row g-0">

            <!-- Left Panel -->
            <div class="col-md-5">
                <div class="left-panel">
                    <div class="text-center">
                        <i class="bi bi-shield-check vote-icon"></i>
                        <h2>E-Voting System</h2>
                        <p class="mt-2">
                            Secure, transparent and efficient
                            online voting platform.
                        </p>
                    </div>

                    <hr>

                    <div class="contact-info">
                        <i class="bi bi-envelope-fill"></i>
                        <div>
                            <strong>Email</strong><br>
                            <span>support@evoting.com</span>
                        </div>
                    </div>

                    <div class="contact-info">
                        <i class="bi bi-telephone-fill"></i>
                        <div>
                            <strong>Phone</strong><br>
                            <span>+91 XXXXX XXXXX</span>
                        </div>
                    </div>

                    <div class="contact-info">
                        <i class="bi bi-geo-alt-fill"></i>
                        <div>
                            <strong>Location</strong><br>
                            <span>Patna, Bihar, India</span>
                        </div>
                    </div>

                    <div class="contact-info">
                        <i class="bi bi-clock-fill"></i>
                        <div>
                            <strong>Support Hours</strong><br>
                            <span>24/7 Available</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Panel - Form -->
            <div class="col-md-7">
                <div class="form-section">
                    <h3>
                        <i class="bi bi-chat-dots-fill"></i> Send us a Message
                    </h3>

                    <form action="${pageContext.request.contextPath}/ContactServlet" method="post">

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-person-fill me-1"></i> Full Name
                            </label>
                            <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-envelope-fill me-1"></i> Email Address
                            </label>
                            <input type="email" name="email" class="form-control" placeholder="Enter your email address" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-tag-fill me-1"></i> Subject
                            </label>
                            <input type="text" name="subject" class="form-control" placeholder="Enter message subject" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-pencil-fill me-1"></i> Message
                            </label>
                            <textarea name="message" rows="4" class="form-control" placeholder="Write your message here..." required></textarea>
                        </div>

                        <button type="submit" class="btn btn-send w-100">
                            <i class="bi bi-send-fill"></i> Send Message
                        </button>

                    </form>
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