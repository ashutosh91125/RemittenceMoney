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
<title>Customers Update</title>
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
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/customer-update-validations.js"></script>
<script type="text/javascript" src="js/commons.js"></script>
<script type="text/javascript">
/*let identityIndex = ${customer.idDetails != null ? customer.idDetails.size() : 0}; */
let identityIndex=0;
function addIdentity() {
    const residentType = document.getElementById('residentType').value;
    const container = document.getElementById("customerIdentityContainer");
    const template = document.getElementById("identityTemplate0");

    if (template) {
        const cloned = template.cloneNode(true);
        identityIndex++;
        cloned.id = `identityTemplate${identityIndex}`;


        cloned.querySelectorAll("[id]").forEach(element => {
            const oldId = element.id;
            element.id = oldId.replace(/\d+/, identityIndex);
        });

        cloned.querySelectorAll("[name]").forEach(element => {
            const oldName = element.name;
            element.name = oldName.replace(/\d+/, identityIndex);
        });

        cloned.querySelectorAll("[path]").forEach(element => {
            const oldPath = element.getAttribute("path");
            element.setAttribute("path", oldPath.replace(/\d+/, identityIndex));
        });

        cloned.querySelectorAll("input, select, textarea").forEach(element => {
            if (element.type === "checkbox" || element.type === "radio") {
                element.checked = false;
            } else if (element.tagName === "SELECT") {
                element.selectedIndex = 0;
            } else {
                element.value = "";
            }
        });


        if (residentType === '101') {
            const idTypeDropdown = cloned.querySelector("[id^='idTypeDropdown']");
            if (idTypeDropdown) {
                idTypeDropdown.value = '28';
                idTypeDropdown.disabled = true;
            }
        }


        const idTypeDropdown = cloned.querySelector("[id^='idTypeDropdown']");
        const idDetailsFields = cloned.querySelector("#idDetailsFields");


        if (idTypeDropdown && idDetailsFields) {
            if (idTypeDropdown.value === '2') {
                idDetailsFields.style.display = 'block';
            } else {
                idDetailsFields.style.display = 'none';
            }


            idTypeDropdown.addEventListener('change', function() {
                if (idTypeDropdown.value === '2') {
                    idDetailsFields.style.display = 'block';
                } else {
                    idDetailsFields.style.display = 'none';
                }
            });
        }

        container.appendChild(cloned);
        const hr = document.createElement('hr');
        hr.style.border = "2px solid black"; 
        hr.style.margin = "20px 0"; 
        container.appendChild(hr);
    }
}



function removeIdentities() {
    const container = document.getElementById("customerIdentityContainer");
    if (container.children.length > 1) {
        container.removeChild(container.lastElementChild);
        identityIndex--;
    } else {
        alert("At least one identity must be present.");
    }
}
$(document).ready(function () {
    $("#customerOnboardForm").on("submit", function (e) {
        e.preventDefault();
        console.log("Form Submitted");

         if (!validation(this)) {
            return false;
        } 

        $('#loader').show();
        const formData = new FormData(this);
        const ecrn = $('#ecrn').val();

        // Send the data via AJAX
        $.ajax({
            url: "/caas/api/v2/customer/onBoarding/updateCustomer/" + ecrn,
            type: "PUT",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                console.log("Success response:", response);
                alert("Customer updated successfully with ECRN: " + ecrn);
                window.location.href = "/customer";
            },
            error: function (xhr) {
                console.log("Error:", xhr.responseText);
                $('#loader').hide();
                alert("Error: " + xhr.responseText);
            }
        });
    });
});


