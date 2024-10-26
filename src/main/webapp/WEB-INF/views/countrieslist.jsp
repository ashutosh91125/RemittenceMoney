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
    <title>Payment Management</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/dataTables.bs5.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
</head>

<body>
    <div class="nxl-navigation">
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <main class="nxl-container">
              <div class="nxl-content">
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card stretch stretch-full">
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="countryList">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Name</th>
                                                <th>Short Code</th>
                                                <th>ISO3</th>
                                                <th>Num Code</th>
                                                <th>Phone Code</th>
                                               <!--  <th>Status</th> -->
                                                <th class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="country" items="${countrieslist.content}" varStatus="status">
                                                <tr>
                                                    <td>${(countrieslist.number * countrieslist.size) + status.index + 1}</td>
                                                    <td>${country.countryName}</td>
                                                    <td>${country.shortName}</td>
                                                    <td>${country.iso3}</td>
                                                    <td>${country.numCode}</td>
                                                    <td>${country.phoneCode}</td>
                                                    <%-- <td>${country.status ? 'Active' : 'Inactive'}</td> --%>
                                                    <td class="text-end">
                                                        <a href="#" class="btn btn-primary btn-sm">Edit</a>
                                                        <a href="#" class="btn btn-danger btn-sm">Delete</a>
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

                <!-- Pagination Controls -->
                <div class="pagination-controls d-flex justify-content-center my-4">
                    <c:if test="${currentPage > 0}">
                        <a href="?page=${currentPage - 1}&size=${size}" class="btn btn-secondary mx-2">Previous</a>
                    </c:if>
                    <c:if test="${currentPage < totalPages - 1}">
                        <a href="?page=${currentPage + 1}&size=${size}" class="btn btn-secondary mx-2">Next</a>
                    </c:if>
                </div>
            </div>
        </div>
    </main>
	<jsp:include page="footer.jsp"></jsp:include>
    <!-- Vendor JS Files -->
    <script src="assets/vendors/js/vendors.min.js"></script>
    <script src="assets/vendors/js/dataTables.min.js"></script>
    <script src="assets/vendors/js/dataTables.bs5.min.js"></script>
    <script src="assets/js/common-init.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#countryList').DataTable(); // Initialize DataTables for sorting and pagination
        });
    </script>
</body>
</html>
