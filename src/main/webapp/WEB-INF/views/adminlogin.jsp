<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">

<title>Admin Login</title>

<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendors.min.css">
<link rel="stylesheet" href="assets/css/theme.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/theme.min.css">
</head>
<script type="text/javascript">
	
</script>

<body>

	<main class="auth-minimal-wrapper">
		<div class="auth-minimal-inner">
			<div class="minimal-card-wrapper">
				<div class="card mb-4 mt-5 mx-4 mx-sm-0 position-relative">
					<div
						class="wd-100 bg-white p-2 rounded-circle shadow-lg position-absolute translate-middle top-0 start-50">
						<img src="assets/images/LuluMoney.png" class="img-fluid">
					</div>
					<div class="card-body p-sm-5">
						<h2 class="fs-20 fw-bolder mb-4" style="text-align: center;">Admin
							Login</h2>
						<form:form action="adminlogin" modelAttribute="admin"
							method="post" class="w-100 mt-4 pt-2">
							<div class="row mb-2">
								<form:input path="email" type="text" class="form-control"
									placeholder="Email or Username" />
							</div>
							<div class="row mb-2">
								<form:input path="password" type="password" class="form-control"
									placeholder="Password" />
							</div>

							<div class="row mb-2 ">
								<form:select path="countries" 
									class="form-control" data-select2-selector="icon"
									multiple="false">
									<form:option value="" disabled="true" selected="true">Select Country</form:option>
									<form:options items="${countryList}" itemValue="valueId"
										itemLabel="description" />
								</form:select>
								<%-- <form:select path="countries" class="form-control"
									multiple="false">
									<form:option value="" disabled="true" selected="true">Country</form:option>
									<form:options items="${countrieslist}" itemValue="countryId"
										itemLabel="countryName" />
								</form:select> --%>
							</div>
							<div class="d-flex align-items-center justify-content-between">
								<div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="rememberMe"> <label
											class="custom-control-label c-pointer" for="rememberMe">Remember
											Me</label>
									</div>
								</div>
								<div>
									<a href="auth-reset-minimal.html" class="fs-11 text-primary">Forget
										password?</a>
								</div>
							</div>
							<div class="mt-5">
								<form:button type="submit" class="btn btn-lg btn-primary w-100">Login</form:button>
							</div>
						</form:form>
					</div>
				</div>
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
	</main>



	<script src="assets/vendors/js/vendors.min.js"></script>

	<script src="assets/js/common-init.min.js"></script>

	<script src="assets/js/theme-customizer-init.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/vendors/js/vendors.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/common-init.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/theme-customizer-init.min.js"></script>
</html>

</body>

</html>