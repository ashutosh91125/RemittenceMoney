<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Transfer List</title>

    <!-- CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/dataTables.bs5.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
    <style type="text/css">
   .truncate-text {
        display: inline-block;
        max-width: 150px; /* Set the maximum width for the text */
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        vertical-align: middle;
    }
   /* Table Responsiveness */
   .table-responsive {
       -webkit-overflow-scrolling: touch;
       overflow-x: auto;
       max-width: 100%;  /* Ensure it doesn't overflow */
   }

   /* Reduce table font and adjust padding on small screens */
   @media (max-width: 768px) {
       .table th, .table td {
           padding: 5px; /* Reduced padding for smaller screens */
           font-size: 12px; /* Smaller font size */
       }

       /* If needed, hide less important columns on small screens */
       #transfer-list th:nth-child(2),
       #transfer-list td:nth-child(2),
       #transfer-list th:nth-child(3),
       #transfer-list td:nth-child(3) {
           display: none;
       }
   }

   /* More compact table on mobile */
   @media (max-width: 576px) {
       .table th, .table td {
           padding: 3px; /* Further reduced padding */
           font-size: 10px; /* Even smaller font size */
       }
   }

</style>

</head>

<body>
    <!-- Header Include -->
        <jsp:include page="header.jsp"></jsp:include>

    <!-- Page Content -->
    <div class="nxl-container" style="background: aliceblue;">
        <div class="page-header">
            <c:if test="${pageContext.request.isUserInRole('STAFF_TR')}">
            <div class="page-header-right ms-auto">
                <div class="page-header-right-items">
                    <div class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
                        <a href="transfer" class="btn btn-primary">
                            <i class="feather-user-plus me-2"></i> <span>Transfer</span>
                        </a>
                    </div>
                </div>
            </div>
            </c:if>
        </div>

        <!-- Table Section -->
        <div class="nxl-content p-3">
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card stretch stretch-full">
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="transfer-list">
                                        <thead>
                                            <tr>
                                                 <th>Agent Location Id</th>
                                                 <th style="display:none;">Branch</th>
                                                 <th style="display:none;">Staff</th>
                                                 <th>Transaction Number</th>
                                                 <th>Date</th>
                                                 <th>PayIn Amount</th>
                                                 <th>PayOut Amount</th>
                                                 <th>Beneficiary Details</th>
                                                 <th>Transaction State</th>
                                                 <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody style="display:none;">
                                            <c:forEach var="transfer" items="${transferList}" varStatus="status">
                                                <tr>
                                                    <td>${transfer.branchLocationId}</td>
                                                    <td style="display:none;">${transfer.branchId}</td>
                                                    <td style="display:none;">${transfer.staffId}</td>
                                                    <td id="transactionRefNumberCell">${transfer.transactionReferenceNumber }</td>
                                                    <td>${transfer.transactionDateFormatted}</td>
                                                    <td>${transfer.payInCurrency} ${transfer.totalPayInAmount}</td>
                                                    <td>${transfer.currencies} ${transfer.payoutAmount}</td>
                                                    <td>
                                                        <div>${transfer.beneficiaryFirstName}${transfer.beneficiaryMiddleName} ${transfer.beneficiaryLastName}</div>
                                                        <div><span class="truncate-text" title="${transfer.beneficiaryBank}">${transfer.beneficiaryBank}</span></div>
                                                        <div>${transfer.beneficiaryAccountNo}</div>
                                                    </td>
                                                    <td>
                                                        <div>${transfer.transactionState} </div>
                                                        <div>(${transfer.transactionSubState})</div>
                                                    </td>
                                                    <td class="text-end">
                                                        <a href="transfer-details?transactionReferenceNumber=${transfer.transactionReferenceNumber }" title="view">
                                                            <i class="feather feather-eye"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Include -->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>

    <!-- JavaScript Files -->
    <script src="assets/vendors/js/vendors.min.js"></script>
    <script src="assets/vendors/js/dataTables.min.js"></script>
    <script src="assets/vendors/js/dataTables.bs5.min.js"></script>
    <script src="assets/js/common-init.min.js"></script>

    <!-- DataTables Initialization -->
    <script>
    
    $(document).ready(function () {	
    
    	 $('#transfer-list tbody').hide();	
        var table = $('#transfer-list').DataTable({
            "pageLength": 10,
            "ordering": true,
            "searching": true,
            "paging": true,
            "info": true,
            "language": {
                "emptyTable": "No data available",
                "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                "infoEmpty": "No entries available",
                "paginate": {
                    "previous": "Previous",
                    "next": "Next"
                }
            },
            "dom": "<'row'<'col-md-2'l><'col-md-6'B><'col-md-4'f>>tp",
            "columnDefs": [{
                "orderable": false,
                "targets": -1
            }],
            "order": [[4, "desc"]]
        });

       
        <c:if test="${pageContext.request.isUserInRole('ADMIN') || pageContext.request.isUserInRole('SUB_ADMIN') || pageContext.request.isUserInRole('AGENT')}">
        const agentDropdowns = `
            <select id="transactionBranchList" class="form-control" style="width: 200px; height: 43px;"></select>
            &nbsp;&nbsp;
            <select id="transactionStaffList" class="form-control" style="width: 200px; height: 43px;"></select>&nbsp;&nbsp;
        `;
        $('.col-md-6').css({ display: 'flex'}).prepend(agentDropdowns);
        $.ajax({
            url: '/api/v1/branch/branches',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionBranchList');
                    dropdown.empty();
                    dropdown.append('<option value="">Filter by Branch</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.id + '">' + item.branchName + '</option>');
                    });
                } else {
                    alert('Failed to load branches. Response format is incorrect.');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching branches:', error);
                alert('Error fetching branch list.');
            }
        });
