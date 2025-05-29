<%@ page import="java.util.List, com.model.FeePayment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results | College Fee Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.bootstrap5.min.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 0;
    }

    .sidebar {
        width: 240px;
        background-color: #1e2a38;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        padding: 20px 0;
        color: #fff;
    }

    .sidebar .sidebar-brand {
        display: flex;
        align-items: center;
        padding: 15px 20px;
        font-size: 20px;
        font-weight: 600;
        color: #fff;
        text-decoration: none;
    }

    .sidebar .nav {
        list-style: none;
        padding-left: 0;
        margin-top: 30px;
    }

    .sidebar .nav-link {
        display: flex;
        align-items: center;
        padding: 12px 20px;
        color: #ccc;
        text-decoration: none;
        transition: all 0.2s ease-in-out;
    }

    .sidebar .nav-link:hover,
    .sidebar .nav-link.active {
        background-color: #324050;
        color: #fff;
    }

    .sidebar .nav-link i {
        margin-right: 10px;
    }

    .main-content {
        margin-left: 240px;
        padding: 30px;
    }

    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    .page-title {
        font-size: 24px;
        font-weight: 600;
    }

    .page-description {
        font-size: 14px;
        color: #666;
    }

    .btn-group .btn {
        margin-right: 10px;
    }

    .card {
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 0 8px rgba(0, 0, 0, 0.06);
        padding: 20px;
    }

    .report-summary {
        margin-bottom: 30px;
    }

    .total-amount {
        font-size: 32px;
        font-weight: 700;
        color: #28a745;
    }

    .report-period {
        font-size: 14px;
        color: #555;
    }

    .badge {
        padding: 6px 12px;
        border-radius: 12px;
        font-size: 13px;
    }

    .badge-paid {
        background-color: #28a745;
        color: #fff;
    }

    .badge-unpaid {
        background-color: #ffc107;
        color: #000;
    }

    .badge-overdue {
        background-color: #dc3545;
        color: #fff;
    }

    table.dataTable thead th {
        background-color: #324050;
        color: white;
        font-weight: 500;
        text-align: center;
    }

    table.dataTable tbody td {
        vertical-align: middle;
        text-align: center;
    }

    .alert-info {
        background-color: #e9f7fe;
        color: #31708f;
        padding: 20px;
        border-radius: 5px;
        margin-top: 20px;
    }

    @media print {
        .sidebar, .btn-group, .page-header {
            display: none !important;
        }

        .main-content {
            margin: 0;
        }
    }
