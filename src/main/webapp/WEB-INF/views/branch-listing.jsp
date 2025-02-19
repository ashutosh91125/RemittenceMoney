<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Branch List</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
</head>

<body>

        <jsp:include page="header.jsp"></jsp:include>
    <div class="nxl-container">
        <div class="page-header">
            <div class="page-header-left d-flex align-items-center">
                <div class="page-header-title">
                    <h5 class="m-b-10">Branch</h5>
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/welcome">Home</a></li>
                    <li class="breadcrumb-item">Branch List</li>
                </ul>
            </div>

            <c:if test="${pageContext.request.isUserInRole('AGENT')}">
                <div class="page-header-right ms-auto">
                    <div class="page-header-right-items">
                        <div class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
                            <a href="branch" class="btn btn-primary">
                                <i class="bi bi-bezier me-2"></i>
                                <span>Add New Branch</span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="nxl-content">
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card stretch stretch-full">
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="branchDetailsList">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Branch ID</th>
                                                <th>Branch Name</th>
                                                <th>Company ID</th>
                                                <th>Branch Type</th>
                                                <th>Branch Mode</th>
                                                <th>Agent Location ID</th>
                                                <th>Outlet Code</th>
                                                <th>Status</th>
                                                <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="branchDetails" items="${branchDetailsList}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${branchDetails.id}</td>
                                                    <td>${branchDetails.branchName}</td>
                                                    <td>${branchDetails.agent}</td>
                                                    <td>${branchDetails.branchType}</td>
                                                    <td>${branchDetails.branchMode}</td>
                                                    <td>${branchDetails.branchLocationId}</td>
                                                    <td>${branchDetails.outletCode}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${branchDetails.status}">Active</c:when>
                                                            <c:otherwise>Inactive</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="hstack gap-2 justify-content-end">
                                                           <%--  <a href="branch-detail?id=${branchDetails.id}" class="avatar-text avatar-md">
                                                                <i class="feather feather-eye"></i>
                                                            </a> --%>
                                                             <a href="#" class="avatar-text avatar-md ajax-link" 
                                                                data-url="branch-detail?id=${branchDetails.id}">
                                                                <i class="feather feather-eye"></i>
                                                            </a>
                                                            <c:if test="${pageContext.request.isUserInRole('AGENT')}">
                                                                <div class="dropdown">
                                                                    <a href="javascript:void(0)" onclick="toggleDropdown(this)" class="avatar-text avatar-md">
                                                                        <i class="feather feather-more-horizontal"></i>
                                                                    </a>
                                                                    <ul class="dropdown-menu" style="position: absolute; right: 38px; top: 54px;">
                                                                        <li>
                                                                            <a class="dropdown-item" href="/branch?branchId=${branchDetails.id}">
                                                                                <i class="feather feather-edit-3 me-3"></i>
                                                                                <span>Edit</span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </c:if>
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
        var table = $('#branchDetailsList').DataTable({
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
            $('.col-md-6').css({ display: 'flex' }).prepend('<select id="agentList" class="form-control" style="width: 200px; height: 43px;"><option value="">Select Agent</option></select>');

            $.ajax({
                url: '/api/v1/agent/agents',
                type: 'GET',
                success: function (response) {
                    if (Array.isArray(response)) {
                        var dropdown = $('#agentList');
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

            $('#agentList').on('change', function() {
                var selectedAgent = $(this).val();
                if (selectedAgent) {
                    table.column(6).search(selectedAgent).draw(); 
                } else {
                    table.column(6).search('').draw(); 
                }
            });
        </c:if>
    });
</script>

    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

</body>
</html>
