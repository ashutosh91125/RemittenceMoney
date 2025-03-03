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

<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

/  for accordion  /
.accordion-button::after {
	display: none;
}
/  Add a custom icon to the left of the accordion button  /
.accordion-button::before {
	content: "\f107"; /  Font Awesome chevron-down icon  /
	font-family: 'Font Awesome 5 Free';
	font-weight: 900;
	margin-right: 10px;
	font-size: 16px;
	transition: transform 0.3s;
}

/  Rotate icon when the accordion is open  /
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

/  Ensure the .form-control class applies uniformly to inputs and selects  /
.form-control {
	width: 100%;
	/  Ensures input and select elements take up the full column width  /
	height: 46px;
	/  Set a consistent height for both input fields and selects  /
	padding: 10px; /  Adds padding for better appearance  /
	box-sizing: border-box; /  Ensures padding doesn't affect width  /
}

/  Optional: Remove any internal margins/padding that could affect layout  /
.col-xl-4 {
	padding-left: 8px;
	padding-right: 8px;
}

.mb-4 {
	margin-bottom: 1.5rem; /  Maintain consistent spacing between fields  /
}

/  Remove any width restrictions if there are any  /
.form-control:focus {
	border-color: #5e72e4; /  Optional: focus effect  /
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	/  Optional: focus effect  /
}

#search-result td {
	padding: 5px; /  Adjust padding  /
	font-size: 12px; /  Adjust font size  /
	white-space: nowrap; /  Prevent wrapping  /
}

#search-result th {
	padding: 5px; /  Adjust padding  /
	font-size: 12px; /  Adjust font size  /
	white-space: nowrap; /  Prevent wrapping  /
}

.hidden {
	display: none;
}
</style>
<script type="text/javascript" src="js/commons.js"></script>
<script>
function updateAgent() {
	    const id= $("#id").val();
	    $('#loader').show();
	    $('#submitButton').prop('disabled', true);
	    $.ajax({
	        url: "/agent-update?id=" + id,
	        type: "GET",
	        contentType: "application/x-www-form-urlencoded",
	        data: id,
	        success: function(response) {
	            $('#loader').hide();
	            $('#submitButton').prop('disabled', false);
	            $('body').html(response);
//	             alert(response);
	        },
	        error: function(xhr) {
	            $('#loader').hide();
	            $('#submitButton').prop('disabled', false);
	            alert("Error: " + xhr.responseText);
	        }
	    });
	}
	$(document).ready(function () {
	    const statusFlag = document.getElementById('statusFlag'); 
	    const status = document.getElementById('status'); 
	    
	    if (statusFlag.value === 'true') {
	        statusField.value = 'Active';
	    }
	    else{
	    	statusFlag.value = 'Inactive';
	    }
	});
function openPopupForApi(){
	 const popupForApi = document.getElementById('popupForApi');
	 const container = document.querySelector('.nxl-container');
	 popupForApi.style.display = 'block'; 
}
function closePopup() {
    $('#popupForApi').hide();
}
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("submitPasswordButton").addEventListener("click", function (event) {
    	  const apiDetails = document.getElementById("panelsStayOpen-collapseSeven");
    	  const container = document.querySelector('.nxl-container');
    	  const passwordError = document.getElementById("passwordError");
    	  const password =   document.getElementById('password').value.trim();;
    	  const id =   document.getElementById('id').value.trim();;
    	  
    	  $.ajax({
    		  url: '/api/v1/agent/api-details/' + id +'?password='+password,
              type: 'POST',
              contentType: 'application/json',
//               data: JSON.stringify({ password: password }),
              success: function (response) {
            	  if(response){
            		  $('#grantType').val(response.grantType);
                	  $('#scope').val(response.scope);
                	  $('#clientId').val(response.clientId);
                	  $('#clientSecret').val(response.clientSecret);
                	  $('#adminUserName').val(response.apiUsername);
                	  $('#adminPassword').val(response.apiPassword);
                      apiDetails.style.display ='block';
                      passwordError.textContent = '';
                      $('#popupForApi').hide();
            	  }else{
            		  apiDetails.style.display ='none';
            		  passwordError.textContent = 'Please enter the correct password'; 
                      passwordError.style.color = 'red';
            		  
            	  }
            	 
              },
              error: function (xhr, status, error) {
                  console.error('Error fetch Api Details:', error);
                  apiDetails.style.display ='none';
        		  passwordError.textContent = 'Please enter the correct password'; 
                  passwordError.style.color = 'red';
              }
          });
        
    });
});
</script>
</head>

