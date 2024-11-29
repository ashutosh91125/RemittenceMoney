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
<title>payment.html</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">

						<a href="javascript:void(0);" class="btn btn-primary"> <i></i>
							<span>+ Add Agent</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content" style="margin-top: -89px;">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<jsp:include page="subheaderagent.jsp"></jsp:include>
					</div>
					<form:form action="customertransaction" modelAttribute="agent"
						method="post">
						<div class="card-body lead-status">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Per Transaction<span
										class="text-danger">*</span></label>
									<form:input path="perTransactionLimit" type="text"
										class="form-control" id="statusInput"
										placeholder="Per Transaction" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Per Day<span
										class="text-danger">*</span></label>
									<form:input path="perDayLimit" type="text" class="form-control"
										id="sourceInput" placeholder="Per Day" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Per Month<span
										class="text-danger">*</span></label>
									<form:input path="perMonthLimit" type="text"
										class="form-control" id="visibilityInput"
										placeholder="Per Month" />
								</div>
							</div>
							<div class="row">
								<div class="col-10">
									<div class="col-2 text-end mb-2">
										<button type="submit" class="btn btn-primary btn-lg">Previous</button>
									</div>
								</div>
								<div class="col-2 text-end mb-2">
									<button type="submit"
										class="btn btn-primary btn-lg next-button">Next</button>
								</div>
							</div>
						</div>
					</form:form>
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
</body>
</html>
