<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== HERO SECTION ===== -->
<section class="hero-modern">
    <div class="hero-container">
        <div class="hero-content">
            <div class="hero-badge">
                <i class="bi bi-shield-check"></i> Secure & Transparent
            </div>
            
           <h1 class="hero-title">Power Your Voice with <br> 
           <span>Digital Democracy</span>
           </h1>
         <p class="hero-description">Experience a new era of secure, accessible, and transparent digital voting. Cast your vote from anywhere, anytime with confidence.</p>
            
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/pages/register.jsp" class="btn-hero btn-primary-hero">
                    <i class="bi bi-rocket-takeoff-fill"></i> Get Started
                </a>
                <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp" class="btn-hero btn-secondary-hero">
                    <i class="bi bi-info-circle-fill"></i> Learn More
                </a>
            </div>
            
            <div class="hero-stats">
                <div class="hero-stat">
                    <span class="stat-number" id="totalVoters">0</span>
                    <span class="stat-label">Registered Voters</span>
                </div>
                <div class="hero-stat">
                    <span class="stat-number" id="totalCandidates">0</span>
                    <span class="stat-label">Candidates</span>
                </div>
                <div class="hero-stat">
                    <span class="stat-number" id="totalVotes">0</span>
                    <span class="stat-label">Votes Cast</span>
                </div>
            </div>
        </div>
        
        <!-- ===== HERO ILLUSTRATION (Option A) ===== -->
        <div class="hero-illustration">
            <div class="illustration-card">
                <div class="illustration-icon">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h3>Secure Voting</h3>
                <p class="illustration-subtitle">End-to-end encrypted</p>
                <div class="illustration-features">
                    <div class="feature-item">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>Verified Identity</span>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>Anonymous Voting</span>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>Tamper-Proof System</span>
                    </div>
                </div>
                <div class="illustration-badge">
                    <i class="bi bi-award-fill"></i>
                    Certified Secure
                </div>
            </div>
            
            <!-- Floating decorative icons -->
            <div class="floating-icon float-1"><i class="bi bi-fingerprint"></i></div>
            <div class="floating-icon float-2"><i class="bi bi-qr-code"></i></div>
            <div class="floating-icon float-3"><i class="bi bi-lock-fill"></i></div>
        </div>
    </div>
</section>

<style>
/* ===== HERO MODERN ===== */
.hero-modern {
    padding: 40px 0 60px;
    background: linear-gradient(135deg, #f0f4ff 0%, #dbeafe 50%, #eff6ff 100%);
    min-height: calc(100vh - 68px);
    display: flex;
    align-items: center;
    position: relative;
    overflow: hidden;
}

.hero-modern::before {
    content: '';
    position: absolute;
    top: -30%;
    right: -10%;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(37, 99, 235, 0.06), transparent 70%);
    border-radius: 50%;
}

.hero-modern::after {
    content: '';
    position: absolute;
    bottom: -20%;
    left: -5%;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(37, 99, 235, 0.04), transparent 70%);
    border-radius: 50%;
}

.hero-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    align-items: center;
    position: relative;
    z-index: 1;
}

/* ===== HERO CONTENT ===== */
.hero-content {
    position: relative;
}

.hero-badge {
    display: inline-block;
    background: rgba(37, 99, 235, 0.12);
    color: #2563eb;
    padding: 6px 18px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 20px;
    border: 1px solid rgba(37, 99, 235, 0.15);
}

.hero-badge i {
    margin-right: 6px;
}

.hero-title {
    font-size: 44px;
    font-weight: 800;
    color: #0b1b33;
    line-height: 1.15;
    margin-bottom: 16px;
}

.hero-title span {
    background: linear-gradient(135deg, #2563eb, #1d4ed8, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.hero-description {
    font-size: 17px;
    color: #4b5563;
    line-height: 1.8;
    max-width: 480px;
    margin-bottom: 30px;
}

/* ===== HERO BUTTONS ===== */
.hero-buttons {
    display: flex;
    gap: 14px;
    flex-wrap: wrap;
    margin-bottom: 40px;
}

.btn-hero {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 12px 30px;
    border-radius: 12px;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
}

.btn-primary-hero {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    color: #ffffff;
    box-shadow: 0 4px 16px rgba(37, 99, 235, 0.3);
}

.btn-primary-hero:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 30px rgba(37, 99, 235, 0.4);
    color: #ffffff;
}

.btn-secondary-hero {
    background: #ffffff;
    color: #1e293b;
    border: 2px solid #e2e8f0;
}

.btn-secondary-hero:hover {
    transform: translateY(-3px);
    border-color: #2563eb;
    color: #2563eb;
    box-shadow: 0 4px 16px rgba(0,0,0,0.06);
}

