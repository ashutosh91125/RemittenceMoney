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
<script type="text/javascript" src="js/commons.js"></script>
</head>

<body>
	<div class="nxl-navigation">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
						<a href="admin" class="btn btn-primary">
							<i class="feather-user-plus me-2"></i> <span>Add New Admin</span>
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
											<%--	<th>Profile Image</th> --%>
												<th>Status</th>
												<th class="text-end">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="admin" items="${subAdminList}"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${admin.adminName}</td>
													<td>${admin.username}</td>
													<td>${admin.phoneNumber}</td>
													<td>${admin.email}</td>
													 <td>${admin.country}</td> 
													<%--  <td><img
														src="data:image/jpeg;base64,${admin.profileImage}"
														alt="Profile Image" style="width: 50px; height: 50px;">
													</td> --%>
													<td><c:choose>
															<c:when test="${admin.approved}">
																Active
															</c:when>
															<c:otherwise>
																Inactive
															</c:otherwise>
														</c:choose></td>
													<%-- <td><div style="display: flex;justify-content: end;"><a href="admin-detail?id=${admin.id}" class="avatar-text avatar-md" title="view">
                                                            <i class="feather feather-eye"></i>
                                                        </a></div></td> --%>
                                                        <td><div class="hstack gap-2 justify-content-end">
															<a href="/admin-detail?id=${admin.id}"
																class="avatar-text avatar-md"> <i
																class="feather feather-eye"></i>
															</a>
															<div class="dropdown">
																<a href="javascript:void(0)"
																	onclick="toggleDropdown(this)"
																	class="avatar-text avatar-md"> <i
																	class="feather feather-more-horizontal"></i>
																</a>
																<ul class="dropdown-menu"
																	style="position: absolute; right: 38px; top: 54px;">
																	<li><a class="dropdown-item"
																		href="/admin-update-form?id=${admin.id}"> <i
																			class="feather feather-edit-3 me-3"></i> <span>Edit</span>
																	</a></li>
																	<!-- 																	<li class="dropdown-divider"></li> -->
																	<!-- <li><a class="dropdown-item"
																		href="javascript:void(0)"> <i
																			class="feather feather-trash-2 me-3"></i> <span>Delete</span>
																	</a></li> -->
																</ul>
															</div>
														</div></td>
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

	<script>
		$(document).ready(function() {
			$('#adminList').DataTable({
				"pageLength" : 10,
				"ordering" : true,
				"searching" : true,
				"paging" : true,
				"info" : true,
				"language" : {
					"emptyTable" : "No data available",
					"info" : "Showing _START_ to _END_ of _TOTAL_ entries",
					"infoEmpty" : "No entries available",
					"paginate" : {
						"previous" : "Previous",
						"next" : "Next"
					}
				},
				"columnDefs" : [ {
					"orderable" : false,
					"targets" : -1
				} ]
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
