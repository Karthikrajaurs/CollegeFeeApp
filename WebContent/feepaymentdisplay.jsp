<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.FeePayment" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>View All Fee Payments</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --bg-light: #f7fafc;
        --bg-dark: #1a202c;
        --text-light: #2d3748;
        --text-dark: #e2e8f0;
        --card-light: rgba(255, 255, 255, 0.95);
        --card-dark: rgba(26, 32, 44, 0.95);
        --border-light: rgba(255, 255, 255, 0.2);
        --border-dark: rgba(255, 255, 255, 0.1);
        --shadow-light: rgba(0, 0, 0, 0.1);
        --shadow-dark: rgba(0, 0, 0, 0.3);
        --table-header-light: rgba(102, 126, 234, 0.1);
        --table-header-dark: rgba(102, 126, 234, 0.2);
        --table-row-light: rgba(255, 255, 255, 0.8);
        --table-row-dark: rgba(45, 55, 72, 0.8);
        --table-hover-light: rgba(102, 126, 234, 0.05);
        --table-hover-dark: rgba(102, 126, 234, 0.1);
    }

    body {
        font-family: 'Inter', sans-serif;
        background: var(--primary-gradient);
        min-height: 100vh;
        padding: 20px;
        transition: all 0.3s ease;
        color: var(--text-light);
    }

    body.dark-mode {
        background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
        color: var(--text-dark);
    }

    .theme-toggle {
        position: fixed;
        top: 30px;
        right: 30px;
        width: 50px;
        height: 50px;
        border: none;
        border-radius: 50%;
        background: var(--card-light);
        color: var(--text-light);
        font-size: 20px;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 10px 30px var(--shadow-light);
        backdrop-filter: blur(10px);
        z-index: 1000;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .theme-toggle:hover {
        transform: scale(1.1) rotate(180deg);
        box-shadow: 0 15px 40px var(--shadow-light);
    }

    body.dark-mode .theme-toggle {
        background: var(--card-dark);
        color: var(--text-dark);
        box-shadow: 0 10px 30px var(--shadow-dark);
    }

    body.dark-mode .theme-toggle:hover {
        box-shadow: 0 15px 40px var(--shadow-dark);
    }

    .container {
        max-width: 1400px;
        margin: 0 auto;
        background: var(--card-light);
        backdrop-filter: blur(20px);
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 25px 50px var(--shadow-light);
        border: 1px solid var(--border-light);
        animation: fadeInUp 0.6s ease;
        margin-top: 80px;
    }

    body.dark-mode .container {
        background: var(--card-dark);
        border: 1px solid var(--border-dark);
        box-shadow: 0 25px 50px var(--shadow-dark);
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 40px;
        flex-wrap: wrap;
        gap: 20px;
    }

    .header h1 {
        font-size: 36px;
        font-weight: 700;
        background: var(--primary-gradient);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .header h1 i {
        background: var(--primary-gradient);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .btn {
        padding: 12px 24px;
        background: var(--primary-gradient);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 8px;
        text-decoration: none;
        position: relative;
        overflow: hidden;
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
    }

    .btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: all 0.5s ease;
    }

    .btn:hover::before {
        left: 100%;
    }

    /* Table Styles */
    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 10px 30px var(--shadow-light);
        background: var(--table-row-light);
        backdrop-filter: blur(10px);
    }

    body.dark-mode table {
        background: var(--table-row-dark);
        box-shadow: 0 10px 30px var(--shadow-dark);
    }

    thead {
        background: var(--table-header-light);
        backdrop-filter: blur(10px);
    }

    body.dark-mode thead {
        background: var(--table-header-dark);
    }

    th {
        padding: 20px 15px;
        text-align: left;
        font-weight: 700;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--text-light);
        position: relative;
    }

    body.dark-mode th {
        color: var(--text-dark);
    }

    th::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 2px;
        background: var(--primary-gradient);
    }

    tbody tr {
        transition: all 0.3s ease;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }

    body.dark-mode tbody tr {
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }

    tbody tr:hover {
        background: var(--table-hover-light);
        transform: scale(1.01);
        box-shadow: 0 5px 15px var(--shadow-light);
    }

    body.dark-mode tbody tr:hover {
        background: var(--table-hover-dark);
        box-shadow: 0 5px 15px var(--shadow-dark);
    }

    td {
        padding: 20px 15px;
        font-size: 16px;
        color: var(--text-light);
        font-weight: 500;
    }

    body.dark-mode td {
        color: var(--text-dark);
    }

    .amount {
        font-weight: 700;
        font-size: 18px;
        color: #2d8659;
    }

    body.dark-mode .amount {
        color: #68d391;
    }

    /* Status Badges */
    .status {
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        display: inline-flex;
        align-items: center;
        gap: 6px;
    }

    .status::before {
        content: '';
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: currentColor;
    }

    .status-paid {
        background: linear-gradient(135deg, #51cf66, #40c057);
        color: white;
    }

    .status-unpaid {
        background: linear-gradient(135deg, #ffd43b, #fab005);
        color: white;
    }

    .status-overdue {
        background: linear-gradient(135deg, #ff6b6b, #ee5a5a);
        color: white;
    }

    .no-data {
        text-align: center;
        padding: 60px 20px;
        color: #a0aec0;
        font-size: 18px;
        font-style: italic;
        background: var(--table-hover-light);
    }

    body.dark-mode .no-data {
        color: #718096;
        background: var(--table-hover-dark);
    }

    /* Search and Filter Section */
    .controls {
        display: flex;
        gap: 20px;
        margin-bottom: 30px;
        flex-wrap: wrap;
        align-items: center;
    }

    .search-box {
        flex: 1;
        min-width: 250px;
        position: relative;
    }

    .search-box input {
        width: 100%;
        padding: 12px 50px 12px 20px;
        border: 2px solid transparent;
        border-radius: 12px;
        font-size: 16px;
        background: rgba(255, 255, 255, 0.9);
        color: var(--text-light);
        transition: all 0.3s ease;
        backdrop-filter: blur(10px);
    }

    body.dark-mode .search-box input {
        background: rgba(45, 55, 72, 0.9);
        color: var(--text-dark);
    }

    .search-box input:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    }

    .search-box i {
        position: absolute;
        right: 18px;
        top: 50%;
        transform: translateY(-50%);
        color: #a0aec0;
        font-size: 18px;
    }

    .filter-select {
        padding: 12px 16px;
        border: 2px solid transparent;
        border-radius: 12px;
        font-size: 16px;
        background: rgba(255, 255, 255, 0.9);
        color: var(--text-light);
        cursor: pointer;
        transition: all 0.3s ease;
        backdrop-filter: blur(10px);
    }

    body.dark-mode .filter-select {
        background: rgba(45, 55, 72, 0.9);
        color: var(--text-dark);
    }

    .filter-select:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    }

    /* Statistics Cards */
    .stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
    }

    .stat-card {
        background: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(10px);
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0 10px 30px var(--shadow-light);
        border: 1px solid var(--border-light);
        transition: all 0.3s ease;
        text-align: center;
    }

    body.dark-mode .stat-card {
        background: rgba(45, 55, 72, 0.9);
        border: 1px solid var(--border-dark);
        box-shadow: 0 10px 30px var(--shadow-dark);
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 40px var(--shadow-light);
    }

    body.dark-mode .stat-card:hover {
        box-shadow: 0 15px 40px var(--shadow-dark);
    }

    .stat-card h3 {
        font-size: 28px;
        font-weight: 700;
        background: var(--primary-gradient);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 8px;
    }

    .stat-card p {
        color: #718096;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    /* Responsive Design */
    @media (max-width: 1200px) {
        .container {
            padding: 30px 25px;
        }
        
        table {
            font-size: 14px;
        }
        
        th, td {
            padding: 15px 10px;
        }
    }

    @media (max-width: 768px) {
        .theme-toggle {
            top: 20px;
            right: 20px;
            width: 45px;
            height: 45px;
            font-size: 18px;
        }

        .container {
            margin-top: 70px;
            padding: 20px 15px;
        }

        .header {
            flex-direction: column;
            text-align: center;
            gap: 15px;
        }

        .header h1 {
            font-size: 28px;
        }

        .controls {
            flex-direction: column;
            gap: 15px;
        }

        .search-box {
            min-width: 100%;
        }

        /* Mobile table scroll */
        .table-container {
            overflow-x: auto;
            border-radius: 16px;
        }

        table {
            min-width: 600px;
        }

        th, td {
            padding: 12px 8px;
            font-size: 13px;
        }

        .amount {
            font-size: 16px;
        }

        .status {
            padding: 6px 12px;
            font-size: 11px;
        }
    }

    /* Animations */
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

    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateX(-20px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    tbody tr {
        animation: slideIn 0.6s ease;
        animation-delay: calc(0.1s * var(--row-index));
    }

    /* Loading animation */
    .loading {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 60px;
    }

    .spinner {
        width: 40px;
        height: 40px;
        border: 4px solid rgba(102, 126, 234, 0.2);
        border-top: 4px solid #667eea;
        border-radius: 50%;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        to {
            transform: rotate(360deg);
        }
    }
</style>
</head>
<body>

<button class="theme-toggle" onclick="toggleTheme()" aria-label="Toggle Dark Mode">
    <i class="fas fa-adjust"></i>
</button>

<div class="container">
    <div class="header">
        <h1><i class="fas fa-receipt"></i> Fee Payment Records</h1>
        <a href="feepaymentadd.jsp" class="btn">
            <i class="fas fa-plus"></i> Add Payment
        </a>
    </div>

    <div class="stats">
        <div class="stat-card">
            <h3 id="totalPayments">0</h3>
            <p>Total Payments</p>
        </div>
        <div class="stat-card">
            <h3 id="totalAmount">₹0</h3>
            <p>Total Amount</p>
        </div>
        <div class="stat-card">
            <h3 id="paidCount">0</h3>
            <p>Paid</p>
        </div>
        <div class="stat-card">
            <h3 id="pendingCount">0</h3>
            <p>Pending</p>
        </div>
    </div>

    <div class="controls">
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search by student name or ID..." onkeyup="searchPayments()">
            <i class="fas fa-search"></i>
        </div>
        <select class="filter-select" id="statusFilter" onchange="filterByStatus()">
            <option value="">All Status</option>
            <option value="Paid">Paid</option>
            <option value="Unpaid">Unpaid</option>
            <option value="Overdue">Overdue</option>
        </select>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th><i class="fas fa-hashtag"></i> Payment ID</th>
                    <th><i class="fas fa-id-card"></i> Student ID</th>
                    <th><i class="fas fa-user"></i> Student Name</th>
                    <th><i class="fas fa-calendar"></i> Payment Date</th>
                    <th><i class="fas fa-rupee-sign"></i> Amount</th>
                    <th><i class="fas fa-info-circle"></i> Status</th>
                </tr>
            </thead>
            <tbody id="payments-tbody">
                <%
                List<FeePayment> payments = (List<FeePayment>) request.getAttribute("payments");
                if (payments != null && !payments.isEmpty()) {
                    int rowIndex = 0;
                    for (FeePayment payment : payments) {
                        String statusClass = "";
                        String status = payment.getStatus();
                        if ("Paid".equalsIgnoreCase(status)) statusClass = "status-paid";
                        else if ("Unpaid".equalsIgnoreCase(status)) statusClass = "status-unpaid";
                        else if ("Overdue".equalsIgnoreCase(status)) statusClass = "status-overdue";
                %>
                <tr style="--row-index: <%= rowIndex++ %>">
                    <td><%= payment.getPaymentId() %></td>
                    <td><%= payment.getStudentId() %></td>
                    <td><%= payment.getStudentName() %></td>
                    <td><%= payment.getPaymentDate() %></td>
                    <td class="amount">₹<%= String.format("%.2f", payment.getAmount()) %></td>
                    <td><span class="status <%= statusClass %>"><%= status %></span></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr><td colspan="6" class="no-data"><i class="fas fa-inbox"></i><br>No fee payments found.</td></tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
function applyTheme(theme) {
    if (theme === 'dark') {
        document.body.classList.add('dark-mode');
    } else {
        document.body.classList.remove('dark-mode');
    }
}

function toggleTheme() {
    if (document.body.classList.contains('dark-mode')) {
        document.body.classList.remove('dark-mode');
        localStorage.setItem('theme', 'light');
    } else {
        document.body.classList.add('dark-mode');
        localStorage.setItem('theme', 'dark');
    }
}

function searchPayments() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toLowerCase();
    const table = document.getElementById('payments-tbody');
    const rows = table.getElementsByTagName('tr');

    for (let i = 0; i < rows.length; i++) {
        const studentId = rows[i].getElementsByTagName('td')[1];
        const studentName = rows[i].getElementsByTagName('td')[2];
        
        if (studentId && studentName) {
            const idText = studentId.textContent || studentId.innerText;
            const nameText = studentName.textContent || studentName.innerText;
            
            if (idText.toLowerCase().indexOf(filter) > -1 || 
                nameText.toLowerCase().indexOf(filter) > -1) {
                rows[i].style.display = '';
                rows[i].style.animation = 'slideIn 0.3s ease';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }
}

function filterByStatus() {
    const select = document.getElementById('statusFilter');
    const filterValue = select.value.toLowerCase();
    const table = document.getElementById('payments-tbody');
    const rows = table.getElementsByTagName('tr');

    for (let i = 0; i < rows.length; i++) {
        const statusCell = rows[i].getElementsByTagName('td')[5];
        
        if (statusCell) {
            const statusText = statusCell.textContent || statusCell.innerText;
            
            if (filterValue === '' || statusText.toLowerCase().indexOf(filterValue) > -1) {
                rows[i].style.display = '';
                rows[i].style.animation = 'slideIn 0.3s ease';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }
}

function calculateStats() {
    const rows = document.querySelectorAll('#payments-tbody tr');
    let totalPayments = 0;
    let totalAmount = 0;
    let paidCount = 0;
    let pendingCount = 0;

    rows.forEach(row => {
        const cells = row.getElementsByTagName('td');
        if (cells.length > 1) { // Skip "no data" row
            totalPayments++;
            
            // Extract amount
            const amountText = cells[4].textContent.replace('₹', '').replace(',', '');
            totalAmount += parseFloat(amountText) || 0;
            
            // Count status
            const status = cells[5].textContent.toLowerCase().trim();
            if (status.includes('paid') && !status.includes('unpaid')) {
                paidCount++;
            } else {
                pendingCount++;
            }
        }
    });

    // Update stats display
    document.getElementById('totalPayments').textContent = totalPayments;
    document.getElementById('totalAmount').textContent = '₹' + totalAmount.toLocaleString('en-IN', {minimumFractionDigits: 2});
    document.getElementById('paidCount').textContent = paidCount;
    document.getElementById('pendingCount').textContent = pendingCount;
}

document.addEventListener('DOMContentLoaded', () => {
    const savedTheme = localStorage.getItem('theme') || 'light';
    applyTheme(savedTheme);
    calculateStats();
    
    // Add smooth scrolling for mobile tables
    const tableContainer = document.querySelector('.table-container');
    if (tableContainer) {
        tableContainer.style.scrollBehavior = 'smooth';
    }
});
</script>
</body>
</html>
