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
					<form:form action="agent" modelAttribute="agent" method="post">
						<form:hidden path="step" value="4" />
						<div class="card-body lead-status">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Daily<span
										class="text-danger">*</span></label>
									<form:input path="daily" type="text" class="form-control"
										id="statusInput" placeholder="Daily" />
									<span id="dailyError" class="text-danger"></span>
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Settlement Mode<span
										class="text-danger">*</span></label>
									<%-- <form:select path="settlementMode" class="form-control"
										multiple="false">
										<form:options items="${setteleMentModeList}"
											itemValue="settelementId" itemLabel="SettelementId"
											placeholder="Settlement Type" />
									</form:select> --%>
									<span id="settlementModeError" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Setlement Type<span
										class="text-danger">*</span></label>
									<%-- <form:select path="settlementType" class="form-control"
										multiple="false">
										<form:options items="${setteleMentTypeList}"
											itemValue="SettelementId" itemLabel="SettelementId"
											placeholder="Settlement Type" />
									</form:select> --%>
									<span id="settlementTypeError" class="text-danger"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Status<span
										class="text-danger">*</span></label>
									<div>
										<form:radiobutton path="status" value="0" id="Deactive"
											class="form-check-input" />
										<label for="Inactive">Deactive</label>
									</div>
									<div>
										<form:radiobutton path="status" value="1" id="Active"
											class="form-check-input" />
										<label for="Active">Active</label>
									</div>
								</div>

							</div>


							<div class="row">
								<div class="col-10">
									<div class="col-2 text-end mb-2">
										<form:button type="submit" class="btn btn-primary btn-lg">
										Previous</form:button>
									</div>
								</div>
								<div class="col-2 text-end mb-2">
									<form:button type="submit"
										class="btn btn-primary btn-lg next-button">Next</form:button>
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
