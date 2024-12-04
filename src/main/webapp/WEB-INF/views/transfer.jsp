<!DOCTYPE html>
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
/* .search-bar-container {
            /* margin: 15px 0; */
/* } */
.search-heading {
	font-size: 17px;
}

.search-heading {
	display: flex;
	justify-content: end;
}

@media screen and (max-width: 678px) {
	.search-heading {
		margin-top: 10px;
		display: flex;
		justify-content: start;
	}
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
/* ADD BENEaFICIARY */
.hide {
	display: none;
}

.map-container {
	text-align: center;
}
/* Custom search bar icon in Select2 dropdown */
.select2-container--default .select2-search--dropdown {
	position: relative;
}

.select2-container--default .select2-search--dropdown input {
	padding-left: 30px; /* Add space for the icon */
}

.select2-search--dropdown::before {
	content: "\f002"; /* Font Awesome search icon (magnifying glass) */
	font-family: 'Font Awesome 5 Free';
	font-weight: 900;
	position: absolute;
	left: 8px;
	top: 8px;
	font-size: 14px;
	color: #6c757d;
}

.accordion .accordion-item {
	background-color: aliceblue;
}
/* Table container for responsiveness and padding */
/* .table-responsive {
    padding: 1.5rem;
} */

/* Table styling */
.table {
	border-collapse: separate;
	border-spacing: 0;
	width: 100%;
	background-color: #ffffff;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
}

.table th, .table td {
	padding: 14px 18px;
	text-align: left;
	font-size: 0.92rem;
	color: #3d3d3d;
	vertical-align: middle;
	border-bottom: 1px solid #e0e0e0;
}

.table th {
	background-color: #eff2f7;
	font-weight: 700;
	text-transform: uppercase;
	color: #5e6873;
}

.table tbody tr:nth-child(even) {
	background-color: #f9fafc;
}

.table tbody tr:hover {
	background-color: #e9f3fd;
	transition: background-color 0.25s ease-in;
}

.table tbody td:last-child {
	text-align: center;
}

.btn-sm {
	padding: 5px 12px;
	font-size: 0.85rem;
	font-weight: 600;
	border-radius: 5px;
	color: #ffffff;
	background-color: #3498db;
	border: none;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.btn-sm:hover {
	background-color: #2980b9;
}

/* Center the 'Edit' text in the last column */
.table td:last-child, .table th:last-child {
	text-align: center;
}
</style>
<script type="text/javascript"></script>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!--! ================================================================ !-->
	<!--! ================================================================ !-->
	<!--! [Start] Main Content !-->
	<!--! ================================================================ !-->
	<div class="nxl-container" style="background: aliceblue;">
		<div class="nxl-content" style="background: aliceblue;">
			<!-- [ page-header ] start -->
			<div class="page-header" style="background: aliceblue;">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Transfer</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Transfer</li>
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
							<a href="javascript:void(0);"
								class="btn btn-primary successAlertMessage"> <!-- <i class="feather-user-plus me-2"></i> -->
								<span>Transfer</span>
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
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
							aria-controls="panelsStayOpen-collapseOne"
							style="background: aliceblue;">Customer Details</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show">
						<div class="accordion-body" style="padding-top: 0; margin-top: 0;">
							<div class="card-body personal-info">
								<!-- Name Fields Row -->
								<div class="row" style="margin-top: 0;">
									<div class="col-12 col-md-4">
										<label class="form-label">First Name</label> <input
											type="text" class="form-control" id="firstName"
											name="firstName" placeholder="First Name">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Middle Name</label> <input
											type="text" class="form-control" id="middleName"
											name="middleName" placeholder="Middle Name">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Last Name</label> <input type="text"
											class="form-control" id="lastName" name="lastName"
											placeholder="Last Name">
									</div>
								</div>

								<!-- Address Fields Row -->
								<div class="row" style="margin-top: 0;">
									<div class="col-12 col-md-4">
										<label class="form-label">Address 1</label> <input type="text"
											class="form-control" id="address1" name="address1"
											placeholder="Address 1">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Address 2</label> <input type="text"
											class="form-control" id="address2" name="address2"
											placeholder="Address 2">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">City</label> <input type="text"
											class="form-control" id="addressCity" name="addressCity"
											placeholder="City">
									</div>
								</div>

								<!-- State and Date of Birth -->
								<div class="row" style="margin-top: 0;">
									<div class="col-12 col-md-4">
										<label class="form-label">State</label> <input type="text"
											class="form-control" id="addressState" name="addressState"
											placeholder="State">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Date of Birth</label> <input
											type="date" class="form-control" id="dob" name="dob">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Place of Birth</label> <input
											type="text" class="form-control" id="placeOfBirth"
											name="placeOfBirth" placeholder="Place of Birth">
									</div>
								</div>

								<!-- Email and Mobile Number -->
								<div class="row" style="margin-top: 0;">
									<div class="col-12 col-md-4">
										<label class="form-label">Email</label> <input type="email"
											class="form-control" id="email" name="email"
											placeholder="Email">
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Mobile No.</label> <input
											type="text" class="form-control" id="mobile" name="mobile"
											placeholder="Mobile No.">
									</div>
								</div>

								<!-- Country Selection Fields -->
								<div class="row" style="margin-top: 0;">
									<div class="col-12 col-md-4">
										<label class="form-label">Country</label> <select
											class="form-control" id="country" name="country">
											<option value="us">United States</option>
											<option value="uk">United Kingdom</option>
										</select>
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Country of Residence</label> <select
											class="form-control" id="countryOfResidence"
											name="countryOfResidence">
											<option value="us">United States</option>
											<option value="uk">United Kingdom</option>
										</select>
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Country of Nationality</label> <select
											class="form-control" id="countryOfNationality"
											name="countryOfNationality">
											<option value="us">United States</option>
											<option value="uk">United Kingdom</option>
										</select>
									</div>
								</div>

								<!-- Customer Category, Type, and Visa Type -->
								<div class="row" style="margin-top: 0;">
									<div class="col-12 col-md-4">
										<label class="form-label">Customer Category</label> <select
											class="form-control" id="customerCategory"
											name="customerCategory">
											<option value="individual">Individual</option>
											<option value="business">Business</option>
										</select>
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Customer Type</label> <select
											class="form-control" id="customerType" name="customerType">
											<option value="premium">Premium</option>
											<option value="standard">Standard</option>
										</select>
									</div>
									<div class="col-12 col-md-4">
										<label class="form-label">Visa Type</label> <select
											class="form-control" id="visaType" name="visaType">
											<option value="tourist">Tourist</option>
											<option value="resident">Resident</option>
										</select>
									</div>
								</div>

								<!-- ID Details Section -->
								<div class="row mt-5">
									<div class="col-12">
										<h6>ID Details</h6>
									</div>
									<div class="col-12">
										<div class="row" style="margin-top: 0;">
											<!-- ID Type -->
											<div class="col-12 col-md-4">
												<label class="form-label">ID Type</label> <select
													class="form-control" id="idType" name="idType">
													<option value="nationalId">National ID</option>
													<option value="passport">Passport</option>
												</select>
											</div>

											<!-- ID Number -->
											<div class="col-12 col-md-4">
												<label class="form-label">ID No.</label> <input type="text"
													class="form-control" id="idNo" name="idNo"
													placeholder="ID Number">
											</div>

											<!-- ID Issued By -->
											<div class="col-12 col-md-4">
												<label class="form-label">ID Issued By</label> <input
													type="text" class="form-control" id="idIssuedBy"
													name="idIssuedBy" placeholder="Issued By">
											</div>
										</div>

										<div class="row mt-2" style="margin-top: 0;">
											<!-- ID Issue Date -->
											<div class="col-12 col-md-4">
												<label class="form-label">ID Date of Issue</label> <input
													type="date" class="form-control" id="idDateIssue"
													name="idDateIssue">
											</div>

											<!-- ID Expiry Date -->
											<div class="col-12 col-md-4">
												<label class="form-label">ID Date of Expiry</label> <input
													type="date" class="form-control" id="idDateExpire"
													name="idDateExpire">
											</div>

											<!-- Country of Issue -->
											<div class="col-12 col-md-4">
												<label class="form-label">Country</label> <select
													class="form-control" id="countryOfIssue"
													name="countryOfIssue">
													<option value="us">United States</option>
													<option value="uk">United Kingdom</option>
												</select>
											</div>
										</div>
										<div class="row mt-4" style="margin-top: 0;">
											<div class="col-12">
												<h6 class="mb-3">ID Details Table</h6>
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>S.No.</th>
																<th>ID Type</th>
																<th>Expiry Date</th>
																<th>ID No.</th>
																<th>Status</th>
																<th>Edit</th>
															</tr>
														</thead>
														<tbody>
															<!-- Dummy Data Row 1 -->
															<tr>
																<td>1</td>
																<td>Passport</td>
																<td>2025-12-31</td>
																<td>123456789</td>
																<td>Active</td>
																<td>
																	<button type="button" class="btn btn-primary btn-sm">Edit</button>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<!-- Accordion 2: Beneficiary Details -->
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseTwo"
							aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo"
							style="background: aliceblue;">Beneficiary Details
							[Lulu-Remit]</button>
					</h2>
					<div id="panelsStayOpen-collapseTwo"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="padding-top: 0; margin-top: 0;">
							<div class="card-body personal-info">
								<!-- <div class="d-flex align-items-center justify-content-between mb-4">
                    <h5 class="fw-bold mb-0 me-4">
                        <span class="d-block">Beneficiary Details</span>
                        <span class="fs-12 fw-normal text-muted text-truncate-1-line">Following information is publicly
                            displayed, be careful! </span>
                    </h5>
                </div> -->
								<div class="row" style="margin-top: 0;">
									<div class="col-xl-4">
										<div class="mb-1">
											<label class="form-label">Delivery Option</label> <select
												class="form-control" id="deliveryOption">
												<option value="toBank">To Bank</option>
												<option value="toMobile">Mobile Wallet</option>
												<option value="tocash">Cash Pickup</option>
											</select>
										</div>
									</div>

									<!-- Delivery from Bank -->
									<div id="toBankForm">
										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Payout Country Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Payout Country</label> <select
																class="form-control" id="payoutCountry"
																name="payoutCountry">
																<option>Select Country</option>
																<option value="us">United States</option>
																<option value="uk">United Kingdom</option>
															</select>
														</div>

														<!-- Currency Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Currency</label> <select
																class="form-control" id="payoutCurrency"
																name="payoutCurrency">
																<option>Select Currency</option>
																<option value="usd">USD</option>
																<option value="gbp">GBP</option>
															</select>
														</div>

														<div class="col-12 col-md-4">
															<div class="mb-1">
																<label class="form-label">Bank</label> <input
																	type="text" class="form-control" id="bank" name="bank"
																	placeholder="Bank Name">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-6">
												<div class="mb-1">
													<label class="form-label">Branch</label> <input type="text"
														class="form-control" id="branch" name="branch"
														placeholder="Branch"> <a href="#">Advance
														Search</a> | <a href="#">Bank Branch Info</a>
												</div>
											</div>

											<div class="col-12 col-md-6">
												<div class="mb-1">
													<label class="form-label">IBAN</label> <input type="text"
														class="form-control" id="iban" name="iban"
														placeholder="IBAN">
												</div>
											</div>
										</div>

										<div class="row">
											<!-- Account Number, Type, and Confirmation -->
											<div class="col-12 col-md-4">
												<label class="form-label">Account Type</label> <select
													class="form-control" id="accountType" name="accountType">
													<option value="savings">Savings</option>
													<option value="current">Current</option>
												</select>
											</div>

											<div class="col-12 col-md-4">
												<label class="form-label">Account No.</label> <input
													type="text" class="form-control" id="accountNo"
													name="accountNo" placeholder="Account No.">
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Confirm Account No.</label> <input
														type="text" class="form-control" id="confirmAccountNo"
														name="confirmAccountNo" placeholder="Confirm Account No.">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<div class="col-12 col-md-4">
															<div class="mb-1">
																<label class="form-label">Beneficiary Type</label> <select
																	class="form-control" id="beneficiaryType"
																	name="beneficiaryType">
																	<option value="individual">Individual</option>
																	<option value="company">Company</option>
																</select>
															</div>
														</div>

														<!-- Relation Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Relation</label> <select
																class="form-control" id="relation" name="relation">
																<option value="spouse">Spouse</option>
																<option value="friend">Friend</option>
															</select>
														</div>

														<!-- Nick Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Nick Name</label> <input
																type="text" class="form-control" id="nickname"
																name="nickname" placeholder="Nick Name">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- First Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">First Name</label> <input
																type="text" class="form-control" id="firstName"
																name="firstName" placeholder="First Name">
														</div>

														<!-- Middle Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Middle Name</label> <input
																type="text" class="form-control" id="middleName"
																name="middleName" placeholder="Middle Name">
														</div>

														<!-- Last Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Last Name</label> <input
																type="text" class="form-control" id="lastName"
																name="lastName" placeholder="Last Name">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account First
														Name</label> <input type="text" class="form-control"
														id="benfFirstName" name="benfFirstName"
														placeholder="First Name">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account
														Middle Name</label> <input type="text" class="form-control"
														id="benfMiddleName" name="benfMiddleName"
														placeholder="Middle Name">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account Last
														Name</label> <input type="text" class="form-control"
														id="benfLastName" name="benfLastName"
														placeholder="Last Name">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Address 1</label> <input
														type="text" class="form-control" id="benfAddress1"
														name="benfAddress1" placeholder="Address">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Address 2</label> <input
														type="text" class="form-control" id="benfAddress2"
														name="benfAddress2" placeholder="Address 2">
												</div>
											</div>

											<!-- Beneficiary City Label and Input -->
											<div class="col-12 col-md-4">
												<label class="form-label">Beneficiary City</label> <input
													type="text" class="form-control" id="beneficiaryCity"
													name="beneficiaryCity" placeholder="City">
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Beneficiary State Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Beneficiary State</label> <input
																type="text" class="form-control" id="beneficiaryState"
																name="beneficiaryState" placeholder="State">
														</div>

														<!-- Mobile Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Mobile</label> <input
																type="text" class="form-control" id="mobile"
																name="mobile" placeholder="Mobile">
														</div>

														<!-- Nationality Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Nationality</label> <select
																class="form-control" id="nationality" name="nationality">
																<option value="us">United States</option>
																<option value="uk">United Kingdom</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Date of Birth Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Date of Birth</label> <input
																type="date" class="form-control" id="dob" name="dob">
														</div>

														<!-- ID Type Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">ID Type</label> <select
																class="form-control" id="idType" name="idType">
																<option value="nationalId">National ID</option>
																<option value="passport">Passport</option>
															</select>
														</div>

														<!-- ID No. Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">ID No.</label> <input
																type="text" class="form-control" id="idNo" name="idNo"
																placeholder="ID No.">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<!-- Own Account, and Nickname -->
											<div class="col-xl-6">
												<div class="mb-1 d-flex align-items-center">
													<label class="form-label me-2">Own Account</label> <input
														type="checkbox" id="ownAccount" name="ownAccount">
												</div>
											</div>
										</div>
									</div>
									<!--Delivery from Mobile Wallet  -->
									<div id="toMobileForm" style="display: none;">
										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Payout Country Dropdown -->
														<div class="col-md-4">
															<label class="form-label">Payout Country</label> <select
																class="form-control" id="payoutCountry"
																name="payoutCountry">
																<option>Select Country</option>
																<option value="us">United States</option>
																<option value="uk">United Kingdom</option>
															</select>
														</div>

														<!-- Currency Dropdown -->
														<div class="col-md-4">
															<label class="form-label">Currency</label> <select
																class="form-control" id="payoutCurrency"
																name="payoutCurrency">
																<option>Select Currency</option>
																<option value="usd">USD</option>
																<option value="gbp">GBP</option>
															</select>
														</div>

														<!-- Bank Input -->
														<div class="col-md-4">
															<label class="form-label">Bank</label> <input type="text"
																class="form-control" id="bank" name="bank"
																placeholder="Bank Name">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<!-- Branch Input -->
											<div class="col-md-4">
												<label class="form-label">Branch</label> <input type="text"
													class="form-control" id="branch" name="branch"
													placeholder="Branch">
												<div>
													<a href="#">Advance Search</a> | <a href="#">Bank
														Branch Info</a>
												</div>
											</div>

											<!-- Mobile No. -->
											<div class="col-md-4">
												<label class="form-label">Mobile No.</label>
												<div class="d-flex">
													<select class="form-control me-2" id="countryCode"
														name="countryCode" style="width: auto;">
														<option value="+1">+1 (US)</option>
														<option value="+44">+44 (UK)</option>
													</select> <input type="text" class="form-control" id="mobileNo"
														name="mobileNo" placeholder="Mobile Number">
												</div>
											</div>

											<!-- IBAN -->
											<div class="col-md-4">
												<label class="form-label">IBAN</label> <input type="text"
													class="form-control" id="iban" name="iban"
													placeholder="IBAN">
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Type</label> <select
														class="form-control" id="beneficiaryType"
														name="beneficiaryType">
														<option value="individual">Individual</option>
														<option value="company">Company</option>
													</select>
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Relation</label> <select
														class="form-control" id="relation" name="relation">
														<option value="spouse">Spouse</option>
														<option value="friend">Friend</option>
													</select>
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Nick Name</label> <input
														type="text" class="form-control" id="nickname"
														name="nickname" placeholder="Nick Name">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- First Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">First Name</label> <input
																type="text" class="form-control" id="firstName"
																name="firstName" placeholder="First Name">
														</div>

														<!-- Middle Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Middle Name</label> <input
																type="text" class="form-control" id="middleName"
																name="middleName" placeholder="Middle Name">
														</div>

														<!-- Last Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Last Name</label> <input
																type="text" class="form-control" id="lastName"
																name="lastName" placeholder="Last Name">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account First
														Name</label> <input type="text" class="form-control"
														id="benfFirstName" name="benfFirstName"
														placeholder="First Name">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account
														Middle Name</label> <input type="text" class="form-control"
														id="benfMiddleName" name="benfMiddleName"
														placeholder="Middle Name">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account Last
														Name</label> <input type="text" class="form-control"
														id="benfLastName" name="benfLastName"
														placeholder="Last Name">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Address 1</label> <input
														type="text" class="form-control" id="benfAddress1"
														name="benfAddress1" placeholder="Address">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Address 2</label> <input
														type="text" class="form-control" id="benfAddress2"
														name="benfAddress2" placeholder="Address 2">
												</div>
											</div>

											<!-- Beneficiary City Label and Input -->
											<div class="col-12 col-md-4">
												<label class="form-label">Beneficiary City</label> <input
													type="text" class="form-control" id="beneficiaryCity"
													name="beneficiaryCity" placeholder="City">
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Beneficiary State Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Beneficiary State</label> <input
																type="text" class="form-control" id="beneficiaryState"
																name="beneficiaryState" placeholder="State">
														</div>
														<!-- Mobile Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Mobile</label> <input
																type="text" class="form-control" id="mobile"
																name="mobile" placeholder="Mobile">
														</div>
														<!-- Nationality Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Nationality</label> <select
																class="form-control" id="nationality" name="nationality">
																<option value="us">United States</option>
																<option value="uk">United Kingdom</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Date of Birth Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Date of Birth</label> <input
																type="date" class="form-control" id="dob" name="dob">
														</div>
														<!-- ID Type Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">ID Type</label> <select
																class="form-control" id="idType" name="idType">
																<option value="nationalId">National ID</option>
																<option value="passport">Passport</option>
															</select>
														</div>
														<!-- ID No. Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">ID No.</label> <input
																type="text" class="form-control" id="idNo" name="idNo"
																placeholder="ID No.">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<!-- Beneficiary Type, Own Account, and Nickname -->
											<div class="col-xl-6">
												<div class="mb-1 d-flex align-items-center">
													<label class="form-label me-2">Own Account</label> <input
														type="checkbox" id="ownAccount" name="ownAccount">
												</div>
											</div>
										</div>
									</div>


									<!--Delivery from Cash  -->
									<div id="tocashForm" style="display: none;">
										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Payout Country Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Payout Country</label> <select
																class="form-control" id="payoutCountry"
																name="payoutCountry">
																<option>Select Country</option>
																<option value="us">United States</option>
																<option value="uk">United Kingdom</option>
															</select>
														</div>

														<!-- Currency Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Currency</label> <select
																class="form-control" id="payoutCurrency"
																name="payoutCurrency">
																<option>Select Currency</option>
																<option value="usd">USD</option>
																<option value="gbp">GBP</option>
															</select>
														</div>
														<div class="col-12 col-md-4">
															<div class="mb-1">
																<label class="form-label">Bank</label> <input
																	type="text" class="form-control" id="bank" name="bank"
																	placeholder="Bank Name">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Branch</label> <input type="text"
														class="form-control" id="branch" name="branch"
														placeholder="Branch">
													<div>
														<a href="#">Advance Search</a> | <a href="#">Bank
															Branch Info</a>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">IBAN</label> <input type="text"
														class="form-control" id="iban" name="iban"
														placeholder="IBAN">
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Type</label> <select
														class="form-control" id="beneficiaryType"
														name="beneficiaryType">
														<option value="individual">Individual</option>
														<option value="company">Company</option>
													</select>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-6">
												<div class="mb-1">
													<label class="form-label">Relation</label> <select
														class="form-control" id="relation" name="relation">
														<option value="spouse">Spouse</option>
														<option value="friend">Friend</option>
													</select>
												</div>
											</div>

											<div class="col-12 col-md-6">
												<div class="mb-1">
													<label class="form-label">Nick Name</label> <input
														type="text" class="form-control" id="nickname"
														name="nickname" placeholder="Nick Name">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- First Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">First Name</label> <input
																type="text" class="form-control" id="firstName"
																name="firstName" placeholder="First Name">
														</div>

														<!-- Middle Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Middle Name</label> <input
																type="text" class="form-control" id="middleName"
																name="middleName" placeholder="Middle Name">
														</div>

														<!-- Last Name Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Last Name</label> <input
																type="text" class="form-control" id="lastName"
																name="lastName" placeholder="Last Name">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account First
														Name</label> <input type="text" class="form-control"
														id="benfFirstName" name="benfFirstName"
														placeholder="First Name">
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account
														Middle Name</label> <input type="text" class="form-control"
														id="benfMiddleName" name="benfMiddleName"
														placeholder="Middle Name">
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Account Last
														Name</label> <input type="text" class="form-control"
														id="benfLastName" name="benfLastName"
														placeholder="Last Name">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Address 1</label> <input
														type="text" class="form-control" id="benfAddress1"
														name="benfAddress1" placeholder="Address">
												</div>
											</div>

											<div class="col-12 col-md-4">
												<div class="mb-1">
													<label class="form-label">Beneficiary Address 2</label> <input
														type="text" class="form-control" id="benfAddress2"
														name="benfAddress2" placeholder="Address 2">
												</div>
											</div>

											<!-- Beneficiary City Label and Input -->
											<div class="col-12 col-md-4">
												<label class="form-label">Beneficiary City</label> <input
													type="text" class="form-control" id="beneficiaryCity"
													name="beneficiaryCity" placeholder="City">
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Beneficiary State Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Beneficiary State</label> <input
																type="text" class="form-control" id="beneficiaryState"
																name="beneficiaryState" placeholder="State">
														</div>
														<!-- Mobile Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Mobile</label> <input
																type="text" class="form-control" id="mobile"
																name="mobile" placeholder="Mobile">
														</div>
														<!-- Nationality Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">Nationality</label> <select
																class="form-control" id="nationality" name="nationality">
																<option value="us">United States</option>
																<option value="uk">United Kingdom</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-12">
												<div class="mb-1">
													<div class="row">
														<!-- Date of Birth Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">Date of Birth</label> <input
																type="date" class="form-control" id="dob" name="dob">
														</div>
														<!-- ID Type Label and Dropdown -->
														<div class="col-12 col-md-4">
															<label class="form-label">ID Type</label> <select
																class="form-control" id="idType" name="idType">
																<option value="nationalId">National ID</option>
																<option value="passport">Passport</option>
															</select>
														</div>
														<!-- ID No. Label and Input -->
														<div class="col-12 col-md-4">
															<label class="form-label">ID No.</label> <input
																type="text" class="form-control" id="idNo" name="idNo"
																placeholder="ID No.">
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<!-- Own Account Checkbox -->
											<div class="col-xl-6">
												<div class="mb-1 d-flex align-items-center">
													<label class="form-label me-2">Own Account</label> <input
														type="checkbox" id="ownAccount" name="ownAccount">
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
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseThree"
							aria-expanded="false"
							aria-controls="panelsStayOpen-collapseThree"
							style="background: aliceblue;">Transaction Details</button>
					</h2>
					<div id="panelsStayOpen-collapseThree"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="padding-top: 0; margin-top: 0;">
							<div class="card-body personal-info">
								<div class="card-body pass-security">
									<div class="row">
										<div class="col-xl-4">
											<div>
												<label class="form-label">PayIn Currency<span
													class="text-danger">*</span></label> <select class="form-control"
													id="payInCurrency" name="payInCurrency">
													<option value="">Select Currency</option>
													<option value="usd">USD</option>
													<option value="eur">EUR</option>
													<option value="gbp">GBP</option>
												</select>
											</div>
										</div>
										<div class="col-xl-4">
											<div>
												<label class="form-label">Source of Fund<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Source of Fund"
													id="sourceOfFund" name="sourceOfFund">
											</div>
										</div>
										<div class="col-xl-4">
											<div>
												<label class="form-label">Transaction Purpose<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Transaction Purpose"
													id="transactionPurpose" name="transactionPurpose">
											</div>
										</div>
										<div class="col-xl-4">
											<div>
												<label class="form-label">Value Date<span
													class="text-danger">*</span></label> <input type="date"
													class="form-control" id="valueDate" name="valueDate">
											</div>
										</div>
										<div class="col-xl-4">
											<div>
												<label class="form-label">Remarks<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Remarks" id="remarks"
													name="remarks">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-4">
											<div>
												<label class="form-label">Payout Amount<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Payout Amount"
													id="payoutAmount" name="payoutAmount">
											</div>
										</div>

										<div class="col-xl-4">
											<div>
												<label class="form-label">Rate<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Rate" id="rate"
													name="rate">
											</div>
										</div>

										<div class="col-xl-4">
											<div>
												<label class="form-label">PayIn Amount<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Pay In Amount"
													id="payInAmount" name="payInAmount">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xl-2">
											<div>
												<label class="form-label">Commission</label> <input
													type="text" class="form-control" placeholder="Commission"
													id="commission" name="commission" readonly>
											</div>
										</div>

										<div class="col-xl-2">
											<div>
												<label class="form-label">Tax (%)</label> <input type="text"
													class="form-control" placeholder="Tax" id="tax" name="tax"
													readonly>
											</div>
										</div>

										<div class="col-xl-2">
											<div>
												<label class="form-label">Other Charges</label> <input
													type="text" class="form-control"
													placeholder="Other Charges" id="otherCharges"
													name="otherCharges" readonly>
											</div>
										</div>

										<div class="col-xl-2">
											<div>
												<label class="form-label">Roundoff</label> <input
													type="text" class="form-control" placeholder="Rate"
													id="dynamicRate" name="dynamicRate" readonly>
											</div>
										</div>

										<div class="col-xl-4">
											<div>
												<label class="form-label">Total Pay In Amount</label> <input
													type="text" class="form-control"
													placeholder="Total Pay In Amount" id="totalPayInAmount"
													name="totalPayInAmount" readonly>
											</div>
										</div>
									</div>
									<div class="row mt-4">
										<div class="col-xl-4">
											<div class="mb-5">
												<label class="form-label">Payment Mode<span
													class="text-danger">*</span></label> <select class="form-control"
													id="paymentMode" name="paymentMode">
													<option value="" disabled selected>Select Payment
														Mode</option>
													<option value="bankTransfer">Bank Transfer</option>
													<option value="mobileWallet">Mobile Wallet</option>
													<option value="cash">Cash</option>
												</select>
											</div>
										</div>

										<div class="col-xl-4">
											<div class="mb-5">
												<label class="form-label">Amount<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Enter Amount" id="amount"
													name="amount">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-12">
											<h6 class="mb-3">ID Details Table</h6>
											<div class="table-responsive">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>S.No.</th>
															<th>Mode</th>
															<th>Amount</th>
															<th>Card Type</th>
															<th>Intl No.</th>
															<th>Product No.</th>
															<th>Intl Code</th>
															<th>Bank Name</th>
															<th>Remarks</th>
														</tr>
													</thead>
													<tbody>
														<!-- Dummy Data Row 1 -->
														<tr>
															<td>1</td>
															<td>Cash</td>
															<td>$500</td>
															<td>Visa</td>
															<td>12345</td>
															<td>Prod-001</td>
															<td>Intl-001</td>
															<td>Bank A</td>
															<td>Payment completed</td>
														</tr>

													</tbody>
												</table>
											</div>
											<!-- Footer for dynamic content -->
											<div class="row mt-3">
												<div class="col-xl-6">
													<strong>Amount Collected:</strong> $1800
												</div>
												<div class="col-xl-6 text-end">
													<strong>Balance To Pay:</strong> $200
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
			<div class="mt-5 mb-5 text-center">
				<button type="button" class="btn btn-primary btn-sm">Submit</button>
			</div>
		</div>
		<!-- [ Footer ] start -->
		<footer class="footer" style="background: aliceblue;"> </footer>
		<!-- [ Footer ] end -->
	</div>

	<!--! ================================================================ !-->
	<!--! [End] Theme Customizer !-->
	<!--! ================================================================ !-->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<!-- vendors.min.js {always must need to be top} -->
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
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