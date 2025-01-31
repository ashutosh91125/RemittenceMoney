<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">
<!--! The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags !-->
<!--! BEGIN: Apps Title-->
<title>LuLu Money || Staff Register</title>
<!--! END:  Apps Title-->
<!--! BEGIN: Favicon-->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">
<!--! END: Favicon-->
<!--! BEGIN: Bootstrap CSS-->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<!--! END: Bootstrap CSS-->
<!--! BEGIN: Vendors CSS-->
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/datepicker.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEJr1X2X-0yyJ9s5ANx6kPqcp8TDCwNjdbREKxQl11jOlWEeUwzoytbDxs9yE"
	crossorigin="anonymous">
<!--! END: Vendors CSS-->
<!--! BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<!--! END: Custom CSS-->
<!--! HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries !-->
<!--! WARNING: Respond.js doesn"t work if you view the page via file: !-->
<!--[if lt IE 9]>
			<script src="https:oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https:oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->


<!-- for KYC -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel="stylesheet" href="./style.css">
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js'></script>
<script src="./script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Feather Icons (optional for search icon) -->
<script src="https://unpkg.com/feather-icons"></script>







<style>
.search-bar-container input {
	width: 100%;
}

.radio-container label {
	display: block;
	margin: 5px 0;
}

.search-bar-container {
	margin: 15px 0;
}

.search-heading {
	font-size: 17px;
}

/* for accordion */
.accordion-button::after {
	display: none;
}
/* Add a custom icon to the left of the accordion button */
.accordion-button::before {
	content: "\f107"; /* Font Awesome chevron-down icon */
	font-family: 'Font Awesome 5 Free';
	font-weight: 900;
	margin-right: 10px;
	font-size: 16px;
	transition: transform 0.3s;
}

/* Rotate icon when the accordion is open */
.accordion-button[aria-expanded="true"]::before {
	transform: rotate(180deg);
}

.accordion-button {
	background-color: aliceblue;
}

.accordion .accordion-item {
	background-color: aliceblue;
}

.spinner-container {
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	display: none;
}

/* Ensure the .form-control class applies uniformly to inputs and selects */
.form-control {
	width: 100%;
	/* Ensures input and select elements take up the full column width */
	height: 46px;
	/* Set a consistent height for both input fields and selects */
	padding: 10px; /* Adds padding for better appearance */
	box-sizing: border-box; /* Ensures padding doesn't affect width */
}

/* Optional: Remove any internal margins/padding that could affect layout */
.col-xl-4 {
	padding-left: 8px;
	padding-right: 8px;
}

.mb-4 {
	margin-bottom: 1.5rem; /* Maintain consistent spacing between fields */
}

/* Remove any width restrictions if there are any */
.form-control:focus {
	border-color: #5e72e4; /* Optional: focus effect */
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	/* Optional: focus effect */
}

#search-result td {
	padding: 5px; /* Adjust padding */
	font-size: 12px; /* Adjust font size */
	white-space: nowrap; /* Prevent wrapping */
}

#search-result th {
	padding: 5px; /* Adjust padding */
	font-size: 12px; /* Adjust font size */
	white-space: nowrap; /* Prevent wrapping */
}

.hidden {
	display: none;
}
</style>
<script>
function registerStaff() {
	if (!validation($("#staffForm"))) {
		return false;
	}
	const formData = $("#staffForm").serialize(); 
	$('#loader').show();
	$('#submitButton').prop('disabled', true);
	$.ajax({
		url : "/api/v1/staff",
		type : "POST",
		contentType : "application/x-www-form-urlencoded",
		data : formData,
		success : function(response) {
			$('#loader').hide();
			$('#submitButton').prop('disabled', false);
			alert(response);
			 window.location.href = "/staff-list";
		},
		error : function(xhr) {
			$('#loader').hide();
			$('#submitButton').prop('disabled', false);
			alert("Error: " + xhr.responseText);
		}
	});
}

