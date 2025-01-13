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
                                    <!-- Data Table -->
                                    <table class="table table-hover" id="transfer-list">
                                        <thead>
                                            <tr>
                                                 <th>Agent</th>
                                                <th>Transaction Number</th>
                                                <th>Date</th>
                                                <th>PayIn Amount</th>
                                                <th>PayOut Amount</th>
                                                <th>Beneficiary Details</th>
                                                <th>Transaction State</th>
                                                <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="transfer" items="${transferList}" varStatus="status">
                                                <tr>
                                                    <td>${transfer.agentId}</td>
                                                    <td id="transactionRefNumberCell">${transfer.transactionReferenceNumber }</td>
                                                    <td>${transfer.transactionDateFormatted}</td>
                                                    <td>${transfer.payInCurrency} ${transfer.totalPayInAmount}</td>
                                                    <td>${transfer.currencies} ${transfer.payoutAmount}</td>
                                                    <td>
                                                    <div>${transfer.beneficiaryFirstName}${transfer.beneficiaryMiddleName} ${transfer.beneficiaryLastName}</div>
                                                    <div><span class="truncate-text" title="${transfer.beneficiaryBank}">${transfer.beneficiaryBank} </span></div>
                                                    <div>${transfer.beneficiaryAccountNo}</div>
                                                    </td>
                                                    <td>
                                                    <div>${transfer.transactionState} </div>
                                                    <div>(${transfer.transactionSubState})</div></td>
                                                    <td class="text-end">
                                                        <img class="transactionLogo" title="Check Status"
                                                             src="assets/images/transferList/refreshState.svg"
                                                             class="img-fluid" style="width: 24px; cursor: pointer;"
                                                             alt="Check State" />
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
        // Initialize DataTable with custom DOM for filter and dropdown
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
            }]
        });

        <c:if test="${pageContext.request.isUserInRole('ADMIN') || pageContext.request.isUserInRole('SUB_ADMIN')}">
        var dropdownHtml = '<select id="transactionAgentList" class="form-control col-md-1" style="width: 200px; height: 43px;"></select></div>';
        var dropdownHtml1 = '&nbsp;&nbsp;<select id="transactionAgentList1" class="form-control col-md-1" style="width: 200px; height: 43px;"></select>&nbsp;&nbsp;';
        var dropdownHtml2 = '<select id="transactionAgentList2" class="form-control col-md-1" style="width: 200px; height: 43px;"></select>';
        $('.col-md-6').css({ 'display': 'flex', 'justify-content': 'flex-end' }).prepend(dropdownHtml);
        $('.col-md-6').css({ 'display': 'flex', 'justify-content': 'flex-center' }).prepend(dropdownHtml1);
        $('.col-md-6').css({ 'display': 'flex', 'justify-content': 'flex-start' }).prepend(dropdownHtml2);

        $.ajax({
            url: '/api/v1/agent/agents',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionAgentList');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Agent</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.agentId + '">' + item.agentName + '</option>');
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

        $('#transactionAgentList').on('change', function () {
            var dropdownValue = $(this).val();

            if (dropdownValue) {
                table.column(0).search(dropdownValue).draw();
            } else {
                table.column(0).search('').draw();
            }
        });
        $.ajax({
            url: '/api/v1/branch/branches',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionAgentList1');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Branch</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.id + '">' + item.branchName + '</option>');
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

        $('#transactionAgentList').on('change', function () {
            var dropdownValue = $(this).val();

            if (dropdownValue) {
                table.column(0).search(dropdownValue).draw();
            } else {
                table.column(0).search('').draw();
            }
        });
        $.ajax({
            url: '/api/v1/staff/staff',
            type: 'GET',
            success: function (response) {
                if (Array.isArray(response)) {
                    var dropdown = $('#transactionAgentList2');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Staff</option>');
                    $.each(response, function (index, item) {
                        dropdown.append('<option value="' + item.id + '">' + item.firstName + '</option>');
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

        $('#transactionAgentList').on('change', function () {
            var dropdownValue = $(this).val();

            if (dropdownValue) {
                table.column(0).search(dropdownValue).draw();
            } else {
                table.column(0).search('').draw();
            }
        });
        </c:if>
  
        $('.dataTables_filter input').on('input', function () {
            var searchValue = $(this).val();
            table.search(searchValue).draw();
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
