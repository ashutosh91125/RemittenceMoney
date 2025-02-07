<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>LuLu Money || Transfer View</title>
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

.hidden {
	display: none;
}
/* Reduce the height of the Select2 container */
.custom-select2+.select2-container .select2-selection--single {
	height: 30px; /* Adjust as needed */
	line-height: 28px; /* Center align text */
	font-size: 12px; /* Adjust text size */
}

.loader {
	display: inline-block;
	width: 16px;
	height: 16px;
	border: 2px solid #f3f3f3;
	border-radius: 50%;
	border-top: 2px solid #3498db;
	animation: spin 1s linear infinite;
	margin-left: 10px;
	visibility: hidden;
}

.spinner-container {
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/commons.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    const accountTypeInput = document.getElementById("beneficiaryAccountType");
    if (accountTypeInput) {
        const accountTypeValue = accountTypeInput.value;
        if (accountTypeValue === "1") {
            accountTypeInput.value = "Saving";
        } else if (accountTypeValue === "2") {
            accountTypeInput.value = "Current";
        }
    }
});
    function viewReceipt() {
        var transactionRefNumber = $('#transactionRefNumber').val();
        var url = '/api/receipt/' + transactionRefNumber;

        $('#loader').show();
        $('#viewReceiptButton').prop('disabled', true);

        $.ajax({
            url: url,
            type: 'GET',
            success: function (response) {
                // Assuming the response contains the receiptBase64Data directly
                if (response && response.receiptBase64Data) {
                    // Decode the Base64 data and create a Blob
                    const base64Data = response.receiptBase64Data;
                    const binaryString = atob(base64Data);  // Decoding the Base64 string
                    const len = binaryString.length;
                    const bytes = new Uint8Array(len);

                    // Convert each character code into a byte
                    for (let i = 0; i < len; i++) {
                        bytes[i] = binaryString.charCodeAt(i);
                    }

                    // Create a Blob object from the decoded byte array
                    const blob = new Blob([bytes], { type: 'application/pdf' });

                    // Create a URL for the Blob and open in a new tab
                    const blobUrl = URL.createObjectURL(blob);

                    // Hide loader and enable the button after the PDF opens
                    $('#loader').hide();
                    $('#viewReceiptButton').prop('disabled', false);

                    // Open the Blob URL (PDF) in a new tab
                    window.open(blobUrl, '_blank');
                } else {
                    // Handle error: No receipt data found
                    alert('Failed to fetch receipt: Receipt data is missing.');
                    $('#loader').hide();
                    $('#viewReceiptButton').prop('disabled', false);
                }
            },
            error: function (xhr, status, error) {
                // Handle any unexpected AJAX error
                alert('Error occurred: ' + error);
                $('#loader').hide();
                $('#viewReceiptButton').prop('disabled', false);
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
			<form>
				<input type="hidden" id="residentTypeId" value="${residentType}">
				<div class="spinner-container" id="loader">
					<div class="spinner-border text-primary" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
				</div>
				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								onclick="toggleDiv('panelsStayOpen-collapseOne')"
								style="background: aliceblue;">Customer Details</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse">
							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body personal-info">
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Ecrn</label> <input name="ecrn"
												type="text" class="form-control" placeholder="Ecrn"
												name="ecrn" id="ecrn" value="${transferDetails.ecrn}"
												readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">First Name</label> <input
												name="firstName" type="text" class="form-control"
												placeholder="First Name" name="firstName" id="firstName"
												value="${transferDetails.firstName}" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Middle Name</label> <input
												name="middleName" type="text" class="form-control"
												placeholder="Middle Name" id="middleName"
												value="${transferDetails.middleName}" readonly />
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Last Name</label> <input
												name="lastName" type="text" class="form-control"
												placeholder="Last Name" id="lastName"
												value="${transferDetails.lastName}" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Date of Birth</label> <input
												name="dateOfBirth" id="dateOfBirth" type="date"
												class="form-control" value="${transferDetails.dateOfBirth}"
												readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Mobile No.</label>
											<div class="input-group">
												<input name="primaryMobileNumber" type="text"
													class="form-control" placeholder="Primary Mobile Number"
													id="primaryMobileNumber"
													value="${transferDetails.primaryMobileNumber}" readonly />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Email</label> <input name="emailId"
												type="email" class="form-control" placeholder="Email"
												id="emailId" value="${transferDetails.emailId}" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Place of Birth</label> <input
												name="placeOfBirth" type="text" class="form-control"
												placeholder="Place of Birth" id="placeOfBirth"
												value="${transferDetails.placeOfBirth}" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Address 1</label> <input
												type="text" class="form-control" id="address1"
												name="address1" placeholder="Address 1"
												value="${transferDetails.address1}" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Address 2</label> <input
												type="text" class="form-control" id="address2"
												name="address2" placeholder="Address 2"
												value="${transferDetails.address2}" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">City</label> <input name="city"
												type="text" class="form-control" placeholder="City"
												id="currentCity" value="${transferDetails.city}" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">State</label> <input name="state"
												type="text" class="form-control" placeholder="State"
												id="state" value="${transferDetails.state}" readonly />
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Country</label> <input type="text"
												class="form-control" name="country" placeholder="Country"
												id="country" value="${country}" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Country of Residence</label> <input
												type="text" class="form-control" name="countryOfResidence"
												placeholder="Country of Residence" id="countryOfResidence"
												value="${countryOfResidence}" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Country of Nationality</label> <input
												type="text" class="form-control" placeholder="nationality"
												name="nationality" id="nationality"
												value="${countryOfNatinality}" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Customer Category</label> <input
												type="text" class="form-control" placeholder="nationality"
												name="customerCategory" id="customerCategory"
												value="Individual"
												value="${transferDetails.customerCategory}" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Customer Type</label> <input
												type="text" class="form-control" placeholder="nationality"
												name="customerType" id="customerType" value="Standard"
												value="${transferDetails.customerType}" readonly>
										</div>
									</div>
									<%-- <div class="row mt-5">
										<div class="col-12">
											<h6>ID Details</h6>
										</div>
										<div id="idDetails">
											<div class="row">
												<div class="col-12 col-md-4">
													<label class="form-label">ID Type</label><input type="text"
														name="idType" class="form-control" placeholder="Id Type"
														id="idType" value="${idType}" readonly>
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">ID No.</label> <input
														name="idNumber" id="idNumber" name="idNumber"
														placeholder="Id Number" type="text" class="form-control"
														id="idNumber" value="${transferDetails.idNumber}" readonly />
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">Issued By</label> <input
														name="issuedBy" type="text" class="form-control"
														placeholder="Issued By" id="issuedBy"
														value="${transferDetails.issuedBy}" readonly />
												</div>
											</div>
											<div class="row mt-2">
												<div class="col-12 col-md-4">
													<label class="form-label">Date of Issue</label> <input
														name="issuedOn" type="text" class="form-control"
														placeholder="issuedOn" id="issuedOn"
														value="${transferDetails.issuedOn}" readonly />
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">Date of Expiry</label> <input
														name="dateOfExpiry" type="text" class="form-control"
														placeHolder="Date of Expiry" id="dateOfExpiry"
														value="${transferDetails.dateOfExpiry}" readonly />
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">Country</label> <input
														type="text" class="form-control"
														placeholder="Issued Country" name="issuedCountry"
														id="issuedCountry" value="${issuedCountry}" readonly>
												</div>
											</div>
											<div id="idDetailsFields" class="row mt-4"
												style="display: none;">
												<h5 class="fw-bold mb-0 me-4">
													<span class="d-block mb-4">Visa Details</span>
												</h5>
												<div class="row">
													<div class="col-12 col-md-4">
														<label class="form-label">Visa Number</label> <input
															name="visaNumber" type="text" id="visaNumber"
															class="form-control" placeholder="Visa Number"
															value="${transferDetails.visaNumber}" readonly />
													</div>
													<div class="col-12 col-md-4">
														<label class="form-label">Visa Expiry Date</label> <input
															name="visaExpiryDate" type="text" class="form-control"
															placeholder="Visa Expiry Date" id="visaExpiryDate"
															value="${transferDetails.visaExpiryDate}" readonly />
													</div>
													<div class="col-12 col-md-4">
														<label class="form-label">Visa Type</label> <input
															name="visaType" type="text" class="form-control"
															placeholder="Visa Type" id="visaType"
															value="${transferDetails.visaType}" readonly />
													</div>
												</div>
											</div>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								onclick="toggleDiv('panelsStayOpen-collapseTwo')"
								style="background: aliceblue;">Beneficiary Details
								[Lulu-Remit]</button>
						</h2>
						<div id="panelsStayOpen-collapseTwo"
							class="accordion-collapse collapse ">
							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body personal-info">
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Delivery Option</label> <input
												name="beneficiaryDeliveryOption" type="text"
												class="form-control" placeholder="Delivery Option"
												id="beneficiaryDeliveryOption"
												value="${transferDetails.beneficiaryDeliveryOption}"
												readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Payout Country</label> <input
												name="payOutCountry" type="text" class="form-control"
												placeholder="Payout Country" id="payOutCountry"
												value="${payOutCountry}" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Currency</label> <input
												name="currencies" type="text" class="form-control"
												placeholder="Currency" id="currencies" value="${currency}"
												readonly />
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Bank</label> <input
													name="beneficiaryBank" type="text" class="form-control"
													placeholder="Bank" id="beneficiaryBank"
													value="${bank.bankName}" readonly />
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Branch</label> <input type="text"
													class="form-control" id="bankBranches"
													name="beneficiaryBranch" value="${baranch.branchName}"
													placeholder="Branch" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">IBAN</label> <input type="text"
													class="form-control" id="beneficiaryIban"
													name="beneficiaryIban"
													value="${transferDetails.beneficiaryIban}"
													placeholder="IBAN" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Account Type</label> <input
													type="text" class="form-control"
													id="beneficiaryAccountType" name="beneficiaryAccountType"
													value="${transferDetails.beneficiaryAccountType}"
													placeholder="Account Type" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Account No.</label> <input
													type="text" class="form-control" id="accountNo"
													name="beneficiaryAccountNo" placeholder="Account No."
													value="${transferDetails.beneficiaryAccountNo}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Type</label> <input
													type="text" class="form-control" id="beneficiaryType"
													name="beneficiaryType" placeholder="Beneficiary Type"
													value="${transferDetails.beneficiaryType}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Relation</label> <input
													type="text" class="form-control" id="beneficiaryRelation"
													name="beneficiaryRelation" placeholder="Relation"
													value="${transferDetails.beneficiaryRelation}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Nick Name</label> <input
												type="text" class="form-control" id="beneficiaryNickname"
												name="beneficiaryNickname" placeholder="Nick Name"
												value="${transferDetails.beneficiaryNickname}" readonly>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">First Name</label> <input
													type="text" class="form-control" id="beneficiaryFirstName"
													name="beneficiaryFirstName" placeholder="First Name"
													value="${transferDetails.beneficiaryFirstName}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Middle Name</label> <input
													type="text" class="form-control" id="beneficiaryMiddleName"
													name="beneficiaryMiddleName" placeholder="Middle Name"
													value="${transferDetails.beneficiaryMiddleName}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Last Name</label> <input
													type="text" class="form-control" id="beneficiaryLastName"
													name="beneficiaryLastName" placeholder="Last Name"
													value="${transferDetails.beneficiaryLastName}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Address 1</label> <input
													type="text" class="form-control" id="beneficiaryAddress1"
													name="beneficiaryAddress1" placeholder="Address"
													value="${transferDetails.beneficiaryAddress1}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Address 2</label> <input
													type="text" class="form-control" id="beneficiaryAddress2"
													name="beneficiaryAddress2" placeholder="Address 2"
													value="${transferDetails.beneficiaryAddress2}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary City</label> <input
													type="text" class="form-control" id="beneficiaryCity"
													name="beneficiaryCity" placeholder="City"
													value="${transferDetails.beneficiaryCity}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Nationality</label> <input
													type="text" class="form-control"
													id="beneficiaryNationality" name="beneficiaryNationality"
													placeholder="IBAN" value="${benificeryNatinality}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary State</label> <input
													type="text" class="form-control" id="beneficiaryState"
													name="beneficiaryState" placeholder="Beneficiary State"
													value="${transferDetails.beneficiaryState}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Mobile</label> <input type="text"
													class="form-control" id="beneficiaryMobile"
													name="beneficiaryMobile" placeholder="Mobile"
													value="${transferDetails.beneficiaryMobile}" readonly>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Date of Birth</label> <input
													type="date" class="form-control" id="beneficiaryDob"
													name="beneficiaryDob"
													value="${transferDetails.beneficiaryDob}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">ID Type</label> <input type="text"
													class="form-control" id="beneficiaryIdType"
													name="beneficiaryIdType" placeholder="ID Type"
													value="${transferDetails.beneficiaryIdType}" readonly />
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">ID No.</label> <input type="text"
													class="form-control" id="beneficiaryIdNo"
													name="beneficiaryIdNo" placeholder="ID No."
													value="${transferDetails.beneficiaryIdNo}" readonly>
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
								onclick="toggleDiv('panelsStayOpen-collapseThree')"
								style="background: aliceblue;">Transaction Details</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body" style="background: aliceblue;">
								<div class="card-body personal-info">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<label class="form-label">PayIn Currency<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" id="payInCurrency"
													name="payInCurrency" placeholder="PayIn Currency"
													value="${payInCurrency}" readonly>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Source of Fund<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" id="sourceOfFund" name="sourceOfFund"
													placeholder="Source of Fund"
													value="${transferDetails.sourceOfFund}" readonly>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Transaction Purpose<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" id="transactionPurpose"
													name="transactionPurpose" placeholder="Transaction Purpose"
													value="${transferDetails.transactionPurpose}" readonly>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<label class="form-label">Value Date<span
													class="text-danger"></span></label> <input type="date"
													class="form-control" id="valueDate" name="valueDate"
													value="${transferDetails.valueDate}" readonly>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Payment Mode<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" id="paymentMode" name="paymentMode"
													placeholder="Payment Mode"
													value="${transferDetails.paymentMode}" readonly>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Remarks<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" placeholder="Remarks" id="remarks"
													name="remarks" value="${transferDetails.remarks}" readonly>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<label class="form-label">PayIn Amount<span
													class="text-danger"></span></label> <input type="number"
													class="form-control" placeholder="PayIn Amount"
													id="payInAmount" name="payInAmount" min="5" max="50000"
													value="${transferDetails.payInAmount}" required readonly>
											</div>

											<div class="col-xl-4">
												<label class="form-label">Rate<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" placeholder="Rate" id="rate"
													style="color: green;" name="rate"
													value="${transferDetails.rate}" readonly>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Payout Amount<span
													class="text-danger"></span></label> <input type="text"
													class="form-control" placeholder="Payout Amount"
													style="color: green;" id="payoutAmount" name="payoutAmount"
													value="${transferDetails.payoutAmount}" readonly>
											</div>
										</div>

										<div class="row">
											<div class="col-xl-2">
												<label class="form-label">Commission</label> <input
													type="text" class="form-control" placeholder="Commission"
													style="color: green;" id="commission" name="commission"
													value="${transferDetails.commission}" readonly>
											</div>
											<div class="col-xl-2">
												<label class="form-label">Tax</label> <input type="text"
													class="form-control" placeholder="Tax"
													style="color: green;" id="tax" name="tax"
													value="${transferDetails.tax}" readonly>
											</div>

											<div class="col-xl-4">
												<label class="form-label">Total Pay In Amount</label> <input
													type="text" class="form-control"
													placeholder="Total Pay In Amount" id="totalPayInAmount"
													style="color: green;" name="totalPayInAmount"
													value="${transferDetails.totalPayInAmount}" readonly>
											</div>

											<div class="col-xl-4">
                                                <label class="form-label">Transaction Number</label> <input
                                                    type="text" class="form-control"
                                                    placeholder="Transaction Number" id="transactionRefNumber"
                                                    style="color: green;" name="transactionRefNumber"
                                                    value="${transferDetails.transactionReferenceNumber}" readonly>
                                            </div>
										</div>
										<div class="row">
                                            <div class="col-xl-4">
                                                <label class="form-label">Payment Status<span
                                                    class="text-danger"></span></label> <input type="text"
                                                    class="form-control" id="paymentStatus" name="paymentStatus"
                                                    placeholder="Payment Status"
                                                    value="${transferDetails.paymentStatus}" readonly>
                                            </div>
                                             <div class="col-xl-4">
                                                <label class="form-label">Transaction State<span
                                                     class="text-danger"></span></label> <input type="text"
                                                     class="form-control" id="transactionState" name="transactionState"
                                                     placeholder="Transaction State"
                                                     value="${transferDetails.transactionState}" readonly>
                                             </div>
                                            <div class="col-xl-4">
                                                <label class="form-label">Transaction SubState<span
                                                     class="text-danger"></span></label> <input type="text"
                                                     class="form-control" id="transactionSubState" name="transactionSubState"
                                                     placeholder="Transaction SubState"
                                                     value="${transferDetails.transactionSubState}" readonly>
                                           </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-5 mb-5 text-center"
                    style="display: flex; justify-content: center">
                    <div>
                        <button type="button" id="viewReceiptButton" onclick="viewReceipt()"
                            class="btn btn-warning">View Receipt</button>
                    </div>
                </div>
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/vendors/js/lslstrength.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/customers-create-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
</body>
</html>