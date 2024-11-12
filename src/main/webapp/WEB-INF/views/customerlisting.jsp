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
<title>Admin List</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
</head>

<body>
	<div class="nxl-navigation">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="nxl-container">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
						<a href="addAdmin" class="btn btn-primary successAlertMessage">
							<i class="feather-user-plus me-2"></i> <span>Add Admin</span>
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
									<table class="table table-hover" id="customerList">
										<thead>
											<tr>
												<th>S.No</th>
												<th>First Name</th>
												<th>Mobile Number</th>
												<th>Email</th>
												<th>Country</th>
												<th>Gender</th>
												<th>Date Of Birth</th>
												<th class="text-end">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="customer" items="${customerList}"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${customer.firstName}</td>
													<td>${customer.phoneNumber}</td>
													<td>${customer.emailId}</td>
													<td>${customer.countryOfResidence }</td>
													<td>${customer.gender }</td>
													<td>${customer.dateOfBirth }
													<%-- <td><c:forEach var="country"
															items="${admin.countries}">
															${country.countryName}<br />
														</c:forEach></td>
													<td><img
														src="data:image/jpeg;base64,${admin.profileImage}"
														alt="Profile Image" style="width: 50px; height: 50px;">
													</td>
													<td><c:choose>
															<c:when test="${admin.satus}">
																Active
															</c:when>
															<c:otherwise>
																Inactive
															</c:otherwise>
														</c:choose></td> --%>
													<td class="text-end"><a href="#"
														class="btn btn-light-brand">View</a> <a href="#"
														class="btn btn-light-brand">Edit</a> <a href="#"
														class="btn btn-light-brand">Delete</a></td>
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
				<div class="pagination-controls">
					<c:if test="${currentPage > 0}">
						<a href="?page=${currentPage - 1}&size=${size}"
							class="btn btn-secondary">Previous</a>
					</c:if>
					</br>
					<c:if test="${currentPage < totalPages - 1}">
						<a href="?page=${currentPage + 1}&size=${size}"
							class="btn btn-secondary">Next</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Vendor JS Files -->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/dataTables.min.js"></script>
	<script src="assets/vendors/js/dataTables.bs5.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
</body>
</html>
