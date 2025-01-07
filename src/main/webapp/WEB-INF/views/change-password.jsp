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

<script type="text/javascript"> 
 document.addEventListener('DOMContentLoaded', function () {
	    const password = document.getElementById("password");
	    const confirmPassword = document.getElementById("confirmPassword");
	    const validationMessage = document.getElementById("validationMessage");
	    const submitButton = document.querySelector("button[type='submit']");
	    const passwordError = document.getElementById("password-error");

	    // Regular expression to check the password validity
	    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}$/;

	    function validateRealTime() {
	        const passwordValue = password.value.trim();
	        const confirmPasswordValue = confirmPassword.value.trim();

	        // Password validation
	        if (!passwordPattern.test(passwordValue)) {
	            passwordError.textContent = "Password must be 8+ characters with at least one uppercase, one lowercase, and one special character.";
	            passwordError.style.display = "block";
	            submitButton.disabled = true;
	        } else {
	            passwordError.style.display = "none";
	        }

	        // Confirm password validation
	        if (confirmPasswordValue === "") {
	            validationMessage.textContent = "";
	            submitButton.disabled = true;
	            return;
	        }

	        if (passwordValue !== confirmPasswordValue) {
	            validationMessage.textContent = "Passwords do not match!";
	            validationMessage.style.color = "red";
	            submitButton.disabled = true;
	        } else {
	            validationMessage.textContent = "Passwords match.";
	            validationMessage.style.color = "green";
	            submitButton.disabled = false;
	        }
	    }

	    password.addEventListener("focus", function () {
	        passwordError.style.display = "block";
	    });

	    password.addEventListener("blur", function () {
	        if (password.value.trim() === "") {
	            passwordError.style.display = "none";
	        }
	    });

	    password.addEventListener("input", validateRealTime);
	    confirmPassword.addEventListener("input", validateRealTime);
	});

</script>
</head>
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
						<h2 class="fs-20 fw-bolder mb-4" style="text-align: center;">Change
							Password</h2>
						<form action="${pageContext.request.contextPath}/change-password"
							method="post" class="w-100 mt-4 pt-2">
							<div class="row mb-2">
								<p style="text-align: center; color: red;">${message}</p>
							</div>
							<div class="row mb-2">
								<input name="username" type="text" class="form-control"
									placeholder="Username" id="username">
							</div>
							<div class="row mb-2">
								<input name="password" type="text" class="form-control"
									placeholder="Password" id="password">
							</div>
							<div id="password-error" class="row mb-2"
										style="color: red; font-size: 0.9rem; display: none;">
										Password must be 8+ characters with at least one uppercase, one lowercase, and one special character.</div>
							<div class="row mb-2">
								<input name="newPassword" type="password" class="form-control"
									placeholder="New Password" id="confirmPassword">
									<span id="validationMessage"></span>
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