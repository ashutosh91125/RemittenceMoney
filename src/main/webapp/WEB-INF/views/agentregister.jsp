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
<title>Agent Register</title>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">

<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2.min.css">

<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEJr1X2X-0yyJ9s5ANx6kPqcp8TDCwNjdbREKxQl11jOlWEeUwzoytbDxs9yE"
	crossorigin="anonymous"> -->

<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js'></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Feather Icons (optional for search icon) -->
<script src="https://unpkg.com/feather-icons"></script>
<link rel="stylesheet" type="text/css" href="css/common.css">






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
<script type="text/javascript" src="js/commons.js"></script>
<script>
function registerAgent() {
	if(!validation($("#agentForm")))  {
        return false;  
    }
    const formData = $("#agentForm").serialize(); // Serialize form data for submission
    $('#loader').show();
    $('#submitButton').prop('disabled', true);
    $.ajax({
        url: "/api/v1/agent",
        type: "POST",
        contentType: "application/x-www-form-urlencoded",
        data: formData,
        success: function(response) {
            $('#loader').hide();
            $('#submitButton').prop('disabled', false);
            alert(response);
            window.location.href = "/agentlist";
//             $('#body').html(response.body.html);
        },
        error: function(xhr) {
            $('#loader').hide();
            $('#submitButton').prop('disabled', false);
            alert("Error: " + xhr.responseText);
        }
    });
}



