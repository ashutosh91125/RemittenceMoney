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
	function toggleDiv(divId) {
		const element = document.getElementById(divId);
		element.classList.toggle("show");
	}


	function toggleFields() {
	    const residentType = document.getElementById('residentType').value;
	    const idTypeInput = document.getElementById("idType");
	    const issuedCountryInput = document.querySelector("[name='issuedCountry']");
	    const issuedAtInput = document.querySelector("[name='issuedAt']");
	    const issuedDateExpiryNonResident = document.getElementById('issuedDateExpiryNonResident');
	    const issuedForNonResidents = document.getElementById('issuedForNonResidents');
	    const idDetailsFields = document.getElementById('idDetailsFields');


	    if (residentType === '101'|| residentType === 'Resident') {
	        idTypeInput.value = "MALAYSIA ID CARD(MYKAD)";
	        issuedCountryInput.value = "MY";
	        issuedAtInput.value = "MALAYSIA";
	        issuedCountryInput.disabled = true;
	        issuedAtInput.disabled = true;
	        issuedDateExpiryNonResident.style.display = 'none';
	        issuedForNonResidents.style.display = 'none';
	        document.getElementById('idNumberField').style.display = 'block';
	        document.getElementById('idDetailsFields').style.display = 'none';
	        document.getElementById('additionalIdDetails').style.display = 'none';
	        document.getElementById('expiryAndStatusFields').style.display = 'none';
	    } else if (residentType === '100'|| residentType === 'Non-Resident' ) {
	        idTypeInput.value = "PASSPORT";
	        issuedCountryInput.value = "";
	        issuedAtInput.value = "";
	        issuedCountryInput.disabled = false;
	        issuedAtInput.disabled = false;
	        issuedForNonResidents.style.display = 'block';
	        issuedDateExpiryNonResident.style.display = 'block';
	        document.getElementById('idNumberField').style.display = 'block';
	        document.getElementById('idDetailsFields').style.display = 'block';
	        document.getElementById('additionalIdDetails').style.display = 'block';
	        document.getElementById('expiryAndStatusFields').style.display = 'block';
	    } else {
	        issuedDateExpiryNonResident.style.display = 'none';
	        issuedForNonResidents.style.display = 'none';
	        document.getElementById('idNumberField').style.display = 'none';
	        document.getElementById('idDetailsFields').style.display = 'none';
	        document.getElementById('additionalIdDetails').style.display = 'none';
	        document.getElementById('expiryAndStatusFields').style.display = 'none';
	    }
	}


	 function toggleCustomerRemarks() {
	        const showRemarks = document.getElementById("showRemarksOnTxn").value;
	        const remarksContainer = document.getElementById("customerRemarksContainer");

	        if (showRemarks === "true") {
	            remarksContainer.style.display = "block";
	        } else {
	            remarksContainer.style.display = "none";
	        }
	    }
	document.addEventListener('DOMContentLoaded', function() {
		console.log("Page Loaded");
		 toggleCustomerRemarks();
			toggleFields();
	});


    $(document).ready(function() {
            $("#updateButton").on("click", function() {
            	
            	 var ecrn = $("input[name='ecrn']").val()
               
                $.ajax({
                    url: '/customer',  
                    type: 'GET', 
                    data: { ecrn: ecrn },
                    success: function(response) {
                        window.location.href = '/customer?ecrn='+ encodeURIComponent(ecrn);  
                    },
                    error: function(xhr, status, error) {
                        console.log('AJAX Error: ' + error);
                    }
                });
            });
        });

    document.querySelectorAll('#customerView input').forEach(function(input) {
            input.readOnly = true;
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
			<jsp:include page="customersearch.jsp"></jsp:include>
			<form:form modelAttribute="customer" id="customerView"
				action="${pageContext.request.contextPath}/createUser" method="post">
				<form:hidden path="ecrn" />


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
							<div class="accordion-body"
								style="background: aliceblue; margin-top: -40px;">

								<div class="main-content">
									<!-- <div
										class="mb-4 d-flex align-items-center justify-content-between">
										<h5 class="fw-bold mb-0 me-4">
											<span class="d-block mb-2">Personal Information:</span> 
										</h5>
										<a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Add New</a>
									</div> -->

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Salutation</label>
												<form:input path="salutation" type="text"
													class="form-control" placeholder="salutation"
													disabled="true" />

											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">First Name<span
													class="text-danger">*</span></label>
												<form:input path="firstName" type="text"
													class="form-control" placeholder="First Name"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Middle Name</label>
												<form:input path="middleName" type="text"
													class="form-control" placeholder="Middle Name"
													disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Last Name<span
													class="text-danger">*</span></label>
												<form:input path="lastName" type="text" class="form-control"
													placeholder="Last Name" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Preferred Name</label>
												<form:input path="preferredName" type="text"
													class="form-control" placeholder="Preferred Name"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Nationality <span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="nationality"
													value="${nationality}" disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Nationality</label> <input
													type="text" class="form-control"
													placeholder="Secondary Nationality"
													value="${secondNationality}" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Native Region</label> <input
													type="text" value="${nativeRegion}" class="form-control"
													placeholder="Native Region" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Date of Birth<span
													class="text-danger">*</span></label>
												<form:input path="dateOfBirth" type="text"
													class="form-control" disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Birth<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Secondary Nationality"
													value="${countryOfBirth}" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Place of Birth </label>
												<form:input path="placeOfBirth" type="text"
													class="form-control" placeholder="Place of Birth"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Residence<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Country of Residence"
													value="${countryOfResidence}" disabled="true" />
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Gender<span
													class="text-danger">*</span></label>
												<form:input path="gender" type="text" class="form-control"
													placeholder="Gender" disabled="true" />
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mothers Maiden Name</label>
												<form:input path="mothersMaidenName" type="Text"
													class="form-control" placeholder="Mothers Maiden Name"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Primary Mobile Number<span
													class="text-danger">*</span></label>
												<div class="input-group">
													<!-- Fixed Phone Code -->
													<form:select path="phoneCode" id="phoneCode"
														class="form-control" multiple="false"
														style="max-width: 80px; padding: 0; text-align:center;"
														disabled="true">
														<form:option value="+60" selected="true">+60</form:option>
													</form:select>

													<!-- Combined Input Box -->
													<form:input path="primaryMobileNumber" type="text"
														class="form-control" placeholder="Primary Mobile Number"
														id="primaryMobileNumber" disabled="true" />
												</div>
												<span id="primaryMobileNumberError" class="text-danger"></span>
											</div>
										</div>

									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Mobile Number</label>
												<form:input path="secondaryMobileNumber" type="tel"
													class="form-control" placeholder="Secondary Mobile Number"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Email<span
													class="text-danger">*</span></label>
												<form:input path="emailId" type="email" class="form-control"
													placeholder="Email" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Phone Number</label>
												<form:input path="phoneNumber" type="tel"
													class="form-control" placeholder="Phone Number"
													disabled="true" />
											</div>
										</div>
									</div>
									<%-- <div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Occupation Id</label> <input
													type="text" class="form-control"
													placeholder="Occupation Id" value="${occupationId}">
													<form:input path="occupationId" type="text"
													class="form-control" placeholder="Occupation Id" />
											</div>
										</div>
									</div> --%>
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
								<div class="accordion-body" style="margin-top: -20px;">
									<div class="card-body personal-info">
										<div class="main-content">
											<div class="row">
												<h6>
													<span class="d-block mb-2">Current Address:</span>
												</h6>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Building Name</label>
														<form:input path="buildingName" type="text"
															class="form-control" placeholder="Building Name"
															id="currentBuildingName" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label>
														<form:input path="streetName" type="text"
															class="form-control" placeholder="Street Name"
															id="currentStreetName" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label>
														<form:input path="landmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="currentLandmark" disabled="true" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City</label>
														<form:input path="city" type="text" class="form-control"
															placeholder="City" id="currentCity" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label>
														<form:input path="district" type="text"
															class="form-control" placeholder="District"
															id="currentDistrict" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country</label> <input
															value="${country}" type="text" class="form-control"
															placeholder="Country" disabled="true" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State</label>
														<form:input path="state" type="text" class="form-control"
															placeholder="State" id="currentState" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label>
														<form:input path="zip" type="text" class="form-control"
															placeholder="Zip" id="currentZip" disabled="true" />
													</div>
												</div>

											</div>
											<div class="row">
												<h6>
													<span class="d-block mb-2">Permanent Address:</span>
												</h6>
											</div>
											<!-- <div class="row">
												<div class="mb-4">
													<div class="col-xl-4">
														<h6>
															Current Address Is Permanent address
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
																type="checkbox" id="sameAsCurrentAddress"
																name="sameAsCurrentAddress" onclick="copyAddress()" />
														</h6>
													</div>
												</div>
											</div> -->

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Building Name</label>
														<form:input path="parBuildingName" type="text"
															class="form-control" placeholder="Building Name"
															id="permanentBuildingName" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label>
														<form:input path="parStreetName" type="text"
															class="form-control" placeholder="Street Name"
															id="permanentStreetName" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label>
														<form:input path="parLandmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="permanentLandmark" disabled="true" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City</label>
														<form:input path="parCity" type="text"
															class="form-control" placeholder="City"
															id="permanentCity" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label>
														<form:input path="parDistrict" type="text"
															class="form-control" placeholder="District"
															id="permanentDistrict" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country</label> <input
															value="${parCountry}" type="text" class="form-control"
															placeholder="Country of Residence" disabled="true" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State</label>
														<form:input path="parState" type="text"
															class="form-control" placeholder="State"
															id="permanentState" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label>
														<form:input path="parZip" type="text" class="form-control"
															placeholder="Zip" id="permanentZip" disabled="true" />
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
								onclick="toggleDiv('panelsStayOpen-collapseThree')">KYC</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body"
								style="background: aliceblue; margin-top: -40px;">
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
												<div class="col-lg-4">
													<label class="fw-semibold">Resident Type</label>
												</div>
												<div class="col-lg-8">
													<div class="mb-4">
														<input value="${residentType}" type="text"
															class="form-control" placeholder="Resident Type"
															id="residentType" disabled="true" />

													</div>
												</div>
											</div>
											<hr>
											<div id="idNumberField" class="row" style="display: block;">
												<h5 class="fw-bold mb-0 me-4">
													<span class="d-block mb-2">Customer Identity</span>
												</h5>
												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Id Type <span
																class="text-danger">*</span></label> <input type="text"
																class="form-control" placeholder="Id Type" id="idType"
																disabled="true">

														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Id Number<span
																class="text-danger">*</span></label>
															<form:input path="idNumber" id="idNumber" name="idNumber"
																placeholder="Id Number" type="text" class="form-control"
																disabled="true" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Name as per Id<span
																class="text-danger">*</span></label>
															<form:input path="nameAsPerId" type="text"
																class="form-control" placeholder="Name as per Id"
																disabled="true" />
														</div>
													</div>
												</div>
											</div>
											<div id="issuedForNonResidents">
												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued Country<span
																class="text-danger">*</span></label> <input type="text"
																class="form-control" placeholder="Issued Country"
																value="${issuedCountry}" disabled="true" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued at<span
																class="text-danger">*</span></label>
															<form:input path="issuedAt" type="text"
																class="form-control" placeholder="Issued at"
																disabled="true" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued By<span
																class="text-danger">*</span></label>
															<form:input path="issuedBy" type="text"
																class="form-control" placeholder="Issued By"
																id="issuedBy" disabled="true" />
														</div>
													</div>
												</div>
											</div>
											<div id="issuedDateExpiryNonResident">
												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Issued on</label>
															<form:input path="issuedOn" type="text"
																class="form-control" disabled="true" />
														</div>
													</div>
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Date of Expiry<span
																class="text-danger">*</span></label>
															<form:input path="dateOfExpiry" type="text"
																class="form-control" disabled="true" />
														</div>
													</div>
												</div>
											</div>

										</div>
										<div id="idDetailsFields" class="row" style="display: none;">
											<h5 class="fw-bold mb-0 me-4">
												<span class="d-block mb-4">Visa Details</span>
											</h5>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Visa Number</label>
														<form:input path="visaNumber" type="text"
															class="form-control" placeholder="Visa Number"
															disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Visa Expiry Date</label>
														<form:input path="visaExpiryDate" type="text"
															class="form-control" placeholder="Visa Expiry Date"
															disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Visa Type</label>
														<form:input path="visaType" type="text"
															class="form-control" placeholder="Visa Type"
															disabled="true" />
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
								onclick="toggleDiv('panelsStayOpen-collapseFour')">Other
								Information</button>
						</h2>
						<div id="panelsStayOpen-collapseFour"
							class="accordion-collapse collapse">

							<div class="accordion-body"
								style="background: aliceblue; margin-top: -30px;">
								<div class="card-body personal-info">
									<div class="main-content">
										<!-- <div
											class="mb-4 d-flex align-items-center justify-content-between">
											<h5 class="fw-bold mb-0 me-4">
												<span class="d-block mb-2">Other Information </span> 
											</h5>

										</div> -->

										<div class="card-body pass-security">
											<div class="row">

												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Annual Income Range</label> <input
															type="text" class="form-control"
															placeholder="Annual Income Range"
															value="${annualIncomeRangeId}" disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Annual Income Currency
															Code </label>
														<form:input path="annualIncomeCurrencyCode" type="text"
															class="form-control"
															placeholder="Annual Income Currency
															Code"
															disabled="true" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Tax Registration Number</label>
														<form:input path="taxRegistrationNumber" type="text"
															class="form-control"
															placeholder="Tax Registration Number" disabled="true" />
													</div>
												</div>
											</div>
										</div>
										<%--	<div class="row">
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
														class="form-control" placeholder="Tax Registration Number" />
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
										</div>--%>

										<%----%>
										<div class="row">
											<%--
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Establishment Id<span
														class="text-danger">*</span>
													</label>
													<form:input path="employerEstablishmentId" type="text"
														class="form-control"
														placeholder="Employer Establishment Id" />
												</div>
											</div> --%>

											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Risk Rating Id<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Risk Rating Id"
														value="${riskRatingId}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Income Type<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Risk Rating Id"
														value="${incomeType}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profession Catagory<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Profession Catagory"
														value="${professionCategory}" disabled="true" />
												</div>
											</div>
										</div>
										<%--<div class="row">
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
											
										</div>--%>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Name</label>
													<form:input path="employerName" type="text"
														class="form-control" placeholder="Employer Name"
														disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Address</label>
													<form:input path="employerAddress" type="text"
														class="form-control" placeholder="Employer Address"
														disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Phone</label>
													<form:input path="employerPhone" type="tel"
														class="form-control" placeholder="Employer Phone"
														disabled="true" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Volume Month<span
														class="text-danger">*</span>
													</label> <input type="text" class="form-control"
														placeholder="Transaction Volume Month"
														value="${txnVolMonth}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Count Month<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Transaction Count Month"
														value="${txnCountMonth}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">First Language<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="First Language"
														value="English" disabled="true" />

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Marital Status<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Marital Status"
														value="${maritalStatus}" disabled="true" />

												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Occupation</label> <input
														value="${ occupationId}" class="form-control"
														placeholder="Occupation" disabled="true" />
												</div>
											</div>

											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Political Exposed Person</label>
													<form:input path="politicalExposedPerson"
														class="form-control"
														placeholder="Political Exposed Person" disabled="true" />

												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Show Remark on
															Transaction<span class="text-danger">*</span>
														</label>
														<form:input path="showRemarksOnTxn" type="text"
															class="form-control"
															placeholder="Show Remark on
															Transaction"
															disabled="true" />

													</div>
												</div>
												<div id="customerRemarksContainer" class="col-xl-4"
													style="display: none;">
													<div class="mb-4">
														<label class="form-label">Customer Remarks</label>
														<form:input path="customerRemarks" class="form-control"
															placeholder="Enter your remarks here" disabled="true" />
													</div>
												</div>
											</div>
											<!-- <div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">DNFBP<span
															class="text-danger">*</span></label>
														<form:select path="dnfbp" class="form-control"
															data-select2-selector="icon">
															<option value="false">No</option>
															<option value="true">Yes</option>
														</form:select>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">DPMS<span
															class="text-danger">*</span></label>
														<form:select path="dpms" class="form-control"
															data-select2-selector="icon">
															<option value="false">No</option>
															<option value="true">Yes</option>
														</form:select>
													</div>
												</div>  -->
										</div>
										<%--<div class="row">
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
										</div>--%>
										<div class="row"></div>
										<div class="row">
											<%-- <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profile Catagory<span
														class="text-danger">*</span></label>
													<form:input path="profileCategory" class="form-control"
														placeholder="Profile Catagory" />
												</div>
											</div> --%>
											<%-- <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profile Photo<span
														class="text-danger">*</span></label>
													<form:input path="" type="file" class="form-control"
														placeholder="Profile Photo" />
												</div>
											</div> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-5 mb-5 text-center"
					style="display: flex; justify-content: center">
					<button type="button" class="btn btn-warning" id="updateButton">Update</button>
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