/* ===== HERO STATS ===== */
.hero-stats {
    display: flex;
    gap: 40px;
    padding-top: 20px;
    border-top: 2px solid #e9edf4;
}

.hero-stat {
    display: flex;
    flex-direction: column;
}

.hero-stat .stat-number {
    font-size: 28px;
    font-weight: 800;
    color: #0b1b33;
}

.hero-stat .stat-label {
    font-size: 13px;
    color: #6b7280;
    font-weight: 500;
}

/* ===== HERO ILLUSTRATION ===== */
.hero-illustration {
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
}

.illustration-card {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(10px);
    border-radius: 24px;
    padding: 40px 30px;
    text-align: center;
    box-shadow: 0 20px 60px rgba(37, 99, 235, 0.12);
    border: 1px solid rgba(255, 255, 255, 0.6);
    max-width: 340px;
    width: 100%;
    transition: transform 0.3s ease;
}

.illustration-card:hover {
    transform: translateY(-5px);
}

.illustration-icon {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #2563eb, #3b82f6);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    box-shadow: 0 8px 24px rgba(37, 99, 235, 0.25);
}

.illustration-icon i {
    font-size: 40px;
    color: white;
}

.illustration-card h3 {
    font-size: 22px;
    color: #0b1b33;
    margin-bottom: 6px;
    font-weight: 700;
}

.illustration-subtitle {
    color: #6b7280;
    font-size: 14px;
    margin-bottom: 20px;
}

.illustration-features {
    text-align: left;
    margin-bottom: 20px;
}

.feature-item {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 8px 0;
    color: #1e293b;
    font-size: 14px;
    font-weight: 500;
}

.feature-item i {
    color: #2563eb;
    font-size: 16px;
}

.illustration-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: rgba(16, 185, 129, 0.12);
    color: #059669;
    padding: 6px 16px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: 600;
}

.illustration-badge i {
    font-size: 14px;
}

/* ===== FLOATING ICONS ===== */
.floating-icon {
    position: absolute;
    font-size: 28px;
    color: rgba(37, 99, 235, 0.15);
    animation: float 6s ease-in-out infinite;
}

.floating-icon i {
    background: rgba(255, 255, 255, 0.8);
    padding: 10px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.04);
}

.float-1 {
    top: 10%;
    right: 5%;
    animation-delay: 0s;
}

.float-2 {
    bottom: 15%;
    right: 25%;
    animation-delay: 2s;
    font-size: 22px;
}

.float-3 {
    top: 35%;
    left: -5%;
    animation-delay: 4s;
    font-size: 20px;
}

@keyframes float {
    0%, 100% { transform: translateY(0px); }
    50% { transform: translateY(-15px); }
}

/* ===== RESPONSIVE ===== */
@media (max-width: 992px) {
    .hero-container {
        grid-template-columns: 1fr;
        text-align: center;
        gap: 30px;
    }
    
    .hero-description {
        max-width: 100%;
        margin-left: auto;
        margin-right: auto;
    }
    
    .hero-buttons {
        justify-content: center;
    }
    
    .hero-stats {
        justify-content: center;
    }
    
    .hero-illustration {
        width: 100%;
    }
    
    .illustration-card {
        max-width: 100%;
        margin: 0 auto;
    }
    
    .feature-item {
        justify-content: center;
    }
}

@media (max-width: 768px) {
    .hero-modern {
        padding: 30px 0 40px;
        min-height: auto;
    }
    
    .hero-title {
        font-size: 32px;
    }
    
    .hero-description {
        font-size: 15px;
    }
    
    .hero-stats {
        gap: 24px;
        flex-wrap: wrap;
    }
    
    .hero-stat .stat-number {
        font-size: 22px;
    }
    
    .illustration-card {
        padding: 30px 20px;
    }
    
    .illustration-icon {
        width: 64px;
        height: 64px;
    }
    
    .illustration-icon i {
        font-size: 32px;
    }
}

@media (max-width: 480px) {
    .hero-title {
        font-size: 26px;
    }
    
    .hero-buttons {
        flex-direction: column;
        align-items: center;
        width: 100%;
    }
    
    .btn-hero {
        width: 100%;
        justify-content: center;
    }
    
    .hero-stats {
        flex-direction: column;
        align-items: center;
        gap: 12px;
    }
    
    .hero-stat {
        align-items: center;
    }
    
    .floating-icon {
        display: none;
    }
}
</style>

<script>
// Animated counter for stats
document.addEventListener('DOMContentLoaded', function() {
    // Fetch real data from database via AJAX
    function fetchStats() {
        // You can implement AJAX calls to get real data
        // For now, using static demo values
        document.getElementById('totalVoters').textContent = '2,450';
        document.getElementById('totalCandidates').textContent = '12';
        document.getElementById('totalVotes').textContent = '1,876';
    }
     
    fetchStats();
});
</script>