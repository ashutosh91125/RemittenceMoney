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

<script type="text/javascript">
	function toggleDiv(divId) {
		const element = document.getElementById(divId);
		element.classList.toggle("show");
	}
</script>



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

@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100%{transform:rotate(360deg);}
}
</style>
<script type="text/javascript">
$(document).ready(function () {
    $("tr[data-customer-ecrn]").on("click", function () {
        var customerEcrn = $(this).data("customer-ecrn");
        console.log("Fetching customer for ECRN:", customerEcrn);

        $.ajax({
            url: '/caas/api/v2/customer/' + customerEcrn, // Include ECRN in path
            type: 'GET',
            success: function (response) {
                console.log(response);
                if (response) {
                    $('#ecrn').val(response.ecrn?.trim() || '');
                    $('#firstName').val(response.firstName?.trim() || '');
                    $('#middleName').val(response.middleName?.trim() || '');
                    $('#lastName').val(response.lastName?.trim() || '');
                    $('#currentCity').val(response.city?.trim() || '');
                    $('#placeOfBirth').val(response.placeOfBirth?.trim() || '');
                    $('#dateOfBirth').val(response.dateOfBirth?.trim() || '');
                    $('#emailId').val(response.emailId?.trim() || '');
                    $('#primaryMobileNumber').val(response.primaryMobileNumber?.trim() || '');
                    $('#state').val(response.state?.trim() || '');
                    $('#countryOfResidence').val(response.countryOfResidence?.trim() || '');
                    $('#nationality').val(response.nationality?.trim() || '');
                    $('#country').val(response.country?.trim() || '');
                    $('#residentTypeId').val(response.residentTypeId || '');
                    $('#visaType').val(response.visaType?.trim() || '');
                    $('#idNumber').val(response.idNumber?.trim() || '');
                    $('#idType').val(response.idType || '');
                    $('#issuedBy').val(response.issuedBy?.trim() || '');
                    $('#issuedOn').val(response.issuedOn?.trim() || '');
                    $('#dateOfExpiry').val(response.dateOfExpiry?.trim() || '');
                    $('#issuedCountry').val(response.issuedCountry?.trim() || '');
                    $('#visaExpiryDate').val(response.visaExpiryDate?.trim() || '');
                    $('#visaNumber').val(response.visaNumber?.trim() || '');

                    toggleFields();
                } else {
                    console.error("No customer data found for the provided ECRN.");
                }
            },
            error: function (xhr, status, error) {
                if (xhr.status === 404) {
                    alert("Customer not found for the provided ECRN.");
                } else {
                    alert("An error occurred while fetching customer data.");
                }
            }
        });
    });
});

function toggleFields() {
    const residentTypeId = document.getElementById('residentTypeId').value;
    const idType = document.getElementById('idType').value;
    const idDetailsFields = document.getElementById('idDetailsFields');
    const idDetails = document.getElementById('idDetails');
    
    idDetails.style.display = "block";
    if (residentTypeId === "100") {
        idDetailsFields.style.display = "block";
    } else {
        idDetailsFields.style.display = "none";
    }
}