function toggleDiv(divId) {
	const element = document.getElementById(divId);
	element.classList.toggle("show");
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
		<div class="nxl-content" style="background: aliceblue;">

			<!-- [ page-header ] start -->
			<div class="page-header" style="background: aliceblue;">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Staff</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Add Staff</li>
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
						<div
							class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
							<!-- <a href="javascript:void(0);" class="btn btn-light-brand successAlertMessage">
                                <i class="feather-layers me-2"></i>
                                <span>Save as Draft</span>
                            </a> -->
							<a href="javascript:void(0);"
								class="btn btn-primary successAlertMessage"> <i
								class="feather-user-plus me-2"></i> <span>Add Staff</span>
							</a>
						</div>
					</div>
					<div class="d-md-none d-flex align-items-center">
						<a href="javascript:void(0)" class="page-header-right-open-toggle">
							<i class="feather-align-right fs-20"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- [ page-header ] end -->

		<div class="spinner-container" id="loader">
			<div class="spinner-border text-primary" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-pzjw8f+ua7Kw1TIq0FB2a7oI4GvYbgPpQXqzZyoxFQsF3jyBzJrb8tO9gW0Gi7km"
			crossorigin="anonymous"></script>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<form:form id="staffForm" modelAttribute="staff"
			onsubmit="event.preventDefault(); registerStaff();">

			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseOne')">Staff
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show">
						<div class="accordion-body mt-2"
							style="background: aliceblue; margin-top: -40px;">
							<div class="main-content">
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Branch<span
												class="text-danger">*</span></label>
											<form:select path="branches" data-select2-selector="tag" multiple="true"
												id="branches" title="Select a branch" class="form-control" >
												<form:options items="${branchList}"
													itemValue="id" itemLabel="branchName" />
											</form:select>

											<span id="branchError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">First Name<span
												class="text-danger">*</span></label>
											<form:input path="firstName" type="text" class="form-control"
												id="firstName" placeholder="Enter your First Name" />

											<span id="firstNameError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Middle Name</label>
                                            <form:input path="middleName" type="text"
                                                class="form-control" id="middleName"
                                                placeholder="Enter your Middle Name" />

                                            <span id="firstNameError" class="text-danger1"></span>
                                        </div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Last Name<span
												class="text-danger">*</span></label>
											<form:input path="lastName" type="text" class="form-control"
												id="lastName" placeholder="Enter your Last Name" />
											<span id="lastNameError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Username<span
												class="text-danger">*</span></label>
											<form:input path="username" type="text" class="form-control"
												id="username" placeholder="Set your Username" />
											<span id="usernameError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Password<span
                                                class="text-danger">*</span></label>
                                            <form:input path="password" type="password"
                                                class="form-control" id="password"
                                                placeholder="Set your password" />
                                            <span id="password-error" style="color: red; display: none;"></span>
                                            <span id="passwordError" class="text-danger1"></span>
                                        </div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Confirm Password<span
												class="text-danger">*</span></label> <input name="confirmPassword"
												type="password" class="form-control" id="confirmPassword"
												placeholder="Confirm Password" />
												<span id="validationMessage"></span>
										</div>	
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseTwo')">Contact
							Details</button>
					</h2>

					<div id="panelsStayOpen-collapseTwo"
						class="accordion-collapse collapse">
						<hr class="my-0">
						<div class="card-body pass-security">
							<div class="accordion-body mt-3">
								<div class="card-body personal-info">
									<div class="main-content">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Email<span
														class="text-danger">*</span></label>
													<form:input path="email" type="email" class="form-control"
														id="email" placeholder="Email" />
													<span id="emailError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mobile<span
														class="text-danger">*</span></label>
													<form:input path="mobile" type="tel" class="form-control"
														id="mobile" placeholder="Mobile" />
													<span id="mobileError" class="text-danger1"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mt-5 mb-5 text-center"
					style="display: flex; justify-content: center">
					<span id="validationError"  style="color:#ff000087; display:none;"><b>Please fill  all the required fields before submitting!</b></span>
				</div>
			<div class="mt-5 mb-5 text-center"
				style="display: flex; justify-content: center">
				<button id="submitButton" type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form:form>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/customers-create-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
	<script type="text/javascript" src="js/staffRegister.js"></script>
</body>

</html>