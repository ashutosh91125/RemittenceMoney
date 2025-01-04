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
<title>LuLu Money || Agent Register</title>
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
<!-- <script type="text/javascript" src="js/customervalidation.js"></script> -->
<script>
function updateAgent() {
	
    const formData = $("#agentForm").serialize(); // Serialize form data for submission
    const id= $("#id").val();
    $('#loader').show();
    $('#submitButton').prop('disabled', true);
    $.ajax({
        url: "/view-agent-update?id=" + id,
        type: "POST",
        contentType: "application/x-www-form-urlencoded",
        data: formData,
        success: function(response) {
            $('#loader').hide();
            $('#submitButton').prop('disabled', false);
            $('body').html(response);
//             alert(response);
        },
        error: function(xhr) {
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


$(document).ready(function () {
    const countries = $('#countries').val();
    const currencies = $('#currencies').val();
    const state = $('#state').val();
    const timeZone = $('#timeZone').val();

    $.ajax({
        url: '/api/enumEntities/' + 'country' + '/values/' + countries,
        type: 'GET',
        success: function (description) {
        	 $('#countries').val(description);		
        },
        error: function () {
            console.error("Error fetching enum value for key:", "country", "valueId:", countries);
        }
    });
    $.ajax({
        url: '/api/enumEntities/' + 'currency' + '/values/' + currencies,
        type: 'GET',
        success: function (description) {
        	 $('#currencies').val(description);
				
        },
        error: function () {
            console.error("Error fetching enum value for key:", "currency", "valueId:", currencies);
        }
    });
    $.ajax({
        url: '/api/enumEntities/' + 'state' + '/values/' + state,
        type: 'GET',
        success: function (description) {
        	 $('#state').val(description);
				
        },
        error: function () {
            console.error("Error fetching enum value for key:", "state", "valueId:", state);
        }
    });
    $.ajax({
        url: '/api/enumEntities/' + 'timezone' + '/values/' + timeZone,
        type: 'GET',
        success: function (description) {
        	 $('#timeZone').val(description);
				
        },
        error: function () {
            console.error("Error fetching enum value for key:", "timezone", "valueId:", timeZone);
        }
    });

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
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Add Agent</li>
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
								class="feather-user-plus me-2"></i> <span>Add Agent</span>
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

		<%-- 			<jsp:include page="customersearch.jsp"></jsp:include> --%>

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
		<form:form id="agentForm" modelAttribute="agent" onsubmit="event.preventDefault(); updateAgent();">
			<form:hidden path="isValid" value="true" />
			<form:hidden path="id" value="" id="id"/>
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
                                            <form:input path="agentName" type="text"
                                                class="form-control" id="agentName"
                                                placeholder="Agent Name" readonly="true" required='true' />
                                            <span id="agentNameError" class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Country<span
												class="text-danger">*</span></label>
											<input value="${agent.countries }" class="form-control" id="countries" readonly="true" required='true' />
											<span id="countriesError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Country Currency<span
												class="text-danger">*</span></label>
											<input value="${agent.currencies}" id="currencies"
												class="form-control"  readonly="true" required='true' />
											<span id="currenciesError" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">State</label>
                                            <input value="${agent.state}" id="state" class="form-control"  readonly="true" required='true' />   
                                            <span id="stateError" class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Agent Display Name<span
												class="text-danger">*</span></label>
											<form:input path="agentDisplayName" type="text"
												class="form-control" id="agentDisplayName"
												placeholder="Agent Display Name" readonly="true" required='true' />
											<span id="agentDisplayNameError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 1<span
												class="text-danger">*</span></label>
											<form:input path="address1" type="text" class="form-control"
												id="address1" placeholder="Address1" readonly="true" required='true' />
											<span id="address1Error" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 2<span
												class="text-danger">*</span></label>
											<form:input path="address2" type="text" class="form-control"
												id="address2" placeholder="Address2" readonly="true" required='true'/>
											<span id="address2Error" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 3</label>
											<form:input path="address3" type="text" class="form-control"
												id="address3" placeholder="Address3" readonly="true" required='true'/>
											<span id="address3Error" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">City<span
												class="text-danger">*</span></label>
											<form:input path="city" type="text" class="form-control"
												id="city" placeholder="City" readonly="true" required='true' />
											<span id="cityError" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">

									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Zip/PoBox</label>
											<form:input path="zip" type="text" class="form-control"
												id="zip" placeholder="Zip/PoBox" readonly="true" required='true' />
											<span id="zipError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">TimeZone<span
												class="text-danger">*</span></label>
											<input value="${agent.timeZone }" class="form-control" readonly="true" required='true' id="timeZone"/>
											<span id="timeZoneError" class="text-danger"></span>
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
														id="email" placeholder="Email" readonly="true" required='true' />
													<span id="emailError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mobile</label>
													<form:input path="mobile" type="tel" class="form-control"
														id="mobile" placeholder="Mobile" readonly="true" required='true' />
													<span id="mobileError" class="text-danger"></span>

												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Phone<span
														class="text-danger">*</span></label>
													<form:input path="phone" type="tel" class="form-control"
														id="phone" placeholder="Phone" readonly="true" required='true' />
													<span id="phoneError" class="text-danger"></span>
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
														placeholder="Contact Person" readonly="true" required='true' />
													<span id="contactPersonError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mis Email Id<span
														class="text-danger">*</span></label>
													<form:input path="misEmailId" type="email"
														class="form-control" id="misEmailId"
														placeholder="Mis Email Id" readonly="true" required='true' />
													<span id="misEmailIdError" class="text-danger"></span>
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
													<label class="form-label">Tax Identification Number<span
														class="text-danger">*</span>
													</label>
													<form:input path="taxIdentificationNumber" type="text"
														class="form-control" id="taxIdentificationNumber"
														placeholder="Tax Identification Number" readonly="true" required='true' />
													<span id="taxIdentificationNumberError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Licence No.<span
														class="text-danger">*</span></label>
													<form:input path="licenceNo" type="text"
														class="form-control" id="licenceNo"
														placeholder="Licence No." readonly="true" required='true' />
													<span id="licenceNoError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Tax Applicable<span
														class="text-danger">*</span></label>
													<form:input path="taxApplicable" class="form-control" id="taxApplicable" readonly="true" required='true'/>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Working Hours<span
													class="text-danger">*</span></label>
												<form:input path="workingHours" class="form-control"  id="working" readonly="true" required='true'/>
												<span id="workingError" class="text-danger"></span>
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
							onclick="toggleDiv('panelsStayOpen-collapseFour')">Credit
							Limit</button>
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
													<label class="form-label">Daily<span
														class="text-danger">*</span></label>
													<form:input path="daily" type="number" class="form-control"
														id="daily" placeholder="Daily" readonly="true" required='true' />
													<span id="dailyError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Settlement Mode<span
														class="text-danger">*</span></label>
													    <form:input path="settlementMode" class="form-control"  id="settlementMode" readonly="true" required='true'/>
													    <span id="settlementModeError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Settlement Type<span
														class="text-danger">*</span></label>	
												    <form:input path="settlementType" class="form-control"  id="settlementType" readonly="true" required='true'/>
													<span id="settlementTypeError" class="text-danger"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Status<span
														class="text-danger">*</span></label>
													<form:input path="status" class="form-control"  id="status" readonly="true" required='true'/>
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
							onclick="toggleDiv('panelsStayOpen-collapseFive')">Customer
							Txn Limit</button>
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
													<label class="form-label">Per Transaction<span
														class="text-danger">*</span></label>
													<form:input path="perTransactionLimit" type="number"
														class="form-control" id="perTransactionLimit"
														placeholder="Per Transaction" readonly="true" required='true' />
													<span id="perTransactionLimitError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Day<span
														class="text-danger">*</span></label>
													<form:input path="perDayLimit" type="number"
														class="form-control" id="perDayLimit"
														placeholder="Per Day" readonly="true" required='true' />
													<span id="perTransactionLimitError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Month<span
														class="text-danger">*</span></label>
													<form:input path="perMonthLimit" type="number"
														class="form-control" id="perMonthLimit"
														placeholder="Per Month" readonly="true" required='true' />
													<span id="perTransactionLimitError" class="text-danger"></span>
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
							onclick="toggleDiv('panelsStayOpen-collapseSix')">Credentials</button>
					</h2>
					<div id="panelsStayOpen-collapseSix"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<%-- <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Grant_Type<span
														class="text-danger">*</span></label>
													<form:input path="grantType" type="text"
														class="form-control" id="grantType"
														placeholder="Grant Type" />
													<span id="grantTypeError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Scope<span
														class="text-danger">*</span></label>
													<form:input path="scope" type="text" class="form-control"
														id="scope" placeholder="Scope" />
													<span id="scopeError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Client_Id<span
														class="text-danger">*</span></label>
													<form:input path="clientId" type="text"
														class="form-control" id="clientId" placeholder="Client Id" />
													<span id="clientIdError" class="text-danger"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Client_Secret<span
														class="text-danger">*</span></label>
													<form:input path="clientSecret" type="text"
														class="form-control" id="clientSecret"
														placeholder="Client Secret" />
													<span id="clientSecretError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Admin User name<span
														class="text-danger">*</span></label>
													<form:input path="adminUserName" type="text"
														class="form-control" id="adminUserName"
														placeholder="Admin User Name" />
													<span id="adminUserNameError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Admin Password<span
														class="text-danger">*</span></label>
													<form:input path="adminPassword" type="text"
														class="form-control" id="adminPassword"
														placeholder="Admin Password" />
													<span id="adminPasswordError" class="text-danger"></span>
												</div>
											</div> --%>
											<div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Username<span
                                                        class="text-danger">*</span></label>
                                                    <form:input path="username" readonly="true" required='true' type="text"
                                                        class="form-control" id="adminUserName"
                                                        placeholder="Set Username" />
                                                    <span id="adminUserNameError" class="text-danger"></span>
                                                </div>
                                            </div>
                                          <%--   <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Password<span
                                                        class="text-danger">*</span></label>
                                                    <form:input path="password" type="password"
                                                        class="form-control" id="adminPassword"
                                                        placeholder="Set Password" readonly="true" required='true' />
                                                    <span id="adminPasswordError" class="text-danger"></span>
                                                </div>
                                            </div> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%-- <div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseSeven')">Audit
							Tails</button>
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
													<label class="form-label">Remarks<span
														class="text-danger">*</span></label>
													<form:input path="remarks" type="text" class="form-control"
														id="remarks" placeholder="Remarks" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Status <span
														class="text-danger">*</span></label>
													<form:select path="statusFlag" class="form-control"
														data-select2-selector="icon" id="statusFlag">
														<form:option value="false">Inactive</form:option>
														<form:option value="true">Active</form:option>
													</form:select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> --%>
			</div>
			<div class="mt-5 mb-5 text-center"
				style="display: flex; justify-content: center">
				<button id="submitButton" type="submit" class="btn btn-primary">Update</button>
			</div>
		</form:form>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>




	<!--! ================================================================ !-->
	<!--! [End] Theme Customizer !-->
	<!--! ================================================================ !-->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<!-- vendors.min.js {always must need to be top} -->
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<!--! END: Vendors JS !-->
	<!--! BEGIN: Apps Init  !-->
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/customers-create-init.min.js"></script>
	<!--! END: Apps Init !-->
	<!--! BEGIN: Theme Customizer  !-->
	<script src="assets/js/theme-customizer-init.min.js"></script>
	<!--! END: Theme Customizer !-->
</body>

</html>