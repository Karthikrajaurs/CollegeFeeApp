<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fee Payment</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
   

:root {
    --primary-gradient: linear-gradient(135deg, #43cea2, #185a9d);
    --light-bg: #ffffff;
    --dark-bg: #1e1e2f;
    --light-text: #2d3748;
    --dark-text: #e2e8f0;
    --input-bg-light: rgba(255, 255, 255, 0.9);
    --input-bg-dark: rgba(45, 55, 72, 0.9);
    --border-radius: 12px;
    --transition: 0.3s ease;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--primary-gradient);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    transition: background var(--transition);
}

body.dark-mode {
    background: linear-gradient(135deg, #0f2027, #203a43);
    color: var(--dark-text);
}

.container {
    background: rgba(255, 255, 255, 0.95);
    padding: 40px 30px;
    border-radius: 20px;
    max-width: 600px;
    width: 100%;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    backdrop-filter: blur(12px);
    animation: fadeIn 0.6s ease;
}

body.dark-mode .container {
    background: rgba(30, 30, 47, 0.95);
    color: var(--dark-text);
}

h1 {
    font-size: 28px;
    text-align: center;
    margin-bottom: 25px;
    color: #333;
}

body.dark-mode h1 {
    color: #fff;
}

form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.form-group label {
    font-weight: 500;
    margin-bottom: 6px;
    display: block;
}

input, select {
    width: 100%;
    padding: 14px 16px;
    border-radius: var(--border-radius);
    border: 1px solid #ccc;
    background: var(--input-bg-light);
    font-size: 16px;
    transition: border var(--transition);
}

body.dark-mode input,
body.dark-mode select {
    background: var(--input-bg-dark);
    color: var(--dark-text);
    border: 1px solid #444;
}

input:focus, select:focus {
    outline: none;
    border-color: #43cea2;
}

button[type="submit"] {
    padding: 14px;
    background: var(--primary-gradient);
    border: none;
    color: #fff;
    font-weight: 600;
    font-size: 16px;
    border-radius: var(--border-radius);
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
}

button[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(67, 206, 162, 0.4);
}

.back-link {
    display: inline-block;
    margin-top: 20px;
    text-decoration: none;
    color: #185a9d;
    font-weight: 500;
    padding: 10px 15px;
    background: rgba(24, 90, 157, 0.1);
    border-radius: var(--border-radius);
    transition: background var(--transition);
}

body.dark-mode .back-link {
    color: #a0c4ff;
    background: rgba(255, 255, 255, 0.08);
}

.back-link:hover {
    background: rgba(24, 90, 157, 0.2);
}

.message {
    padding: 15px 20px;
    border-radius: var(--border-radius);
    margin-bottom: 20px;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 10px;
}

.message.error {
    background: #f56565;
    color: #fff;
}

.message.success {
    background: #48bb78;
    color: #fff;
}

.theme-toggle {
    position: fixed;
    top: 20px;
    right: 20px;
    width: 45px;
    height: 45px;
    border-radius: 50%;
    border: none;
    background: #fff;
    color: #333;
    font-size: 18px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    cursor: pointer;
    transition: transform 0.3s ease;
    z-index: 1000;
}

.theme-toggle:hover {
    transform: rotate(20deg) scale(1.05);
}

body.dark-mode .theme-toggle {
    background: #2d3748;
    color: #fff;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}
    
    </style>
    
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()" title="Toggle Light/Dark Mode">
        <i class="fas fa-adjust"></i>
    </button>

    <div class="container">
        <h1><i class="fas fa-edit"></i> Update Fee Payment</h1>

        <% if (request.getParameter("error") != null) { %>
            <div class="message error">
                <i class="fas fa-exclamation-circle"></i> Failed to update payment. Please try again.
            </div>
        <% } %>

        <% if (request.getParameter("success") != null) { %>
            <div class="message success">
                <i class="fas fa-check-circle"></i> Payment updated successfully!
            </div>
        <% } %>

        <form action="updatePayment" method="post">
            <div class="form-group">
                <label for="paymentId">Payment ID</label>
                <input type="number" id="paymentId" name="paymentId" required placeholder="Enter payment ID">
            </div>
            <div class="form-group">
                <label for="studentId">Student ID</label>
                <input type="number" id="studentId" name="studentId" required placeholder="Enter student ID">
            </div>
            <div class="form-group">
                <label for="studentName">Student Name</label>
                <input type="text" id="studentName" name="studentName" required placeholder="Enter student name">
            </div>
            <div class="form-group">
                <label for="paymentDate">Payment Date</label>
                <input type="date" id="paymentDate" name="paymentDate" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" id="amount" name="amount" step="0.01" required placeholder="0.00">
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select id="status" name="status" required>
                    <option value="" disabled selected>Select payment status</option>
                    <option value="Paid">Paid</option>
                    <option value="Unpaid">Unpaid</option>
                    <option value="Overdue">Overdue</option>
                </select>
            </div>
            <button type="submit"><i class="fas fa-save"></i> Update Payment</button>
        </form>

        <a class="back-link" href="index.jsp"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    <script>
        // Theme toggle logic with local storage
        function toggleTheme() {
            document.body.classList.toggle("dark-mode");
            localStorage.setItem("theme", document.body.classList.contains("dark-mode") ? "dark" : "light");
        }

        // Initialize theme on page load
        window.onload = () => {
            if (localStorage.getItem("theme") === "dark") {
                document.body.classList.add("dark-mode");
            }
        }
    </script>
</body>
</html>
