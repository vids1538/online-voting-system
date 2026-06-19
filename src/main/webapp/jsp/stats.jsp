<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ===== STATS SECTION ===== -->
<section class="stats-modern">
    <div class="stats-container">
        <div class="stat-item">
            <div class="stat-number">2,450+</div>
            <div class="stat-label">Registered Voters</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">12</div>
            <div class="stat-label">Total Candidates</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">1,876</div>
            <div class="stat-label">Votes Cast</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">99.9%</div>
            <div class="stat-label">Uptime</div>
        </div>
    </div>
</section>

<style>
/* ===== STATS SECTION ===== */
.stats-modern {
    padding: 40px 0;
    background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
}

.stats-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    text-align: center;
}

.stat-item .stat-number {
    font-size: 32px;
    font-weight: 800;
    color: #ffffff;
    display: block;
}

.stat-item .stat-label {
    font-size: 14px;
    color: #94a3b8;
    font-weight: 500;
}

@media (max-width: 768px) {
    .stats-container {
        grid-template-columns: repeat(2, 1fr);
        gap: 16px;
    }
    
    .stat-item .stat-number {
        font-size: 24px;
    }
}

@media (max-width: 480px) {
    .stats-container {
        grid-template-columns: 1fr 1fr;
        gap: 12px;
    }
    
    .stat-item .stat-number {
        font-size: 20px;
    }
}
</style>