<body>
<div class="modal fade show" id="popupForApi" tabindex="-1"
		style="display: none; padding-left: 0px;">
		<div class="modal-dialog" role="document"
			style="width: 508px; height: 360px; display: flex; align-items: center;">
			<div class="modal-content" style="position: absolute;top: 144;">
				<div class="modal-header">
					<div style="align-items: end;">
						<h5 class="modal-title" style="position: absolute; top: 15px;">Confirm Password</h5>
						<button type="button" class="btn-close" onclick="closePopup()"
							style="position: absolute; top: 15px; right: 25px;"></button>
					</div>
				</div>
				<div class="modal-body" style="display: flex;justify-content: center;">
				<input type="password" name="password" placeholder="Enter Your Password" id="password" autocomplete="new-password">
				<span id="passwordError" style="color: red;position: absolute;margin-top: 52;"></span>
				</div>
				<div class="modal-footer"
					style="display: flex; justify-content: center;">
					<button type="button" class="btn btn-primary"
						id="submitPasswordButton">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container">
		<div class="nxl-content">

			<!-- [ page-header ] start -->
		<div class="page-header">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Agent</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/welcome">Home</a></li>
						<li class="breadcrumb-item">Agent Details</li>
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
		<form:form id="agentForm" modelAttribute="agent"
			onsubmit="event.preventDefault(); updateAgent();">
			<form:hidden path="isValid" value="true" />
			<form:hidden path="id" value="" id="id" />
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseOne')">Agent
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show">
						<div class="accordion-body p-3">
							<div class="main-content">
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Agent Name<span
												class="text-danger"> </span></label>
											<form:input path="agentName" type="text" class="form-control"
												id="agentName" placeholder="Agent Name" readonly="true"
												required='true' />
											<span id="agentNameError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Country<span
												class="text-danger"> </span></label> <input
												value="${countries }" class="form-control"
												id="countries" readonly="true" required='true' /> <span
												id="countriesError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Country Currency<span
												class="text-danger"> </span></label> <input
												value="${currencies}" id="currencies"
												class="form-control" readonly="true" required='true' /> <span
												id="currenciesError" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">State</label> <input
												value="${states}" id="state" class="form-control"
												readonly="true" required='true' /> <span id="stateError"
												class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Agent Display Name<span
												class="text-danger"> </span></label>
											<form:input path="agentDisplayName" type="text"
												class="form-control" id="agentDisplayName"
												placeholder="Agent Display Name" readonly="true"
												required='true' />
											<span id="agentDisplayNameError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 1<span
												class="text-danger"> </span></label>
											<form:input path="address1" type="text" class="form-control"
												id="address1" placeholder="Address1" readonly="true"
												required='true' />
											<span id="address1Error" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 2<span
												class="text-danger"> </span></label>
											<form:input path="address2" type="text" class="form-control"
												id="address2" placeholder="Address2" readonly="true"
												required='true' />
											<span id="address2Error" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 3</label>
											<form:input path="address3" type="text" class="form-control"
												id="address3" placeholder="Address3" readonly="true"
												required='true' />
											<span id="address3Error" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">City<span
												class="text-danger"> </span></label>
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
												id="zip" placeholder="Zip/PoBox" readonly="true"
												required='true' />
											<span id="zipError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">TimeZone<span
												class="text-danger"> </span></label> <input
												value="${timezones }" class="form-control"
												readonly="true" required='true' id="timeZone" /> <span
												id="timeZoneError" class="text-danger"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							onclick="toggleDiv('panelsStayOpen-collapseTwo')">Contact
							Details</button>
					</h2>

					<div id="panelsStayOpen-collapseTwo"
						class="accordion-collapse collapse">
						<hr class="my-0">
						<div class="card-body pass-security">
							<div class="accordion-body p-3">
								<div class="card-body personal-info">

									<div class="main-content">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Email<span
														class="text-danger"> </span></label>
													<form:input path="email" type="email" class="form-control"
														id="email" placeholder="Email" readonly="true"
														required='true' />
													<span id="emailError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mobile</label>
													<form:input path="mobile" type="tel" class="form-control"
														id="mobile" placeholder="Mobile" readonly="true"
														required='true' />
													<span id="mobileError" class="text-danger"></span>

												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Phone<span
														class="text-danger"> </span></label>
													<form:input path="phone" type="tel" class="form-control"
														id="phone" placeholder="Phone" readonly="true"
														required='true' />
													<span id="phoneError" class="text-danger"></span>
												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Contact Person<span
														class="text-danger"> </span></label>
													<form:input path="contactPerson" type="tel"
														class="form-control" id="contactPerson"
														placeholder="Contact Person" readonly="true"
														required='true' />
													<span id="contactPersonError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mis Email Id<span
														class="text-danger"> </span></label>
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
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseThree')">Regulatory
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseThree"
						class="accordion-collapse collapse">
						<div class="accordion-body p-3">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Company Id<span
                                                        class="text-danger"> </span>
                                                    </label>
                                                    <form:input path="agentId" type="text"
                                                        class="form-control" id="agentId" readonly="true"/>
                                                </div>
                                            </div>

                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                   <label class="form-label">Agent Location Id<span
                                                       class="text-danger"> </span>
                                                   </label>
                                                   <form:input path="branchLocationId" type="text"
                                                       class="form-control" id="branchLocationId" readonly="true" />
                                                </div>
                                            </div>

											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Tax Identification Number<span
														class="text-danger"> </span>
													</label>
													<form:input path="taxIdentificationNumber" type="text"
														class="form-control" id="taxIdentificationNumber"
														placeholder="Tax Identification Number" readonly="true"
														required='true' />
													<span id="taxIdentificationNumberError" class="text-danger"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
									    <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Licence No.<span
                                                    class="text-danger"> </span></label>
                                                <form:input path="licenceNo" type="text"
                                                    class="form-control" id="licenceNo"
                                                    placeholder="Licence No." readonly="true" required='true' />
                                                <span id="licenceNoError" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Tax Applicable<span
                                                    class="text-danger"> </span></label>
                                                <form:input path="taxApplicable" class="form-control"
                                                    id="taxApplicable" readonly="true" required='true' />
                                            </div>
                                        </div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Working Hours<span
													class="text-danger"> </span></label>
												<form:input path="workingHours" class="form-control"
													id="working" readonly="true" required='true' />
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
                        onclick="toggleDiv('panelsStayOpen-collapseFour')">Funding Bank Details</button>
                </h2>
                <div id="panelsStayOpen-collapseFour"
                    class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <div class="card-body personal-info">
                            <div class="main-content">
                                <div class="card-body pass-security">
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Bank Name<span
                                                    class="text-danger">*</span></label>
                                                <form:input path="BankName" type="text" class="form-control"
                                                    id="BankName" readonly="true" placeholder="Enter bank name" />
                                                <span id="BankNameError" class="text-danger1"></span>
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Branch Name<span
                                                    class="text-danger">*</span></label>
                                                <form:input path="branchName" type="text" class="form-control"
                                                    id="branchName" readonly="true" placeholder="Enter branch name" />
                                                <span id="branchNameError" class="text-danger1"></span>
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Account Number<span
                                                    class="text-danger">*</span></label>
                                                <form:input path="accountNumber" type="number" class="form-control"
                                                    id="accountNumber" readonly="true" placeholder="Enter account number" />
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
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseFive')">Credit
							Limit</button>
					</h2>
					<div id="panelsStayOpen-collapseFive"
						class="accordion-collapse collapse">
						<div class="accordion-body p-3">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Daily<span
														class="text-danger"> </span></label>
													<form:input path="daily" type="number" class="form-control"
														id="daily" placeholder="Daily" readonly="true"
														required='true' />
													<span id="dailyError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Settlement Mode<span
														class="text-danger"> </span></label>
													<form:input path="settlementMode" class="form-control"
														id="settlementMode" readonly="true" required='true' />
													<span id="settlementModeError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Settlement Type<span
														class="text-danger"> </span></label>
													<form:input path="settlementType" class="form-control"
														id="settlementType" readonly="true" required='true' />
													<span id="settlementTypeError" class="text-danger"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Status<span
														class="text-danger"> </span></label>
													<form:input path="creditLimitStatus" class="form-control" id="status"
														readonly="true" required='true' />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							onclick="toggleDiv('panelsStayOpen-collapseSix')">Customer
							Txn Limit</button>
					</h2>
					<div id="panelsStayOpen-collapseSix"
						class="accordion-collapse collapse">
						<div class="accordion-body p-3">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Transaction<span
														class="text-danger"> </span></label>
													<form:input path="perTransactionLimit" type="number"
														class="form-control" id="perTransactionLimit"
														placeholder="Per Transaction" readonly="true"
														required='true' />
													<span id="perTransactionLimitError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Day<span
														class="text-danger"> </span></label>
													<form:input path="perDayLimit" type="number"
														class="form-control" id="perDayLimit"
														placeholder="Per Day" readonly="true" required='true' />
													<span id="perTransactionLimitError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Per Month<span
														class="text-danger"> </span></label>
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
					<div class="accordion-item">
					<h2 class="accordion-header">
						 <button class="accordion-button collapsed" type="button" onclick="openPopupForApi()">Api
							Details</button> 
					</h2>
					 <div id="panelsStayOpen-collapseSeven"
						class="accordion-collapse collapse" style="display:none;">
						<div class="accordion-body p-3" >
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Grant Type<span
														class="text-danger">*</span></label>
													<input name="grantType" type="text"
														class="form-control" id="grantType" maxlength="10"
														placeholder="Grant Type" readonly="true" 
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
													<input name="scope" type="text" class="form-control"
														id="scope" placeholder="Scope" maxlength="60" readonly="true" 
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
													<input name="clientId" type="text"
														class="form-control" id="clientId" placeholder="Client Id" readonly="true" 
														oninput="validateLengthWithMaxMessage('clientId', 60, 'clientIdValidation')"
														maxlength="60" />
													<span id="clientIdError" class="text-danger1"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">

													<label class="form-label">Client Secret<span
														class="text-danger">*</span></label>
													<input name="clientSecret" type="text"
														class="form-control" id="clientSecret"
														placeholder="Client Secret" maxlength="60" readonly="true" 
														oninput="validateLengthWithMaxMessage('clientSecret', 60, 'clientSecretValidation')" />
													<span id="clientSecretError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">

													<label class="form-label">API Username<span
														class="text-danger">*</span></label>
													<input name="apiUsername" type="text"
														class="form-control" id="adminUserName" maxlength="60" readonly="true" 
														placeholder="Set Username"
														oninput="validateLengthWithMaxMessage('adminUserName', 60, 'adminUserNameError')" />
													<span id="adminUserNameError" style="color: red;"></span>
												</div>
											</div>

											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">API Password<span
														class="text-danger">*</span></label>
													<input name="apiPassword" type="password"
														class="form-control" id="adminPassword" maxlength="60" readonly="true" 
														placeholder="Set Password"
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
				
				 <%--	<div class="accordion-item">
					<h2 class="accordion-header">
						<!-- <button class="accordion-button collapsed" type="button"
							onclick="toggleDiv('panelsStayOpen-collapseSeven')">Api
							Details</button> -->
					</h2>
					 <div id="panelsStayOpen-collapseSeven"
						class="accordion-collapse collapse">
						<div class="accordion-body p-3" >
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Grant Type<span
														class="text-danger">*</span></label>
													<form:input path="grantType" type="text"
														class="form-control" id="grantType" maxlength="10"
														placeholder="Grant Type" readonly="true" 
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
														id="scope" placeholder="Scope" maxlength="60" readonly="true" 
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
														class="form-control" id="clientId" placeholder="Client Id" readonly="true" 
														oninput="validateLengthWithMaxMessage('clientId', 60, 'clientIdValidation')"
														maxlength="60" />
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
														placeholder="Client Secret" maxlength="60" readonly="true" 
														oninput="validateLengthWithMaxMessage('clientSecret', 60, 'clientSecretValidation')" />
													<span id="clientSecretError" style="color: red;"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">

													<label class="form-label">API Username<span
														class="text-danger">*</span></label>
													<form:input path="apiUsername" type="text"
														class="form-control" id="adminUserName" maxlength="60" readonly="true" 
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
														class="form-control" id="adminPassword" maxlength="60" readonly="true" 
														placeholder="Set Password"
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
				</div>--%>
				
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseEight')">Audit
							Tails</button>
					</h2>
					<div id="panelsStayOpen-collapseEight"
						class="accordion-collapse collapse">
						<div class="accordion-body p-3">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Created By<span
														class="text-danger"> </span></label>
													<form:input path="createdBy" type="text"
														class="form-control" id="createdBy"
														placeholder="Created By" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Created On<span
														class="text-danger"> </span></label>
													<form:input path="createdOn" type="text"
														class="form-control" id="createdOn"
														placeholder="Created On" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified By<span
														class="text-danger"> </span></label>
													<form:input path="modifiedBy" type="text"
														class="form-control" id="modifiedBy"
														placeholder="Modified By" readonly="true"/>
												</div>
											</div>
										</div>
										<div class="row">
											 <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified On<span
														class="text-danger"> </span></label>
													<form:input path="modifiedOn" type="text" class="form-control"
														id="modifiedOn" placeholder="Modified On" readonly="true"/>
												</div>
											</div> 
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Remarks<span
														class="text-danger"> </span></label>
													<form:input path="remarks" type="text" class="form-control"
														id="remarks" placeholder="Remarks" readonly="true"/>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Status <span
														class="text-danger"> </span></label>
													<form:input path="statusFlag"  class="form-control"
														id="statusFlag" readonly="true" placeholder="Status"/>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		<!-- 	<div class="mt-5 mb-5 text-center"
				style="display: flex; justify-content: center">
				<button id="submitButton" type="submit" class="btn btn-primary">Update</button>
			</div> --> 
			</div>
		</form:form>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
</body>

</html>