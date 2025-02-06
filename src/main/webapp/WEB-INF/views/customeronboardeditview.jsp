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
<title>LuLu Money || Customers Create</title>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">

<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/datepicker.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
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
                url: '/updateCustomer?ecrn='+ecrn,
                type: 'GET',
//                 data: { ecrn: ecrn },
                success: function(response) {
                	 $('body').html(response);
//                     window.location.href = '/customer?ecrn='+ encodeURIComponent(ecrn);
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

$(document).ready(function () {
    $(".issued-country-dropdown").each(function () {
        const inputElement = $(this);
        const key = inputElement.data("key");
        const valueId = inputElement.val();

        fetchEnumValue(key, valueId, function (description) {
            if (description) {
                inputElement.val(description);
            } else {
                console.error("Unable to fetch value for Issued Country");
            }
        });
    });

    $(".issued-at-dropdown").each(function () {
        const inputElement = $(this);
        const key = inputElement.data("key");
        const valueId = inputElement.val();

        fetchEnumValue(key, valueId, function (description) {
            if (description) {
                inputElement.val(description);
            } else {
                console.error("Unable to fetch value for Issued At");
            }
        });
    });
    $(".id-type-dropdown").each(function () {
        const inputElement = $(this);
        const key = inputElement.data("key");
        const valueId = inputElement.val();

        fetchEnumValue(key, valueId, function (description) {
            if (description) {
                inputElement.val(description);
            } else {
                console.error("Unable to fetch value for Issued At");
            }
        });
    });
});


function fetchEnumValue(key, valueId, callback) {
$.ajax({
    url: '/api/enumEntities/' + key + '/values/' + valueId,
    type: 'GET',
    success: function (description) {
    	console.log(description);
        callback(description);
    },
    error: function () {
        console.error("Error fetching enum value for key:", key, "valueId:", valueId);
        callback(null);
    }
});
}		
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
						<li class="breadcrumb-item"><a href="/welcome">Home</a></li>
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
						<!-- <div
							class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
							 <a href="javascript:void(0);" class="btn btn-light-brand successAlertMessage">
                                <i class="feather-layers me-2"></i>
                                <span>Save as Draft</span>
                            </a>
							<a href="javascript:void(0);"
								class="btn btn-primary successAlertMessage"> <i
								class="feather-user-plus me-2"></i> <span>Add Customer</span>
							</a>
						</div> -->
					</div>
					<div class="d-md-none d-flex align-items-center">
						<a href="javascript:void(0)" class="page-header-right-open-toggle">
							<i class="feather-align-right fs-20"></i>
						</a>
					</div>
				</div>
			</div>
			<jsp:include page="customersearch.jsp"></jsp:include>
			<%-- <form:form id="customerView" modelAttribute="customer"
			onsubmit="event.preventDefault(); updateCustomer();"> --%>
			<form modelAttribute="customer" id="customerView"
				action="${pageContext.request.contextPath}/customerdetails"
				enctype="multipart/form-data" method="post">
				<input type="hidden" name="ecrn" id="ecrn" value="${customer.ecrn}" />
				<input type="hidden" id="id" name="id" value="${customer.id}">


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
												<label class="form-label">Salutation</label> <input
													name="salutation" type="text"
													value="${customer.salutation}" class="form-control"
													placeholder="salutation" disabled="true" />

											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">First Name<span
													class="text-danger"></span></label> <input name="firstName"
													type="text" value="${customer.firstName}"
													class="form-control" placeholder="First Name"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Middle Name</label> <input
													name="middleName" type="text"
													value="${customer.middleName}" class="form-control"
													placeholder="Middle Name" disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Last Name<span
													class="text-danger"></span></label> <input name="lastName"
													type="text" class="form-control" placeholder="Last Name"
													disabled="true" value="${customer.lastName}" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Preferred Name</label> <input
													name="preferredName" type="text"
													value="${customer.preferredName}" class="form-control"
													placeholder="Preferred Name" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Nationality <span
													class="text-danger"></span></label> <input type="text"
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
													class="text-danger"></span></label> <input name="dateOfBirth"
													type="text" value="${customer.dateOfBirth}"
													class="form-control" disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Birth<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" placeholder="Secondary Nationality"
													value="${countryOfBirth}" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Place of Birth </label> <input
													name="placeOfBirth" type="text" class="form-control"
													placeholder="Place of Birth"
													value="${customer.placeOfBirth}" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Residence<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" placeholder="Country of Residence"
													value="${countryOfResidence}" disabled="true" />
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Gender<span
													class="text-danger"></span></label> <input name="gender"
													type="text" class="form-control" placeholder="Gender"
													disabled="true" value="${customer.gender}" />
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mothers Maiden Name</label> <input
													name="mothersMaidenName" type="Text"
													value="${customer.mothersMaidenName}" class="form-control"
													placeholder="Mothers Maiden Name" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Primary Mobile Number<span
													class="text-danger"></span></label>
												<div class="input-group">
													<!-- Fixed Phone Code -->
													<input name="phoneCode" id="phoneCode" class="form-control"
														multiple="false" value="${customer.phoneCode}"
														style="max-width: 80px; padding: 0; text-align: center;"
														disabled="true" />
													<!-- Combined Input Box -->
													<input name="primaryMobileNumber" type="text"
														class="form-control" placeholder="Primary Mobile Number"
														id="primaryMobileNumber" disabled="true"
														value="${customer.primaryMobileNumber}" />
												</div>
												<span id="primaryMobileNumberError" class="text-danger"></span>
											</div>
										</div>

									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Mobile Number</label> <input
													name="secondaryMobileNumber" type="tel"
													value="${customer.secondaryMobileNumber}"
													class="form-control" placeholder="Secondary Mobile Number"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Email<span
													class="text-danger"></span></label> <input name="emailId"
													type="email" class="form-control"
													value="${customer.emailId}" placeholder="Email"
													disabled="true" />
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Phone Number</label> <input
													name="phoneNumber" type="tel"
													value="${customer.phoneNumber}" class="form-control"
													placeholder="Phone Number" disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">AML Status</label> <input
													name="amlScanStatus" type="text" class="form-control"
													lass="form-control" placeholder="AML Status"
													value="${customer.amlScanStatus}" disabled="true" />
											</div>
										</div>
										<div class="col-xl-4"> 
											<div class="mb-4">
												<label class="form-label">Customer Status</label> <input
													name="amlScanStatus" type="text"
													value="${customer.customerStatus}" class="form-control"
													placeholder="Customer Status" disabled="true" />
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
														<label class="form-label">Building Name</label> <input
															name="buildingName" type="text" class="form-control"
															placeholder="Building Name" id="currentBuildingName"
															disabled="true" value="${customer.buildingName}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label> <input
															name="streetName" type="text" class="form-control"
															placeholder="Street Name" id="currentStreetName"
															disabled="true" value="${customer.streetName}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label> <input
															name="landmark" type="text" class="form-control"
															placeholder="Land Mark" id="currentLandmark"
															disabled="true" value="${customer.landmark}" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City</label> <input name="city"
															type="text" class="form-control" placeholder="City"
															id="currentCity" disabled="true" value="${customer.city}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label> <input
															name="district" type="text" class="form-control"
															placeholder="District" id="currentDistrict"
															disabled="true" value="${customer.district}" />
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
														<label class="form-label">State</label> <input
															name="state" type="text" class="form-control"
															placeholder="State" id="currentState" disabled="true"
															value="${customer.state}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label> <input name="zip"
															type="text" class="form-control" placeholder="Zip"
															id="currentZip" disabled="true" value="${customer.zip}" />
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
														<label class="form-label">Building Name</label> <input
															name="parBuildingName" type="text" class="form-control"
															placeholder="Building Name" id="permanentBuildingName"
															disabled="true" value="${customer.parBuildingName}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label> <input
															name="parStreetName" type="text" class="form-control"
															placeholder="Street Name" id="permanentStreetName"
															disabled="true" value="${customer.parStreetName}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label> <input
															name="parLandmark" type="text" class="form-control"
															placeholder="Land Mark" id="permanentLandmark"
															disabled="true" value="${customer.parLandmark}" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City</label> <input
															name="parCity" type="text" class="form-control"
															placeholder="City" id="permanentCity" disabled="true"
															value="${customer.parCity}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label> <input
															name="parDistrict" type="text" class="form-control"
															placeholder="District" id="permanentDistrict"
															disabled="true" value="${customer.parDistrict}" />
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
														<label class="form-label">State</label> <input
															name="parState" type="text" class="form-control"
															placeholder="State" id="permanentState" disabled="true"
															value="${customer.parState}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label> <input name="parZip"
															type="text" class="form-control" placeholder="Zip"
															id="permanentZip" disabled="true"
															value="${customer.parZip}" />
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
											<div id="idNumberField" class="row">
												<div id="customerIdentityContainer" class="row">
													<c:forEach var="idDetail" items="${customer.idDetails}"
														varStatus="status">
														<div class="identity-row row" id="identityTemplate">
															<div class="row" id="customerTemplate">
																<div class="col-xl-4">
																	<h5 class="fw-bold mb-0 me-4">
																		<span class="d-block mb-2">Customer Identity</span>
																	</h5>
																</div>
															</div>
															<div class="row">
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Id Type <span
																			class="text-danger">*</span></label> <input
																			name="idDetails[${status.index}].idType" type="text"
																			class="form-control id-type-dropdown"
																			placeholder="Id Type"
																			value="${idDetails[status.index].idType}"
																			id="idTypeDropdown${status.index}" data-key="idTypes"
																			readonly="true" />
																	</div>
																</div>
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Id Number<span
																			class="text-danger">*</span></label> <input
																			name="idDetails[${status.index}].idNumber"
																			value="${idDetails[status.index].idNumber}"
																			id="idNumber" name="idNumber" placeholder="Id Number"
																			type="text" class="form-control" disabled="true" />
																	</div>
																</div>
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Name as per Id<span
																			class="text-danger">*</span></label> <input
																			name="idDetails[${status.index}].nameAsPerId"
																			value="${idDetails[status.index].nameAsPerId}"
																			type="text" class="form-control"
																			placeholder="Name as per Id" disabled="true" />
																	</div>
																</div>
															</div>
															<div id="issuedForNonResidents">
																<div class="row">
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued Country<span
																				class="text-danger">*</span></label> <input
																				name="idDetails[${status.index}].issuedCountry"
																				type="text"
																				value="${idDetails[status.index].issuedCountry}"
																				class="form-control issued-country-dropdown"
																				placeholder="Issued Country"
																				id="issuedCountryDropdown${status.index}"
																				data-key="country" disabled="true" />
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued at<span
																				class="text-danger">*</span></label> <input
																				name="idDetails[${status.index}].issuedAt"
																				type="text"
																				value="${idDetails[status.index].issuedAt}"
																				class="form-control issued-at-dropdown"
																				id="issuedAtDropdown${status.index}"
																				data-key="country" placeholder="Issued at"
																				disabled="true" />
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued By<span
																				class="text-danger">*</span></label> <input
																				name="idDetails[${status.index}].issuedBy"
																				type="text" class="form-control"
																				value="${idDetails[status.index].issuedBy}"
																				placeholder="Issued By" id="issuedBy"
																				disabled="true" />
																		</div>
																	</div>
																</div>
															</div>
															<div id="issuedDateExpiryNonResident">
																<div class="row">
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued on</label> <input
																				name="idDetails[${status.index}].issuedOn"
																				value="${idDetails[status.index].issuedOn}"
																				type="text" class="form-control" disabled="true" />
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Date of Expiry<span
																				class="text-danger">*</span></label> <input
																				name="idDetails[${status.index}].dateOfExpiry"
																				value="${idDetails[status.index].dateOfExpiry}"
																				type="text" class="form-control" disabled="true" />
																		</div>
																	</div>
																</div>
															</div>
															<div id="idDetails">
																<div class="row">
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<div>
																				<label class="form-label">Id Front</label>
																			</div>

																			<img
																				src="/caas/api/v2/iddetail/frontimage/${idDetails[status.index].id}"
																				alt="Id Front"
																				class="img-thumbnail passport-picture id-Front"
																				style="width: 300px; height: 180px;">

																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<div>
																				<label class="form-label">Id Back</label>
																			</div>
																			<img
																				src="/caas/api/v2/iddetail/backimage/${idDetails[status.index].id}"
																				alt="Id Back"
																				class="img-thumbnail passport-picture id-Back"
																				style="width: 300px; height: 180px;">
																		</div>
																	</div>
																</div>
																<div id="idDetailsFields">
																	<h5 class="fw-bold mb-0 me-4">
																		<span class="d-block mb-4">Visa Details</span>
																	</h5>
																	<div class="row">
																		<div class="col-xl-4">
																			<div class="mb-4">
																				<label class="form-label">Visa Number</label> <input
																					name="idDetails[${status.index}].visaNumber"
																					value="${idDetails[status.index].visaNumber}"
																					type="text" class="form-control"
																					placeholder="Visa Number" disabled="true" />
																			</div>
																		</div>
																		<div class="col-xl-4">
																			<div class="mb-4">
																				<label class="form-label">Visa Expiry Date</label> <input
																					name="idDetails[${status.index}].visaExpiryDate"
																					value="${idDetails[status.index].visaExpiryDate}"
																					type="text" class="form-control"
																					placeholder="Visa Expiry Date" disabled="true" />
																			</div>
																		</div>
																		<div class="col-xl-4">
																			<div class="mb-4">
																				<label class="form-label">Visa Type</label> <input
																					name="idDetails[${status.index}].visaType"
																					value="${idDetails[status.index].visaType}"
																					type="text" class="form-control"
																					placeholder="Visa Type" disabled="true" />
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
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
															Code </label> <input name="annualIncomeCurrencyCode" type="text"
															class="form-control"
															placeholder="Annual Income Currency
															Code"
															disabled="true"
															value="${customer.annualIncomeCurrencyCode}" />
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Tax Registration Number</label>
														<input name="taxRegistrationNumber" type="text"
															class="form-control"
															placeholder="Tax Registration Number" disabled="true"
															value="${customer.taxRegistrationNumber}" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Risk Rating Id<span
														class="text-danger"></span></label> <input type="text"
														class="form-control" placeholder="Risk Rating Id"
														value="${riskRatingId}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Income Type<span
														class="text-danger"></span></label> <input type="text"
														class="form-control" placeholder="Risk Rating Id"
														value="${incomeType}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profession Catagory<span
														class="text-danger"></span></label> <input type="text"
														class="form-control" placeholder="Profession Catagory"
														value="${professionCategory}" disabled="true" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Name</label> <input
														name="employerName" type="text" class="form-control"
														placeholder="Employer Name" disabled="true"
														value="${customer.employerName}" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Address</label> <input
														name="employerAddress" type="text" class="form-control"
														placeholder="Employer Address" disabled="true"
														value="${customer.employerAddress}" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Phone</label> <input
														name="employerPhone" type="tel" class="form-control"
														placeholder="Employer Phone" disabled="true"
														value="${customer.employerPhone}" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Volume Month<span
														class="text-danger"></span>
													</label> <input type="text" class="form-control"
														placeholder="Transaction Volume Month"
														value="${txnVolMonth}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Count Month<span
														class="text-danger"></span></label> <input type="text"
														class="form-control" placeholder="Transaction Count Month"
														value="${txnCountMonth}" disabled="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">First Language<span
														class="text-danger"></span></label> <input type="text"
														class="form-control" placeholder="First Language"
														value="English" disabled="true" />

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Marital Status<span
														class="text-danger"></span></label> <input type="text"
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
													<input name="politicalExposedPerson" class="form-control"
														placeholder="Political Exposed Person" disabled="true" />

												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Show Remark on
															Transaction<span class="text-danger"></span>
														</label> <input name="showRemarksOnTxn" type="text"
															class="form-control"
															placeholder="Show Remark on
															Transaction"
															disabled="true" />

													</div>
												</div>
												<div id="customerRemarksContainer" class="col-xl-4"
													style="display: none;">
													<div class="mb-4">
														<div>
															<label class="form-label">Customer Remarks</label>
														</div>
														<input name="customerRemarks" class="form-control"
															placeholder="Enter your remarks here" disabled="true" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<div>
													<label class="form-label"> Profile Photo</label>
												</div>
												<img src="/caas/api/v2/customer/image/${customer.id}"
													style="width: 150px; height: 190px;" alt="Profile Image"
													class="img-thumbnail" class="passport-picture">
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
					<button type="button" class="btn btn-warning" id="updateButton">Update</button>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/vendors/js/datepicker.min.js"></script>
	<script src="assets/vendors/js/lslstrength.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/customers-create-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
</body>

</html>