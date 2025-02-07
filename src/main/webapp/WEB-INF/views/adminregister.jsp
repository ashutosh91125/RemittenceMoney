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
<script type="text/javascript" src="js/commons.js"></script>
<script type="text/javascript">
function validation(form) {
	let isValid = true;
	document.getElementById("adminNameError").innerHTML = "";
	document.getElementById("userNameError").innerHTML = "";
	document.getElementById("phoneNumberError").innerHTML = "";
	document.getElementById("emailError").innerHTML = "";
// 	document.getElementById("passwordError").innerHTML = "";
	document.getElementById("countryError").innerHTML = "";

	if (!form.adminName.value.trim()) {
		document.getElementById("adminNameError").innerHTML = "Admin Name is required.";
		isValid = false;
	}
	if (!form.userName.value.trim()) {
		document.getElementById("userNameError").innerHTML = "User Name is required.";
		isValid = false;
	}
	if (!form.phoneNumber.value.trim()) {
		document.getElementById("phoneNumberError").innerHTML = "Phone Number is required.";
		isValid = false;
	}
	if (!form.email.value.trim()) {
		document.getElementById("emailError").innerHTML = "Email is required.";
		isValid = false;
	}
	/* if (!form.password.value.trim()) {
		document.getElementById("passwordError").innerHTML = "Password is required.";
		isValid = false;
	} */
	if (!form.country.value) {
		document.getElementById("countryError").innerHTML = "Country is required.";
		isValid = false;
	}
	if (!isValid) {
		document.getElementById("validationError").style.display = "block";
	}
	return isValid;
}	
document.addEventListener('DOMContentLoaded', function () {
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmPassword");
    const validationMessage = document.getElementById("validationMessage");
    const passwordError = document.getElementById("password-error");
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}$/;

    function validateRealTime() {
        const passwordValue = password.value.trim();
        const confirmPasswordValue = confirmPassword.value.trim();

        if (!passwordPattern.test(passwordValue)) {
            passwordError.textContent = "Password must be 8+ characters with at least one uppercase, one lowercase, and one special character.";
            passwordError.style.display = "block";
        } else {
            passwordError.style.display = "none";
        }

        if (confirmPasswordValue === "") {
            validationMessage.textContent = "";
            return;
        }

        if (passwordValue !== confirmPasswordValue) {
            validationMessage.textContent = "Passwords do not match!";
            validationMessage.style.color = "red";
        } else {
            if (passwordPattern.test(passwordValue)) {
                validationMessage.textContent = "Matched password";
                validationMessage.style.color = "green";
            } else {
                validationMessage.textContent = "";
            }
        }
    }

    function validateOnSubmit(event) {
        let isValid = true;
        const passwordValue = password.value.trim();
        const confirmPasswordValue = confirmPassword.value.trim();

        if (!passwordValue) {
            passwordError.textContent = "Password is required.";
            passwordError.style.display = "block";
            isValid = false;
        } else if (!passwordPattern.test(passwordValue)) {
            passwordError.textContent = "Password must be 8+ characters with at least one uppercase, one lowercase, and one special character.";
            passwordError.style.display = "block";
            isValid = false;
        } else {
            passwordError.style.display = "none";
        }

        if (!confirmPasswordValue) {
            validationMessage.textContent = "Confirm Password is required.";
            validationMessage.style.color = "red";
            isValid = false;
        } else if (passwordValue !== confirmPasswordValue) {
            validationMessage.textContent = "Passwords do not match!";
            validationMessage.style.color = "red";
            isValid = false;
        } else {
            validationMessage.textContent = "";
        }

        if (!isValid) {
            event.preventDefault(); // Prevent form submission
        }
    }

    password.addEventListener("focus", function () {
        if (!passwordPattern.test(password.value.trim())) {
            passwordError.style.display = "block";
        }
    });

    password.addEventListener("blur", function () {
        if (password.value.trim() === "" || !passwordPattern.test(password.value.trim())) {
            passwordError.style.display = "none";
        }
    });

    password.addEventListener("input", validateRealTime);
    confirmPassword.addEventListener("input", validateRealTime);

    const form = document.querySelector("form"); // Select the form element
    form.addEventListener("submit", validateOnSubmit);
});	
</script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="nxl-container" style="background: aliceblue;">
		<%--<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
						<a href="javascript:void(0);"
							class="btn btn-primary successAlertMessage"> <i
							class="feather-user-plus me-2"></i> <span>Add Admin</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		--%>
		<div class="nxl-content p-3">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<%-- <jsp:include page="subheaderagent.jsp"></jsp:include> --%>
					</div>
					<form action="/signup" method="post" enctype="multipart/form-data"
						onsubmit="return validation(this)">
						<div class="card-body lead-status">

							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Admin Full Name<span
										class="text-danger">*</span></label> <input name="adminName"
										type="text" class="form-control" id="adminName"
										placeholder="Enter full name"> <span id="adminNameError"
										style="color: red;"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">User Name<span
										class="text-danger">*</span></label> <input name="userName"
										type="text" class="form-control" id="userName"
										placeholder="User Name"> <span id="userNameError"
										style="color: red;"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Phone Number <span
										class="text-danger">*</span></label> <input name="phoneNumber"
										type="text" class="form-control" id="phoneNumber"
										placeholder="Phone Number"> <span
										id="phoneNumberError" style="color: red;"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Email<span
										class="text-danger">*</span></label> <input name="email" type="text"
										class="form-control" id="email" placeholder="Email"> <span
										id="emailError" style="color: red;"></span>
								</div>
								<div class="col-xl-4">
									<div class="mb-4">
										<label class="form-label">Password<span
											class="text-danger">*</span></label> <input name="password"
											type="password" class="form-control" id="password"
											placeholder="Set Password" /> <span id="password-error"
											style="color: red; display: none;"></span> <span
											id="passwordError" class="text-danger1"></span>
									</div>
								</div>
								<div class="col-xl-4">
									<div class="mb-4">
										<label class="form-label">Confirm Password<span
											class="text-danger">*</span></label> <input name="confirmPassword"
											type="password" class="form-control" id="confirmPassword"
											placeholder="Confirm Password" /> <span
											id="validationMessage"></span>
									</div>
								</div>

								<%-- <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Confirm Password</label>
									<form:input path="confirmPassword" type="text"
										class="form-control" id="statusInput"
										placeholder="Confirm Password" />
								</div> --%>
							</div>
							<div class="row">
								<%-- <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Profile Image</label>
									<form:input path="profileImagePath" type="file"
										class="form-control" placeholder="Profile Image" />
								</div> --%>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Country<span
										class="text-danger">*</span></label> <select name="country"
										class="form-control" id="country">
										<option value="" disabled="true" selected="true">Select
											Country</option>
										<c:forEach items="${countryList}" var="country">
											<option value="${country.valueId}">${country.description}</option>
										</c:forEach>
									</select> <span id="countryError" style="color: red;"></span>
								</div>
							</div>
							<div class="mt-5 mb-5 text-center"
								style="display: flex; justify-content: center">
								<span id="validationError"
									style="color: #ff000087; display: none;"><b>Please
										fill all the required fields before submitting!</b></span>
							</div>
							<div class="mt-5 mb-5 text-center"
								style="display: flex; justify-content: center">
								<button id="submitButton" type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</form>
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
