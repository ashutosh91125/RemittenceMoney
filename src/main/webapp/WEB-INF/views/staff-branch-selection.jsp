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

<title>Login</title>

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
						<h2 class="fs-20 fw-bolder mb-4" style="text-align: center;">Branch Selection</h2>
						<form action="${pageContext.request.contextPath}/select-branch"
							method="post" class="w-100 mt-4 pt-2">
							<div class="row mb-2">
								<input name="branch" type="number" class="form-control"
									placeholder="Enter your branch Id" required>
							</div>

							<div class="mt-5">
								<button type="submit" class="btn btn-lg btn-primary w-100">Submit</button>
							</div>
						</form>
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