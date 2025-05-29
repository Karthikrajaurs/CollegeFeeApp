<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Fee Payment</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --bg-light: #ffffff;
        --bg-dark: #1a202c;
        --text-light: #2d3748;
        --text-dark: #e2e8f0;
        --card-light: rgba(255, 255, 255, 0.95);
        --card-dark: rgba(26, 32, 44, 0.95);
        --border-light: rgba(255, 255, 255, 0.2);
        --border-dark: rgba(255, 255, 255, 0.1);
        --input-light: rgba(255, 255, 255, 0.9);
        --input-dark: rgba(45, 55, 72, 0.9);
        --shadow-light: rgba(0, 0, 0, 0.1);
        --shadow-dark: rgba(0, 0, 0, 0.3);
    }

    body {
        font-family: 'Inter', sans-serif;
        background: var(--primary-gradient);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        transition: all 0.3s ease;
        position: relative;
    }

    body.dark-mode {
        background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
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
        transform: scale(1.1) rotate(15deg);
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
        width: 100%;
        max-width: 600px;
        background: var(--card-light);
        backdrop-filter: blur(20px);
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 25px 50px var(--shadow-light);
        border: 1px solid var(--border-light);
        animation: fadeInUp 0.6s ease;
    }

    body.dark-mode .container {
        background: var(--card-dark);
        border: 1px solid var(--border-dark);
        box-shadow: 0 25px 50px var(--shadow-dark);
    }

    h1 {
        text-align: center;
        font-size: 32px;
        font-weight: 700;
        background: var(--primary-gradient);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 40px;
        position: relative;
    }

    h1::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 4px;
        background: var(--primary-gradient);
        border-radius: 2px;
    }

    .error, .success {
        padding: 15px 20px;
        border-radius: 12px;
        margin-bottom: 25px;
        font-weight: 500;
        animation: slideDown 0.5s ease;
    }

    .error {
        background: linear-gradient(135deg, #ff6b6b, #ee5a5a);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .success {
        background: linear-gradient(135deg, #51cf66, #40c057);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .form-group {
        margin-bottom: 25px;
        animation: fadeInUp 0.6s ease;
        animation-delay: calc(0.1s * var(--i));
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: var(--text-light);
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    body.dark-mode label {
        color: var(--text-dark);
    }

    input, select {
        width: 100%;
        padding: 16px 20px;
        border: 2px solid transparent;
        border-radius: 12px;
        font-size: 16px;
        background: var(--input-light);
        color: var(--text-light);
        transition: all 0.3s ease;
        backdrop-filter: blur(10px);
        font-family: 'Inter', sans-serif;
    }

    body.dark-mode input,
    body.dark-mode select {
        background: var(--input-dark);
        color: var(--text-dark);
        border-color: transparent;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        transform: translateY(-2px);
    }

    input::placeholder {
        color: #a0aec0;
        font-weight: 400;
    }

    body.dark-mode input::placeholder {
        color: #718096;
    }

    select {
        cursor: pointer;
    }

    select option {
        background: var(--bg-light);
        color: var(--text-light);
        padding: 10px;
    }

    body.dark-mode select option {
        background: var(--bg-dark);
        color: var(--text-dark);
    }

    button[type="submit"] {
        width: 100%;
        padding: 18px;
        background: var(--primary-gradient);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 1px;
        margin-top: 20px;
        position: relative;
        overflow: hidden;
    }

    button[type="submit"]:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
    }

    button[type="submit"]:active {
        transform: translateY(-1px);
    }

    button[type="submit"]::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: all 0.5s ease;
    }

    button[type="submit"]:hover::before {
        left: 100%;
    }

    .back-link {
        display: inline-flex;
        align-items: center;
        color: #667eea;
        text-decoration: none;
        font-weight: 500;
        margin-top: 25px;
        padding: 12px 20px;
        border-radius: 10px;
        background: rgba(102, 126, 234, 0.1);
        transition: all 0.3s ease;
    }

    .back-link:hover {
        background: rgba(102, 126, 234, 0.2);
        transform: translateX(-5px);
    }

    body.dark-mode .back-link {
        color: #a78bfa;
        background: rgba(167, 139, 250, 0.1);
    }

    body.dark-mode .back-link:hover {
        background: rgba(167, 139, 250, 0.2);
    }

    /* Form validation styles */
    input:invalid {
        border-color: #fc8181;
    }

    input:valid {
        border-color: #68d391;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .container {
            margin: 10px;
            padding: 30px 25px;
        }

        .theme-toggle {
            top: 20px;
            right: 20px;
            width: 45px;
            height: 45px;
            font-size: 18px;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 30px;
        }

        input, select {
            padding: 14px 16px;
            font-size: 15px;
        }

        button[type="submit"] {
            padding: 16px;
            font-size: 15px;
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

    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Loading animation for form submission */
    .loading {
        position: relative;
        pointer-events: none;
    }

    .loading::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 20px;
        height: 20px;
        border: 2px solid transparent;
        border-top: 2px solid white;
        border-radius: 50%;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        to {
            transform: translate(-50%, -50%) rotate(360deg);
        }
    }

    /* Custom scrollbar */
    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: rgba(0, 0, 0, 0.1);
    }

    ::-webkit-scrollbar-thumb {
        background: var(--primary-gradient);
        border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(135deg, #764ba2, #667eea);
    }
</style>
</head>
<body>
<button class="theme-toggle" onclick="toggleTheme()">
    <i class="fas fa-moon"></i>
</button>

<div class="container">
    <h1><i class="fas fa-plus-circle"></i> Add Fee Payment</h1>

    <% if (request.getParameter("error") != null) { %>
    <div class="error">
        <i class="fas fa-exclamation-triangle"></i> Failed to add payment. Please try again.
    </div>
    <% } %>

    <% if (request.getParameter("success") != null) { %>
    <div class="success">
        <i class="fas fa-check-circle"></i> Payment added successfully!
    </div>
    <% } %>

    <form action="addPayment" method="post" id="paymentForm">
        <div class="form-group" style="--i: 1">
            <label for="studentId"><i class="fas fa-id-card"></i> Student ID</label>
            <input type="number" id="studentId" name="studentId" required placeholder="Enter student ID" min="1">
        </div>

        <div class="form-group" style="--i: 2">
            <label for="studentName"><i class="fas fa-user"></i> Student Name</label>
            <input type="text" id="studentName" name="studentName" required placeholder="Enter student name" pattern="[A-Za-z\s]+" title="Please enter a valid name">
        </div>

        <div class="form-group" style="--i: 3">
            <label for="paymentDate"><i class="fas fa-calendar-alt"></i> Payment Date</label>
            <input type="date" id="paymentDate" name="paymentDate" required>
        </div>

        <div class="form-group" style="--i: 4">
            <label for="amount"><i class="fas fa-rupee-sign"></i> Amount (₹)</label>
            <input type="number" id="amount" name="amount" step="0.01" required placeholder="0.00" min="0.01">
        </div>

        <div class="form-group" style="--i: 5">
            <label for="status"><i class="fas fa-info-circle"></i> Payment Status</label>
            <select id="status" name="status" required>
                <option value="" disabled selected>Select status</option>
                <option value="Paid">✅ Paid</option>
                <option value="Unpaid">⏳ Unpaid</option>
                <option value="Overdue">❌ Overdue</option>
            </select>
        </div>

        <button type="submit" onclick="handleSubmit(this)">
            <i class="fas fa-save"></i> Add Payment Record
        </button>
    </form>

    <a href="index.jsp" class="back-link">
        <i class="fas fa-arrow-left"></i> Return to Dashboard
    </a>
</div>

<script>
function toggleTheme() {
    const isDark = document.body.classList.toggle('dark-mode');
    const icon = document.querySelector('.theme-toggle i');
    
    if (isDark) {
        icon.className = 'fas fa-sun';
        localStorage.setItem('theme', 'dark-mode');
    } else {
        icon.className = 'fas fa-moon';
        localStorage.setItem('theme', 'light-mode');
    }
}

function handleSubmit(button) {
    button.classList.add('loading');
    button.innerHTML = '<i class="fas fa-spinner"></i> Processing...';
    
    setTimeout(() => {
        button.classList.remove('loading');
        button.innerHTML = '<i class="fas fa-save"></i> Add Payment Record';
    }, 2000);
}

// Set today's date as default
document.getElementById('paymentDate').valueAsDate = new Date();

// Load saved theme
window.onload = function() {
    const savedTheme = localStorage.getItem('theme');
    const icon = document.querySelector('.theme-toggle i');
    
    if (savedTheme === 'dark-mode') {
        document.body.classList.add('dark-mode');
        icon.className = 'fas fa-sun';
    }
    
    // Form validation enhancement
    const form = document.getElementById('paymentForm');
    const inputs = form.querySelectorAll('input, select');
    
    inputs.forEach(input => {
        input.addEventListener('blur', function() {
            if (this.checkValidity()) {
                this.style.borderColor = '#68d391';
            } else {
                this.style.borderColor = '#fc8181';
            }
        });
        
        input.addEventListener('input', function() {
            if (this.checkValidity()) {
                this.style.borderColor = '#68d391';
            }
        });
    });
};

// Real-time form validation
document.getElementById('studentName').addEventListener('input', function(e) {
    e.target.value = e.target.value.replace(/[^A-Za-z\s]/g, '');
});

document.getElementById('amount').addEventListener('input', function(e) {
    if (e.target.value < 0) {
        e.target.value = 0;
    }
});
</script>
</body>
</html>
