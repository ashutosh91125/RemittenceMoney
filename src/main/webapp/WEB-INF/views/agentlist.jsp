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
<title>Agent List</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<script type="text/javascript">
	function toggleDropdown(element) {
		const dropdownMenu = element.nextElementSibling;
		dropdownMenu.classList.toggle('show');
	}
</script>
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
						<a href="agent" class="btn btn-primary"> <i
							class="feather-user-plus me-2"></i> <span>Add New Agent</span>
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
									<table class="table table-hover" id="agentList">
										<thead>
											<tr>
												<th>S.No</th>
												<th>Agent Name</th>
												<th>Username</th>
												<th>Company ID</th>
												<th>Agent Location ID</th>
												<th>Email</th>
												<th>Country</th>
												<th>Status</th>
												<th class="text-end">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="agent" items="${agentList}"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${agent.agentName}</td>
													<td>${agent.username}</td>
													<td>${agent.agentId}</td>
													<td>${agent.branchLocationId}</td>
													<td>${agent.email}</td>
													<td>${agent.countries }</td>
													<td><c:choose>
															<c:when test="${agent.statusFlag}">
                                                            Active
                                                        </c:when>
															<c:otherwise>
                                                            Inactive
                                                        </c:otherwise>
														</c:choose></td>
													<td><div class="hstack gap-2 justify-content-end">
															<a href="agent-detail?id=${agent.id }"
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
																		href="/agent-update?id=${agent.id}"> <i
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
			$('#agentList').DataTable({
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
