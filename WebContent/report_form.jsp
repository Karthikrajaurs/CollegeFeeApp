<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
        color: #343a40;
    }

    .card {
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        border: none;
    }

    .card-header {
        background-color: #0d6efd;
        color: white;
        font-weight: 500;
        font-size: 1.2rem;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
    }

    .card-header i {
        margin-right: 8px;
    }

    .report-icon {
        font-size: 48px;
        color: #0d6efd;
        margin-bottom: 15px;
    }

    .report-title {
        font-weight: 600;
        color: #0d6efd;
        margin-bottom: 10px;
    }

    .date-input-group {
        position: relative;
    }

    .date-input-group input[type="date"] {
        padding-left: 40px;
    }

    .date-input-group i {
        position: absolute;
        top: 50%;
        left: 12px;
        transform: translateY(-50%);
        color: #6c757d;
        pointer-events: none;
    }

    .btn-primary {
        background-color: #0d6efd;
        border-color: #0d6efd;
        font-weight: 500;
    }

    .btn-outline-secondary {
        font-weight: 500;
    }

    .form-label {
        font-weight: 500;
    }

    .invalid-feedback {
        font-size: 0.875rem;
    }

    @media (max-width: 576px) {
        .report-icon {
            font-size: 36px;
        }

        .report-title {
            font-size: 1.25rem;
        }
    }
</style>

    
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-chart-pie me-2"></i>
                            <span>Generate Custom Report</span>
                        </div>
                        <a href="reports.jsp" class="btn btn-sm btn-light">
                            <i class="fas fa-arrow-left me-1"></i> Back
                        </a>
                    </div>
                    <div class="card-body text-center">
                        <% 
                            String reportType = request.getParameter("reportType");
                            String reportTitle = "";
                            String iconClass = "";
                            String description = "";
                            
                            if ("overdue".equals(reportType)) {
                                reportTitle = "Overdue Payments Report";
                                iconClass = "fas fa-exclamation-triangle";
                                description = "Generate a list of students with overdue fee payments";
                            } else if ("unpaid".equals(reportType)) {
                                reportTitle = "Unpaid Fees Report";
                                iconClass = "fas fa-clock";
                                description = "Generate a list of students with pending fee payments";
                            } else if ("collections".equals(reportType)) {
                                reportTitle = "Fee Collections Report";
                                iconClass = "fas fa-chart-line";
                                description = "Generate summary of all fee collections";
                            }
                        %>
                        
                        <div class="report-icon">
                            <i class="<%= iconClass %>"></i>
                        </div>
                        <h3 class="report-title"><%= reportTitle %></h3>
                        <p class="text-muted mb-4"><%= description %></p>
                        
                        <form action="report" method="get" class="needs-validation" novalidate>
                            <input type="hidden" name="reportType" value="<%= reportType %>">
                            
                            <% if (!"overdue".equals(reportType)) { %>
                            <div class="row mb-4">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <label for="startDate" class="form-label">Start Date</label>
                                    <div class="date-input-group">
                                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please select a valid start date
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="endDate" class="form-label">End Date</label>
                                    <div class="date-input-group">
                                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please select a valid end date
                                    </div>
                                </div>
                            </div>
                            <% } %>
                            
                            <% if ("collections".equals(reportType)) { %>
                      <!--       <div class="mb-4">
                                <label for="reportFormat" class="form-label">Report Format</label>
                                <select class="form-select" id="reportFormat" name="reportFormat">
                                    <option value="pdf" selected>PDF Document</option>
                                    <option value="excel">Excel Spreadsheet</option>
                                    <option value="csv">CSV File</option>
                                </select>
                            </div> -->
                            <% } %>
                            
                            <div class="d-grid gap-3 d-md-flex justify-content-md-center mt-4">
                                <a href="reports.jsp" class="btn btn-outline-secondary px-4">
                                    <i class="fas fa-times me-2"></i> Cancel
                                </a>
                                <button type="submit" class="btn btn-primary px-4">
                                    <i class="fas fa-file-download me-2"></i> Generate Report
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Form Validation and Date Handling -->
    <script>
        (function () {
            'use strict'
            
            // Initialize form validation
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            
            // Set default dates
            document.addEventListener('DOMContentLoaded', function() {
                const today = new Date();
                const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
                
                // Format dates as YYYY-MM-DD
                function formatDate(date) {
                    const d = new Date(date);
                    let month = '' + (d.getMonth() + 1);
                    let day = '' + d.getDate();
                    const year = d.getFullYear();
                    
                    if (month.length < 2) month = '0' + month;
                    if (day.length < 2) day = '0' + day;
                    
                    return [year, month, day].join('-');
                }
                
                const startDate = document.getElementById('startDate');
                const endDate = document.getElementById('endDate');
                
                if (startDate) startDate.value = formatDate(firstDay);
                if (endDate) endDate.value = formatDate(today);
                
                // Add date validation (end date not before start date)
                if (startDate && endDate) {
                    startDate.addEventListener('change', function() {
                        if (endDate.value && startDate.value > endDate.value) {
                            endDate.value = startDate.value;
                        }
                    });
                    
                    endDate.addEventListener('change', function() {
                        if (startDate.value && endDate.value < startDate.value) {
                            endDate.setCustomValidity('End date must be after start date');
                        } else {
                            endDate.setCustomValidity('');
                        }
                    });
                }
            });
        })();
    </script>
</body>
</html>
