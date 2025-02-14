<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <meta name="author" content="theme_ocean">
    <title>Fund Request List</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/dataTables.bs5.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/commons.js"></script>
</head>

<body>
    <div class="nxl-navigation">
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <div class="nxl-container" style="background: aliceblue;">
        <div class="page-header">
            <div class="page-header-left d-flex align-items-center">
                <div class="page-header-title">
                    <h5 class="m-b-10">Fund Request</h5>
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/welcome">Home</a></li>
                    <li class="breadcrumb-item">Fund Request List</li>
                </ul>
            </div>

            <c:if test="${pageContext.request.isUserInRole('AGENT')}">
                <div class="page-header-right ms-auto">
                    <div class="page-header-right-items">
                        <div class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
                            <a href="fund-request" class="btn btn-primary">
                                <i class="feather-user-plus me-2"></i>
                                <span>Add New Fund Request</span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="nxl-content" style="margin-top: -89px;">
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card stretch stretch-full">
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="fundRequestList">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Fund Req. No.</th>
                                                <th>Ref. No.</th>
                                                <th>Amount</th>
                                                <th>Deposit Mode</th>
                                                <th>Deposit Date</th>
                                                <th>Deposit By</th>
                                                <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="fundRequest" items="${fundRequestList}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${fundRequest.depositRequestNumber}</td>
                                                    <td>${fundRequest.referenceNumber}</td>
                                                    <td>${fundRequest.amount}</td>
                                                    <td>${fundRequest.depositMode}</td>
                                                    <td>${fundRequest.depositDate}</td>
                                                    <td>${fundRequest.depositBy}</td>
                                                    <td>
                                                        <div class="hstack gap-2 justify-content-end">
                                                            <a href="#" class="avatar-text avatar-md ajax-link" data-url="/fund-request-by-id?id=${fundRequest.id}" >
                                                                <i class="feather feather-eye" ></i>
                                                            </a>
                                                        </div>
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

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#fundRequestList').DataTable({
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
                "columnDefs": [
                    {
                        "orderable": false,
                        "targets": -1
                    }
                ]
            });
        });
    </script>

    <!-- Vendor JS Files -->
    <script src="assets/vendors/js/vendors.min.js"></script>
    <script src="assets/vendors/js/dataTables.min.js"></script>
    <script src="assets/vendors/js/dataTables.bs5.min.js"></script>
    <script src="assets/js/common-init.min.js"></script>
</body>
</html>
