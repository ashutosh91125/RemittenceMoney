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
<title>LuLu Money || Branch Register</title>
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
function registerBranch() {
	 if(!validation($("#branchForm")))  {
        return false;  
    } 
   const formData = $("#branchForm").serialize(); // Serialize form data for submission
   const id = $("#id").val();
   let url = "/api/v1/branch";
   let method = "POST";
   if (id) {
       url = '/api/v1/branch/'+id;
       method = "PUT"; // Change to update method
   }
   $('#loader').show();
   $('#submitButton').prop('disabled', true);
   $.ajax({
       url: url,
       type: method,
       contentType: "application/x-www-form-urlencoded",
       data: formData,
       success: function(response) {
           $('#loader').hide();
           $('#submitButton').prop('disabled', false);
           alert(response);
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

function toggleRemarks() {
    
    let status = document.getElementById('statusFlag').value;
    console.log(status); 
    
    let remarksSection = document.getElementById('remarksSection');
    if (status === 'false') {
        remarksSection.style.display = 'block';
    } else {
        remarksSection.style.display = 'none';
    }
}

document.addEventListener('DOMContentLoaded', function() {
    console.log("Page Loaded");
    toggleRemarks();  // Call toggleRemarks to show/hide the remarks section on page load
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
						<h5 class="m-b-10">Branch</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Add Branch</li>
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
								class="feather-user-plus me-2"></i> <span>Add Branch</span>
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
		<form:form id="branchForm" modelAttribute="branch"
			onsubmit="event.preventDefault(); registerBranch();">
			<form:hidden path="id" value="" id="id" />
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseOne')">Branch
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
											<label class="form-label">Branch Name<span
												class="text-danger">*</span></label>
											<form:input path="branchName" type="text"
												class="form-control" id="branchName"
												placeholder="Branch Name" />
											<span id="branchNameError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Agent<span
												class="text-danger">*</span></label>
											<form:select path="agent" class="form-control"
												data-select2-selector="icon" multiple="false" id="agent">
												<form:option value="" disabled="true" selected="true">Select Agent</form:option>
												<form:options items="${agentList}" itemValue="agentId"
													itemLabel="agentName" />
											</form:select>
											<span id="agentError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Branch Type<span
												class="text-danger">*</span></label>
											<form:select path="branchType" class="form-control"
												data-select2-selector="icon" id="branchType">
												<form:option value="" disabled="true" selected="true">Select Branch Type</form:option>
												<form:option value="Remittance">Remittance</form:option>
												<form:option value="FC">FC</form:option>
												<form:option value="Both">Both</form:option>
											</form:select>
											<span id="branchTypeError" class="text-danger1"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Branch Channel<span
												class="text-danger">*</span></label>
											<form:select path="branchChannel" class="form-control"
												data-select2-selector="icon" id="branchChannel">
												<form:option value="" disabled="true" selected="true">Select Branch Chhanel</form:option>
												<form:option value="Web">Web</form:option>
												<form:option value="Digital">Digital</form:option>
												<form:option value="Mobile">mobile</form:option>
												<form:option value="FC Wholesale Branch">FC Wholesale Branch</form:option>
											</form:select>
											<span id="branchChannelError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Branch Display Name<span
												class="text-danger">*</span></label>
											<form:input path="branchDisplayName" type="text"
												class="form-control" id="branchDisplayName"
												placeholder="Branch Display Name" />
											<span id="branchDisplayNameError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 1<span
												class="text-danger">*</span></label>
											<form:input path="address1" type="text" class="form-control"
												id="address1" placeholder="Address1" />
											<span id="address1Error" class="text-danger1"></span>
										</div>
									</div>
								</div>
								<div class="row">
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
											<label class="form-label">Zip/PoBox</label>
											<form:input path="zip" type="text" class="form-control"
												id="zip" placeholder="Zip/PoBox" />
											<span id="zipError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Branch Channel Id</label>
											<form:input path="branchChannelId" type="text"
												class="form-control" id="branchChannelId"
												placeholder="Branch Channel Id" />
											<span id="branchChannelIdError" class="text-danger1"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Branch Mode<span
												class="text-danger">*</span></label>
											<form:select path="branchMode" class="form-control"
												data-select2-selector="icon" id="branchMode">
												<form:option value="Head Office">Head Office</form:option>
												<form:option value="Transaction">Transaction</form:option>
											</form:select>
											<span id="branchModeError" class="text-danger1"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">State<span
												class="text-danger">*</span></label>
											<form:select path="state" class="form-control"
												data-select2-selector="icon" multiple="false" id="state">
												<form:option value="" disabled="true" selected="true">Select State</form:option>
												<form:options items="${stateList}" itemValue="valueId"
													itemLabel="description" />
											</form:select>
											<span id="stateError" class="text-danger1"></span>
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
													<label class="form-label">Branch Location Id<span
														class="text-danger">*</span>
													</label>
													<form:input path="branchLocationId" type="number"
														class="form-control" id="branchLocationId"
														placeholder="Branch Location Id" />
													<span id="branchLocationIdError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Licence Number<span
														class="text-danger">*</span></label>
													<form:input path="licenceNo" type="text"
														class="form-control" id="licenceNo"
														placeholder="Licence Number" />
													<span id="licenceNoError" class="text-danger1"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Outlet Code<span
														class="text-danger">*</span></label>
													<form:input path="outletCode" type="text"
														class="form-control" id="outletCode"
														placeholder="Outlet Code" />
													<span id="outletCodeError" class="text-danger1"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Working Hours<span
													class="text-danger">*</span></label>
												<form:select path="workingHours" class="form-control"
													data-select2-selector="icon" multiple="false"
													id="workingHours">
													<form:option value="" disabled="true" selected="true">Select Working Hours</form:option>
													<form:options items="${workingHoursList}"
														itemValue="valueId" itemLabel="description" />
												</form:select>
												<span id="workingHoursError" class="text-danger1"></span>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${isUpdate }">
				<div class="accordion-item" style="background: aliceblue;">
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
										<%-- <div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Created By<span
														class="text-danger">*</span></label>
													<form:input path="createdBy" type="text"
														class="form-control" id="createdBy"
														placeholder="Created By" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Created On<span
														class="text-danger">*</span></label>
													<form:input path="createdOn" type="text"
														class="form-control" id="createdOn"
														placeholder="Created On" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified By<span
														class="text-danger">*</span></label>
													<form:input path="modifiedBy" type="text"
														class="form-control" id="modifiedBy"
														placeholder="Modified By" readonly="true"/>
												</div>
											</div>
										</div> --%>
										
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Status <span
														class="text-danger">*</span></label>
													<form:select path="status" class="form-control"
														data-select2-selector="icon" id="statusFlag"
														onchange="toggleRemarks()">
														<form:option value="false">Inactive</form:option>
														<form:option value="true">Active</form:option>
													</form:select>
												</div>
											</div>

											<div class="col-xl-4" id="remarksSection" style="display:none">
												<div class="mb-4">
													<label class="form-label">Remarks <span
														class="text-danger">*</span></label>
													<form:input path="remarks" type="text" class="form-control"
														id="remarks" placeholder="Remarks" />
												</div>
											</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
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
	<script type="text/javascript" src="js/branchRegister.js"></script>
</body>

</html>