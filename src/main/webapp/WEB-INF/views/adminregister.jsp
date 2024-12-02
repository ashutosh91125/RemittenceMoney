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
<script type="text/javascript">
	
</script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
						<a href="javascript:void(0);"
							class="btn btn-primary successAlertMessage"> <i
							class="feather-user-plus me-2"></i> <span>Add Admin</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content" style="margin-top: -89px;">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<%-- <jsp:include page="subheaderagent.jsp"></jsp:include> --%>
					</div>
					<form:form action="admin" modelAttribute="admin" method="post"
						enctype="multipart/form-data">
						<div class="card-body lead-status">

							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Admin Name</label>
									<form:input path="adminName" type="text" class="form-control"
										id="statusInput" placeholder="Admin Name" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">User Name</label>
									<form:input path="userName" type="text" class="form-control"
										id="statusInput" placeholder="User Name" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Phone Number</label>
									<form:input path="phone" type="text" class="form-control"
										id="statusInput" placeholder="Phone Number" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Email</label>
									<form:input path="email" type="text" class="form-control"
										id="statusInput" placeholder="Email" />
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Password</label>
									<form:input path="password" type="text" class="form-control"
										id="statusInput" placeholder="Password" />
								</div>


								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Confirm Password</label>
									<form:input path="confirmPassword" type="text"
										class="form-control" id="statusInput"
										placeholder="Confirm Password" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Profile Image</label>
									<form:input path="profileImagePath" type="file"
										class="form-control" placeholder="Profile Image" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Country</label>
									<form:select path="countries" class="form-control"
										data-select2-selector="icon" multiple="false">
										<form:option value="" disabled="true" selected="true">Country</form:option>
										<form:options items="${countryList}" itemValue="valueId"
											itemLabel="description" />
									</form:select>
								</div>
							</div>
							<div class="row">
								<div class="col-10"></div>
								<div class="col-2 text-end mb-2">
									<button type="submit" onclick="submit()"
										class="btn btn-primary btn-lg next-button">Submit</button>
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
