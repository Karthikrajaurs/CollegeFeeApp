<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Fee Management System</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
    }

    .sidebar {
        width: 280px;
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-right: 1px solid rgba(255, 255, 255, 0.2);
        box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
        position: fixed;
        height: 100vh;
        overflow-y: auto;
        transition: all 0.3s ease;
    }

    .sidebar:hover {
        box-shadow: 4px 0 30px rgba(0, 0, 0, 0.15);
    }

    .sidebar h2 {
        padding: 30px 25px;
        font-size: 24px;
        font-weight: 700;
        color: #2d3748;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        background: linear-gradient(135deg, #667eea, #764ba2);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-align: center;
        letter-spacing: 1px;
    }

    .sidebar h2 i {
        margin-right: 10px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .sidebar ul {
        list-style: none;
        padding: 20px 0;
    }

    .sidebar ul li {
        margin: 8px 15px;
    }

    .sidebar ul li a {
        display: flex;
        align-items: center;
        padding: 15px 20px;
        color: #4a5568;
        text-decoration: none;
        border-radius: 12px;
        transition: all 0.3s ease;
        font-weight: 500;
        position: relative;
        overflow: hidden;
    }

    .sidebar ul li a::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, #667eea, #764ba2);
        transition: all 0.3s ease;
        z-index: -1;
    }

    .sidebar ul li a:hover {
        color: white;
        transform: translateX(5px);
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
    }

    .sidebar ul li a:hover::before {
        left: 0;
    }

    .sidebar ul li a:active {
        transform: translateX(5px) scale(0.98);
    }

    .sidebar ul li a i {
        margin-right: 15px;
        font-size: 18px;
        width: 20px;
        text-align: center;
        transition: all 0.3s ease;
    }

    .sidebar ul li a:hover i {
        transform: scale(1.1);
    }

    /* Main content area */
    .main-content {
        margin-left: 280px;
        flex: 1;
        padding: 40px;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
    }

    .welcome-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-bottom: 30px;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .welcome-card h1 {
        font-size: 36px;
        font-weight: 700;
        background: linear-gradient(135deg, #667eea, #764ba2);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 15px;
    }

    .welcome-card p {
        color: #718096;
        font-size: 18px;
        line-height: 1.6;
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 25px;
        margin-top: 30px;
    }

    .stat-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
        transition: all 0.3s ease;
        text-align: center;
    }

    .stat-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }

    .stat-card i {
        font-size: 48px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 15px;
    }

    .stat-card h3 {
        font-size: 24px;
        font-weight: 600;
        color: #2d3748;
        margin-bottom: 10px;
    }

    .stat-card p {
        color: #718096;
        line-height: 1.6;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .sidebar {
            width: 260px;
            transform: translateX(-100%);
        }

        .sidebar.active {
            transform: translateX(0);
        }

        .main-content {
            margin-left: 0;
            padding: 20px;
        }

        .welcome-card {
            padding: 25px;
        }

        .welcome-card h1 {
            font-size: 28px;
        }

        .stats-grid {
            grid-template-columns: 1fr;
        }
    }

    /* Scrollbar styling */
    .sidebar::-webkit-scrollbar {
        width: 6px;
    }

    .sidebar::-webkit-scrollbar-track {
        background: rgba(0, 0, 0, 0.1);
    }

    .sidebar::-webkit-scrollbar-thumb {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-radius: 3px;
    }

    .sidebar::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(135deg, #764ba2, #667eea);
    }

    /* Animation for page load */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .sidebar, .main-content {
        animation: fadeInUp 0.6s ease;
    }

    .sidebar ul li {
        animation: fadeInUp 0.6s ease;
        animation-delay: calc(0.1s * var(--i));
    }
</style>
</head>
<body>
<div class="sidebar">
    <h2><i class="fas fa-university"></i> CFMS</h2>
    <ul>
        <li style="--i: 1"><a href="#"><i class="fas fa-home"></i> Dashboard</a></li>
        <li style="--i: 2"><a href="feepaymentadd.jsp"><i class="fas fa-plus-circle"></i> Add Payment</a></li>
        <li style="--i: 3"><a href="feepaymentupdate.jsp"><i class="fas fa-edit"></i> Update Payment</a></li>
        <li style="--i: 4"><a href="feepaymentdelete.jsp"><i class="fas fa-trash-alt"></i> Delete Payment</a></li>
        <li style="--i: 5"><a href="displayPayments"><i class="fas fa-list"></i> View Payments</a></li>
        <li style="--i: 6"><a href="reports.jsp"><i class="fas fa-chart-pie"></i> Reports</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="welcome-card">
        <h1><i class="fas fa-graduation-cap"></i> Welcome to CFMS</h1>
        <p>Manage college fee payments efficiently with our comprehensive fee management system. Track payments, generate reports, and maintain financial records with ease.</p>
    </div>
    
    <div class="stats-grid">
        <div class="stat-card">
            <i class="fas fa-dollar-sign"></i>
            <h3>Total Payments</h3>
            <p>Track and manage all fee payments in one centralized location</p>
        </div>
        
        <div class="stat-card">
            <i class="fas fa-users"></i>
            <h3>Student Records</h3>
            <p>Maintain comprehensive student payment histories and profiles</p>
        </div>
        
        <div class="stat-card">
            <i class="fas fa-chart-line"></i>
            <h3>Financial Reports</h3>
            <p>Generate detailed reports for better financial insights and planning</p>
        </div>
        
        <div class="stat-card">
            <i class="fas fa-shield-alt"></i>
            <h3>Secure System</h3>
            <p>Ensure data security and maintain audit trails for all transactions</p>
        </div>
    </div>
</div>

</body>
</html>