</style>
    
    
</head>
<body>
    <div class="sidebar">
        <a href="index.jsp" class="sidebar-brand">
            <i class="fas fa-university"></i>
            <span>College Fees</span>
        </a>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="feepaymentadd.jsp">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add Payment</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="feepaymentupdate.jsp">
                    <i class="fas fa-edit"></i>
                    <span>Update Payment</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="feepaymentdelete.jsp">
                    <i class="fas fa-trash-alt"></i>
                    <span>Delete Payment</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="displayPayments">
                    <i class="fas fa-list"></i>
                    <span>View Payments</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="reports.jsp">
                    <i class="fas fa-chart-bar"></i>
                    <span>Reports</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">
                    <i class="fas fa-file-alt"></i> Report Results
                </h1>
                <p class="page-description"><%= request.getAttribute("reportTitle") %></p>
            </div>
            <div class="btn-group">
                <button class="btn btn-outline-secondary" onclick="window.print()">
                    <i class="fas fa-print"></i> Print
                </button>
                <a href="reports.jsp" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
                <button class="btn btn-primary" id="exportPdf">
                    <i class="fas fa-file-pdf"></i> PDF
                </button>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <% if ("collections".equals(request.getAttribute("reportType"))) { %>
                    <div class="report-summary">
                        <h4>Total Collections Summary</h4>
                        <div class="total-amount">
                            ₹<%= String.format("%.2f", request.getAttribute("totalCollections")) %>
                        </div>
                        <p class="report-period">
                            <i class="fas fa-calendar-alt"></i> 
                            <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %>
                        </p>
                        <div class="mt-3">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="p-3 bg-light rounded">
                                        <h6>Total Payments</h6>
                                        <h4><%= request.getAttribute("totalPayments") %></h4>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="p-3 bg-light rounded">
                                        <h6>Paid Students</h6>
                                        <h4><%= request.getAttribute("paidStudents") %></h4>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="p-3 bg-light rounded">
                                        <h6>Average Payment</h6>
                                        <h4>₹<%= String.format("%.2f", request.getAttribute("averagePayment")) %></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } else { 
                    List<FeePayment> reportData = (List<FeePayment>) request.getAttribute("reportData");
                    if (reportData != null && !reportData.isEmpty()) { 
                %>
                    <div class="table-responsive">
                        <table id="reportTable" class="table table-striped table-hover" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Payment ID</th>
                                    <th>Student ID</th>
                                    <th>Student Name</th>
                                    <th>Payment Date</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (FeePayment payment : reportData) { 
                                    String badgeClass = "";
                                    if ("Paid".equals(payment.getStatus())) {
                                        badgeClass = "badge-paid";
                                    } else if ("Unpaid".equals(payment.getStatus())) {
                                        badgeClass = "badge-unpaid";
                                    } else if ("Overdue".equals(payment.getStatus())) {
                                        badgeClass = "badge-overdue";
                                    }
                                %>
                                    <tr>
                                        <td><%= payment.getPaymentId() %></td>
                                        <td><%= payment.getStudentId() %></td>
                                        <td><%= payment.getStudentName() %></td>
                                        <td><%= payment.getPaymentDate() %></td>
                                        <td>₹<%= String.format("%.2f", payment.getAmount()) %></td>
                                        <td><span class="badge <%= badgeClass %>"><%= payment.getStatus() %></span></td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <a href="feepaymentupdate.jsp?id=<%= payment.getPaymentId() %>" class="btn btn-sm btn-outline-primary" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="feepaymentdelete.jsp?id=<%= payment.getPaymentId() %>" class="btn btn-sm btn-outline-danger" title="Delete">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                            <% if ("overdue".equals(request.getAttribute("reportType")) || "unpaid".equals(request.getAttribute("reportType"))) { %>
                            <tfoot>
                         <!--        <tr>
                                    <th colspan="4" class="text-end">Total Outstanding:</th>
                                    <th>₹<%= String.format("%.2f", request.getAttribute("totalOutstanding")) %></th>
                                    <th colspan="2"></th>
                                </tr> -->
                            </tfoot>
                            <% } %>
                        </table>
                    </div>
                <% } else { %>
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle"></i> No records found matching your criteria.
                    </div>
                <% } 
                   } %>
                
                <div class="mt-4 text-muted text-center">
                    <small>
                        <i class="fas fa-clock"></i> Report generated on: <%= new java.util.Date() %> | 
                        <i class="fas fa-user"></i> Generated by: <%= request.getRemoteUser() != null ? request.getRemoteUser() : "System" %>
                    </small>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
    <script>
        $(document).ready(function() {
            var table = $('#reportTable').DataTable({
                responsive: true,
                dom: '<"top"Bf>rt<"bottom"lip><"clear">',
                buttons: [
                    {
                        extend: 'copy',
                        className: 'btn btn-sm btn-outline-secondary',
                        text: '<i class="fas fa-copy"></i> Copy'
                    },
                    {
                        extend: 'excel',
                        className: 'btn btn-sm btn-outline-success',
                        text: '<i class="fas fa-file-excel"></i> Excel',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'csv',
                        className: 'btn btn-sm btn-outline-primary',
                        text: '<i class="fas fa-file-csv"></i> CSV',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'pdf',
                        className: 'btn btn-sm btn-outline-danger',
                        text: '<i class="fas fa-file-pdf"></i> PDF',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        },
                        customize: function(doc) {
                            doc.content[1].table.widths = 
                                Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                            doc.styles.tableHeader.alignment = 'center';
                        }
                    },
                    {
                        extend: 'print',
                        className: 'btn btn-sm btn-outline-info',
                        text: '<i class="fas fa-print"></i> Print',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    }
                ],
                order: [[0, 'desc']],
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records...",
                    lengthMenu: "Show _MENU_ entries",
                    info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    infoEmpty: "Showing 0 to 0 of 0 entries",
                    infoFiltered: "(filtered from _MAX_ total entries)",
                    paginate: {
                        first: "First",
                        last: "Last",
                        next: "Next",
                        previous: "Previous"
                    }
                }
            });
            
            // Custom PDF export button
            $('#exportPdf').click(function() {
                table.button('.buttons-pdf').trigger();
            });
        });
    </script>
</body>
</html>