$(document).ready(function() {
	
   $('#payOutCountry').on('change', function() {
       let dependent = $(this).val(); 

     
       $('#currencies').empty().append('<option value="" disabled selected>Select Currency</option>');
       $('#beneficryBank').empty().append('<option value="" disabled selected>Select Bank</option>');
       $('#bankBranches').empty().append('<option value="" disabled selected>Select Branch</option>'); 

       if (dependent) {
           let currencyDependent = dependent + "C"; 

           // Fetch Currencies
           $.ajax({
               url: '/api/enumEntities/dependent', 
               type: 'GET',
               data: { dependent: currencyDependent },
               success: function(data) {
                   $.each(data, function(index, enumValue) {
                       $('#currencies').append('<option value="' + enumValue.valueId + '">' + enumValue.description + '</option>');
                   });
               },
               error: function() {
                   console.error("Error fetching currencies for the selected country.");
               }
           });

           $.ajax({
               url: '/api/v1/banks/country-code/' + dependent,
               type: 'GET',
               success: function(data) {
                   console.log(data);
                   
                   $('#beneficryBank').empty();

                   
                   $('#beneficryBank').append('<option value="">Select  Bank</option>');

                   
                   $.each(data, function(index, bank) {
                       $('#beneficryBank').append('<option value="' + bank.bankId + '">' + bank.bankName + '</option>');
                   });
               },
               error: function() {
                   console.error("Error fetching banks for the selected country.");
               }
           })
       }
   });


   $('#beneficryBank').on('change', function() {
       let bankId = $(this).val(); 

       // Clear previous values in the branches dropdown
       $('#bankBranches').empty().append('<option value="" disabled selected>Select Branch</option>');

       if (bankId) {
    
           $.ajax({
               url: '/api/v1/banks/branches/by-bank/'+bankId, 
               type: 'GET',
//                data: { bankId: bankId },
               success: function(data) {
               	console.log(data);
               	 $('#bankBranches').empty();
               	 $('#bankBranches').append('<option value="">Select  Branch</option>');
                   $.each(data, function(index, branch) {
                       $('#bankBranches').append('<option value="' + branch.routingCode + '">' + branch.branchName + '</option>');
                   });
               },
               error: function() {
                   console.error("Error fetching branches for the selected bank.");
               }
           });
       }
   });
});
    // Function to call the quote service
            function getQuote() {
                const payload = {
                    sending_country_code: "MY",
                    sending_currency_code: $('#payInCurrency').val(),
                    receiving_country_code: $('#payOutCountry').val(),
                    receiving_currency_code: $('#currencies').val(),
                    sending_amount: $('#totalPayInAmount').val(),
                    receiving_mode: $('#beneficryDeleiveryOption').val(),
                    type: "SEND",
                    instrument: "REMITTANCE"
                };
                console.log(payload);

                // Show loader and disable button
                $('#quoteLoader').css('visibility', 'visible');
                $('#quoteButton').prop('disabled', true);

                $.ajax({
                    url: '/api/v1/raas/quote',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(payload),
                    success: function(response) {
                        if (response.status === 200) {
                            const quoteId = response.quote_id;

                            $('#quoteId').val(response.quote_id); // Store the quote ID
                            $('#totalPayInAmount').val(response.total_payin_amount);
                            $('#rate').val(response.exchange_rate);
                            $('#commission').val(response.commission_amount);
                            $('#payoutAmount').val(response.receiving_amount);
                            $('#tax').val(response.tax_amount);

                            $('#quoteMessage').text(`Quote Created Successfully`);
                            $('#quoteButton').hide();
                            $('#createTransactionSection').show(); // Show the transaction section 
                        }
                        else {
                            $('#quoteMessage').text('Failed to generate quote. Please try again.').css('color', 'red');
                             $('#createTransactionSection').hide(); // Ensure it remains hidden 
                        }
                    },
                    error: function() {
                        alert('Failed to generate quote. Please try again.');
                        $('#createTransactionSection').hide();
                        
                    },
                    complete: function() {
                        // Hide loader and enable button
                        $('#quoteLoader').css('visibility', 'hidden');
                        $('#quoteButton').prop('disabled', false);
                    }
                });
            }

            // Function to call the create-transaction service
            function createTransaction() {
                const payload = {
                    type: "SEND",
                    source_of_income: $('#sourceOfFund').val(),
                    purpose_of_txn: $('#transactionPurpose').val(),
                    instrument: "REMITTANCE",
                    message: "Agency transaction",
                    sender: {
//                     	 customer_number:"4582433857738986"
                         customer_number: $('#ecrn').val()
                    },
                    receiver: {
                        mobile_number: $('#beneficiarymobile').val(),
                        first_name: $('#benificiryfirstName').val(),
                        last_name: $('#benificirylastName').val(),
                        relation_code: "32",
                        nationality: $('#beneficiaryNationality').val(),
                        receiver_address: [
                            {
                                address_type: "PRESENT",
                                address_line: $('#benificiryAddress1').val(),
                                town_name: $('#benificiryCity').val(),
                                country_code: $('#beneficiaryNationality').val()
                            }
                        ],
                        bank_details: {
                            account_type_code: $('#beneficryAccountType').val(),
                            account_number: $('#confirmAccountNo').val(),
                            routing_code: $('#bankBranches').val()
                        }
                    },
                    transaction: {
                        quote_id: $('#quoteId').val() // Use stored quote ID
                    }
                };

                // Show loader and disable button
                $('#transactionLoader').css('visibility', 'visible');
                $('#transactionButton').prop('disabled', true);

                $.ajax({
                    url: '/api/v1/raas/create-transaction',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(payload),
                    success: function(response) {
                        if (response.status === 200) {
                            $('#transactionMessage').text(`Transaction created successfully. Reference Number: ${response.transaction_ref_number}`);
                        }
                    },
                    error: function() {
                        alert('Failed to create transaction. Please try again.');
                    },
                    complete: function() {
                        // Hide loader and enable button
                        $('#transactionLoader').css('visibility', 'hidden');
                        $('#transactionButton').prop('disabled', false);
                    }
                });
            }