$(document).ready(function() {
$('#countries').on('change', function() {
    let countryDependent = $(this).val();
    $('#currencies').empty();
    
    if (countryDependent) {
        let currencyDependent = countryDependent + "C";
        $.ajax({
            url: '/api/enumEntities/dependent',
            type: 'GET',
            data: { dependent: currencyDependent },
            success: function(data) {
                $.each(data, function(index, enumValue) {
                    $('#currencies').append('<option value="' + enumValue.valueId + '">' + enumValue.description + '</option>');
                });
            },
            error: function() {
                console.error("Error fetching currencies for the selected country.");
            }
        });
    }
$('#state').empty().append('<option value="" disabled selected>Select State</option>');     
    if (countryDependent) {
        let currencyDependent = countryDependent;
        $.ajax({
            url: '/api/enumEntities/dependent',
            type: 'GET',
            data: { dependent: currencyDependent },
            success: function(data) {
                $.each(data, function(index, enumValue) {
                    $('#state').append('<option value="' + enumValue.valueId + '">' + enumValue.description + '</option>');
                });
            },
            error: function() {
                console.error("Error fetching currencies for the selected country.");
            }
        });
    }
});
});	

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
            event.preventDefault(); 
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

    const form = document.querySelector("form"); 
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
						<h5 class="m-b-10">Agent</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/welcome">Home</a></li>
						<li class="breadcrumb-item">Agent Register</li>
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
						<%--
						<div
							class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
							<a href="javascript:void(0);"
								class="btn btn-primary successAlertMessage"> <i
								class="feather-user-plus me-2"></i> <span>Add Agent</span>
							</a>
						</div> --%>
						<div>
							<a onclick="goBack()" class="back-btn">
   								 <i class="bi bi-arrow-left-circle text-primary normal-icon"></i>
    							 <i class="bi bi-arrow-left-circle-fill text-primary hover-icon"></i>
							</a>
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
		</div>
		<div class="spinner-container" id="loader">
			<div class="spinner-border text-primary" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>

		<!-- <script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-pzjw8f+ua7Kw1TIq0FB2a7oI4GvYbgPpQXqzZyoxFQsF3jyBzJrb8tO9gW0Gi7km"
			crossorigin="anonymous"></script> -->

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<form:form id="agentForm" modelAttribute="agent"
			onsubmit="event.preventDefault(); registerAgent();">
			<form:hidden path="isValid" value="true" />
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseOne')">Agent
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
											<label class="form-label">Agent Name<span
												class="text-danger">*</span></label>
											<form:input path="agentName" type="text" class="form-control"
												id="agentName" placeholder="Agent Name"
												oninput="validateLengthWithMaxMessage('agentName', 60, 'agentNameError')" />
											<span id="agentNameError" style="color: red;"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Agent Display Name<span
												class="text-danger">*</span></label>
											<form:input path="agentDisplayName" type="text"
												class="form-control" id="agentDisplayName"
												placeholder="Agent Display Name" />
											<span id="agentDisplayNameError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Country<span
												class="text-danger">*</span></label>
											<form:select path="countries" class="form-select"  multiple="false" id="countries" style="font-size: inherit;">
												<form:option value="" disabled="true" selected="true">Select Country</form:option>
												<form:options items="${countryList}" itemValue="valueId"
													itemLabel="description" />
											</form:select>
											<span id="countriesError" class="text-danger1"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Country Currency<span
												class="text-danger">*</span></label>
											<form:select path="currencies" id="currencies"
												 class="form-select" style="font-size: inherit;" 
												multiple="false">
												<form:option value="" disabled="true" selected="true" >Select Currency</form:option>
												<form:options items="${currencyList}" itemValue="valueId"
													itemLabel="description" />
											</form:select>
											<span id="currenciesError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">State</label>
											<form:select path="state" id="state"  class="form-select"  multiple="false" style="font-size: inherit;">
												<form:option value="" disabled="true" selected="true">Select State</form:option>
												<form:options items="${stateList}" itemValue="valueId"
													itemLabel="description" />
											</form:select>
											<span id="stateError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">City<span
												class="text-danger">*</span></label>
											<form:input path="city" type="text" class="form-control"
												id="city" placeholder="City" />
											<span id="cityError" class="text-danger1"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 1<span
												class="text-danger">*</span></label>
											<form:input path="address1" type="text" class="form-control"
												id="address1" placeholder="Address1" />
											<span id="address1Error" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 2<span
												class="text-danger">*</span></label>
											<form:input path="address2" type="text" class="form-control"
												id="address2" placeholder="Address2" />
											<span id="address2Error" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 3</label>
											<form:input path="address3" type="text" class="form-control"
												id="address3" placeholder="Address3" />
											<span id="address3Error" class="text-danger1"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Zip/PoBox<span
												class="text-danger">*</span></label>
											<form:input path="zip" type="text" class="form-control"
												id="zip" placeholder="Zip/PoBox" />
											<span id="zipError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">TimeZone<span
												class="text-danger">*</span></label>
											<form:select path="timeZone"  class="form-select" style="font-size: inherit;"  multiple="false" id="timeZone" >
												<form:option value="" disabled="true" selected="true">Select Timezone</form:option>
												<form:options items="${timezoneList}" itemValue="valueId"
													itemLabel="description" />
											</form:select>
											<span id="timeZoneError" class="text-danger1"></span>
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
													<label class="form-label">Mobile</label>
													<form:input path="mobile" type="tel" class="form-control"
														id="mobile" placeholder="Mobile" />
													<span id="mobileError" class="text-danger1"></span>

												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Phone<span
														class="text-danger">*</span></label>
													<form:input path="phone" type="tel" class="form-control"
														id="phone" placeholder="Phone" />
													<span id="phoneError" class="text-danger1"></span>
												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Contact Person<span
														class="text-danger">*</span></label>
													<form:input path="contactPerson" type="tel"
														class="form-control" id="contactPerson"
														placeholder="Contact Person" />
													<span id="contactPersonError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mis Email Id<span
														class="text-danger">*</span></label>
													<form:input path="misEmailId" type="email"
														class="form-control" id="misEmailId"
														placeholder="Mis Email Id" />
													<span id="misEmailIdError" class="text-danger1"></span>
												</div>
											</div>
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
							onclick="toggleDiv('panelsStayOpen-collapseThree')">Regulatory
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseThree"
						class="accordion-collapse collapse">
						<div class="accordion-body mt-3" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Company Id<span
														class="text-danger">*</span></label>
													<form:input path="agentId" type="text" class="form-control"
														id="agentId" placeholder="Enter Company Id"
														oninput="validateLengthWithMaxMessage('agentId', 6, 'agentIdError')" />
													<span id="agentIdError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Agent Location Id<span
														class="text-danger">*</span>
													</label>
													<form:input path="branchLocationId" type="number"
														class="form-control" id="branchLocationId"
														placeholder="Enter Agent Location Id"
														oninput="validateLengthWithMaxMessage('branchLocationId', 6, 'branchLocationIdError')" />
													<span id="branchLocationIdError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Licence No.<span
														class="text-danger">*</span></label>
													<form:input path="licenceNo" type="text"
														class="form-control" id="licenceNo"
														placeholder="Licence No." />
													<span id="licenceNoError" class="text-danger1"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Tax Applicable<span
													class="text-danger">*</span></label>
												<form:select path="taxApplicable" class="form-control"
													id="taxApplicable">
													<form:option value="0">No</form:option>
													<form:option value="1">Yes</form:option>
												</form:select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Working Hours<span
													class="text-danger">*</span></label>
												<form:select path="workingHours"  class="form-select"  multiple="false" id="working" style="font-size: inherit;">
													<form:option value="" disabled="true" selected="true">Select Working Hours</form:option>
													<form:options items="${workingHoursList}"
														itemValue="valueId" itemLabel="description" />
												</form:select>
												<span id="workingError" class="text-danger1"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Tax Identification Number<span
													class="text-danger">*</span>
												</label>
												<form:input path="taxIdentificationNumber" type="text"
													class="form-control" id="taxIdentificationNumber"
													placeholder="Tax Identification Number" />
												<span id="taxIdentificationNumberError" class="text-danger1"></span>
											</div>
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
                        onclick="toggleDiv('panelsStayOpen-collapseFour')">Funding Bank Details</button>
                </h2>
                <div id="panelsStayOpen-collapseFour"
                    class="accordion-collapse collapse">
                    <div class="accordion-body" style="background: aliceblue;">
                        <div class="card-body personal-info">
                            <div class="main-content">
                                <div class="card-body pass-security">
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Bank Name<span
                                                    class="text-danger">*</span></label>
                                                <form:input path="BankName" type="text" class="form-control"
                                                    id="BankName" placeholder="Enter bank name" />
                                                <span id="BankNameError" class="text-danger1"></span>
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Branch Name<span
                                                    class="text-danger">*</span></label>
                                                <form:input path="branchName" type="text" class="form-control"
                                                    id="branchName" placeholder="Enter branch name" />
                                                <span id="branchNameError" class="text-danger1"></span>
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Account Number<span
                                                    class="text-danger">*</span></label>
                                                <form:input path="accountNumber" type="number" class="form-control"
                                                    id="accountNumber" placeholder="Enter account number" />
                                                <span id="accountNumberError" class="text-danger1"></span>
                                            </div>
                                        </div>
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
							onclick="toggleDiv('panelsStayOpen-collapseFive')">Credit
							Limit</button>
					</h2>
					<div id="panelsStayOpen-collapseFive"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Daily<span
														class="text-danger">*</span></label>
													<form:input path="daily" type="number" class="form-control"
														id="daily" placeholder="Daily" />
													<span id="dailyError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Settlement Mode<span
														class="text-danger">*</span></label>
													<form:select path="settlementMode" class="form-select" 
														 id="settlementMode" style="font-size: inherit;">
														<form:option value="" disabled="true" selected="true">Select Settlement Mode</form:option>
														<form:option value="Rolling">Rolling</form:option>
														<form:option value="Expire Everyday">Expire Everyday</form:option>
													</form:select>
													<span id="settlementModeError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Settlement Type<span
														class="text-danger">*</span></label>
													<form:select path="settlementType" class="form-select" 
														id="settlementType" style="font-size: inherit;">
														<form:option value="" disabled="true" selected="true">Select Settlement Type</form:option>
														<form:option value="Pre-Funding">Pre-Funding</form:option>
														<form:option value="Post-Funding">Post-Funding</form:option>
													</form:select>

													<span id="settlementTypeError" class="text-danger1"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Status<span
														class="text-danger">*</span></label>
													<form:select path="creditLimitStatus"  class="form-select" 
														 id="status" style="font-size: inherit;">
														<%-- <form:option value="" disabled="true" selected="true">Select Status</form:option> --%>
														<form:option value="0">Inactive</form:option>
														<form:option value="1">Active</form:option>
													</form:select>
													<span id="statusError" class="text-danger1"></span>
												</div>
											</div>
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
							onclick="toggleDiv('panelsStayOpen-collapseSix')">Customer
							Txn Limit</button>
					</h2>
					<div id="panelsStayOpen-collapseSix"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Transaction<span
														class="text-danger">*</span></label>
													<form:input path="perTransactionLimit" type="number"
														class="form-control" id="perTransactionLimit"
														placeholder="Per Transaction" />
													<span id="perTransactionLimitError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Day<span
														class="text-danger">*</span></label>
													<form:input path="perDayLimit" type="number"
														class="form-control" id="perDayLimit"
														placeholder="Per Day" />
													<span id="perDayLimitError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Month<span
														class="text-danger">*</span></label>
													<form:input path="perMonthLimit" type="number"
														class="form-control" id="perMonthLimit"
														placeholder="Per Month" />
													<span id="perMonthLimitError" class="text-danger1"></span>
												</div>
											</div>
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
							onclick="toggleDiv('panelsStayOpen-collapseSeven')">Api
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseSeven"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Grant Type<span
														class="text-danger">*</span></label>
													<form:input path="grantType" type="text"
														class="form-control" id="grantType"
														placeholder="Grant Type"
														oninput="validateLengthWithMaxMessage('grantType', 10, 'grantTypeError')" />
													<span id="grantTypeError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Scope<span
														class="text-danger">*</span></label>
													<!-- <label id="scopeValidation" style="color:red; display:none;">Scope
														(max 60 characters):</label> -->
													<form:input path="scope" type="text" class="form-control"
														id="scope" placeholder="Scope"
														oninput="validateLengthWithMaxMessage('scope', 60, 'scopeError')" />
													<span id="scopeError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">

													<label class="form-label">Client Id<span
														class="text-danger">*</span></label>
													<!--  <label id="clientIdValidation" style="color:red; display:none;">Client
														Id (max 60 characters):</label> -->
													<form:input path="clientId" type="text"
														class="form-control" id="clientId" placeholder="Client Id"
														oninput="validateLengthWithMaxMessage('clientId', 60, 'clientIdValidation')" />
													<span id="clientIdError" class="text-danger1"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">

													<label class="form-label">Client Secret<span
														class="text-danger">*</span></label>
													<form:input path="clientSecret" type="text"
														class="form-control" id="clientSecret"
														placeholder="Client Secret"
														oninput="validateLengthWithMaxMessage('clientSecret', 60, 'clientSecretValidation')" />
													<span id="clientSecretError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">

													<label class="form-label">API Username<span
														class="text-danger">*</span></label>
													<form:input path="apiUsername" type="text"
														class="form-control" id="adminUserName"
														placeholder="Set Username"
														oninput="validateLengthWithMaxMessage('adminUserName', 60, 'adminUserNameError')" />
													<span id="adminUserNameError" style="color: red;"></span>
												</div>
											</div>

											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">API Password<span
														class="text-danger">*</span></label>
													<form:input path="apiPassword" type="password"
														class="form-control" id="adminPassword"
														placeholder="Set Password" autocomplete="new-password"
														oninput="validateLengthWithMaxMessage('adminPassword', 60, 'adminPasswordError')" />
													<span id="adminPasswordError" style="color: red;"></span>
												</div>
											</div>

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
							onclick="toggleDiv('panelsStayOpen-collapseEight')">Login
							Credentials</button>
					</h2>
					<div id="panelsStayOpen-collapseEight"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Username<span
														class="text-danger">*</span></label>
													<form:input path="username" type="text"
														class="form-control" id="userName"
														placeholder="Set Username" />
													<span id="userNameError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Password<span
														class="text-danger">*</span></label>
													<form:input path="password" type="password"
														class="form-control" id="password"
														placeholder="Set Password" autocomplete="new-password"/>
													<span id="password-error"
														style="color: red; display: none;"></span> <span
														id="passwordError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Confirm Password<span
														class="text-danger">*</span></label> <input name="confirmPassword"
														type="password" class="form-control" id="confirmPassword" autocomplete="new-password"
														placeholder="Confirm Password" /> <span
														id="validationMessage"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-3 mb-3 text-center"
					style="display: flex; justify-content: center">
					<span id="validationError" style="color: #ff000087; display: none;"><b>Please
							fill all the required fields before submitting!</b></span>
				</div>
				<div class="mt-3 mb-3 text-center"
					style="display: flex; justify-content: center">
					<button id="submitButton" type="submit" class="btn btn-primary mb-3">Submit</button>
				</div>
			</div>
		</form:form>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
	<script type="text/javascript" src="js/agentRegister.js"></script>

</body>

</html>