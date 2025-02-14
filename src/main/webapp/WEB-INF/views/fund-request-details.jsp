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
<title>Fund Request Details</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<script type="text/javascript" src="js/commons.js"></script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="page-header" style="background: aliceblue;">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Fund Request</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/welcome">Home</a></li>
						<li class="breadcrumb-item">Fund Request Details</li>
					</ul>
				</div>
				<div class="page-header-right ms-auto">
					<div class="page-header-right-items">
						<div class="d-flex d-md-none">
							<a href="javascript:void(0)"
								class="page-header-right-close-toggle"> <i
								class="feather-arrow-left me-2"></i> <span>Back</span>
							</a>
						</div>
						<div>
							<a onclick="goBack()"> <i
								class="bi bi-arrow-left-circle-fill text-primary"
								style="font-size: 30px;"></i></a>
						</div>
							<label class="form-label">Back</label>
					</div>
					<div class="d-md-none d-flex align-items-center">
						<a href="javascript:void(0)" class="page-header-right-open-toggle">
							<i class="feather-align-right fs-20"></i>
						</a>
					</div>
				</div>
			</div>

		<div class="nxl-content p-3">
			<div class="main-content">
				<div class="card border-top-0">
					<form:form method="post" modelAttribute="fundRequest" id="fundRequest">
						<form:hidden path="id" value="" id="id" />
						<div class="card-body lead-status">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Fund Request No.</label>
									<form:input path="depositRequestNumber" type="text" class="form-control"
									  readonly="true" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Transaction Reference No.</label>
									<form:input path="referenceNumber" type="text" class="form-control"
									 readonly="true" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Deposit Mode</label>
									<form:input path="depositMode" type="text" class="form-control"
									 readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Amount</label>
									<form:input path="amount" type="text" class="form-control"
										 readonly="true" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                    <label class="form-label">Deposit Date</label>
                                    <form:input path="depositDate" type="text" class="form-control"
                                         readonly="true" />
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                    <label class="form-label">Deposit By</label>
                                    <form:input path="depositBy" type="text" class="form-control"
                                        readonly="true" />
                                </div>

							</div>
							<div class="row">
							    <div class="">
                                    <label class="form-label">Remarks</label>
                                    <form:textarea path="remarks" rows="3" class="form-control" readonly="true" ></form:textarea>
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
