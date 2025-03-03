<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
						<a href="customer" class="btn btn-primary ">
							<i class="feather-user-plus me-2"></i> <span>Add Customer</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content p-3" >
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
												<th>Ecrn</th>
												<th>First Name</th>
												<th>Mobile Number</th>
												<th>Email</th>
												<th>Country</th>
												<th>Gender</th>

												<th class="text-end">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="customer" items="${customerList1}"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td><a href="customerdetailstransfer?ecrn=${customer.ecrn}">${customer.ecrn}</a></td>
													<td>${customer.firstName}</td>
													<td>${customer.phoneNumber}</td>
													<td>${customer.emailId}</td>
													<td>${customer.countryOfResidence }</td>
													<td>${customer.gender }</td>

													<td class="text-end"><a
														href="customerdetailstransfer?ecrn=${customer.ecrn}"
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
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


	<!-- Vendor JS Files -->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/dataTables.min.js"></script>
	<script src="assets/vendors/js/dataTables.bs5.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>

	<!-- DataTables Initialization -->
	<script>
		$(document).ready(function() {
			$('#customerListOnTransfer').DataTable({
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
</body>
</html>
