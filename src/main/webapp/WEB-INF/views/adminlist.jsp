<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin List</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
</head>

<body>

        <jsp:include page="header.jsp"></jsp:include>


    <div class="nxl-container" >
        <div class="page-header">
            <div class="page-header-left d-flex align-items-center">
                <div class="page-header-title">
                    <h5 class="m-b-10">Admin</h5>
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/welcome">Home</a></li>
                    <li class="breadcrumb-item">Admin List</li>
                </ul>
            </div>
            <div class="page-header-right ms-auto">
                <div class="page-header-right-items">
                    <div class="d-flex align-items-center gap-2">
                        <a href="admin" class="btn btn-primary">
                            <i class="feather-user-plus me-2"></i> Add New Admin
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="nxl-content" style="margin-top: -89px;">
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card stretch stretch-full">
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="adminList">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Admin Name</th>
                                                <th>Username</th>
                                                <th>Phone Number</th>
                                                <th>Email</th>
                                                <th>Countries</th>
                                                <th>Status</th>
                                                <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="admin" items="${subAdminList}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${admin.adminName}</td>
                                                    <td>${admin.username}</td>
                                                    <td>${admin.phoneNumber}</td>
                                                    <td>${admin.email}</td>
                                                    <td>${admin.country}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${admin.approved}">Active</c:when>
                                                            <c:otherwise>Inactive</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="hstack gap-2 justify-content-end">
                                                        <%-- <a href="/admin-detail?id=${admin.id}"
																class="avatar-text avatar-md"> <i
																class="feather feather-eye"></i>
															</a> --%>
                                                            <a href="#" class="avatar-text avatar-md ajax-link" data-url="/admin-detail?id=${admin.id}">
                                                                <i class="feather feather-eye"></i>
                                                            </a>
                                                            <div class="dropdown">
                                                                <a href="javascript:void(0)" onclick="toggleDropdown(this)" class="avatar-text avatar-md">
                                                                    <i class="feather feather-more-horizontal"></i>
                                                                </a>
                                                                <ul class="dropdown-menu" style="position: absolute; right: 38px; top: 54px;">
                                                                    <li>
                                                                        <a class="dropdown-item" href="/admin-update-form?id=${admin.id}">
                                                                            <i class="feather feather-edit-3 me-3"></i> Edit
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
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
        </div>
         <jsp:include page="footer.jsp"></jsp:include>
    </div>
  
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <!-- Initialize DataTable -->
    <script>
        $(document).ready(function () {
            $('#adminList').DataTable({
                pageLength: 10,
                ordering: true,
                searching: true,
                paging: true,
                info: true,
                language: {
                    emptyTable: "No data available",
                    info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    infoEmpty: "No entries available",
                    paginate: {
                        previous: "Previous",
                        next: "Next"
                    }
                },
                columnDefs: [{ orderable: false, targets: -1 }]
            });
        });
    </script>
</body>
</html>
