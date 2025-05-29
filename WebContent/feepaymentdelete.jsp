<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Fee Payment</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
   

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

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    background: var(--primary-gradient);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    min-height: 100vh;
    transition: background 0.3s ease;
}

body.dark-mode {
    background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
}

.container {
    background: var(--card-light);
    padding: 40px;
    border-radius: 24px;
    max-width: 600px;
    width: 100%;
    backdrop-filter: blur(20px);
    box-shadow: 0 25px 50px var(--shadow-light);
    border: 1px solid var(--border-light);
    animation: fadeInUp 0.6s ease;
}

body.dark-mode .container {
    background: var(--card-dark);
    border-color: var(--border-dark);
    box-shadow: 0 25px 50px var(--shadow-dark);
}

h1 {
    font-size: 32px;
    font-weight: 700;
    text-align: center;
    margin-bottom: 40px;
    background: var(--primary-gradient);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
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

.form-group {
    margin-bottom: 25px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    font-size: 14px;
    letter-spacing: 0.5px;
    color: var(--text-light);
    text-transform: uppercase;
}

body.dark-mode label {
    color: var(--text-dark);
}

input {
    width: 100%;
    padding: 16px 20px;
    font-size: 16px;
    border: 2px solid transparent;
    border-radius: 12px;
    background: var(--input-light);
    color: var(--text-light);
    transition: 0.3s;
    font-family: 'Inter', sans-serif;
}

body.dark-mode input {
    background: var(--input-dark);
    color: var(--text-dark);
}

input:focus {
    outline: none;
    border-color: #667eea;
    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    transform: translateY(-2px);
}

input::placeholder {
    color: #a0aec0;
}

body.dark-mode input::placeholder {
    color: #718096;
}

button[type="button"],
button.confirm, button.cancel {
    padding: 16px;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    width: 100%;
    transition: 0.3s;
    text-transform: uppercase;
}

.btn-delete {
    background: var(--primary-gradient);
    color: white;
}

.btn-delete:hover {
    box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
    transform: translateY(-3px);
}

.back-link {
    display: inline-block;
    margin-top: 25px;
    color: #667eea;
    background: rgba(102, 126, 234, 0.1);
    padding: 12px 20px;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 500;
    transition: 0.3s;
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

/* Error/Success Alerts */
.error, .success {
    padding: 15px 20px;
    border-radius: 12px;
    margin-bottom: 25px;
    font-weight: 500;
    animation: slideDown 0.5s ease;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.error {
    background: linear-gradient(135deg, #ff6b6b, #ee5a5a);
    color: white;
}

.success {
    background: linear-gradient(135deg, #51cf66, #40c057);
    color: white;
}

/* Modal */
.modal {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.6);
    justify-content: center;
    align-items: center;
    z-index: 2000;
}

.modal-content {
    background: white;
    padding: 30px;
    border-radius: 12px;
    max-width: 400px;
    width: 90%;
    text-align: center;
}

.modal-buttons {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    gap: 15px;
}

button.confirm {
    background-color: #e53e3e;
    color: white;
}

button.cancel {
    background-color: #718096;
    color: white;
}

/* Theme Toggle Button */
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
    box-shadow: 0 10px 30px var(--shadow-light);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    backdrop-filter: blur(10px);
    transition: all 0.3s ease;
}

.theme-toggle:hover {
    transform: scale(1.1) rotate(15deg);
}

body.dark-mode .theme-toggle {
    background: var(--card-dark);
    color: var(--text-dark);
    box-shadow: 0 10px 30px var(--shadow-dark);
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        padding: 30px 25px;
    }

    h1 {
        font-size: 28px;
    }

    button {
        font-size: 15px;
    }
}

/* Animations */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes slideDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

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
    
    </style>
    
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()">
        <i class="fas fa-adjust"></i>
    </button>

    <div class="container">
        <h1><i class="fas fa-trash-alt"></i> Delete Fee Payment</h1>

        <% if (request.getParameter("error") != null) { %>
            <div class="error">Failed to delete payment. Please try again.</div>
        <% } %>

        <form id="deleteForm">
            <div class="form-group">
                <label for="paymentId">Payment ID</label>
                <input type="number" id="paymentId" name="paymentId" required placeholder="Enter payment ID">
            </div>
            <button type="button" class="btn-delete" onclick="openModal()">Delete Payment Record</button>
        </form>

        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Return to Dashboard</a>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <p>Are you sure you want to delete this payment record? This action cannot be undone.</p>
            <div class="modal-buttons">
                <button class="confirm" onclick="submitForm()">Yes, Delete</button>
                <button class="cancel" onclick="closeModal()">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        const form = document.getElementById('deleteForm');
        const modal = document.getElementById('confirmModal');

        function toggleTheme() {
            document.body.classList.toggle('dark-mode');
            localStorage.setItem("theme", document.body.classList.contains("dark-mode") ? "dark" : "light");
        }

        function openModal() {
            modal.style.display = "flex";
        }

        function closeModal() {
            modal.style.display = "none";
        }

        function submitForm() {
            form.setAttribute("method", "get");
            form.setAttribute("action", "deletePayment");
            form.submit();
        }

        window.onload = () => {
            // Apply saved theme on load
            if (localStorage.getItem("theme") === "dark") {
                document.body.classList.add("dark-mode");
            }

            // Auto-focus the payment ID input
            document.getElementById("paymentId").focus();
        }
    </script>
</body>
</html>
