<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== FEATURES SECTION ===== -->
<section class="features-modern">
    <div class="features-container">
        
        

        <div class="features-grid">

            <!-- Feature 1 -->
            <div class="feature-card-modern">
                <div class="feature-icon" style="background: #eef2ff; color: #2563eb;">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h3 class="feature-name">Secure Authentication</h3>
                <p class="feature-desc">
                    User login and session-based authentication for secure access control.
                </p>
                <a href="#" class="feature-link">Learn More →</a>
            </div>

            <!-- Feature 2 -->
            <div class="feature-card-modern">
                <div class="feature-icon" style="background: #ecfdf5; color: #059669;">
                    <i class="bi bi-clock-history"></i>
                </div>
                <h3 class="feature-name">Real-Time Voting</h3>
                <p class="feature-desc">
                    Users can cast votes digitally with instant processing and validation.
                </p>
                <a href="#" class="feature-link">Learn More →</a>
            </div>

            <!-- Feature 3 -->
            <div class="feature-card-modern">
                <div class="feature-icon" style="background: #fef2f2; color: #dc2626;">
                    <i class="bi bi-person-badge-fill"></i>
                </div>
                <h3 class="feature-name">Candidate Management</h3>
                <p class="feature-desc">
                    Admin can add, update and manage candidate information easily.
                </p>
                <a href="#" class="feature-link">Learn More →</a>
            </div>

            <!-- Feature 4 -->
            <div class="feature-card-modern">
                <div class="feature-icon" style="background: #f3e8ff; color: #7c3aed;">
                    <i class="bi bi-bar-chart-fill"></i>
                </div>
                <h3 class="feature-name">Live Result Tracking</h3>
                <p class="feature-desc">
                    Automatic vote counting with transparent result generation.
                </p>
                <a href="#" class="feature-link">Learn More →</a>
            </div>

            <!-- Feature 5 -->
            <div class="feature-card-modern">
                <div class="feature-icon" style="background: #fff7ed; color: #ea580c;">
                    <i class="bi bi-phone-fill"></i>
                </div>
                <h3 class="feature-name">Fast & Responsive</h3>
                <p class="feature-desc">
                    Modern responsive interface compatible with all devices.
                </p>
                <a href="#" class="feature-link">Learn More →</a>
            </div>

            <!-- Feature 6 -->
            <div class="feature-card-modern">
                <div class="feature-icon" style="background: #ecfeff; color: #0891b2;">
                    <i class="bi bi-session-fill"></i>
                </div>
                <h3 class="feature-name">Session Handling</h3>
                <p class="feature-desc">
                    Proper session management for secure user activities.
                </p>
                <a href="#" class="feature-link">Learn More →</a>
            </div>

        </div>

    </div>
</section>

<style>
/* ===== FEATURES MODERN ===== */
.features-modern {
    padding: 60px 0 70px;
    background: #ffffff;
}

.features-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

/* ===== HEADER ===== */



/* ===== GRID ===== */
.features-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 28px;
}

/* ===== CARD ===== */
.feature-card-modern {
    background: #f8fafc;
    border-radius: 16px;
    padding: 30px 28px;
    transition: all 0.3s ease;
    border: 1px solid #e9edf4;
}

.feature-card-modern:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 32px rgba(0,0,0,0.06);
    border-color: #2563eb;
    background: #ffffff;
}

.feature-icon {
    width: 52px;
    height: 52px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    margin-bottom: 16px;
}

.feature-name {
    font-size: 17px;
    font-weight: 700;
    color: #0b1b33;
    margin-bottom: 8px;
}

.feature-desc {
    font-size: 14px;
    color: #6b7280;
    line-height: 1.7;
    margin-bottom: 14px;
}

.feature-link {
    color: #2563eb;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.2s;
}

.feature-link:hover {
    color: #1d4ed8;
    text-decoration: underline;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 992px) {
    .features-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .features-title {
        font-size: 28px;
    }
}

@media (max-width: 768px) {
    .features-modern {
        padding: 40px 0 50px;
    }
    
    .features-grid {
        grid-template-columns: 1fr;
        gap: 20px;
    }
    
    .features-title {
        font-size: 24px;
    }
    
    .feature-card-modern {
        padding: 24px 20px;
    }
}

@media (max-width: 480px) {
    .features-title {
        font-size: 20px;
    }
    
    .features-subtitle {
        font-size: 14px;
    }
}
</style>