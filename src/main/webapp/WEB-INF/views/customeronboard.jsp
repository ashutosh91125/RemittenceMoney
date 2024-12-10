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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
<script type="text/javascript" src="js/customervalidation.js"></script>
<script>
$(document).ready(function () {
    // Handle form submission
    $("#customerOnboardForm").on("submit", function (e) {
        e.preventDefault();  // Prevent the default form submission
          if (!validation(this)) {
              return false;  // Stop form submission if validation fails
          }
        // Show the loader (Bootstrap spinner)
        $('#loader').show();

        // Disable the submit button to prevent multiple submissions
        $("#customerOnboardForm button[type='submit']").prop('disabled', true);

        // Create a FormData object to send form data with the image
        const formData = new FormData(this);

        // AJAX request to submit the form data
        $.ajax({
            url: "/createUser", // URL where the form will be submitted
            type: "POST",
            data: formData,
            processData: false, // Don't let jQuery process the data
            contentType: false, // Let the browser set the content type
            success: function (response) {
                // Hide the loader after success
                $('#loader').hide();

                // Enable the submit button again
                $("#customerOnboardForm button[type='submit']").prop('disabled', false);

                // Check if the response contains the ecrn value
                                if (response && response.includes("ECRN:")) {
                                    var ecrn = response.split("ECRN:")[1].trim(); // Extract the ecrn value
                                    alert("Customer Onboarded successfully with ECRN: " + ecrn); // Show the success alert with ecrn
                                } else {
                                    alert("Customer Onboarded successfully!");
                                }
                $("#customerOnboardForm")[0].reset();

                // Optionally, clear any file input fields if necessary
                //$('#frontPictureFile').val('');
                //$('#backPictureFile').val('');
                window.location.reload();
            },
            error: function (xhr) {
                // Hide the loader on error
                $('#loader').hide();

                // Enable the submit button again
                $("#customerOnboardForm button[type='submit']").prop('disabled', false);

                // Show error message if creation fails
                alert("Something went wrong!");
            }
        });
    });
//     const formFields = $("#customerOnboardForm").find("input, select, text");
//     formFields.on("input change", function () {
//         validation("#customerOnboardForm"); // Trigger validation on input or change
//         clearValidationError(this);
//     });
//     function clearValidationError(field) {
//         const fieldId = field.id;
//         const errorElement = document.getElementById(`${fieldId}Error`);
//         if (errorElement) {
//             errorElement.innerHTML = '';  // Clear the error message when user interacts with the field
//         }
//     }
});


