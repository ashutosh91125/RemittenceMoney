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
<title>LuLu Money || Customers Create</title>
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
</style>

<script>
	function copyAddress() {
		const checkbox = document.getElementById("sameAsCurrentAddress");
		if (checkbox.checked) {
			document.getElementById("permanentBuildingName").value = document
					.getElementById("currentBuildingName").value;
			document.getElementById("permanentStreetName").value = document
					.getElementById("currentStreetName").value;
			document.getElementById("permanentLandmark").value = document
					.getElementById("currentLandmark").value;
			document.getElementById("permanentCity").value = document
					.getElementById("currentCity").value;
			document.getElementById("permanentDistrict").value = document
					.getElementById("currentDistrict").value;
			document.getElementById("permanentState").value = document
					.getElementById("currentState").value;
			document.getElementById("permanentZip").value = document
					.getElementById("currentZip").value;


			const currentCountry = document.getElementById("currentCountry").value;
			document.getElementById("permanentCountry").value = currentCountry;
		} else {

			document.getElementById("permanentBuildingName").value = "";
			document.getElementById("permanentStreetName").value = "";
			document.getElementById("permanentLandmark").value = "";
			document.getElementById("permanentCity").value = "";
			document.getElementById("permanentDistrict").value = "";
			document.getElementById("permanentState").value = "";
			document.getElementById("permanentZip").value = "";
			document.getElementById("permanentCountry").selectedIndex = 0;
		}
	}
	function toggleDiv(divId) {
		const element = document.getElementById(divId);
		element.classList.toggle("show");
	}
	// Function to show/hide fields based on the selected idType
	function toggleFields() {
		const idType = document.getElementById('idType').value;

		// Show/hide fields based on idType value
		if (idType === '28') {
			// Show only the "idNumber" field
			document.getElementById('idNumberField').style.display = 'block';
			document.getElementById('idDetailsFields').style.display = 'none';
			document.getElementById('additionalIdDetails').style.display = 'none';
			document.getElementById('expiryAndStatusFields').style.display = 'none';
		} else if (idType === '2') {
			// Show all fields
			document.getElementById('idNumberField').style.display = 'block';
			document.getElementById('idDetailsFields').style.display = 'block';
			document.getElementById('additionalIdDetails').style.display = 'block';
			document.getElementById('expiryAndStatusFields').style.display = 'block';
		} else {
			// Hide all fields if no matching idType
			document.getElementById('idNumberField').style.display = 'none';
			document.getElementById('idDetailsFields').style.display = 'none';
			document.getElementById('additionalIdDetails').style.display = 'none';
			document.getElementById('expiryAndStatusFields').style.display = 'none';
		}
	}

	// Initial check to set visibility based on the default selected value
	document.addEventListener('DOMContentLoaded', function() {
		toggleFields();
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
						<h5 class="m-b-10">Customers</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Add Customer</li>
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
								class="feather-user-plus me-2"></i> <span>Add Customer</span>
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
			<!-- [ page-header ] end -->
			<!-- [ Main Content ] start -->

			<div class="container mx-0">
				<div class="row" style="display: flex; align-items: baseline;">
					<div class="col-xl-2">
						<label class=""> <input type="radio" name="form-radio"
							class="form-radio" value="Customer Number:" checked>
							Customer Number
						</label>
					</div>
					<div class="col-xl-1">
						<label class=""> <input type="radio" name="form-radio"
							class="form-radio" value="ID No:"> ID No
						</label>
					</div>
					<div class="col-xl-2">
						<label class=""> <input type="radio" name="form-radio"
							class="form-radio" value="Mobile Number:"> Mobile Number
						</label>
					</div>
					<div class="col-xl-2">
						<label class=""> <input type="radio" name="form-radio"
							class="form-radio" value="Customer Name:"> Customer Name
						</label>
					</div>

					<div class="col-xl-2">
						<div class="search-heading" id="search-heading">Customer
							Number:</div>
					</div>

					<div class="col-xl-3 ps-0">
						<div class="search-bar-container d-flex"
							style="display: flex; justify-content: space-around; align-items: center;">
							<input type="text" class="py-2" id="radio-search"
								placeholder="Search..." style="flex: 1;"> <span
								class="mt-2" style="margin-left: 8px;"><i
								class="feather-search"></i></span>
						</div>
					</div>

				</div>
			</div>
			<form:form modelAttribute="customer"
				action="${pageContext.request.contextPath}/createUser" method="post">
				<form:hidden path="channel" value="WEB" />
				<form:hidden path="agentLocationId" value="India" />

				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item" style="background: aliceblue;">
						<h2 class="accordion-header" id="customer_Id">
							<button class="accordion-button" type="button"
								style="background: aliceblue;"
								onclick="toggleDiv('panelsStayOpen-collapseOne')">Personal
								Details</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse">
							<div class="accordion-body" style="background: aliceblue;">

								<div class="main-content">
									<div
										class="mb-4 d-flex align-items-center justify-content-between">
										<h5 class="fw-bold mb-0 me-4">
											<span class="d-block mb-2">Personal Information:</span> <span
												class="fs-12 fw-normal text-muted text-truncate-1-line">Following
												information is publicly displayed, be careful! </span>
										</h5>
										<!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Add New</a> -->
									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Salutation<span
													class="text-danger">*</span></label>
												<form:input path="salutation" type="text"
													class="form-control" placeholder="salutation" />

											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">First Name</label>
												<form:input path="firstName" type="text"
													class="form-control" placeholder="First Name" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Middle Name</label>
												<form:input path="middleName" type="text"
													class="form-control" placeholder="Middle Name" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Last Name</label>
												<form:input path="lastName" type="text" class="form-control"
													placeholder="Last Name" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Preferred Name</label>
												<form:input path="preferredName" type="text"
													class="form-control" placeholder="Preferred Name" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Nationality <span
													class="text-danger">*</span></label>

												<form:input path="nationality" type="text"
													class="form-control" placeholder="nationality" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Nationality<span
													class="text-danger">*</span>
												</label>

												<form:input path="secondNationality" type="text"
													class="form-control" placeholder="First Name" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Native Region<span
													class="text-danger">*</span></label>
												<form:input path="nativeRegion" type="text"
													class="form-control" placeholder="Native Region" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Date of Birth</label>
												<form:input path="dateOfBirth" type="text"
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Birth<span
													class="text-danger">*</span></label>

												<form:input path="firstName" type="text"
													class="form-control" placeholder="firstName" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Place of Birth </label>
												<form:input path="placeOfBirth" type="text"
													class="form-control" placeholder="Place of Birth" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Resident Type Id<span
													class="text-danger">*</span></label>
												<form:input path="residentTypeId" type="text"
													class="form-control" placeholder="Resident Type Id" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Residence<span
													class="text-danger">*</span></label>
												<form:input path="countryOfResidence" type="text"
													class="form-control" placeholder="countryOfResidence" />
											</div>

										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Gender<span
													class="text-danger">*</span></label>
												<form:input path="gender" type="text" class="form-control"
													placeholder="gender" />
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mothers Maiden Name</label>
												<form:input path="mothersMaidenName" type="Text"
													class="form-control" placeholder="Mothers Maiden Name" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Primary Mobile Number</label>
												<form:input path="primaryMobileNumber" type="tel"
													class="form-control" placeholder="Primary Mobile Number" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Mobile Number</label>
												<form:input path="secondaryMobileNumber" type="tel"
													class="form-control" placeholder="Secondary Mobile Number" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Email<span
													class="text-danger">*</span></label>
												<form:input path="emailId" type="email" class="form-control"
													placeholder="Email" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Phone Number</label>
												<form:input path="phoneNumber" type="tel"
													class="form-control" placeholder="Phone Number" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Occupation Id</label>
												<form:input path="occupationId" type="text"
													class="form-control" placeholder="Occupation Id" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Political Exposed Person</label>

												<form:input path="politicalExposedPerson" type="text"
													class="form-control" placeholder="Political Exposed Person" />

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="accordion-item" style="background: aliceblue;">
						<h2 class="accordion-header" id="address_Id">
							<button class="accordion-button collapsed" type="button"
								style="background: aliceblue;"
								onclick="toggleDiv('panelsStayOpen-collapseTwo')">Address</button>
						</h2>

						<div id="panelsStayOpen-collapseTwo"
							class="accordion-collapse collapse">
							<hr class="my-0">
							<div class="card-body pass-security">
								<div class="accordion-body">
									<div class="card-body personal-info">

										<div class="main-content">
											<div
												class="mb-4 d-flex align-items-center justify-content-between">
												<h5 class="fw-bold mb-0 me-4">
													<span class="d-block mb-2">Current Address</span> <span
														class="fs-12 fw-normal text-muted text-truncate-1-line">Following
														information is publicly displayed, be careful! </span>
												</h5>
											</div>

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Building Name</label>
														<form:input path="buildingName" type="text"
															class="form-control" placeholder="Building Name"
															id="currentBuildingName" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label>
														<form:input path="streetName" type="text"
															class="form-control" placeholder="Street Name"
															id="currentStreetName" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label>
														<form:input path="landmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="currentLandmark" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City</label>
														<form:input path="city" type="text" class="form-control"
															placeholder="City" id="currentCity" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label>
														<form:input path="district" type="text"
															class="form-control" placeholder="District"
															id="currentDistrict" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State</label>
														<form:input path="state" type="text" class="form-control"
															placeholder="State" id="currentState" />
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country</label>
														<form:input path="country" type="text"
															class="form-control" placeholder="Country" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label>
														<form:input path="zip" type="text" class="form-control"
															placeholder="Zip" id="currentZip" />
													</div>
												</div>

											</div>

											<div
												class="mb-4 d-flex align-items-center justify-content-between">
												<h5 class="fw-bold mb-0 me-4">
													<span class="d-block mb-2">Permanent Address:</span> <span
														class="fs-12 fw-normal text-muted text-truncate-1-line">Keep
														your account more secure with following preferences. </span>
												</h5>

											</div>
											<div class="row">
												<div class="col-xl-4">
													<label class="form-label">Current Address Is
														Permanent address</label> <input type="checkbox"
														id="sameAsCurrentAddress" name="sameAsCurrentAddress"
														onclick="copyAddress()" />
												</div>
											</div>

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Building Name</label>
														<form:input path="parBuildingName" type="text"
															class="form-control" placeholder="Building Name"
															id="permanentBuildingName" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label>
														<form:input path="parStreetName" type="text"
															class="form-control" placeholder="Street Name"
															id="permanentStreetName" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label>
														<form:input path="parLandmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="permanentLandmark" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City</label>
														<form:input path="parCity" type="text"
															class="form-control" placeholder="City"
															id="permanentCity" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label>
														<form:input path="parDistrict" type="text"
															class="form-control" placeholder="District"
															id="permanentDistrict" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State</label>
														<form:input path="parState" type="text"
															class="form-control" placeholder="State"
															id="permanentState" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country</label>

														<form:input path="parCountry" type="text"
															class="form-control" placeholder="Country of Residence" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label>
														<form:input path="parZip" type="text" class="form-control"
															placeholder="Zip" id="permanentZip" />
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
						<h2 class="accordion-header" id="kyc_Id">
							<button class="accordion-button collapsed" type="button"
								style="background: aliceblue;"
								onclick="toggleDiv('panelsStayOpen-collapseThree')">KYC</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body pass-info">
									<div class="main-content">
										<div
											class="mb-4 d-flex align-items-center justify-content-between">
											<h5 class="fw-bold mb-0 me-4">
												<span class="d-block mb-2">Document Details</span>
											</h5>
										</div>

										<div class="row mb-4 align-items-center">
											<div class="row">
												<div class="col-lg-4"></div>
												<div class="col-lg-8">
													<div class="mb-4">
														<div class="input-group">
															<div class="input-group-text">
																<i class="feather-user"></i>
															</div>
															<form:input id="idType" path="idType"
																class="form-control" onchange="toggleFields()" />
														</div>
													</div>
												</div>
											</div>

											<hr>

											<!-- This block contains fields that will be shown based on the selected id type -->

											<div id="idNumberField" class="row" style="display: block;">

												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Id Number<span
																class="text-danger">*</span></label>
															<form:input path="idNumber" id="idNumber"
																placeholder="Id Number" type="text" class="form-control"/>
														</div>
													</div>

												</div>

											</div>

											<div id="idDetailsFields" class="row" style="display: none;">

												<div class="row">

													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued By<span
																class="text-danger">*</span></label>
															<form:input path="issuedBy" type="text"
																class="form-control" placeholder="Issued By" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Name as per Id<span
																class="text-danger">*</span></label>
															<form:input path="nameAsPerId" type="text"
																class="form-control" placeholder="Name as per Id" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued Country<span
																class="text-danger">*</span></label>
															<form:input path="issuedCountry" class="form-control"
																placeholder="Issued Country" />
														</div>
													</div>

												</div>
											</div>

											<div id="additionalIdDetails" class="row"
												style="display: none;">
												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued at<span
																class="text-danger">*</span></label>
															<form:input path="issuedAt" type="text"
																class="form-control" placeholder="Issued at" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued on<span
																class="text-danger">*</span></label> <input type="date"
																class="form-control" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Date of Expiry<span
																class="text-danger">*</span></label>
															<form:input path="dateOfBirth" type="date"
																class="form-control" />
														</div>
													</div>
												</div>

												<div id="expiryAndStatusFields" class="row"
													style="display: none;">
													<div class="row">
														<div class="col-xl-4">
															<div class="mb-4">
																<label class="form-label">Default Status<span
																	class="text-danger">*</span></label>
																<form:input path="defaultStatus" class="form-control" />

															</div>
														</div>
														<div class="col-xl-4">
															<div class="mb-4">
																<label class="form-label">Active Status<span
																	class="text-danger">*</span></label>
																<form:input path="activeStatus" type="text"
																	class="form-control" />
															</div>
														</div>
														<%-- <h5 class="fw-bold mb-0 me-4">
                        															<span class="d-block mb-2">Upload Document</span>
                        														</h5>
                        														<div class="row">
                        															<div class="col-xl-4">
                        																<div class="mb-4">
                        																	<label class="form-label">Id Front<span
                        																		class="text-danger">*</span></label>
                        																	<form:input path="frontBase64Data" type="file"
                        																		class="form-control" placeholder="Id Front" />
                        																</div>
                        															</div>
                        															<div class="col-xl-4">
                        																<div class="mb-4">
                        																	<label class="form-label">Id Back<span
                        																		class="text-danger">*</span></label>
                        																	<form:input path="backBase64Data" type="file"
                        																		class="form-control" placeholder="Id Back" />
                        																</div>
                        															</div>
                        														</div> --%>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="accordion-item" style="background: aliceblue;">
							<h2 class="accordion-header" id="otherinfo_Id">

								<button class="accordion-button collapsed" type="button"
									style="background: aliceblue;"
									onclick="toggleDiv('panelsStayOpen-collapseFour')">Other
									Information</button>
							</h2>
							<div id="panelsStayOpen-collapseFour"
								class="accordion-collapse collapse">

								<div class="accordion-body" style="background: aliceblue;">
									<div class="card-body personal-info">
										<div class="main-content">
											<div
												class="mb-4 d-flex align-items-center justify-content-between">
												<h5 class="fw-bold mb-0 me-4">
													<span class="d-block mb-2">Other Information </span> <span
														class="fs-12 fw-normal text-muted text-truncate-1-line">Following
														information is publicly displayed, be careful! </span>
												</h5>

											</div>

											<div class="card-body pass-security">
												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Customer type id</label>
															<form:input path="customerTypeId" type="text"
																class="form-control" placeholder="Customer type id" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Annual Income Range Id</label>
															<form:input path="annualIncomeRangeId" type="text"
																class="form-control"
																placeholder="Annual Income Range Id" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Annual Income Currency
																Code </label>
															<form:select path="annualIncomeCurrencyCode"
																class="form-control" data-select2-selector="icon"
																multiple="false">
																<form:option value="" disabled="true" selected="true">Annual Income Currency</form:option>
																<form:options items="${currencyList}" />
															</form:select>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Social Security Number</label>
														<form:input path="socialSecurityNumber" type="text"
															class="form-control" placeholder="Social Security Number" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Tax Registration Number</label>
														<form:input path="taxRegistrationNumber" type="text"
															class="form-control"
															placeholder="Tax Registration Number" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Transaction Issued
															Country </label>
														<form:select path="txnIssuedCountry" class="form-control"
															data-select2-selector="icon" multiple="false">
															<form:option value="" disabled="true" selected="true">Transaction Issued Country</form:option>
															<form:options items="${countryList}" />
														</form:select>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Employer Name<span
															class="text-danger">*</span></label>
														<form:input path="employerName" type="text"
															class="form-control" placeholder="Employer Name" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Employer Address<span
															class="text-danger">*</span></label>
														<form:input path="employerAddress" type="text"
															class="form-control" placeholder="Employer Address" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Employer Phone<span
															class="text-danger">*</span></label>
														<form:input path="employerPhone" type="tel"
															class="form-control" placeholder="Employer Phone" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Employer ecrn<span
															class="text-danger">*</span></label>
														<form:input path="ecrn" type="text" class="form-control"
															placeholder="Employer ecrn" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Employer Establishment
															Id<span class="text-danger">*</span>
														</label>
														<form:input path="employerEstablishmentId" type="text"
															class="form-control"
															placeholder="Employer Establishment Id" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Risk Rating Id<span
															class="text-danger">*</span></label>
														<form:input path="riskRatingId" type="text"
															class="form-control" placeholder="Risk Rating Id" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">PEP Catagory<span
															class="text-danger">*</span></label>
														<form:input path="pepCategory" type="text"
															class="form-control" placeholder="PEP Catagory" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Personal Mohre Id<span
															class="text-danger">*</span></label>
														<form:input path="personalMohreId" type="text"
															class="form-control" placeholder="Personal Mohre Id" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Income Type<span
															class="text-danger">*</span></label>

														<form:input path="incomeType" type="text"
															class="form-control" placeholder="Income Type" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Profession Catagory<span
															class="text-danger">*</span></label>

														<form:input path="professionCategory" type="text"
															class="form-control" placeholder="Profession Catagory" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Reason For Acc.<span
															class="text-danger">*</span></label>
														<form:input path="reasonForAcc" type="text"
															class="form-control" placeholder="Reason For Acc." />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Transaction Volume Month<span
															class="text-danger">*</span>
														</label>
														<form:input path="txnVolMonth" type="text"
															class="form-control"
															placeholder="Transaction Volume Month" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Transaction Count Month<span
															class="text-danger">*</span></label>
														<form:input path="txnCountMonth" type="Text"
															class="form-control"
															placeholder="Transaction Count Month" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Show Remark on
															Transaction<span class="text-danger">*</span>
														</label>

														<form:input path="showRemarksOnTxn" type="text"
															class="form-control"
															placeholder="Show Remark on
                                                                                                                                              															Transaction" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Customer Remark<span
															class="text-danger">*</span></label>
														<form:input path="customerRemarks" type="text"
															class="form-control" placeholder="Customer Remark" />
													</div>
												</div>
											</div>
											<div class="row">

												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Agent Referenc Number<span
															class="text-danger">*</span></label>
														<form:input path="agentRefNo" type="text"
															class="form-control" placeholder="Agent Referenc Number" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Social Links<span
															class="text-danger">*</span></label>
														<form:input path="socialLinksId" class="form-control"
															placeholder="Social Links" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">First Language<span
															class="text-danger">*</span></label>
														<form:input path="firstLanguage" class="form-control"
															placeholder="First Language" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Marital Status<span
															class="text-danger">*</span></label>

														<form:input path="maritalStatus" type="text"
															class="form-control" placeholder="Marital Status" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">DNFBP<span
															class="text-danger">*</span></label>

														<form:input path="dnfbp" type="text" class="form-control"
															placeholder="DNFBP" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">DPMS<span
															class="text-danger">*</span></label>
														<form:input path="dpms" type="text" class="form-control"
															placeholder="DPMS" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Profile Catagory<span
															class="text-danger">*</span></label>
														<form:input path="profileCategory" class="form-control"
															placeholder="Profile Catagory" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Profile Photo<span
															class="text-danger">*</span></label>
														<form:input path="" type="file" class="form-control"
															placeholder="Profile Photo" />
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
					<button type="submit" class="btn btn-primary">Update</button>
				</div>

			</form:form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>




	<!--! ================================================================ !-->
	<!--! [End] Theme Customizer !-->
	<!--! ================================================================ !-->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<!-- vendors.min.js {always must need to be top} -->
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/vendors/js/datepicker.min.js"></script>
	<script src="assets/vendors/js/lslstrength.min.js"></script>
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