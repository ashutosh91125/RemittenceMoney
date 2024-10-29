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

			<!-- <script>
				$(document).ready(
						function() {
							// Set the default value in the search heading on page load
							const defaultValue = $(
									'input[name="form-radio"]:checked').val();
							$('#search-heading').text(defaultValue);

							// Handle radio button change
							$('.form-radio').change(function() {
								const value = this.value;

								// Update the heading above the search bar with the selected value
								$('#search-heading').text(value);

								// Clear the search input field when a new radio button is selected
								$('#radio-search').val('');
							});

							// Initialize Feather Icons
							feather.replace();
						});
			</script> -->
			<form:form modelAttribute="custDTO">

				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne"
								style="background: aliceblue;">Personal Details</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
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
												<label class="form-label">Salutation <span
													class="text-danger">*</span></label>
												<form:select path="salutation" multiple="false">
													<form:options item="salutationList" itemValue="salutation"
														itemLabel="description" />
												</form:select>

											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">First Name<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="First Name">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Middle Name<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Middle Name">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Last Name<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Last Name">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Preferred Name<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Preferred Name">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Nationality <span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead" disabled>Select</option>
													<option value="India">India</option>
													<option value="Malaysia">Malaysia</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Nationality <span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead" disabled>Select</option>
													<option value="India">India</option>
													<option value="Malaysia">Malaysia</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Native Region<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Native Region">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Date of Birth<span
													class="text-danger">*</span></label> <input type="date"
													class="form-control" placeholder="Date of Birth">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Birth<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead" disabled>Select</option>
													<option value="coustomer">India</option>
													<option value="coustomer">Malaysia</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Place of Birth <span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Native Region">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Resident Type Id<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Resident Type Id">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Country of Residence<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead" disabled>Select</option>
													<option value="coustomer">India</option>
													<option value="coustomer">Malaysia</option>
												</select>
											</div>

										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Gender<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead">Male</option>
													<option value="coustomer">Female</option>
													<option value="coustomer">Others</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mothers Maiden Name<span
													class="text-danger">*</span></label> <input type="Text"
													class="form-control" placeholder="Occupation Id">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Primary Mobile Number<span
													class="text-danger">*</span></label> <input type="tel"
													class="form-control" placeholder="Occupation Id">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Secondary Mobile Number<span
													class="text-danger">*</span></label> <input type="tel"
													class="form-control" placeholder="Secondary Mobile Number">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Email</label><span
													class="text-danger">*</span></label> <input type="email"
													class="form-control" placeholder="Email">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Phone Number<span
													class="text-danger">*</span></label> <input type="tel"
													class="form-control" placeholder="Phone Number">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Occupation Id<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Occupation Id">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Political Exposed Person<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead">No</option>
													<option value="coustomer">Yes</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<!-- <div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Additional Documents<span
												class="text-danger">*</span></label> <input type="file"
												class="form-control" placeholder="Additional Documents">
										</div>
									</div> -->
										<div class="col-xl-4"></div>
										<div class="col-xl-4"></div>
									</div>

								</div>

							</div>
						</div>
					</div>

					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseTwo"
								aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo"
								style="background: aliceblue;">Address</button>
						</h2>
						<div id="panelsStayOpen-collapseTwo"
							class="accordion-collapse collapse">
							<hr class="my-0">
							<div class="card-body pass-security">
								<div class="accordion-body" style="background: aliceblue;">
									<div class="card-body personal-info">
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
													<label class="form-label">Building Name<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Building Name">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Street Name<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Street Name">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Land Mark<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Land Mark">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">City<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="City">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">District<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="District">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">State<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="lead" disabled>Select</option>
														<option value="coustomer">India</option>
														<option value="coustomer">Malaysia</option>
													</select>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Country<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="lead" disabled>Select</option>
														<option value="coustomer">India</option>
														<option value="coustomer">Malaysia</option>
													</select>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Zip<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Zip">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Po. Box<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Po.Box">
												</div>
											</div>
										</div>
										<!-- 
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mobile Number111<span
													class="text-danger">*</span></label> <input type="tel"
													class="form-control" placeholder="Mobile Number">
											</div>
										</div>
										<div class="col-xl-4"></div>
										<div class="col-xl-4"></div>
									</div> -->
										<div
											class="mb-4 d-flex align-items-center justify-content-between">
											<h5 class="fw-bold mb-0 me-4">
												<span class="d-block mb-2">Permanent Address:</span> <span
													class="fs-12 fw-normal text-muted text-truncate-1-line">Keep
													your account more secure with following preferences. </span>
											</h5>
											<!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Check Auth</a> -->
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Same As A current Address<span
														class="text-danger">*</span></label> <input type="radio"
														class="form-control" placeholder="Building Name">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Building Name<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Building Name">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Street Name<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Street Name">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Land Mark<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Land Mark">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">City<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="City">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">District<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="District">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">State<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="State">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Country<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="lead" disabled>Select</option>
														<option value="coustomer">India</option>
														<option value="coustomer">Malaysia</option>
													</select>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Zip<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Zip">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Po. Box<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Po.Box">
												</div>
											</div>
											<!-- <div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Mobile Number<span
													class="text-danger">*</span></label> <input type="tel"
													class="form-control" placeholder="Mobile Number">
											</div>
										</div> -->
										</div>

									</div>

								</div>

							</div>
						</div>
					</div>

					<!-- <div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseFive"
							aria-expanded="false" aria-controls="panelsStayOpen-collapseFive"
							style="background: aliceblue;">Visa Details</button>
					</h2>
					<div id="panelsStayOpen-collapseFive"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div
									class="mb-4 d-flex align-items-center justify-content-between">
									<h5 class="fw-bold mb-0 me-4">
										<span class="d-block mb-2">Visa Details</span> <span
											class="fs-12 fw-normal text-muted text-truncate-1-line">Following
											information is publicly displayed, be careful! </span>
									</h5>
								</div>

								<div class="card-body pass-security">
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Id Number<span
													class="text-danger">*</span></label> <input type="number"
													class="form-control" placeholder="Id Number">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Visa Number<span
													class="text-danger">*</span></label> <input type="number"
													class="form-control" placeholder="Visa Number">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Visa Expiry Date<span
													class="text-danger">*</span></label> <input type="Date"
													class="form-control">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Name as per Id<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Name as per Id">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Issued Country<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead" disabled>Select</option>
													<option value="coustomer">India</option>
													<option value="coustomer">Malaysia</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Issued By<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Issued By">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Issued at<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Issued at">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Issued on<span
													class="text-danger">*</span></label> <input type="date"
													class="form-control">
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Date of Expiry<span
													class="text-danger">*</span></label> <input type="date"
													class="form-control">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Default Status<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead">Yes</option>
													<option value="coustomer">No</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Active Status<span
													class="text-danger">*</span></label> <select class="form-control"
													data-select2-selector="icon">
													<option value="lead">Yes</option>
													<option value="coustomer">No</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Id Front<span
													class="text-danger">*</span></label> <input type="file"
													class="form-control" placeholder="Id Front">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div class="mb-4">
												<label class="form-label">Id Back<span
													class="text-danger">*</span></label> <input type="file"
													class="form-control" placeholder="Id Back">
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
 -->
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseThree"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseThree"
								style="background: aliceblue;">KYC</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body pass-info">
									<div
										class="mb-4 d-flex align-items-center justify-content-between">
										<h5 class="fw-bold mb-0 me-4">
											<span class="d-block mb-2">Document Details</span>
										</h5>
									</div>


									<div class="row mb-4 align-items-center">
										<div class="col-lg-4">
											<label for="" class="fw-semibold">Select id type: </label>
										</div>
										<div class="col-lg-8">
											<div class="input-group">
												<div class="input-group-text">
													<i class="feather-user"></i>
												</div>
												<select class="form-select form-control" id="search-select">
													<option value="Paris">Passport</option>
													<option value="London">National Id</option>
												</select>
											</div>
										</div>
									</div>

									<hr>
									<!-- cards content -->
									<section>
										<div class="dropdown-content-bond" style="display: none;">

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Passport Number<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Id Number">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Name as per Id<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Name as per Id">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued Country<span
															class="text-danger">*</span></label> <select class="form-control"
															data-select2-selector="icon">
															<option value="lead" disabled>Select</option>
															<option value="coustomer">India</option>
															<option value="coustomer">Malaysia</option>
														</select>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued By<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Issued By">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued at<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Issued at">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued on<span
															class="text-danger">*</span></label> <input type="date"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Date of Expiry<span
															class="text-danger">*</span></label> <input type="date"
															class="form-control">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Default Status<span
															class="text-danger">*</span></label> <select class="form-control"
															data-select2-selector="icon">
															<option value="lead">Yes</option>
															<option value="coustomer">No</option>
														</select>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Active Status<span
															class="text-danger">*</span></label> <select class="form-control"
															data-select2-selector="icon">
															<option value="lead">Yes</option>
															<option value="coustomer">No</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Id Front<span
															class="text-danger">*</span></label> <input type="file"
															class="form-control" placeholder="Id Front">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Id Back<span
															class="text-danger">*</span></label> <input type="file"
															class="form-control" placeholder="Id Back">
													</div>
												</div>
											</div>
										</div>

										<div class="dropdown-content-bond" style="display: none;">

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Id Number<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Id Number">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Name as per Id<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Name as per Id">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued Country<span
															class="text-danger">*</span></label> <select class="form-control"
															data-select2-selector="icon">
															<option value="lead" disabled>Select</option>
															<option value="coustomer">India</option>
															<option value="coustomer">Malaysia</option>
														</select>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued By<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Issued By">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued at<span
															class="text-danger">*</span></label> <input type="text"
															class="form-control" placeholder="Issued at">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Issued on<span
															class="text-danger">*</span></label> <input type="date"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Date of Expiry<span
															class="text-danger">*</span></label> <input type="date"
															class="form-control">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Default Status<span
															class="text-danger">*</span></label> <select class="form-control"
															data-select2-selector="icon">
															<option value="lead">Yes</option>
															<option value="coustomer">No</option>
														</select>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Active Status<span
															class="text-danger">*</span></label> <select class="form-control"
															data-select2-selector="icon">
															<option value="lead">Yes</option>
															<option value="coustomer">No</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Id Front<span
															class="text-danger">*</span></label> <input type="file"
															class="form-control" placeholder="Id Front">
													</div>
												</div>
												<div class="col-xl-4">
													<div class="mb-4">
														<label class="form-label">Id Back<span
															class="text-danger">*</span></label> <input type="file"
															class="form-control" placeholder="Id Back">
													</div>
												</div>
											</div>
										</div>
									</section>

									<script>
										const deafultValue = 3;
										$(document)
												.ready(
														function() {
															$('#search-select')
																	.prop(
																			'selectedIndex',
																			deafultValue);
															$(
																	".dropdown-content-bond")
																	.hide();
															$(
																	".dropdown-content-bond")
																	.eq(
																			deafultValue)
																	.show();
															$("#search-select")
																	.change(
																			function() {
																				$(
																						'.dropdown-content-bond')
																						.hide();

																				var currentIndex = $(
																						this)
																						.prop(
																								'selectedIndex');
																				console
																						.log(currentIndex);
																				$(
																						".dropdown-content-bond")
																						.eq(
																								currentIndex)
																						.show();
																			});

														});
									</script>

								</div>
							</div>
						</div>
					</div>

					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseSix"
								aria-expanded="false" aria-controls="panelsStayOpen-collapseSix"
								style="background: aliceblue;">Other Information</button>
						</h2>
						<div id="panelsStayOpen-collapseSix"
							class="accordion-collapse collapse">

							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body personal-info">
									<div
										class="mb-4 d-flex align-items-center justify-content-between">
										<h5 class="fw-bold mb-0 me-4">
											<span class="d-block mb-2">Other Information </span> <span
												class="fs-12 fw-normal text-muted text-truncate-1-line">Following
												information is publicly displayed, be careful! </span>
										</h5>
										<!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Add New</a> -->
									</div>

									<div class="card-body pass-security">
										<!-- <div class="mb-4 d-flex align-items-center justify-content-between">
                                        <h5 class="fw-bold mb-0 me-4">
                                            <span class="d-block mb-2">Permanent Address:</span>
                                            <span class="fs-12 fw-normal text-muted text-truncate-1-line">Keep your account more secure with following preferences. </span>
                                        </h5> -->
										<!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Check Auth</a> -->
										<!-- </div> -->

										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Customer type id<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Customer type id">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Annual Income Range Id<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Annual Income Range Id">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Annual Income Currency
														Code<span class="text-danger">*</span>
													</label> <select class="form-control" data-select2-selector="icon">
														<option value="lead">INR</option>
														<option value="coustomer">MYR</option>
														<option value="coustomer">USD</option>
													</select>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Social Security Number<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Social Security Number">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Tax Registration Number<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Tax Registration Number">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Issued
														Country<span class="text-danger">*</span>
													</label> <select class="form-control" data-select2-selector="icon">
														<option value="lead" disabled>Select</option>
														<option value="coustomer">India</option>
														<option value="coustomer">Malaysia</option>
													</select>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Name<span
														class="text-danger">*</span></label> <input type="number"
														class="form-control" placeholder="Employer Name">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Address<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Employer Address">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Phone<span
														class="text-danger">*</span></label> <input type="tel"
														class="form-control" placeholder="Employer Phone">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer ecrn<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Employer ecrn">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Employer Establishment Id<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control"
														placeholder="Employer Establishment Id">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Risk Rating Id<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Risk Rating Id">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">PEP Catagory<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="PEP Catagory">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Personal Mohre Id<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Personal Mohre Id">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Income Type<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="salary">Salary</option>
														<option value="business">Business</option>
														<option value="investment">Investment</option>
														<option value="rental">Rental</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profession Catagory<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="" disabled selected>Select
															Profession Category</option>
														<option value="it">IT & Software</option>
														<option value="healthcare">Healthcare</option>
														<option value="finance">Finance</option>
														<option value="education">Education</option>
														<option value="construction">Construction</option>
													</select>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Reason For Acc.<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Reason For Acc.">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Volume Month<span
														class="text-danger">*</span></label> <input type="tel"
														class="form-control"
														placeholder="Transaction Volume Month">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Customer Remark<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Customer Remark">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Transaction Count Month<span
														class="text-danger">*</span></label> <input type="Text"
														class="form-control" placeholder="Transaction Count Month">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Show Remark on
														Transaction<span class="text-danger">*</span>
													</label> <select class="form-control" data-select2-selector="icon">
														<option value="personal">Personal</option>
														<option value="business">Business</option>
														<option value="investment">Investment</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Customer Remark<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="Customer Remark">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Agent Referenc Number<span
														class="text-danger">*</span></label> <input type="tel"
														class="form-control" placeholder="Agent Referenc Number">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Social Links<span
														class="text-danger">*</span></label> <input type="tel"
														class="form-control" placeholder="Social Links">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">First Language<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="lead">Hindi</option>
														<option value="coustomer">English</option>
														<option value="coustomer">Malay</option>
													</select>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Marital Status<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="coustomer">Unmarried</option>
														<option value="lead">Married</option>
													</select>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">DNFBP<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="lead">No</option>
														<option value="coustomer">Yes</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">DPMS<span
														class="text-danger">*</span></label> <input type="text"
														class="form-control" placeholder="DPMS">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profile Catagory<span
														class="text-danger">*</span></label> <select class="form-control"
														data-select2-selector="icon">
														<option value="lead">Low Profile</option>
														<option value="coustomer">High Profile</option>
													</select>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Profile Photo<span
														class="text-danger">*</span></label> <input type="file"
														class="form-control" placeholder="Profile Photo">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

					<!-- <div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseFour"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseFour"
								style="background: aliceblue;">Social Details</button>
						</h2>
						<div id="panelsStayOpen-collapseFour"
							class="accordion-collapse collapse">


							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body personal-info">
									<div class="d-flex align-items-center justify-content-between">
										<h5 class="fw-bold mb-0 me-4">
											<span class="d-block">Social Details</span> <span
												class="fs-12 fw-normal text-muted text-truncate-1-line">Following
												information is publicly displayed, be careful! </span>
										</h5>
									</div>

									<div class="card-body pass-security">
										<div class="row my-5">
											<div class="col-xl-4">
												<div class="input-group">
													<div class="input-group-text">
														<i class="feather-linkedin"></i>
													</div>
													<input type="text" class="form-control" id=""
														placeholder="www.linked.com">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="input-group">
													<div class="input-group-text">
														<i class="feather-twitter"></i>
													</div>
													<input type="text" class="form-control" id=""
														placeholder="www.twitter.com">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="input-group">
													<div class="input-group-text">
														<i class="feather-facebook"></i>
													</div>
													<input type="text" class="form-control" id=""
														placeholder="www.facebook.com">
												</div>
											</div>
										</div>

										<div class="row my-5">
											<div class="col-xl-4">
												<div class="input-group">
													<div class="input-group-text">
														<i class="feather-instagram"></i>
													</div>
													<input type="text" class="form-control" id=""
														placeholder="www.instagram.com">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="input-group">
													<div class="input-group-text">
														<i class="feather-youtube"></i>
													</div>
													<input type="text" class="form-control" id=""
														placeholder="www.youtube.com">
												</div>
											</div>
											<div class="col-xl-4">
												<div class="input-group">
													<div class="input-group-text">
														<i class="feather-link"></i>
													</div>
													<input type="text" class="form-control" id=""
														placeholder="www.link.com">
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>

					</div> -->
					<!-- [ Main Content ] end -->
					<div class="mt-5 mb-5 text-center"
						style="display: flex; justify-content: center">
						<button type="button" class="btn btn-primary">Submit</button>
					</div>
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