function copyAddress() {
    const checkbox = document.getElementById("sameAsCurrentAddress");
    const permanentCountryDropdown = document.getElementById("permanentCountry");
    const permanentStateDropdown = document.getElementById("parStateDropdown");
    const currentCountry = document.getElementById("currentCountry");
    const currentState = document.getElementById("stateDropdown");

    if (checkbox.checked) {
        // Copy field values from current address to permanent address
        document.getElementById("permanentBuildingName").value = document.getElementById("currentBuildingName").value;
        document.getElementById("permanentStreetName").value = document.getElementById("currentStreetName").value;
        document.getElementById("permanentLandmark").value = document.getElementById("currentLandmark").value;
        document.getElementById("permanentCity").value = document.getElementById("currentCity").value;
        document.getElementById("permanentDistrict").value = document.getElementById("currentDistrict").value;
        document.getElementById("permanentZip").value = document.getElementById("currentZip").value;

        // Sync country and trigger change for state options
        permanentCountryDropdown.value = currentCountry.value;
        $(permanentCountryDropdown).trigger('change'); // Trigger change to reload dependent states

        // Wait for the states to load and then set the state
        setTimeout(() => {
            permanentStateDropdown.value = currentState.value;
        }, 500); // Delay allows state options to load
    } else {
        // Clear permanent address fields
        document.getElementById("permanentBuildingName").value = "";
        document.getElementById("permanentStreetName").value = "";
        document.getElementById("permanentLandmark").value = "";
        document.getElementById("permanentCity").value = "";
        document.getElementById("permanentDistrict").value = "";
        document.getElementById("permanentZip").value = "";

        permanentCountryDropdown.selectedIndex = 0; // Reset country
        permanentStateDropdown.innerHTML = '<option value="" disabled selected>Select State</option>'; // Reset state
    }
}


	function toggleDiv(divId) {
		const element = document.getElementById(divId);
		element.classList.toggle("show");
	}

	$(document)
			.ready(
					function() {
						$('#currentCountry')
								.on(
										'change',
										function() {
											let dependent = $(this).val(); // Get the selected country value
											if (dependent) { // Check if a country is selected
												$
														.ajax({
															url : '/api/enumEntities/dependent', // Ensure this matches your controller's URL mapping
															type : 'GET',
															data : {
																dependent : dependent
															}, // Pass the selected country ID
															success : function(
																	data) {
																// Clear the state dropdown and populate with new options
																$(
																		'#stateDropdown')
																		.empty()
																		.append(
																				'<option value="" disabled selected>Select State</option>');
																$
																		.each(
																				data,
																				function(
																						index,
																						enumValue) {
																					$(
																							'#stateDropdown')
																							.append(
																									'<option value="' + enumValue.description + '">'
																											+ enumValue.description
																											+ '</option>');
																				});
															},
															error : function() {
																console
																		.error("Error fetching states for the selected country.");
															}
														});
											} else {
												// Reset the state dropdown if no country is selected
												$('#stateDropdown')
														.empty()
														.append(
																'<option value="" disabled selected>Select State</option>');
											}
										});
					});

	$(document)
			.ready(
					function() {
						$('#permanentCountry')
								.on(
										'change',
										function() {
											let dependent = $(this).val(); // Get the selected country value
											if (dependent) { // Check if a country is selected
												$
														.ajax({
															url : '/api/enumEntities/dependent', // Ensure this matches your controller's URL mapping
															type : 'GET',
															data : {
																dependent : dependent
															}, // Pass the selected country ID
															success : function(
																	data) {
																// Clear the state dropdown and populate with new options
																$(
																		'#parStateDropdown')
																		.empty()
																		.append(
																				'<option value="" disabled selected>Select State</option>');
																$
																		.each(
																				data,
																				function(
																						index,
																						enumValue) {
																					$(
																							'#parStateDropdown')
																							.append(
																									'<option value="' + enumValue.description + '">'
																											+ enumValue.description
																											+ '</option>');
																				});
															},
															error : function() {
																console
																		.error("Error fetching states for the selected country.");
															}
														});
											} else {
												// Reset the state dropdown if no country is selected
												$('#parStateDropdown')
														.empty()
														.append(
																'<option value="" disabled selected>Select State</option>');
											}
										});
					});

	$(document)
			.ready(
					function() {
						$('#nationality')
								.on(
										'change',
										function() {
											let dependent = $(this).val(); // Get the selected country value
											if (dependent) { // Check if a country is selected
												$
														.ajax({
															url : '/api/enumEntities/dependent', // Ensure this matches your controller's URL mapping
															type : 'GET',
															data : {
																dependent : dependent
															}, // Pass the selected country ID
															success : function(
																	data) {
																// Clear the state dropdown and populate with new options
																$(
																		'#nativeRegion')
																		.empty()
																		.append(
																				'<option value="" disabled selected>Select Native Region</option>');
																$
																		.each(
																				data,
																				function(
																						index,
																						enumValue) {
																					$(
																							'#nativeRegion')
																							.append(
																									'<option value="' + enumValue.valueId + '">'
																											+ enumValue.description
																											+ '</option>');
																				});
															},
															error : function() {
																console
																		.error("Error fetching states for the selected country.");
															}
														});
											} else {
												// Reset the state dropdown if no country is selected
												$('#nativeRegion')
														.empty()
														.append(
																'<option value="" disabled selected>Select Native Region</option>');
											}
										});
					});


    $(document)
    			.ready(
    					function() {
    						$('#countryOfBirth')
    								.on(
    										'change',
    										function() {
    											let dependent = $(this).val(); // Get the selected country value
    											if(dependent == "MY"){
    											    dependent += "R";
    											}
    											if (dependent) { // Check if a country is selected
    												$
    														.ajax({
    															url : '/api/enumEntities/dependent', // Ensure this matches your controller's URL mapping
    															type : 'GET',
    															data : {
    																dependent : dependent
    															}, // Pass the selected country ID
    															success : function(
    																	data) {
    																// Clear the state dropdown and populate with new options
    																$(
    																		'#placeOfBirth')
    																		.empty()
    																		.append(
    																				'<option value="" disabled selected>Select Place Of Birth</option>');
    																$
    																		.each(
    																				data,
    																				function(
    																						index,
    																						enumValue) {
    																					$(
    																							'#placeOfBirth')
    																							.append(
    																									'<option value="' + enumValue.description + '">'
    																											+ enumValue.description
    																											+ '</option>');
    																				});
    															},
    															error : function() {
    																console
    																		.error("Error fetching Place Of Birth for the selected country.");
    															}
    														});
    											} else {
    												// Reset the state dropdown if no country is selected
    												$('#nativeRegion')
    														.empty()
    														.append(
    																'<option value="" disabled selected>Select Place Of Birth</option>');
    											}
    										});
    					});
    

    $(document)
	.ready(
			function() {
				$('#countryOfResidence')
						.on(
								'change',
								function() {
									let dependent = $(this).val(); // Get the selected country value
									    dependent += "PC";
									    if (dependent) { // Check if a country is selected
											$
												.ajax({
													url : '/api/enumEntities/dependent', // Ensure this matches your controller's URL mapping
													type : 'GET',
													data : {
														dependent : dependent
													}, // Pass the selected country ID
													success : function(
															data) {
														// Clear the state dropdown and populate with new options
														$(
																'#phoneCode')
																.empty()
																		/* .append(
																				'<option value="" disabled selected>Select State</option>'); */
														$
																.each(
																		data,
																		function(
																				index,
																				enumValue) {
																			$(
																					'#phoneCode')
																					.append(
																							'<option value="' + enumValue.valueId  + '">'
																									+ enumValue.description
																									+ '</option>');
																		});
													},
													error : function() {
														console
																.error("Error fetching phone code for the selected country.");
													}
												});
									} else {
										// Reset the state dropdown if no country is selected
										$('#phoneCode')
												.empty()
 														.append(
 																'<option value="" disabled selected>Select State</option>');
									}
								});
			});

	function toggleFields() {
        const residentType = document.getElementById('residentType').value;
        const idTypeInput = document.getElementById("idType");
        const idTypeDropdown = document.getElementById("idTypeDropdown");
        const hiddenIdType = document.getElementById("hiddenIdType"); // Hidden input for dynamic value
        const issuedDateExpiryNonResident = document.getElementById('issuedDateExpiryNonResident');
        const issuedForNonResidents = document.getElementById('issuedForNonResidents');
        const idDetails = document.getElementById('idDetails');
        const idDetailsFields = document.getElementById('idDetailsFields');
        const idNumberField = document.getElementById('idNumberField');
        const nonResident = document.getElementById('nonResident');


        // Reset fields
        idTypeInput.value = "";
        hiddenIdType.value = ""; // Reset hidden field
        idTypeDropdown.style.display = "none";
        idTypeDropdown.setAttribute("disabled", true);
       

        if (residentType === '101') { // Malaysian ID
            idTypeInput.value = "MALAYSIA ID CARD(MYKAD)";
            hiddenIdType.value = "28"; // Dynamically set the ID value for submission
            idTypeInput.readOnly = true; // Disable editing
            idTypeInput.style.display = "block"; // Show input field
            issuedDateExpiryNonResident.style.display = 'none';
            issuedForNonResidents.style.display = 'none';
            idDetails.style.display = 'block';
            idDetailsFields.style.display = 'none';
            idNumberField.style.display = 'block';
            nonResident.style.display = 'none';
        } else if (residentType === '100') { // Non-resident
            idTypeInput.style.display = "none"; // Hide fixed input field
            idTypeDropdown.style.display = "block"; // Show dropdown
            idTypeDropdown.removeAttribute("disabled");

            idTypeDropdown.addEventListener('change', function () {
                hiddenIdType.value = idTypeDropdown.value; // Dynamically update hidden field value
                if (idTypeDropdown.value === '2') {
                    idDetailsFields.style.display = 'block';
                } else {
                    idDetailsFields.style.display = 'none';
                }
            });

            idDetails.style.display = 'block';
            issuedForNonResidents.style.display = 'block';
            issuedDateExpiryNonResident.style.display = 'block';
            idDetailsFields.style.display = 'block';
            idNumberField.style.display = 'block';
            nonResident.style.display = 'flex';
        } else {
            idTypeInput.value = ""; // Reset ID Type
            hiddenIdType.value = ""; // Reset hidden field
            idTypeInput.readOnly = true; // Keep it disabled
            idTypeInput.style.display = "block"; // Show input field
            idTypeDropdown.style.display = "none";
            idDetails.style.display = 'none';
            issuedDateExpiryNonResident.style.display = 'none';
            issuedForNonResidents.style.display = 'none';
            idNumberField.style.display = 'none';
            nonResident.style.display = 'none';
        }
    }

    function toggleCustomerRemarks() {
        const showRemarks = document.getElementById("showRemarksOnTxn").value;
        const remarksContainer = document.getElementById("customerRemarksContainer");

        if (showRemarks === "1") {
            remarksContainer.style.display = "block";
        } else {
            remarksContainer.style.display = "none";
        }
    }

    // Ensure the correct fields are toggled on page load
    document.addEventListener('DOMContentLoaded', function() {
        console.log("Page Loaded");
        document.getElementById('idNumber').addEventListener('input', function () {
                const idNumber = this.value.trim();
                const residentType = document.getElementById('residentType').value;
                const dateOfBirth = document.getElementById('dateOfBirth').value;
                const placeOfBirth = document.getElementById('placeOfBirth').value.trim();
                const gender = document.getElementById('gender').value;

                const errorSpan = document.getElementById('idNumberError');
                errorSpan.textContent = ""; // Clear previous errors

                // Only validate when residentType is "101"
                if (residentType !== "101") {
                    return; // Skip validation if not resident type "101"
                }

                // Extract integer value from placeOfBirth (e.g., "Cansno (20)" -> "20")
                const placeOfBirthMatch = placeOfBirth.match(/\((\d+)\)$/); // Regex to extract digits in parentheses
                const placeOfBirthCode = placeOfBirthMatch ? placeOfBirthMatch[1] : null;

                // Validation starts here
                if (idNumber.length < 12) {
                    errorSpan.textContent = "ID Number must be 12 digit.";
                    return;
                }

                // Validate first 6 characters (YY-MM-DD)
                if (dateOfBirth) {
                    const dobParts = dateOfBirth.split("-");
                    const expectedDob = dobParts[0].substring(2) + dobParts[1] + dobParts[2]; // Convert YYYY-MM-DD to YYMMDD
                    if (idNumber.substring(0, 6) !== expectedDob) {
                        errorSpan.textContent = "First 6 characters must match Date of Birth";
                        return;
                    }
                } else {
                    errorSpan.textContent = "Please select Date of Birth";
                    return;
                }

                // Validate next 2 characters (Place of Birth)
                if (placeOfBirthCode && idNumber.substring(6, 8) !== placeOfBirthCode) {
                    errorSpan.textContent = "7th and 8th digit must be Place of Birth code";
                    return;
                } else if (!placeOfBirthCode) {
                    errorSpan.textContent = "Please select Place of Birth";
                    return;
                }

                // Validate last character (Gender)
                const expectedGenderChar = gender === "Male" ? "1" : "0";
                if (idNumber.charAt(11) !== expectedGenderChar) {
                    errorSpan.textContent = "Last digit must be 1 for Male or 0 for Female";
                    return;
                }

                // If all validations pass
                errorSpan.textContent = ""; // Clear errors
            });
        toggleFields();
        toggleCustomerRemarks();
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

			<jsp:include page="customersearch.jsp"></jsp:include>

			<div class="spinner-container" id="loader">
				<div class="spinner-border text-primary" role="status">
					<span class="visually-hidden">Loading...</span>
				</div>
			</div>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<form:form modelAttribute="customer" id="customerOnboardForm"
				action="${pageContext.request.contextPath}/createUser" method="post"
				enctype="multipart/form-data" onsubmit="return validation(this)">
				<form:hidden path="isValid" value="true" />
				<form:hidden path="ecrn" />


				<div class="${not empty customerList?'main-content':'hidden' }">
					<div class="row">
						<div class="col-lg-12">
							<div class="card stretch stretch-full">
								<div class="card-body p-0">
									<div class="table-responsive">
										<table class="table table-hover" id="search-result">
											<thead>
												<tr>

													<th>Ecrn</th>
													<th>First Name</th>
													<th>Mobile Number</th>
													<th>Email</th>
													<th>Country</th>
													<th>Gender</th>

													<th class="text-end">Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="customer" items="${customerList}"
													varStatus="status">
													<tr>

														<td><a href="customerdetails?ecrn=${customer.ecrn}">${customer.ecrn}</a></td>
														<td>${customer.firstName}</td>
														<td>${customer.phoneNumber}</td>
														<td>${customer.emailId}</td>
														<td>${customer.countryOfResidence }</td>
														<td>${customer.gender }</td>

														<td class="text-end"><a
															href="customerdetails?ecrn=${customer.ecrn}"
															class="btn btn-light-brand">View</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item" style="background: aliceblue;">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								style="background: aliceblue;"
								onclick="toggleDiv('panelsStayOpen-collapseOne')">Personal
								Details</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body"
								style="background: aliceblue; margin-top: -40px;">
								<div class="main-content">
									<!-- <div
										class="mb-4 d-flex align-items-center justify-content-between">
										<h5 class="fw-bold mb-0 me-4">
											<span class="d-block mb-2">Personal Information:</span> <span
												class="fs-12 fw-normal text-muted text-truncate-1-line">Following
												information is publicly displayed, be careful! </span>
										</h5>
										<a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Add New</a>
									</div> -->

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Salutation<span
													class="text-danger">*</span></label>
												<form:select path="salutation" class="form-control"
													data-select2-selector="icon" multiple="false">
													<form:option value="" disabled="true" selected="true">Select Salutation</form:option>
													<form:options items="${salutationList}" itemValue="valueId"
														itemLabel="displayName" />
												</form:select>
												<span id="salutationError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">First Name<span
													class="text-danger">*</span></label>
												<form:input path="firstName" type="text"
													class="form-control" placeholder="First Name" />
												<span id="firstNameError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Middle Name</label>
												<form:input path="middleName" type="text"
													class="form-control" placeholder="Middle Name" />
												<span id="middleNameError" class="text-danger"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Last Name<span
													class="text-danger">*</span></label>
												<form:input path="lastName" type="text" class="form-control"
													placeholder="Last Name" />
												<span id="lastNameError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Preferred Name</label>
												<form:input path="preferredName" type="text"
													class="form-control" placeholder="Preferred Name" />
												<span id="preferredNameError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Nationality <span
													class="text-danger">*</span></label>
												<form:select path="nationality" id="nationality"
													class="form-control" data-select2-selector="icon"
													multiple="false">
													<form:option value="" disabled="true" selected="true">Nationality</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="nationalityError" class="text-danger"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Nationality </label>
												<form:select path="secondNationality" class="form-control"
													data-select2-selector="icon" multiple="false">
													<form:option value="" disabled="true" selected="true">Secondary Nationality</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="secondNationalityError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4"> 
											<div class="mb-4">
												<label class="form-label">Native Region <span
													class="text-danger">*</span></label>
												<form:select path="nativeRegion" id="nativeRegion"
													class="form-control" multiple="false"  data-select2-selector="icon">
													<form:option value="" disabled="true" selected="true">Select Native Region</form:option>
													<form:options items="${nativeRegionList}"
														itemValue="valueId" itemLabel="description" />
												</form:select>
												<span id="nativeRegionError" class="text-danger"></span>
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Date of Birth<span
													class="text-danger">*</span></label>
												<form:input path="dateOfBirth" id="dateOfBirth" type="date"
													class="form-control" />
												<span id="dateOfBirthError" class="text-danger"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Birth<span
													class="text-danger">*</span></label>
												<form:select path="countryOfBirth" id="countryOfBirth"
													class="form-control" data-select2-selector="icon"
													multiple="false">
													<form:option value="" disabled="true" selected="true">Country of Birth</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="countryOfBirthError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Place of Birth </label>
												<form:select path="placeOfBirth" id="placeOfBirth"
													class="form-control" data-select2-selector="icon"
													multiple="false">
													<form:option value="" disabled="true" selected="true">Select Place of Birth</form:option>
													<form:options items="${placeOfBirthList}"
														itemValue="description" itemLabel="description" />
												</form:select>
												<span id="placeOfBirthError" class="text-danger"></span>

												<!-- <form:input path="placeOfBirth" type="text"
													class="form-control" placeholder="Place of Birth" />
												<span id="placeOfBirthError" class="text-danger"></span>  -->
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Residence<span
													class="text-danger">*</span></label>
												<form:select path="countryOfResidence" class="form-control"
													data-select2-selector="icon" multiple="false"
													id="countryOfResidence">
													<form:option value="" disabled="true" selected="true">Country of Residence</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="countryOfResidenceError" class="text-danger"></span>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Gender<span
													class="text-danger">*</span></label>
												<form:select path="gender" id="gender" class="form-control"
													data-select2-selector="icon" multiple="false">
													<form:option value="" disabled="true" selected="true">Gender</form:option>
													<form:options items="${genderList}" />
												</form:select>
												<span id="genderError" class="text-danger"></span>
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mothers Maiden Name</label>
												<form:input path="mothersMaidenName" type="Text"
													class="form-control" placeholder="Mothers Maiden Name" />
												<span id="mothersMaidenNameError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Primary Mobile Number<span
													class="text-danger">*</span></label>
												<div class="input-group">
													<form:select path="phoneCode" id="phoneCode"
														class="form-control" multiple="false"
														style="max-width: 80px; padding: 0;text-align:center;">
														<form:option value="+60" disabled="true" selected="true">+60</form:option>
													</form:select>
													<form:input path="primaryMobileNumber" type="text"
														class="form-control" placeholder="Primary Mobile Number"
														id="primaryMobileNumber" />
												</div>
												<span id="primaryMobileNumberError" class="text-danger"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Mobile Number</label>
												<form:input path="secondaryMobileNumber" type="text"
													class="form-control" placeholder="Secondary Mobile Number" />
												<span id="secondaryMobileNumberError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Email<span
													class="text-danger">*</span></label>
												<form:input path="emailId" type="email" class="form-control"
													placeholder="Email" />
												<span id="emailIdError" class="text-danger"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Phone Number</label>
												<form:input path="phoneNumber" type="text"
													class="form-control" placeholder="Phone Number" />
												<span id="phoneNumberError" class="text-danger"></span>
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
														<label class="form-label">Building Name<span
															class="text-danger">*</span></label>
														<form:input path="buildingName" type="text"
															class="form-control" placeholder="Building Name"
															id="currentBuildingName" />
														<span id="buildingNameError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name<span
															class="text-danger">*</span></label>
														<form:input path="streetName" type="text"
															class="form-control" placeholder="Street Name"
															id="currentStreetName" />
														<span id="streetNameError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark<span
															class="text-danger">*</span></label>
														<form:input path="landmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="currentLandmark" />
														<span id="landmarkError" class="text-danger"></span>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">City<span
															class="text-danger">*</span></label>
														<form:input path="city" type="text" class="form-control"
															placeholder="City" id="currentCity" />
														<span id="cityError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District<span
															class="text-danger">*</span></label>
														<form:input path="district" type="text"
															class="form-control" placeholder="District"
															id="currentDistrict" />
														<span id="districtError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country<span
															class="text-danger">*</span></label>
														<form:select path="country" class="form-control"
															data-select2-selector="icon" multiple="false"
															id="currentCountry">
															<form:option value="" disabled="true" selected="true">Select Country</form:option>
															<form:options items="${countryList}" itemValue="valueId"
																itemLabel="description" />
														</form:select>
														<span id="countryError" class="text-danger"></span>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State<span
															class="text-danger">*</span></label>
														<form:select path="state" id="stateDropdown"
															class="form-control" data-select2-selector="icon"
															multiple="false">
															<form:option value="" disabled="true" selected="true">Select State</form:option>
															<form:options items="${stateList}" itemValue="valueId"
																itemLabel="description" />
														</form:select>
														<span id="stateError" class="text-danger"></span>
													</div>
												</div>

												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip<span
															class="text-danger">*</span></label>
														<form:input path="zip" type="text" class="form-control"
															placeholder="Zip" id="currentZip" />
														<span id="zipError" class="text-danger"></span>
													</div>
												</div>
												<!-- <div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Po. Box</label>
														<form:input path="poBox" type="text" class="form-control"
															placeholder="Po.Box" id="currentPoBox" />
													</div>
												</div> -->
											</div>

											<div class="row">
												<h6>
													<span class="d-block mb-2">Permanent Address:</span>
												</h6>
											</div>
											<div class="row">
												<div class="mb-4">
													<div class="col-xl-4">
														<strong><input type="checkbox"
															id="sameAsCurrentAddress" name="sameAsCurrentAddress"
															onclick="copyAddress()" /> Current Address is Permanent
															Address</strong>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Building Name</label>
														<form:input path="parBuildingName" type="text"
															class="form-control" placeholder="Building Name"
															id="permanentBuildingName" />
														<span id="parBuildingNameError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label>
														<form:input path="parStreetName" type="text"
															class="form-control" placeholder="Street Name"
															id="permanentStreetName" />
														<span id="parStreetNameError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label>
														<form:input path="parLandmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="permanentLandmark" />
														<span id="parLandmarkError" class="text-danger"></span>
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
														<span id="parCityError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label>
														<form:input path="parDistrict" type="text"
															class="form-control" placeholder="District"
															id="permanentDistrict" />
														<span id="parDistrictError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country</label>
														<form:select path="parCountry" class="form-control"
															data-select2-selector="icon" multiple="false"
															id="permanentCountry">
															<form:option value="" disabled="true" selected="true">Select Country</form:option>
															<form:options items="${countryList}" itemValue="valueId"
																itemLabel="description" />
														</form:select>
														<span id="parCountryError" class="text-danger"></span>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State</label>
														<form:select path="parState" id="parStateDropdown"
															class="form-control" multiple="false" style="height: 46;"
															title="Select State">
															<form:option value="" disabled="true" selected="true">Select State</form:option>
																<form:options items="${stateList}" itemValue="valueId"
																itemLabel="description" />
														</form:select>
														<span id="parStateError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label>
														<form:input path="parZip" type="text" class="form-control"
															placeholder="Zip" id="permanentZip" />
														<span id="parZipError" class="text-danger"></span>
													</div>
												</div>
												<!-- <div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Po. Box</label>
														<form:input path="parPoBox" type="text"
															class="form-control" placeholder="Po.Box"
															id="permanentPoBox" />
													</div>
												</div> -->
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


										<div class="row mb-4 align-items-center">
											<div class="row">
												<div class="col-lg-4">
													<label class="fw-semibold">Resident Type</label>
												</div>
												<div class="col-lg-8">
													<div class="mb-4">
														<form:select id="residentType" path="residentTypeId"
															class="form-control" data-select2-selector="icon"
															multiple="false" onchange="toggleFields(); "
															onblur="toggleFields();">
															<form:option value="" disabled="true" selected="true">Select Resident Type</form:option>
															<form:options items="${residentTypeList}"
																itemValue="valueId" itemLabel="description" />
														</form:select>
														<span id="residentTypeError" class="text-danger"></span>
													</div>
												</div>
											</div>
											<hr>

											<div id="idNumberField" class="row">
												<div id="nonResident" class="row"
													style="display: flex; justify-content: end;">
													<a href="javascript:void(0);"
														class="avatar-text avatar-md bg-primary text-white"> <i
														class="feather-plus"></i>
													</a>
												</div>
												<div id="customerIdentityContainer" class="row">
													<div class="row">
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
																	class="text-danger">*</span></label>
																<!-- Input field for fixed ID type -->
																<input type="text" id="idType" class="form-control"
																	placeholder="ID Type" readonly> <input
																	type="hidden" id="hiddenIdType" name="idType">
																<form:select id="idTypeDropdown" path="idType"
																	class="form-control" style="display: none;">
																	<form:option value="2" disabled="true" selected="true">PASSPORT</form:option>
																	<form:options items="${idTypeList}" itemValue="valueId"
																		itemLabel="description" />
																</form:select>
																<span id="idTypeError" class="text-danger"></span>
															</div>
														</div>
														<div class="col-xl-4">
															<div class="mb-4">
																<label class="form-label">Id Number<span
																	class="text-danger">*</span></label>
																<form:input path="idNumber" id="idNumber"
																	name="idNumber" placeholder="Id Number" type="text"
																	class="form-control" />
																<span id="idNumberError" class="text-danger"></span>
															</div>
														</div>
														<div class="col-xl-4">
															<div class="mb-4">
																<label class="form-label">Name as per Id<span
																	class="text-danger">*</span></label>
																<form:input path="nameAsPerId" type="text"
																	class="form-control" placeholder="Name as per Id" />
																<span id="nameAsPerIdError" class="text-danger"></span>
															</div>
														</div>
													</div>

													<div id="issuedForNonResidents">
														<div class="row">
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Issued Country<span
																		class="text-danger">*</span></label>
																	<form:select path="issuedCountry" class="form-control"
																		data-select2-selector="icon" multiple="false">
																		<form:option value="" disabled="true" selected="true">Issued Country</form:option>
																		<form:options items="${countryList}"
																			itemValue="valueId" itemLabel="description" />
																	</form:select>
																	<span id="issuedCountryError" class="text-danger"></span>
																</div>
															</div>
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Issued at<span
																		class="text-danger">*</span></label>
																	<form:select path="issuedAt" class="form-control"
																		data-select2-selector="icon" multiple="false">
																		<form:option value="" disabled="true" selected="true">Issued at</form:option>
																		<form:options items="${countryList}"
																			itemValue="description" itemLabel="description" />
																	</form:select>
																	<span id="issuedAtError" class="text-danger"></span>
																</div>
															</div>
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Issued By<span
																		class="text-danger">*</span></label>
																	<form:input path="issuedBy" type="text"
																		class="form-control" placeholder="Issued By"
																		id="issuedBy" />
																	<span id="issuedByError" class="text-danger"></span>
																</div>
															</div>
														</div>
													</div>

													<div id="issuedDateExpiryNonResident">
														<div class="row">
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Issued on<span
																		class="text-danger">*</span></label>
																	<form:input path="issuedOn" type="date"
																		class="form-control" />
																	<span id="issuedOnError" class="text-danger"></span>
																</div>
															</div>
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Date of Expiry<span
																		class="text-danger">*</span></label>
																	<form:input path="dateOfExpiry" type="date"
																		class="form-control" />
																	<span id="dateOfExpiryError" class="text-danger"></span>
																</div>
															</div>
														</div>
													</div>
													<div id="idDetails">
														<div class="row">
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Id Front (Jpg only)<span
																		class="text-danger">*</span></label>
																	<form:input path="frontPictureFile" type="file"
																		accept="image/jpeg, image/jpg" class="form-control"
																		placeholder="Id Front" />
																</div>
															</div>
															<div class="col-xl-4">
																<div class="mb-4">
																	<label class="form-label">Id Back (Jpg only)<span
																		class="text-danger">*</span></label>
																	<form:input path="backPictureFile" type="file"
																		accept="image/jpeg, image/jpg" class="form-control"
																		placeholder="Id Back" />
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
																		<label class="form-label">Visa Number</label>
																		<form:input path="visaNumber" type="text"
																			class="form-control" placeholder="Visa Number" />
																		<span id="visaNumberError" class="text-danger"></span>
																	</div>
																</div>
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Visa Expiry Date</label>
																		<form:input path="visaExpiryDate" type="date"
																			class="form-control" placeholder="Visa Expiry Date" />
																		<span id="visaExpiryDateError" class="text-danger"></span>
																	</div>
																</div>
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Visa Type</label>
																		<form:select path="visaType" class="form-control"
																			data-select2-selector="icon">
																			<form:option value="" disabled="true" selected="true">Visa Type</form:option>
																			<option value="1">Employment</option>
																			<option value="2">Visitor</option>
																			<option value="3">MyKad</option>
																		</form:select>
																		<span id="visaTypeError" class="text-danger"></span>
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
							</div>
						</div>
					</div>
					<!--<div class="card-body pass-info">
									<div class="main-content">
										<div
											class="mb-4 d-flex align-items-center justify-content-between">
											<h5 class="fw-bold mb-0 me-4">
												<span class="d-block mb-2">Upload Document</span>
											</h5>
										</div>

										<div class="row mb-4 align-items-center">


										</div>

									</div>
								</div>
								-->

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
												<span class="d-block mb-2">Other Information </span> <span
													class="fs-12 fw-normal text-muted text-truncate-1-line">Following
													information is publicly displayed, be careful! </span>
											</h5>

										</div> -->

										<div class="card-body pass-security">
											<div class="row">

												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Annual Income Range<span
															class="text-danger">*</span></label>
														<form:select path="annualIncomeRangeId"
															class="form-control" data-select2-selector="icon"
															multiple="false">
															<form:option value="" disabled="true" selected="true">Annual Income Range</form:option>
															<form:options items="${annualIncomeRangeList}"
																itemValue="valueId" itemLabel="description" />
														</form:select>
														<span id="annualIncomeRangeIdError" class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Annual Income Currency
															Code<span class="text-danger">*</span>
														</label>
														<form:select path="annualIncomeCurrencyCode"
															class="form-control" data-select2-selector="icon"
															multiple="false">
															<form:option value="" disabled="true" selected="true">Annual Income Currency</form:option>
															<%-- <form:options items="${currencyList}" itemValue="valueId"
														itemLabel="description"/> --%>
															<form:option value="MYR">Malaysian Ringgit</form:option>
														</form:select>
														<span id="annualIncomeCurrencyCodeError"
															class="text-danger"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Tax Registration Number</label>
														<form:input path="taxRegistrationNumber" type="text"
															class="form-control"
															placeholder="Tax Registration Number" />
														<span id="taxRegistrationNumberError" class="text-danger"></span>
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

										<%-- --%>
										<div class="row">
											<%-- <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer ecrn<span
														class="text-danger">*</span></label>
													<form:input path="ecrn" type="text" class="form-control"
														placeholder="Employer ecrn" />
												</div>
											</div>
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
														class="text-danger">*</span></label>
													<form:select path="riskRatingId" class="form-control"
														data-select2-selector="icon" multiple="false">
														<form:option value="" disabled="true" selected="true">Risk Rating Id</form:option>
														<form:options items="${riskRatingIdList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="riskRatingIdError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Income Type<span
														class="text-danger">*</span></label>
													<form:select path="incomeType" class="form-control"
														data-select2-selector="icon" multiple="false">
														<form:option value="" disabled="true" selected="true">Income Type</form:option>
														<form:options items="${incomeTypeList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="incomeTypeError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profession Catagory<span
														class="text-danger">*</span></label>
													<form:select path="professionCategory" class="form-control"
														data-select2-selector="icon" multiple="false">
														<form:option value="" disabled="true" selected="true">Profession Catagory</form:option>
														<form:options items="${professionCategoryList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="professionCategoryError" class="text-danger"></span>
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
													<label class="form-label">Employer Name<span
														class="text-danger">*</span></label>
													<form:input path="employerName" type="text"
														class="form-control" placeholder="Employer Name" />
													<span id="employerNameError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Address<span
														class="text-danger">*</span></label>
													<form:input path="employerAddress" type="text"
														class="form-control" placeholder="Employer Address" />
													<span id="employerAddressError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Phone<span
														class="text-danger">*</span></label>
													<form:input path="employerPhone" type="tel"
														class="form-control" placeholder="Employer Phone" />
													<span id="employerPhoneError" class="text-danger"></span>
												</div>
											</div>
										</div>
										<div class="row">

											<%-- <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Reason For Acc.<span
														class="text-danger">*</span></label>
													<form:input path="reasonForAcc" type="text"
														class="form-control" placeholder="Reason For Acc." />
												</div>
											</div> --%>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Volume Month<span
														class="text-danger">*</span>
													</label>
													<form:select path="txnVolMonth" class="form-control"
														data-select2-selector="icon" multiple="false">
														<form:option value="" disabled="true" selected="true">Transaction Volume Month</form:option>
														<form:options items="${transactionVolumeMonthList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="txnVolMonthError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Count Month<span
														class="text-danger">*</span></label>
													<form:select path="txnCountMonth" class="form-control"
														data-select2-selector="icon" multiple="false">
														<form:option value="" disabled="true" selected="true">Transaction Count Month</form:option>
														<form:options items="${transactionCountMonthList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="txnCountMonthError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">First Language<span
														class="text-danger">*</span></label>
													<form:select path="firstLanguage" class="form-control"
														data-select2-selector="icon">
														<option value="en">English</option>
													</form:select>
													<span id="firstLanguageError" class="text-danger"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Marital Status<span
														class="text-danger">*</span></label>
													<form:select path="maritalStatus" class="form-control"
														data-select2-selector="icon">
														<form:option value="" disabled="true" selected="true">Marital Status</form:option>
														<option value="2">Unmarried</option>
														<option value="1">Married</option>
													</form:select>
													<span id="maritalStatusError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Occupation</label>
													<form:select path="occupationId" class="form-control"
														data-select2-selector="icon" multiple="false">
														<form:option value="" disabled="true" selected="true">Occupation</form:option>
														<form:options items="${occupationIdList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="occupationIdError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Political Exposed Person</label>
													<form:select path="politicalExposedPerson"
														class="form-control" data-select2-selector="icon">
														<form:option value="0">No</form:option>
														<form:option value="1">Yes</form:option>
													</form:select>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Show Remark on
														Transaction <span class="text-danger">*</span>
													</label>
													<form:select path="showRemarksOnTxn" id="showRemarksOnTxn"
														class="form-control" data-select2-selector="icon"
														onchange="toggleCustomerRemarks();">
														<option value="0">No</option>
														<option value="1">Yes</option>
													</form:select>
												</div>
											</div>
											<div id="customerRemarksContainer" class="col-xl-4"
												style="display: none;">
												<div class="mb-4">
													<label class="form-label">Customer Remarks</label>
													<form:input path="customerRemarks" class="form-control"
														placeholder="Enter your remarks here" />
													<span id="customerRemarksError" class="text-danger"></span>
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
					<button type="submit" class="btn btn-primary">Submit</button>
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