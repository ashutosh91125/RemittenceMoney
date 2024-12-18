<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Transfer List</title>

<!-- CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
</head>

<body>
	<!-- Header Include -->
	<div class="nxl-navigation">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<!-- Page Content -->
	<div class="nxl-container" style="background: aliceblue;">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
						<a href="customer" class="btn btn-primary"> <i
							class="feather-user-plus me-2"></i> <span>Add Customer</span>
						</a>
					</div>
				</div>
			</div>
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
												<th>S.No</th>
												<th>Transaction Number</th>
												<th>Date</th>
												<th>PayIn Amount</th>
												<th>PayOut Amount</th>
												<th>Transaction State</th>
												<!-- <th>Transaction SubState</th> -->
												<th class="text-end">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="transfer" items="${transferList}"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${transfer.transactionReferenceNumber }</td>
													<td>${transfer.transactionDate}</td>
													<td>${transfer.totalPayInAmount}</td>
													<td>${transfer.payoutAmount}</td>
													<td>${transfer.transactionState}</td>
													<%-- 	<td>${transfer.transactionSubState}</td> --%>
													<td class="text-end"><a
														href="customerdetails?ecrn=${transfer.ecrn}"> <img
															title="Check Status" src="assets/images/status.png"
															class="img-fluid" style="width: 24px;">
													</a> <a
														href="transfer-details?transactionReferenceNumber=${transfer.transactionReferenceNumber }"
														class="ms-2"> <img src="assets/images/receipt.png"
															class="img-fluid" style="width: 24px;"
															title="View Transaction">
													</a></td>
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
		$(document).ready(function() {
			$('#transfer-list').DataTable({
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