document.addEventListener('DOMContentLoaded', function() {
    console.log("Page Loaded");
    toggleFields();

    const accountNumber = document.getElementById("accountNo");
    const confirmAccountNumber = document.getElementById("confirmAccountNo");
    const messageElement = document.getElementById("validationMessage");

    function validateRealTime() {
        const accountNumberValue = accountNumber.value.trim();
        const confirmAccountNumberValue = confirmAccountNumber.value.trim();

        if (confirmAccountNumberValue === "") {
            messageElement.textContent = ""; 
            return;
        }
        if (accountNumberValue !== confirmAccountNumberValue) {
            messageElement.textContent = "Account numbers do not match!";
            messageElement.style.color = "red";
        } else {
            messageElement.textContent = "Account numbers match.";
            messageElement.style.color = "green";
        }
    }

    accountNumber.addEventListener('input', validateRealTime);
    confirmAccountNumber.addEventListener('input', validateRealTime);
    document.getElementById('residentTypeId').addEventListener('change', toggleFields);
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
			<jsp:include page="customersearchontransfer.jsp"></jsp:include>
			<form>
				<input type="hidden" id="residentTypeId" name="residentTypeId"
					value="">
				<div
					class="${not empty customerListOnTransfer?'main-content':'hidden' }">
					<div class="row">
						<div class="col-lg-12">
							<div class="card stretch stretch-full">
								<div class="card-body p-0">
									<div class="table-responsive">
										<table class="table table-hover" id="search-result">
											<thead>
												<tr>
													<%--  id="customerRow-${customer.ecrn}"
													data-customer-ecrn="${customer.ecrn}">
 --%>
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
												<c:forEach var="customer" items="${customerListOnTransfer}"
													varStatus="status">
													<tr data-customer-ecrn="${customer.ecrn}">
														<td>${customer.ecrn}</td>
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
												name="ecrn" id="ecrn" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">First Name</label> <input
												name="firstName" type="text" class="form-control"
												placeholder="First Name" name="firstName" id="firstName"
												readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Middle Name</label> <input
												name="middleName" type="text" class="form-control"
												placeholder="Middle Name" id="middleName" readonly />
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Last Name</label> <input
												name="lastName" type="text" class="form-control"
												placeholder="Last Name" id="lastName" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Date of Birth</label> <input
												name="dateOfBirth" id="dateOfBirth" type="date"
												class="form-control" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Mobile No.</label>
											<div class="input-group">
												<input name="primaryMobileNumber" type="text"
													class="form-control" placeholder="Primary Mobile Number"
													id="primaryMobileNumber" readonly />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Email</label> <input name="emailId"
												type="email" class="form-control" placeholder="Email"
												id="emailId" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Place of Birth</label> <input
												name="placeOfBirth" type="text" class="form-control"
												placeholder="Place of Birth" id="placeOfBirth" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Address 1</label> <input
												type="text" class="form-control" id="address1"
												name="address1" placeholder="Address 1" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Address 2</label> <input
												type="text" class="form-control" id="address2"
												name="address2" placeholder="Address 2" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">City</label> <input name="city"
												type="text" class="form-control" placeholder="City"
												id="currentCity" readonly />
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">State</label> <input name="state"
												type="text" class="form-control" placeholder="State"
												id="state" readonly />
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Country</label> <input type="text"
												class="form-control" name="country" placeholder="Country"
												id="country" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Country of Residence</label> <input
												type="text" class="form-control" name="countryOfResidence"
												placeholder="Country of Residence" id="countryOfResidence"
												readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Country of Nationality</label> <input
												type="text" class="form-control" placeholder="nationality"
												name="nationality" id="nationality" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Customer Category</label> <input
												type="text" class="form-control" placeholder="nationality"
												name="customerCategory" id="customerCategory"
												value="Individual" readonly>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Customer Type</label> <input
												type="text" class="form-control" placeholder="nationality"
												name="customerType" id="customerType" value="Standard"
												readonly>
										</div>
									</div>
									<div class="row mt-5">
										<div class="col-12">
											<h6>ID Details</h6>
										</div>
										<div id="idDetails">
											<div class="row">
												<div class="col-12 col-md-4">
													<label class="form-label">ID Type</label><input type="text"
														name="idType" class="form-control" placeholder="Id Type"
														id="idType" readonly>
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">ID No.</label> <input
														name="idNumber" id="idNumber" name="idNumber"
														placeholder="Id Number" type="text" class="form-control"
														id="idNumber" readonly />
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">ID Issued By</label> <input
														name="issuedBy" type="text" class="form-control"
														placeholder="Issued By" id="issuedBy" readonly />
												</div>
											</div>
											<div class="row mt-2">
												<div class="col-12 col-md-4">
													<label class="form-label">ID Date of Issue</label> <input
														name="issuedAt" type="text" class="form-control"
														placeholder="issuedOn" id="issuedOn" readonly />
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">ID Date of Expiry</label> <input
														name="dateOfExpiry" type="text" class="form-control"
														placeHolder="Date of Expiry" id="dateOfExpiry" readonly />
												</div>
												<div class="col-12 col-md-4">
													<label class="form-label">Country</label> <input
														type="text" class="form-control"
														placeholder="Issued Country" name="issuedCountry"
														id="issuedCountry" readonly>
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
															class="form-control" placeholder="Visa Number" readonly />
													</div>
													<div class="col-12 col-md-4">
														<label class="form-label">Visa Expiry Date</label> <input
															name="visaExpiryDate" type="text" class="form-control"
															placeholder="Visa Expiry Date" id="visaExpiryDate"
															readonly />
													</div>
													<div class="col-12 col-md-4">
														<label class="form-label">Visa Type</label> <input
															name="visaType" type="text" class="form-control"
															placeholder="Visa Type" id="visaType" readonly />
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
											<label class="form-label">Delivery Option</label><select
												data-select2-selector="icon" class="form-control"
												name="beneficryDeleiveryOption"
												id="beneficryDeleiveryOption">
												<option value="">Select Delivery Option</option>
												<option value="CASHPICKUP">Cash Pickup</option>
												<option value="MOBILEWALLET">Mobile Wallet</option>
												<option value="BANK">BANK</option>
											</select>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Payout Country</label> <select
												data-select2-selector="icon" name="payOutCountry"
												id="payOutCountry" class="form-control">
												<option value="" disabled selected>Select Payout
													Country</option>
												<c:forEach var="country" items="${countryList}">
													<option value="${country.valueId}">${country.description}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Currency</label> <select
												name="currencies" id="currencies" class="form-control"
												data-select2-selector="icon">
												<option value="" disabled selected>Currency</option>
												<c:forEach var="currency" items="${currencyList}">
													<option value="${currency.valueId}">${currency.description}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Bank</label> <select
													class="form-control" id="beneficryBank"
													name="beneficryBank" data-select2-selector="icon">
													<option value="" disabled selected>Select Bank</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Branch</label> <select
													class="form-control" id="bankBranches"
													name="beneficrybranch" data-select2-selector="icon">
													<option value="" disabled selected>Select Branch</option>
												</select>
												<!-- <input type="text" class="form-control" id="branch"
													name="branch" placeholder=""> -->
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">IBAN</label> <input type="text"
													class="form-control" id="beneficryIban"
													name="beneficryIban" placeholder="IBAN">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Account Type</label> <select
													class="form-control" id="beneficryAccountType"
													name="beneficryAccountType" data-select2-selector="icon">
													<option value="1">Savings</option>
													<option value="2">Current</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Account No.</label> <input
													type="text" class="form-control" id="accountNo"
													name="beneficryAccountNo" placeholder="Account No.">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Confirm Account No.</label> <input
													type="text" class="form-control" id="confirmAccountNo"
													name="beneficryConfirmAccountNo"
													placeholder="Confirm Account No.">
											</div>
											<span id="validationMessage"></span>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Type</label> <select
													class="form-control" id="beneficiaryType"
													name="beneficiaryType" data-select2-selector="icon">
													<option value="individual">Individual</option>
													<option value="company">Company</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Relation</label> <select
													class="form-control" id="beneficiaryRelation"
													name="beneficiaryRelation" data-select2-selector="icon">
													<option value="spouse">Spouse</option>
													<option value="friend">Friend</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<label class="form-label">Nick Name</label> <input
												type="text" class="form-control" id="beneficiaryNickname"
												name="beneficiaryNickname" placeholder="Nick Name">
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">First Name</label> <input
													type="text" class="form-control" id="benificiryfirstName"
													name="benificiryfirstName" placeholder="First Name">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Middle Name</label> <input
													type="text" class="form-control" id="benificiryMiddleName"
													name="benificirymiddleName" placeholder="Middle Name">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Last Name</label> <input
													type="text" class="form-control" id="benificirylastName"
													name="benificirylastName" placeholder="Last Name">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Address 1</label> <input
													type="text" class="form-control" id="benificiryAddress1"
													name="benificiryAddress1" placeholder="Address">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Address 2</label> <input
													type="text" class="form-control" id="benificiryAddress2"
													name="benificiryAddress2" placeholder="Address 2">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary City</label> <input
													type="text" class="form-control" id="beneficiaryCity"
													name="beneficiaryCity" placeholder="City">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary State</label> <input
													type="text" class="form-control" id="beneficiaryState"
													name="beneficiaryState" placeholder="State">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Mobile</label> <input type="text"
													class="form-control" id="beneficiarymobile"
													name="beneficiarymobile" placeholder="Mobile">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Nationality</label> <select
													name="beneficiaryNationality" id="beneficiaryNationality"
													class="form-control" data-select2-selector="icon">
													<option value="" disabled selected>Nationality</option>
													<c:forEach var="country" items="${countryList}">
														<option value="${country.valueId}">${country.description}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Date of Birth</label> <input
													type="date" class="form-control" id="benificiryDob"
													name="benificiryDob">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">ID Type</label> <select
													data-select2-selector="icon" class="form-control"
													id="benificiryIdType" name="benificiryIdType">
													<option value="nationalId">National ID</option>
													<option value="passport">Passport</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">ID No.</label> <input type="text"
													class="form-control" id="benificiryIdNo"
													name="benificiryIdNo" placeholder="ID No.">
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
													class="text-danger">*</span></label> <select name="payInCurrency"
													id="payInCurrency" class="form-control"
													data-select2-selector="icon">
													<option value="" disabled selected>Currency</option>
													<c:forEach var="currency" items="${currencyList}">
														<option value="${currency.valueId}">${currency.description}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Source of Fund<span
													class="text-danger">*</span></label> <select
													data-select2-selector="icon" class="form-control"
													id="sourceOfFund" name="sourceOfFund">
													<option value="">Select Source of Fund</option>
													<option value="BUSINESS">Business</option>
													<option value="LOAN">Loan</option>
													<option value="LOTTERY">Lottery Income</option>
													<option value="SLRY">Salary</option>
													<option value="SVGS">Savings</option>
												</select>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Transaction Purpose<span
													class="text-danger">*</span></label> <select
													data-select2-selector="icon" class="form-control"
													id="transactionPurpose" name="transactionPurpose">
													<option value="">Select Transaction Purpose</option>
													<option value="P52">Business travel</option>
													<option value="P147">Education services</option>
													<option value="FAMA">Family Maintenance</option>
													<option value="P18">Gift</option>
													<option value="MDCS">Medical Expenses</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<label class="form-label">Value Date<span
													class="text-danger">*</span></label> <input type="date"
													class="form-control" id="valueDate" name="valueDate">
											</div>
											<div class="col-xl-4">
												<label class="form-label">Payment Mode<span
													class="text-danger">*</span></label> <select class="form-control"
													id="paymentMode" name="paymentMode"
													data-select2-selector="icon">
													<option value="" disabled selected>Select Payment Mode</option>
													<option value="BANK">Bank Transfer</option>
												
												</select>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Remarks<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Remarks" id="remarks"
													name="remarks">
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<label class="form-label">PayIn Amount<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="PayIn Amount" id="amount"
													name="amount">
											</div>
											<div class="col-xl-4">
												<label class="form-label">Rate<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Rate" id="rate"
													name="rate">
											</div>
											<div class="col-xl-4">
												<label class="form-label">Payout Amount<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Payout Amount"
													id="payoutAmount" name="payoutAmount">
											</div>
										</div>

										<div class="row">
											<div class="col-xl-2">
												<label class="form-label">Commission</label> <input
													type="text" class="form-control" placeholder="Commission"
													id="commission" name="commission" readonly>
											</div>
											<!-- <div class="col-xl-2">
												<div>
													<label class="form-label">Tax (%)</label> <input
														type="text" class="form-control" placeholder="Tax"
														id="tax" name="tax" readonly>
												</div>
											</div>
											<div class="col-xl-2">
												<div>
													<label class="form-label">Other Charges</label> <input
														type="text" class="form-control"
														placeholder="Other Charges" id="otherCharges"
														name="otherCharges" readonly>
												</div>
											</div> -->
											<div class="col-xl-2">
												<label class="form-label">Roundoff</label> <input
													type="text" class="form-control" placeholder="Rate"
													id="dynamicRate" name="dynamicRate" readonly>
											</div>

											<div class="col-xl-4">
												<label class="form-label">Total Pay In Amount</label> <input
													type="text" class="form-control"
													placeholder="Total Pay In Amount" id="totalPayInAmount"
													name="totalPayInAmount" readonly>
											</div>
										</div>
										<!-- <div class="row mt-4">
											<div class="col-xl-4">
												<div class="mb-5">
													<label class="form-label">Amount<span
														class="text-danger">*</span></label>
												</div>
											</div>
										</div> -->
										<!-- <div class="row">
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
															Dummy Data Row 1
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
												Footer for dynamic content
												<div class="row mt-3">
													<div class="col-xl-6">
														<strong>Amount Collected:</strong> $1800
													</div>
													<div class="col-xl-6 text-end">
														<strong>Balance To Pay:</strong> $200
													</div>
												</div>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-5 mb-5 text-center"
						style="display: flex; justify-content: center">
						<div id="createQuote">
							<button type="button" id="quoteButton" onclick="getQuote()"
								class="btn btn-warning">Submit</button>
							<div id="quoteMessage" style="font-weight: bold; color: green;"></div>
							<input type="hidden" id="quoteId" />
						</div>
						<div class="mt-5 mb-5 text-center"
							style="justify-content: center;">
							<button type="button" onclick="createTransaction()"
								class="btn btn-primary" id="createTransactionSection"
								style="display: none; margin-left: -169px;">Create
								Transaction</button>
							<div id="transactionMessage"
								style="color: green; font-weight: bold;"></div>
						</div>
					</div>
			</form>
		</div>
		<footer class="footer" style="background: aliceblue;"> </footer>
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