function toggleFields() {
    const residentType = document.getElementById('residentType').value;
    const idTypeDropdowns = document.querySelectorAll("[id^='idTypeDropdown']");
    const issuedDateExpiryNonResident = document.getElementById('issuedDateExpiryNonResident');
    const issuedForNonResidents = document.getElementById('issuedForNonResidents');
    const idDetails = document.getElementById('idDetails');
    const idDetailsFields = document.getElementById('idDetailsFields');
    const idNumberField = document.getElementById('idNumberField');
    const nonResident = document.getElementById('nonResident');
    const customerIdentityContainer = document.getElementById('customerIdentityContainer');

    if (residentType === '101') {
        idTypeDropdowns.forEach(dropdown => {
            dropdown.style.display = "block";
            dropdown.value = "28";
            dropdown.setAttribute("disabled", true);
        });

        issuedDateExpiryNonResident.style.display = 'none';
        issuedForNonResidents.style.display = 'none';
        idDetails.style.display = 'block';
        idDetailsFields.style.display = 'none';
        idNumberField.style.display = 'block';
         nonResident.style.display = 'none';
        customerIdentityContainer.style.display = 'block';
    } else if (residentType === '100') {
        idTypeDropdowns.forEach(dropdown => {
            dropdown.style.display = "block";
            dropdown.removeAttribute("disabled");
            dropdown.value = "2";

            dropdown.addEventListener('change', function () {
                if (this.value === '28') {
                    idDetails.style.display = 'none';
                    idDetailsFields.style.display = 'none';
                    idNumberField.style.display = 'none';
                } else if (this.value === '2') {
                    idDetailsFields.style.display = 'block';
                } else {
                    idDetailsFields.style.display = 'none';
                }
            });
        });

        issuedDateExpiryNonResident.style.display = 'block';
        issuedForNonResidents.style.display = 'block';
        idDetails.style.display = 'block';
        idDetailsFields.style.display = 'block';
        idNumberField.style.display = 'block';
         nonResident.style.display = 'flex';
        customerIdentityContainer.style.display = 'block';
    } else {
        idTypeDropdowns.forEach(dropdown => {
            dropdown.style.display = "none";
            dropdown.removeAttribute("disabled");
        });

        issuedDateExpiryNonResident.style.display = 'none';
        issuedForNonResidents.style.display = 'none';
        idDetails.style.display = 'none';
        idDetailsFields.style.display = 'none';
        idNumberField.style.display = 'none';
         nonResident.style.display = 'none';
        customerIdentityContainer.style.display = 'none';
    }
}

$(document).ready(function () {
    toggleFields();
});
$(document).ready(function() {
    $('#currentCountry').on('change', function() {
        let dependent = $(this).val(); 

        if (dependent) { 
            $.ajax({
                url: '/api/enumEntities/dependent', 
                type: 'GET',
                data: {
                    dependent: dependent
                },
                success: function(data) {
                    $('#stateDropdown')
                        .empty()
                        .append('<option value="" disabled selected>Select State</option>');

                    $.each(data, function(index, enumValue) {
                        $('#stateDropdown').append(
                            '<option value="' + enumValue.description + '">' +
                            enumValue.description +
                            '</option>'
                        );
                    });
                },
                error: function() {
                    console.error("Error fetching states for the selected country.");
                }
            });
        } else {
            $('#stateDropdown')
                .empty()
                .append('<option value="" disabled selected>Select State</option>');
        }
    });
});

$(document).ready(function() {
    $('#permanentCountry').on('change', function() {
        let dependent = $(this).val(); 
        if (dependent) { 
            $.ajax({
                url: '/api/enumEntities/dependent',
                type: 'GET',
                data: {
                    dependent: dependent 
                },
                success: function(data) {
                    $('#parStateDropdown')
                        .empty()
                        .append('<option value="" disabled selected>Select State</option>');

                    $.each(data, function(index, enumValue) {
                        $('#parStateDropdown').append(
                            '<option value="' + enumValue.description + '">' +
                            enumValue.description +
                            '</option>'
                        );
                    });
                },
                error: function() {
                    console.error("Error fetching states for the selected country.");
                }
            });
        } else { 
            $('#parStateDropdown')
                .empty()
                .append('<option value="" disabled selected>Select State</option>');
        }
    });
});



