<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Staff List</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
</head>

<body>
    <div class="nxl-navigation">
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <div class="nxl-container" style="background: aliceblue;">
        <div class="page-header">
            <div class="page-header-left d-flex align-items-center">
                <div class="page-header-title">
                    <h5 class="m-b-10">Staff</h5>
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/welcome">Home</a></li>
                    <li class="breadcrumb-item">Staff List</li>
                </ul>
            </div>

            <c:if test="${pageContext.request.isUserInRole('AGENT')}">
                <div class="page-header-right ms-auto">
                    <div class="page-header-right-items">
                        <div class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
                            <a href="staff" class="btn btn-primary">
                                <i class="feather-user-plus me-2"></i>
                                <span>Add New Staff</span>
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
                                    <table class="table table-hover" id="staffDetailsList">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th  style="display:none;">agent</th>
                                                <th>Staff Name</th>
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Mobile Number</th>
                                                <th>Created Date</th>
                                                <th>Status</th>
                                                <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="staffDetails" items="${staffDetailsList}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td  style="display:none;">${staffDetails.branchLocationId}</td>
                                                    <td>${staffDetails.firstName} ${staffDetails.lastName}</td>
                                                    <td>${staffDetails.username}</td>
                                                    <td>${staffDetails.email}</td>
                                                    <td>${staffDetails.mobile}</td>
                                                    <td>${staffDetails.staffCraetedDateFormated}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${staffDetails.status}">Active</c:when>
                                                            <c:otherwise>Inactive</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="hstack gap-2 justify-content-end">
                                                           <%--  <a href="/staff-deatils?id=${staffDetails.id}" class="avatar-text avatar-md">
                                                                <i class="feather feather-eye"></i>
                                                            </a> --%>
                                                            <a href="#" class="avatar-text avatar-md ajax-link" data-url="/staff-deatils?id=${staffDetails.id}" >
                                                                <i class="feather feather-eye" ></i>
                                                            </a>
                                                            <c:if test="${pageContext.request.isUserInRole('AGENT')}">
                                                                <div class="dropdown">
                                                                    <a href="javascript:void(0)" onclick="toggleDropdown(this)" class="avatar-text avatar-md">
                                                                        <i class="feather feather-more-horizontal"></i>
                                                                    </a>
                                                                    <ul class="dropdown-menu" style="position: absolute; right: 38px; top: 54px;">
                                                                        <li>
                                                                            <a class="dropdown-item" href="/staff-update-form?id=${staffDetails.id}">
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
        var table = $('#staffDetailsList').DataTable({
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
                    table.column(1).search(selectedAgent).draw(); 
                } else {
                    table.column(1).search('').draw(); 
                }
            });
        </c:if>
    });
    </script>
  

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

</body>
</html>