//         $('#transactionBranchList').on('change', function () {
//             var branchValue = $(this).val();
//             table.column(1).search(branchValue ? branchValue : '').draw();
//             $('#transfer-list tbody').show();
//         });
 $('#transactionBranchList').on('change', function () {
        var branchValue = $(this).val();
        if (!branchValue) {
            $('#transfer-list tbody').hide(); // Hide table body if value is empty
        } else {
            table.column(1).search(branchValue).draw();
            $('#transfer-list tbody').show(); // Show table body when a value is selected
        }
    });

        $.ajax({
            url: '/api/v1/staff/staff',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionStaffList');
                    dropdown.empty();
                    dropdown.append('<option value="">Filter by Staff</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.id + '">' + item.firstName + '</option>');
                    });
                } else {
                    alert('Failed to load staff. Response format is incorrect.');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching staff:', error);
                alert('Error fetching staff list.');
            }
        });
      
//         $('#transactionStaffList').on('change', function () {
//             var staffValue = $(this).val();
//             table.column(2).search(staffValue ? staffValue : '').draw();
//             $('#transfer-list tbody').show();
//         });

 $('#transactionStaffList').on('change', function () {
        var staffValue = $(this).val();
        if (!staffValue) {
            $('#transfer-list tbody').hide(); // Hide table body if value is empty
        } else {
            table.column(1).search(staffValue).draw();
            $('#transfer-list tbody').show(); // Show table body when a value is selected
        }
    });

        </c:if>
        <c:if test="${pageContext.request.isUserInRole('ADMIN') || pageContext.request.isUserInRole('SUB_ADMIN')}">
        const adminDropdown = `
            <select id="transactionAgentList" class="form-control" style="width: 200px; height: 43px;"></select>
            &nbsp;&nbsp;
        `;
        $('.col-md-6').css({ display: 'flex', justifyContent: 'space-between' }).prepend(adminDropdown);


        $.ajax({
            url: '/api/v1/agent/agents',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionAgentList');
                    dropdown.empty();
                    dropdown.append('<option value="">Filter by Agent</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.branchLocationId + '">' + item.agentName + '</option>');
                    });
                } else {
                    alert('Failed to load agents. Response format is incorrect.');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching agents:', error);
                alert('Error fetching agent list.');
            }
        });


//         $('#transactionAgentList').on('change', function () {
//             var agentValue = $(this).val();
//             table.column(0).search(agentValue ? agentValue : '').draw();
//             $('#transfer-list tbody').show();
//         });
 $('#transactionAgentList').on('change', function () {
        var agentValue = $(this).val();
        if (!agentValue) {
            $('#transfer-list tbody').hide(); // Hide table body if value is empty
        } else {
            table.column(1).search(agentValue).draw();
            $('#transfer-list tbody').show(); // Show table body when a value is selected
        }
    });
        </c:if>
 /*        <c:if test="${pageContext.request.isUserInRole('ADMIN') || pageContext.request.isUserInRole('SUB_ADMIN')} || pageContext.request.isUserInRole('AGENT')}">
        const dropdowns1 = `<select id="transactionBranchList" class="form-control" style="width: 200px; height: 43px;"></select>
            &nbsp;&nbsp;
            <select id="transactionStaffList" class="form-control" style="width: 200px; height: 43px;"></select>
        `;
         $('.col-md-6').css({ display: 'flex', justifyContent: 'space-between' }).prepend(dropdowns1);

        $.ajax({
            url: '/api/v1/branch/branches',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionBranchList');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Branch</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.id + '">' + item.branchName + '</option>');
                    });
                } else {
                    alert('Failed to load branches. Response format is incorrect.');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching branches:', error);
                alert('Error fetching branch list.');
            }
        });
        $('#transactionBranchList').on('change', function () {
            var branchValue = $(this).val();
            table.column(1).search(branchValue ? branchValue : '').draw();
        });


        $.ajax({
            url: '/api/v1/staff/staff',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionStaffList');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Staff</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.id + '">' + item.firstName + '</option>');
                    });
                } else {
                    alert('Failed to load staff. Response format is incorrect.');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching staff:', error);
                alert('Error fetching staff list.');
            }
        });
        
        $('#transactionStaffList').on('change', function () {
            var staffValue = $(this).val();
            table.column(2).search(staffValue ? staffValue : '').draw();
        });
        </c:if> */ 
        $('.dataTables_filter input').on('input', function () {
            var searchValue = $(this).val().trim();
            table.search(searchValue).draw();
            
            if (searchValue === "") {
                $('#transfer-list tbody').hide(); // Hide table body if search is empty
            } else {
                $('#transfer-list tbody').show(); // Show table body when searching
            }
        });

        $('#transfer-list').on('click', '.transactionLogo', function () {
            var transactionRefNumber = $(this).closest('tr').find('#transactionRefNumberCell').text().trim();
            if (!transactionRefNumber) {
                alert('Transaction reference number is missing!');
                return;
            }

            $.ajax({
                url: '/api/v1/raas/enquire-transaction',
                type: 'GET',
                data: { transaction_ref_number: transactionRefNumber },
                success: function (response) {
                	console.log(response);
                    if (response.status === 200) {
                        console.log('Transaction enquiry successful');
                    } else {
                        alert(response.error || 'Enquiry failed!');
                    }
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert('Error: ' + error);
                }
            });
        });
        $('#transactionAgentList, .dataTables_filter input').on('change input', function () {
            table.draw();
        });
    });


    </script>
</body>
</html>