$(document).ready(function() {
    $('#nationality').on('change', function() {
        let dependent = $(this).val();

        if (dependent) { 
            $.ajax({
                url: '/api/enumEntities/dependent',
                type: 'GET',
                data: {
                    dependent: dependent 
                },
                success: function(data) {
                    $('#nativeRegion')
                        .empty()
                        .append('<option value="" disabled selected>Select Native Region</option>');

                    $.each(data, function(index, enumValue) {
                        $('#nativeRegion').append(
                            '<option value="' + enumValue.valueId + '">' +
                            enumValue.description +
                            '</option>'
                        );
                    });
                },
                error: function() {
                    console.error("Error fetching native regions for the selected country.");
                }
            });
        } else {
            $('#nativeRegion')
                .empty()
                .append('<option value="" disabled selected>Select Native Region</option>');
        }
    });
});


$(document).ready(function() {
    
    $('#countryOfBirth').on('change', function() {
        let dependent = $(this).val(); 
        
        if (dependent == "MY") {
            dependent += "R";
        }

        if (dependent) { 
            $.ajax({
                url: '/api/enumEntities/dependent',
                type: 'GET',
                data: {
                    dependent: dependent 
                },
                success: function(data) {
                    $('#placeOfBirth')
                        .empty()
                        .append('<option value="" disabled selected>Select Place Of Birth</option>');

                    $.each(data, function(index, enumValue) {
                        $('#placeOfBirth').append(
                            '<option value="' + enumValue.description + '">' +
                            enumValue.description +
                            '</option>'
                        );
                    });
                },
                error: function() {
                    console.error("Error fetching Place Of Birth for the selected country.");
                }
            });
        } else {
            $('#placeOfBirth')
                .empty()
                .append('<option value="" disabled selected>Select Place Of Birth</option>');
        }
    });

    $('#countryOfResidence').on('change', function() {
        let dependent = $(this).val(); 
        dependent += "PC";

        if (dependent) { 
            $.ajax({
                url: '/api/enumEntities/dependent',
                type: 'GET',
                data: {
                    dependent: dependent 
                },
                success: function(data) {
                    $('#phoneCode')
                        .empty();

                    $.each(data, function(index, enumValue) {
                        $('#phoneCode').append(
                            '<option value="' + enumValue.valueId + '">' +
                            enumValue.description +
                            '</option>'
                        );
                    });
                },
                error: function() {
                    console.error("Error fetching phone code for the selected country.");
                }
            });
        } else {
            $('#phoneCode')
                .empty()
                .append('<option value="" disabled selected>Select State</option>');
        }
    });
});

