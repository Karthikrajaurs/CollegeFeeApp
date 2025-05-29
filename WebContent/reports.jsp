<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports | College Fee System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #f9f9f9;
        color: #333;
        transition: background-color 0.3s, color 0.3s;
    }

    .dark-mode {
        background-color: #1e1e2f;
        color: #f0f0f0;
    }

    .container {
        max-width: 1100px;
        margin: 40px auto;
        padding: 20px;
    }

    .page-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .page-title {
        font-size: 2.2rem;
        font-weight: 600;
        margin-bottom: 5px;
        color: #2c3e50;
    }

    .page-description {
        font-size: 1rem;
        color: #777;
    }

    .report-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
    }

    .report-card {
        background-color: #ffffff;
        border-radius: 16px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        padding: 25px;
        cursor: pointer;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .report-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 25px rgba(0,0,0,0.1);
    }

    .report-icon {
        font-size: 2.5rem;
        color: #4e73df;
        margin-bottom: 15px;
    }

    .report-card h3 {
        font-size: 1.4rem;
        margin-bottom: 10px;
        color: #333;
    }

    .report-card p {
        font-size: 0.95rem;
        line-height: 1.5;
        color: #555;
    }

    .report-link {
        display: inline-block;
        margin-top: 15px;
        font-weight: 500;
        color: #4e73df;
        text-decoration: none;
        transition: color 0.2s ease;
    }

    .report-link:hover {
        color: #2c55d3;
        text-decoration: underline;
    }

    .back-link {
        display: inline-block;
        margin-top: 30px;
        font-size: 0.95rem;
        color: #333;
        text-decoration: none;
    }

    .back-link:hover {
        text-decoration: underline;
        color: #000;
    }

    .theme-toggle {
        position: fixed;
        top: 20px;
        right: 25px;
        font-size: 1.5rem;
        cursor: pointer;
        color: #888;
        z-index: 999;
        transition: color 0.3s ease;
    }

    .theme-toggle:hover {
        color: #000;
    }

    .dark-mode .report-card {
        background-color: #2c2f3f;
        color: #f0f0f0;
    }

    .dark-mode .report-link {
        color: #5ba8ff;
    }

    .dark-mode .report-link:hover {
        color: #77c4ff;
    }

    .dark-mode .page-title {
        color: #fefefe;
    }

    .dark-mode .page-description {
        color: #ccc;
    }

    .dark-mode .theme-toggle {
        color: #fefefe;
    }
</style>
    
   
</head>
<body>
    <i class="fas fa-moon theme-toggle" id="themeToggle" title="Toggle Theme"></i>

    <div class="container">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-chart-pie"></i> Generate Reports
            </h1>
            <p class="page-description">
                Select a report type below to generate detailed fee payment reports and analytics
            </p>
        </div>

        <div class="report-grid">
            <div class="report-card" onclick="location.href='reportCriteria?reportType=overdue'">
                <div class="report-icon">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h3>Overdue Payments</h3>
                <p>
                    Generate a comprehensive list of all students with overdue fee payments, 
                    including payment details and days overdue.
                </p>
                <a href="reportCriteria?reportType=overdue" class="report-link">
                    Generate Report <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="report-card" onclick="location.href='reportCriteria?reportType=unpaid'">
                <div class="report-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <h3>Pending Payments</h3>
                <p>
                    View all students with unpaid fees within a specific period, 
                    with options to filter by department or payment amount.
                </p>
                <a href="reportCriteria?reportType=unpaid" class="report-link">
                    Generate Report <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="report-card" onclick="location.href='reportCriteria?reportType=collections'">
                <div class="report-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Fee Collections</h3>
                <p>
                    Analyze total fee collections with breakdowns by department, 
                    payment method, and time period for financial reporting.
                </p>
                <a href="reportCriteria?reportType=collections" class="report-link">
                    Generate Report <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>

        <a href="index.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <script>
        const themeToggle = document.getElementById('themeToggle');
        themeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            themeToggle.classList.toggle('fa-moon');
            themeToggle.classList.toggle('fa-sun');
        });

        // Optional animation
        document.addEventListener('DOMContentLoaded', () => {
            const cards = document.querySelectorAll('.report-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 150);
            });
        });
    </script>
</body>
</html>