</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="nxl-content" style="background: aliceblue;">

			<div class="page-header" style="background: aliceblue;">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Customer</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Customer Update</li>
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
							<a href="javascript:void(0);"
								class="btn btn-primary successAlertMessage">  <i class="feather-user-plus me-2"></i>
								<span>Transfer</span>
							</a>
						</div> -->
						<div>
							<a onclick="goBack()" class="back-btn"> <i
								class="bi bi-arrow-left-circle text-primary normal-icon"></i> <i
								class="bi bi-arrow-left-circle-fill text-primary hover-icon"></i>
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

			<jsp:include page="customersearch.jsp"></jsp:include>

			<div class="spinner-container" id="loader">
				<div class="spinner-border text-primary" role="status">
					<span class="visually-hidden">Loading...</span>
				</div>
			</div>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
				crossorigin="anonymous"></script>

			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<form:form modelAttribute="customer" id="customerOnboardForm"
				method="post" enctype="multipart/form-data">
				<form:hidden path="isValid" value="true" />
				<form:hidden path="ecrn" value="" id="ecrn" />


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
														<td><div style="display: flex; justify-content: end;">
																<a href="customerdetails?ecrn=${customer.ecrn}"
																	class="avatar-text avatar-md" title="view"> <i
																	class="feather feather-eye"></i>
																</a>
															</div></td>
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
							<div class="accordion-body p-3
								style=" background:aliceblue;">
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
												<form:select path="salutation" class="form-select"
													style="font-size: inherit;" multiple="false"
													id="salutation">
													<form:option value="" disabled="true" selected="true">Select Salutation</form:option>
													<form:options items="${salutationList}" itemValue="valueId"
														itemLabel="displayName" />
												</form:select>
												<span id="salutationError" style="color: red;" /></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">First Name<span
													class="text-danger">*</span></label>
												<form:input path="firstName" type="text"
													class="form-control" placeholder="First Name"
													id="firstName" />
												<span id="firstNameError" style="color: red;"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Middle Name</label>
												<form:input path="middleName" type="text"
													class="form-control" placeholder="Middle Name" />
												<span id="middleNameError" style="color: red;"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Last Name<span
													class="text-danger">*</span></label>
												<form:input path="lastName" type="text" class="form-control"
													placeholder="Last Name" id="lastName" />
												<span id="lastNameError" style="color: red;"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Preferred Name</label>
												<form:input path="preferredName" type="text"
													class="form-control" placeholder="Preferred Name" />
												<span id="preferredNameError" style="color: red;"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Nationality <span
													class="text-danger">*</span></label>
												<form:select path="nationality" id="nationality"
													class="form-select" style="font-size: inherit;"
													multiple="false">
													<form:option value="" disabled="true" selected="true">Nationality</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="nationalityError" style="color: red;"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Nationality </label>
												<form:select path="secondNationality" class="form-select"
													style="font-size: inherit;" id="secondNationality">
													<form:option value="" disabled="true" selected="true">Secondary Nationality</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="secondNationalityError" style="color: red;"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Native Region <span
													class="text-danger">*</span></label>
												<form:select path="nativeRegion" class="form-select"
													style="font-size: inherit;" multiple="false"
													id="nativeRegion">
													<form:option value="" disabled="true" selected="true">Select Native Region</form:option>
													<form:options items="${nativeRegionList}"
														itemValue="valueId" itemLabel="description" />
												</form:select>
												<span id="nativeRegionError" style="color: red;"></span>
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Date of Birth<span
													class="text-danger">*</span></label>
												<form:input path="dateOfBirth" id="dateOfBirth" type="date"
													class="form-control" />
												<span id="dateOfBirthError" style="color: red;"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Birth<span
													class="text-danger">*</span></label>
												<form:select path="countryOfBirth" class="form-select"
													style="font-size: inherit;" multiple="false"
													id="countryOfBirth">
													<form:option value="" disabled="true" selected="true">Country of Birth</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="countryOfBirthError" style="color: red;"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Place of Birth </label>
												<form:select path="placeOfBirth" id="placeOfBirth"
													class="form-select" style="font-size: inherit;"
													multiple="false">
													<form:option value="" disabled="true" selected="true">Select Place of Birth</form:option>
													<form:options items="${placeOfBirthList}"
														itemValue="description" itemLabel="description" />
												</form:select>
												<span id="placeOfBirthError" style="color: red;"></span>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Residence<span
													class="text-danger">*</span></label>
												<form:select path="countryOfResidence" class="form-select"
													style="font-size: inherit;" multiple="false"
													id="countryOfResidence">
													<form:option value="" disabled="true" selected="true">Country of Residence</form:option>
													<form:options items="${countryList}" itemValue="valueId"
														itemLabel="description" />
												</form:select>
												<span id="countryOfResidenceError" style="color: red;"></span>
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Gender<span
													class="text-danger">*</span></label>
												<form:select path="gender" id="gender" class="form-select"
													style="font-size: inherit;" multiple="false">
													<form:option value="" disabled="true" selected="true">Gender</form:option>
													<form:options items="${genderList}" />
												</form:select>
												<span id="genderError" style="color: red;"></span>
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mothers Maiden Name</label>
												<form:input path="mothersMaidenName" type="Text"
													class="form-control" placeholder="Mothers Maiden Name" />
												<span id="mothersMaidenNameError" style="color: red;"></span>
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
								<div class="accordion-body p-3">
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
														<span id="buildingNameError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name<span
															class="text-danger">*</span></label>
														<form:input path="streetName" type="text"
															class="form-control" placeholder="Street Name"
															id="currentStreetName" />
														<span id="streetNameError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark<span
															class="text-danger">*</span></label>
														<form:input path="landmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="currentLandmark" />
														<span id="landmarkError" style="color: red;"></span>
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
														<span id="cityError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District<span
															class="text-danger">*</span></label>
														<form:input path="district" type="text"
															class="form-control" placeholder="District"
															id="currentDistrict" />
														<span id="districtError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country<span
															class="text-danger">*</span></label>
														<form:select path="country" class="form-select"
															style="font-size: inherit;" multiple="false"
															id="currentCountry">
															<form:option value="" disabled="true" selected="true">Select Country</form:option>
															<form:options items="${countryList}" itemValue="valueId"
																itemLabel="description" />
														</form:select>
														<span id="countryError" style="color: red;"></span>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State<span
															class="text-danger">*</span></label>
														<form:select path="state" id="stateDropdown"
															class="form-select" style="font-size: inherit;"
															multiple="false">
															<form:option value="" disabled="true" selected="true">Select State</form:option>
															<form:options items="${stateList}"
																itemValue="description" itemLabel="description" />
														</form:select>
														<span id="stateError" style="color: red;"></span>
													</div>
												</div>

												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip<span
															class="text-danger">*</span></label>
														<form:input path="zip" type="text" class="form-control"
															placeholder="Zip" id="currentZip" />
														<span id="zipError" style="color: red;"></span>
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
														<span id="parBuildingNameError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Street Name</label>
														<form:input path="parStreetName" type="text"
															class="form-control" placeholder="Street Name"
															id="permanentStreetName" />
														<span id="parStreetNameError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Land Mark</label>
														<form:input path="parLandmark" type="text"
															class="form-control" placeholder="Land Mark"
															id="permanentLandmark" />
														<span id="parLandmarkError" style="color: red;"></span>
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
														<span id="parCityError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">District</label>
														<form:input path="parDistrict" type="text"
															class="form-control" placeholder="District"
															id="permanentDistrict" />
														<span id="parDistrictError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Country</label>
														<form:select path="parCountry" class="form-select"
															style="font-size: inherit;" id="permanentCountry">
															<form:option value="" disabled="true" selected="true">Select Country</form:option>
															<form:options items="${countryList}" itemValue="valueId"
																itemLabel="description" />
														</form:select>
														<span id="parCountryError" style="color: red;"></span>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">State</label>
														<form:select path="parState" id="parStateDropdown"
															class="form-select"
															style="font-size: inherit; height: 46;" multiple="false"
															title="Select State">
															<form:option value="" disabled="true" selected="true">Select State</form:option>
															<form:options items="${stateList}"
																itemValue="description" itemLabel="description" />
														</form:select>
														<span id="parStateError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Zip</label>
														<form:input path="parZip" type="text" class="form-control"
															placeholder="Zip" id="permanentZip" />
														<span id="parZipError" style="color: red;"></span>
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
								onclick="toggleDiv('panelsStayOpen-collapseThree')">Contact
								Details</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body p-3" style="background: aliceblue;">
								<div class="card-body personal-info">
									<div class="main-content">

										<div class="card-body pass-security">
											<div class="row">
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
														<span id="primaryMobileNumberError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Secondary Mobile Number</label>
														<form:input path="secondaryMobileNumber" type="text"
															class="form-control"
															placeholder="Secondary Mobile Number" />
														<span id="secondaryMobileNumberError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Email<span
															class="text-danger">*</span></label>
														<form:input path="emailId" type="email"
															class="form-control" placeholder="Email" id="emailId" />
														<span id="emailIdError" style="color: red;"></span>
													</div>
												</div>
												<div class="row">
													<div class="col-xl-4">
														<div class="mb-4">
															<label class="form-label">Phone Number</label>
															<form:input path="phoneNumber" type="text"
																class="form-control" placeholder="Phone Number" />
															<span id="phoneNumberError" style="color: red;"></span>
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
					<div class="accordion-item" style="background: aliceblue;">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								style="background: aliceblue;"
								onclick="toggleDiv('panelsStayOpen-collapseFour')">KYC</button>
						</h2>
						<div id="panelsStayOpen-collapseFour"
							class="accordion-collapse collapse">
							<div class="accordion-body p-3" style="background: aliceblue;">
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
															class="form-control" multiple="false"
															onchange="toggleFields(); " onblur="toggleFields();">
															<form:option value="" disabled="true" selected="true">Select Resident Type</form:option>
															<form:options items="${residentTypeList}"
																itemValue="valueId" itemLabel="description" />
														</form:select>
														<span id="residentTypeError" style="color: red;"></span>
													</div>
												</div>
											</div>
											<div id="nonResident" class="row"
												style="display: flex; justify-content: end;">
												<a onclick="addIdentity()"
													class="avatar-text avatar-md bg-primary text-white"> <i
													class="feather-plus"></i>
												</a>&nbsp;&nbsp; <a onclick="removeIdentities()"
													class="avatar-text avatar-md bg-secondary text-danger">
													<i class="feather-minus"></i> <!-- or you can use feather-trash-2 -->
												</a>
											</div>

											<div id="idNumberField" class="row">
												<div id="customerIdentityContainer" class="row">
													<c:forEach var="idDetail" items="${customer.idDetails}"
														varStatus="status">
														<div class="identity-row row"
															id="identityTemplate${status.index}">
															<div class="row" id="customerTemplate${status.index}">
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
																		<form:select id="idTypeDropdown${status.index}"
																			path="idDetails[${status.index}].idType"
																			class="form-select" style="font-size: inherit;">
																			<form:options items="${idTypesList}"
																				itemValue="valueId" itemLabel="description" />
																		</form:select>
																		<span id="idTypeError${status.index}"
																			class="text-danger"></span>
																	</div>
																</div>
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Id Number<span
																			class="text-danger">*</span></label>
																		<form:input path="idDetails[${status.index}].idNumber"
																			id="idNumber" name="idNumber" placeholder="Id Number"
																			type="text" class="form-control" />
																		<span id="idNumberError${status.index}"
																			class="text-danger"></span>
																	</div>
																</div>
																<div class="col-xl-4">
																	<div class="mb-4">
																		<label class="form-label">Name as per Id<span
																			class="text-danger">*</span></label>
																		<form:input
																			path="idDetails[${status.index}].nameAsPerId"
																			type="text" class="form-control"
																			placeholder="Name as per Id" />
																		<span id="nameAsPerIdError${status.index}"
																			class="text-danger"></span>
																	</div>
																</div>
															</div>

															<div id="issuedForNonResidents">
																<div class="row">
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued Country<span
																				class="text-danger">*</span></label>
																			<form:select
																				path="idDetails[${status.index}].issuedCountry"
																				class="form-select" style="font-size: inherit;"
																				multiple="false">
																				<form:option value="" disabled="true"
																					selected="true">Issued Country</form:option>
																				<form:options items="${countryList}"
																					itemValue="valueId" itemLabel="description" />
																			</form:select>
																			<span id="issuedCountryError${status.index}"
																				class="text-danger"></span>
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued at<span
																				class="text-danger">*</span></label>
																			<form:select
																				path="idDetails[${status.index}].issuedAt"
																				class="form-select" style="font-size: inherit;"
																				multiple="false">
																				<form:option value="" disabled="true"
																					selected="true">Issued at</form:option>
																				<form:options items="${countryList}"
																					itemValue="valueId" itemLabel="description" />
																			</form:select>
																			<span id="issuedAtError${status.index}"
																				class="text-danger"></span>
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Issued By<span
																				class="text-danger">*</span></label>
																			<form:input
																				path="idDetails[${status.index}].issuedBy"
																				type="text" class="form-control"
																				placeholder="Issued By" id="issuedBy" />
																			<span id="issuedByError${status.index}"
																				class="text-danger"></span>
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
																			<form:input
																				path="idDetails[${status.index}].issuedOn"
																				type="date" class="form-control" min="1900-01-01"
																				max="${today}" />
																			<span id="issuedOnError${status.index}"
																				class="text-danger"></span>
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Date of Expiry<span
																				class="text-danger">*</span></label>
																			<form:input
																				path="idDetails[${status.index}].dateOfExpiry"
																				type="date" class="form-control" min="${tomorrow}" />
																			<span id="dateOfExpiryError${status.index}"
																				class="text-danger"></span>
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
																			<form:input
																				path="idDetails[${status.index}].frontPictureFile"
																				type="file" accept="image/jpeg, image/jpg"
																				class="form-control" placeholder="Id Front" />
																		</div>
																	</div>
																	<div class="col-xl-4">
																		<div class="mb-4">
																			<label class="form-label">Id Back (Jpg only)<span
																				class="text-danger">*</span></label>
																			<form:input
																				path="idDetails[${status.index}].backPictureFile"
																				type="file" accept="image/jpeg, image/jpg"
																				class="form-control" placeholder="Id Back" />
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
																				<form:input
																					path="idDetails[${status.index}].visaNumber"
																					type="text" class="form-control"
																					placeholder="Visa Number" />
																				<span id="visaNumberError${status.index}"
																					class="text-danger"></span>
																			</div>
																		</div>
																		<div class="col-xl-4">
																			<div class="mb-4">
																				<label class="form-label">Visa Expiry Date</label>
																				<form:input
																					path="idDetails[${status.index}].visaExpiryDate"
																					type="date" class="form-control"
																					placeholder="Visa Expiry Date" />
																				<span id="visaExpiryDateError${status.index}"
																					class="text-danger"></span>
																			</div>
																		</div>
																		<div class="col-xl-4">
																			<div class="mb-4">
																				<label class="form-label">Visa Type</label>
																				<form:select
																					path="idDetails[${status.index}].visaType"
																					class="form-select" style="font-size: inherit;">
																					<form:option value="" disabled="true"
																						selected="true">Visa Type</form:option>
																					<option value="1">Employment</option>
																					<option value="2">Visitor</option>
																					<option value="3">MyKad</option>
																				</form:select>
																				<span id="visaTypeError${status.index}"
																					class="text-danger"></span>
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
								onclick="toggleDiv('panelsStayOpen-collapseFive')">Other
								Information</button>
						</h2>
						<div id="panelsStayOpen-collapseFive"
							class="accordion-collapse collapse">
							<div class="accordion-body p-3" style="background: aliceblue;">
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
															class="form-select" style="font-size: inherit;"
															multiple="false" id="annualIncomeRangeId">
															<form:option value="" disabled="true" selected="true">Annual Income Range</form:option>
															<form:options items="${annualIncomeRangeList}"
																itemValue="valueId" itemLabel="description" />
														</form:select>
														<span id="annualIncomeRangeIdError" style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Annual Income Currency
															Code<span class="text-danger">*</span>
														</label>
														<form:select path="annualIncomeCurrencyCode"
															class="form-select" style="font-size: inherit;"
															multiple="false" id="annualIncomeCurrencyCode">
															<form:option value="" disabled="true" selected="true">Annual Income Currency</form:option>
															<%-- <form:options items="${currencyList}" itemValue="valueId"
														itemLabel="description"/> --%>
															<form:option value="MYR">Malaysian Ringgit</form:option>
														</form:select>
														<span id="annualIncomeCurrencyCodeError"
															style="color: red;"></span>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Tax Registration Number</label>
														<form:input path="taxRegistrationNumber" type="text"
															class="form-control"
															placeholder="Tax Registration Number" />
														<span id="taxRegistrationNumberError" style="color: red;"></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Risk Rating<span
														class="text-danger">*</span></label>
													<form:select path="riskRatingId" class="form-select"
														style="font-size: inherit;" multiple="false"
														id="riskRatingId">
														<form:option value="" disabled="true" selected="true">Risk Rating</form:option>
														<form:options items="${riskRatingIdList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="riskRatingIdError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Income Type<span
														class="text-danger">*</span></label>
													<form:select path="incomeType" class="form-select"
														style="font-size: inherit;" multiple="false"
														id="incomeType">
														<form:option value="" disabled="true" selected="true">Income Type</form:option>
														<form:options items="${incomeTypeList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="incomeTypeError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profession Catagory<span
														class="text-danger">*</span></label>
													<form:select path="professionCategory" class="form-select"
														style="font-size: inherit;" multiple="false"
														id="professionCategory">
														<form:option value="" disabled="true" selected="true">Profession Catagory</form:option>
														<form:options items="${professionCategoryList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="professionCategoryError" style="color: red;"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Name<span
														class="text-danger">*</span></label>
													<form:input path="employerName" type="text"
														class="form-control" placeholder="Employer Name"
														id="employerName" />
													<span id="employerNameError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Address<span
														class="text-danger">*</span></label>
													<form:input path="employerAddress" type="text"
														class="form-control" placeholder="Employer Address"
														id="employerAddress" />
													<span id="employerAddressError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Phone<span
														class="text-danger">*</span></label>
													<form:input path="employerPhone" type="tel"
														id="employerPhone" class="form-control"
														placeholder="Employer Phone" />
													<span id="employerPhoneError" style="color: red;"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Monthly Transaction
														Volume<span class="text-danger">*</span>
													</label>
													<form:select path="txnVolMonth" class="form-select"
														style="font-size: inherit;" multiple="false"
														id="txnVolMonth">
														<form:option value="" disabled="true" selected="true">Monthly Transaction Volume</form:option>
														<form:options items="${transactionVolumeMonthList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="txnVolMonthError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Monthly Transaction Count<span
														class="text-danger">*</span></label>
													<form:select path="txnCountMonth" class="form-select"
														style="font-size: inherit;" multiple="false"
														id="txnCountMonth">
														<form:option value="" disabled="true" selected="true">Monthly Transaction Count</form:option>
														<form:options items="${transactionCountMonthList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="txnCountMonthError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">First Language<span
														class="text-danger">*</span></label>
													<form:select path="firstLanguage" class="form-control"
														data-select2-selector="icon" id="firstLanguage">
														<option value="en">English</option>
													</form:select>
													<span id="firstLanguageError" style="color: red;"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Marital Status<span
														class="text-danger">*</span></label>
													<form:select path="maritalStatus" class="form-select"
														style="font-size: inherit;" id="maritalStatus">
														<%-- 														<form:option value="" disabled="true" selected="true">Marital Status</form:option> --%>
														<option value="2">Unmarried</option>
														<option value="1">Married</option>
													</form:select>
													<span id="maritalStatusError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Occupation</label>
													<form:select path="occupationId" class="form-select"
														style="font-size: inherit;" multiple="false"
														id="occupationId">
														<form:option value="" disabled="true" selected="true">Occupation</form:option>
														<form:options items="${occupationIdList}"
															itemValue="valueId" itemLabel="description" />
													</form:select>
													<span id="occupationIdError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Political Exposed Person</label>
													<form:select path="politicalExposedPerson"
														class="form-select" style="font-size: inherit;">
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
														class="form-select" style="font-size: inherit;"
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
													<span id="customerRemarksError" style="color: red;"></span>
												</div>
											</div>

											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profile Photo (Jpg only)</label>
													<form:input path="profPictureFile" type="file"
														accept="image/jpeg, image/jpg" class="form-control"
														placeholder="Profile Photo" />
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
						<span id="validationError"
							style="color: #ff000087; display: none;"><b>Please
								fill all the required fields before submitting!</b></span>
					</div>
					<div class="mt-5 mb-5 text-center"
						style="display: flex; justify-content: center">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
			</form:form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/customers-create-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
</body>

</html>