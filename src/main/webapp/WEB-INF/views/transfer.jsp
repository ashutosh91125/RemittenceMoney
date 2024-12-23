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

.spinner-container {
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	display: none;
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
                    $('#residentTypeId').val(response.residentTypeId || '');
                    $('#visaType').val(response.visaType?.trim() || '');
                    $('#idNumber').val(response.idNumber?.trim() || '');
//                     $('#idType').val(response.idType || '');
                    $('#issuedBy').val(response.issuedBy?.trim() || '');
                    $('#issuedOn').val(response.issuedOn?.trim() || '');
                    $('#dateOfExpiry').val(response.dateOfExpiry?.trim() || '');
                    $('#visaExpiryDate').val(response.visaExpiryDate?.trim() || '');
                    $('#visaNumber').val(response.visaNumber?.trim() || '');
                    // Map country code to country name
                    if (response.country) {
                        fetchEnumValue('country', response.country, function (country) {
                            $('#country').val(country || response.country);
                        });
                        fetchEnumValue('country', response.countryOfResidence, function (country) {
                            $('#countryOfResidence').val(country || response.countryOfResidence);
                        });
                        fetchEnumValue('country', response.nationality, function (country) {
                            $('#nationality').val(country || response.nationality);
                        });
                        fetchEnumValue('country', response.issuedCountry, function (country) {
                            $('#issuedCountry').val(country || response.issuedCountry);
                        });
                        fetchEnumValue('idTypes', response.idType, function (idTypes) {
                            $('#idType').val(idTypes || response.idType);
                        });
                    }
                    var mergedAddress1 = [
                        response.buildingName?.trim(),
                        response.streetName?.trim(),
                        response.landmark?.trim(),
                        response.district?.trim(),
                        response.zip ? ', Zip - ' + response.zip.trim() : ''
                    ].filter(Boolean).join(' ');
                    $('#address1').val(mergedAddress1);
                    var mergedAddress2 = [
                        response.parBuildingName?.trim(),
                        response.parStreetName?.trim(),
                        response.parLandmark?.trim(),
                        response.parDistrict?.trim(),	
                        response.parZip ? ', Zip - ' + response.parZip.trim() : '' 
                    ].filter(Boolean).join(' ');
                    $('#address2').val(mergedAddress2);
                    toggleFields();
                    fetchBeneficiaries(customerEcrn);
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
     // Fetch Beneficiaries Function
        function fetchBeneficiaries(ecrn) {
            $.ajax({
                url: '/api/v1/beneficiaries/get-list-by-ecrn/' + ecrn,
                type: 'GET',
                success: function (response) {
                    if (response.success && response.data?.length > 0) {
                        console.log("Beneficiaries fetched successfully:", response.data);
                        response.data.forEach(function (beneficiary) {
                        	 $('#searchBenficery').append('<option value="' + beneficiary.id + '">' + beneficiary.fullName + '</option>');
                        });

                    } else {
                        console.warn(response.message || "No beneficiaries found for the provided ECRN.");
                        $('#searchBenficery').html('<option value="">No beneficiaries found</option>');
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching beneficiaries:", error);
                    alert("An error occurred while fetching beneficiaries.");
                }
            });
        }

    })
     $('#searchBenficery').on('change', function () {
                    var selectedId = $(this).val(); // Get the selected value (beneficiary ID)
                    if (selectedId) {
                        fetchBeneficiaryDetails(selectedId); // Fetch the details of the selected beneficiary
                    }
                });

    function fetchBeneficiaryDetails(beneficiaryId) {
        $.ajax({
            url: '/api/v1/beneficiaries/' + beneficiaryId,
            type: 'GET',
            success: function (response) {
            	console.log(response);
                if (response && response.data) { // Ensure `response.data` exists
                    var beneficiary = response.data;
                    $('#beneficiaryDeliveryOption').val(beneficiary.beneficiaryDeliveryOption?.trim() || '').change();
                    $('#payOutCountry').val(beneficiary.payOutCountry?.trim() || '').change();
                    $('#currencies').val(beneficiary.currencies?.trim() || '').change();
                    
                    if (beneficiary.beneficiaryBank) {
                        fetchBankById(beneficiary.beneficiaryBank, function (bankName) {
                            if (bankName) {
                                // Clear existing bank options and add the new bank
                                $('#beneficiaryBank').empty(); // Clear the dropdown
                                $('#beneficiaryBank').append(new Option(bankName, bankName)); // Add the bank name as the option
                                $('#beneficiaryBank').val(bankName).change(); // Set the bank name and trigger change
                            } else {
                                $('#beneficiaryBank').val('').change(); // Clear the field if no bank name found
                            }
                        });
                    }
                    if (beneficiary.beneficiaryBranch) {
                        // If beneficiaryBranch is available
                        $.ajax({
                            url: '/api/v1/banks/routing-code/' + beneficiary.beneficiaryBranch,
                            type: 'GET',
                            success: function (branchResponse) {
                                console.log(branchResponse);
                                if (branchResponse) {
                                    $('#bankBranches').empty(); // Clear existing options
                                    $('#bankBranches').append( new Option(branchResponse.branchName, branchResponse.routingCode)); // Add the branch name
                                    $('#bankBranches').val(branchResponse.routingCode).change(); // Set and trigger change
                                } else {
                                	$('#bankBranches').val('').change(); // Clear if no branch found
                                }
                            },
                            error: function () {
                                console.error("Error fetching branch details.");
                                $('#bankBranches').val('').change(); // Clear on error
                            }
                        });
                    } 
                   /*  else {
                        // Fallback action when beneficiaryBranch is not available
                        $.ajax({
                            url: '/api/v1/banks/default-branches', // Example fallback URL
                            type: 'GET',
                            success: function (defaultBranches) {
                                console.log(defaultBranches);
                                $('#bankBranches').empty(); // Clear existing options
                                $('#bankBranches').append('<option value="" disabled selected>Select Branch</option>');
                                $.each(defaultBranches, function (index, branch) {
                                    $('#bankBranches').append(new Option(branch.branchName, branch.routingCode));
                                });
                                $('#bankBranches').val('').change(); // Trigger change
                            },
                            error: function () {
                                console.error("Error fetching default branches.");
                                $('#bankBranches').val('').change(); // Clear on error
                            }
                        });
                    } */
	
                    $('#beneficiaryAccountType').val(beneficiary.beneficiaryAccountType?.trim() || '').change();
                    $('#accountNo').val(beneficiary.beneficiaryAccountNo?.trim() || '');
                    $('#confirmAccountNo').val(beneficiary.beneficiaryAccountNo?.trim() || '');
                    $('#beneficiaryIban').val(beneficiary.beneficiaryIban?.trim() || '');
                    $('#beneficiaryType').val(beneficiary.beneficiaryType?.trim() || '').change();
                    $('#beneficiaryNickname').val(beneficiary.beneficiaryNickname?.trim() || '');
                    $('#beneficiaryFirstName').val(beneficiary.beneficiaryFirstName?.trim() || '');
                    $('#beneficiaryMiddleName').val(beneficiary.beneficiaryMiddleName?.trim() || '');
                    $('#beneficiaryLastName').val(beneficiary.beneficiaryLastName?.trim() || '');
                    $('#beneficiaryAddress1').val(beneficiary.beneficiaryAddress1?.trim() || '');
                    $('#beneficiaryAddress2').val(beneficiary.beneficiaryAddress2?.trim() || '');
                    $('#beneficiaryCity').val(beneficiary.beneficiaryCity?.trim() || '');
                    $('#beneficiaryNationality').val(beneficiary.beneficiaryNationality?.trim() || '').change();
//                     $('#beneficiaryState').val(beneficiary.beneficiaryState?.trim() || '').change();
					if (beneficiary.beneficiaryNationality) {
    				$.ajax({
      				  url: '/api/enumEntities/dependent',
       				  type: 'GET',
                      data: { dependent: beneficiary.beneficiaryNationality },
                      success: function (states) {
                      // Clear existing state options and add default
                      $('#beneficiaryState').empty().append('<option value="" disabled selected>Select Beneficiary State</option>');

                     // Populate with new state options
                    $.each(states, function (index, state) {
                    $('#beneficiaryState').append(new Option(state.description, state.description));
                    });

                    // Set selected state value after populating options
                    $('#beneficiaryState').val(beneficiary.beneficiaryState?.trim() || '').change();
                    }, 
        			error: function () {
            		console.error("Error fetching states for nationality.");
        			}
    				});
					} else {
   					 $('#beneficiaryState').empty().append('<option value="" disabled selected>Select Beneficiary State</option>');
					}

                    $('#beneficiaryMobile').val(beneficiary.beneficiaryMobile?.trim() || '');
                    $('#beneficiaryDob').val(beneficiary.beneficiaryDob?.trim() || '');
                    $('#beneficiaryIdType').val(beneficiary.beneficiaryIdType?.trim() || '').change();
                    $('#beneficiaryIdNo').val(beneficiary.beneficiaryIdNo?.trim() || '');
                } else {
                    console.warn(response.message || "No details found for the selected beneficiary.");
                    alert("No details found for the selected beneficiary.");
                }
            },
            error: function (xhr, status, error) {
                console.error("Error fetching beneficiary details:", {
                    status: xhr.status,
                    statusText: xhr.statusText,
                    responseText: xhr.responseText
                });
                alert("An error occurred while fetching beneficiary details.");
            }
        });
    }

    function fetchBankById(beneficiaryBank, callback) {
        $.ajax({
            url: '/api/v1/banks/' + beneficiaryBank, // Ensure the correct endpoint format
            type: 'GET',
            success: function (response) {
                console.log(response);
                if (response && response.bankName) {
                    var bankName = response.bankName;
                    callback(bankName); // Pass the bank name to the callback
                } else {
                    console.warn("Bank name not found in response.");
                    callback(null); // Handle case where no bank name is found
                }
            },
            error: function (xhr, status, error) {
                console.error("Error fetching bank details:", {
                    status: xhr.status,
                    statusText: xhr.statusText,
                    responseText: xhr.responseText
                });
                callback(null);  // Return null on error
            }
        });
    }
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
       $('#beneficiaryBank').empty().append('<option value="" disabled selected>Select Bank</option>');
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

                   $('#beneficiaryBank').empty();


                   $('#beneficiaryBank').append('<option value="">Select  Bank</option>');


                   $.each(data, function(index, bank) {
                       $('#beneficiaryBank').append('<option value="' + bank.bankId + '">' + bank.bankName + '</option>');
                   });
               },
               error: function() {
                   console.error("Error fetching banks for the selected country.");
               }
           })
       }
   });


   $('#beneficiaryBank').on('change', function() {
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
                    sending_amount: $('#payInAmount').val(),
                    receiving_mode: $('#beneficiaryDeliveryOption').val(),
                    type: "SEND",
                    instrument: "REMITTANCE"
                };
                console.log(payload);

                // Show loader and disable button
                $('#loader').show();
                $('#quoteButton').prop('disabled', true);

                $.ajax({
                    url: '/api/v1/raas/quote',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(payload),
                    success: function(response) {
                        if (response.status === 200) {
                            var quoteId = response.quote_id;

                            $('#quoteId').val(response.quote_id); // Store the quote ID
                            $('#totalPayInAmount').val(response.total_payin_amount);
                            $('#rate').val(response.exchange_rate);
                            $('#commission').val(response.commission_amount);
                            $('#payoutAmount').val(response.receiving_amount);
                            $('#tax').val(response.tax_amount);
                            let remainingTime = 60;
                            $('#quoteMessage').html(`Quote Created Successfully , Expires in <span id="countdown" style="color: red; font-weight: bold;">${remainingTime}</span> seconds!`);
                            $('#quoteButton').hide();
                            $('#createTransactionSection').show();
                            const interval = setInterval(() => {
                            	remainingTime--;
                                $('#countdown').text(remainingTime);
                                if (remainingTime < 0) {
                                    clearInterval(interval);
                                    clearInterval(interval);
                                    $('#quoteMessage').text(""); // Clear message
                                    $('#quoteButton').show(); // Show quote button
                                    $('#createTransactionSection').hide();
                                }
                            }, 1000);
                            console.log(remainingTime);
                        }
                        else {
                            $('#quoteMessage').text('Failed to generate quote. Please try again.').css('color', 'red');
                             $('#createTransactionSection').hide(); // Ensure it remains hidden
                        }
                    },
                    error: function() {
                        $('#loader').hide();
                        $('#createTransactionSection').hide();
                        alert('Failed to generate quote. Please try again.');


                    },
                    complete: function() {
                        // Hide loader and enable button
                        $('#loader').hide();
                        $('#quoteButton').prop('disabled', false);
                    }
                });
            }

            function createTransaction() {
                $('#quoteMessage').hide();
                const payload = {
                    type: "SEND",
                    source_of_income: $('#sourceOfFund').val(),
                    purpose_of_txn: $('#transactionPurpose').val(),
                    instrument: "REMITTANCE",
                    message: "Agency transaction",
                    sender: {
                        customer_number: $('#ecrn').val()
                    },
                    receiver: {
                        mobile_number: $('#beneficiarymobile').val(),
                        first_name: $('#beneficiaryFirstName').val(),
                        last_name: $('#beneficiaryLastName').val(),
                        relation_code: "32",
                        nationality: $('#beneficiaryNationality').val(),
                        receiver_address: [
                            {
                                address_type: "PRESENT",
                                address_line: $('#beneficiaryAddress1').val(),
                                town_name: $('#beneficiaryCity').val(),
                                country_code: $('#beneficiaryNationality').val()
                            }
                        ],
                        bank_details: {
                            account_type_code: $('#beneficiaryAccountType').val(),
                            account_number: $('#confirmAccountNo').val(),
                            routing_code: $('#bankBranches').val()
                        }
                    },
                    transaction: {
                        quote_id: $('#quoteId').val()
                    }
                };

                // Show loader and disable button
                $('#loader').show();
                $('#transactionButton').prop('disabled', true);

                $.ajax({
                    url: '/api/v1/raas/create-transaction',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(payload),
                    success: function(response) {
                        if (response.status === 200) {
                            var transactionRefNumber = response.transaction_ref_number;
                            var state                = response.state;
                            var subState             = response.sub_state;

                            // Call confirm-transaction service
                            confirmTransaction(transactionRefNumber, state, subState);
                        }
                    },
                    error: function() {
                        $('#loader').hide();
                        alert('Failed to create transaction. Please try again.');
                    },
                    complete: function() {
                        $('#loader').hide();
                        $('#transactionButton').prop('disabled', false);
                    }
                });
            }

            // Function to call the confirm-transaction service
            function confirmTransaction(transactionRefNumber, state, subState) {
                const confirmPayload = {
                    transaction_ref_number: transactionRefNumber
                };

                $.ajax({
                    url: '/api/v1/raas/confirm-transaction',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(confirmPayload),
                    success: function(confirmResponse) {
                        const transactionData = {
                            ecrn: $('#ecrn').val(),
                            transactionReferenceNumber: transactionRefNumber,
                            paymentStatus: confirmResponse.status,
                            transactionState: confirmResponse.data ? confirmResponse.data.state : state,
                            transactionSubState: confirmResponse.data ? confirmResponse.data.sub_state : subState,

                            firstName: $('#firstName').val(),
                             middleName: $('#middleName').val(),
                             lastName: $('#lastName').val(),
                             dateOfBirth: $('#dateOfBirth').val(),
                             primaryMobileNumber: $('#primaryMobileNumber').val(),
                             emailId: $('#emailId').val(),
                             placeOfBirth: $('#placeOfBirth').val(),
                             address1: $('#address1').val(),
                             address2: $('#address2').val(),
                             city: $('#currentCity').val(),
                             state: $('#state').val(),
                             country: $('#country').val(),
                             countryOfResidence: $('#countryOfResidence').val(),
                             nationality: $('#nationality').val(),
                             customerCategory: $('#customerCategory').val(),
                             customerType: $('#customerType').val(),
                             idType: $('#idType').val(),
                             idNumber: $('#idNumber').val(),
                             issuedBy: $('#issuedBy').val(),
                             issuedOn: $('#issuedOn').val(),
                             dateOfExpiry: $('#dateOfExpiry').val(),
                             visaNumber: $('#visaNumber').val(),
                             visaExpiryDate: $('#visaExpiryDate').val(),
                             visaType: $('#visaType').val(),
                             issuedCountry: $('#issuedCountry').val(),

                             // Beneficiary Details
                             beneficiaryDeliveryOption: $('#beneficiaryDeliveryOption').val(),
                             payOutCountry: $('#payOutCountry').val(),
                             currencies: $('#currencies').val(),
                             beneficiaryBank: $('#beneficiaryBank').val(),
                             beneficiaryBranch: $('#bankBranches').val(),
                             beneficiaryIban: $('#beneficiaryIban').val(),
                             beneficiaryAccountType: $('#beneficiaryAccountType').val(),
                             beneficiaryAccountNo: $('#accountNo').val(),
                             beneficiaryType: $('#beneficiaryType').val(),
                             beneficiaryRelation: $('#beneficiaryRelation').val(),
                             beneficiaryNickname: $('#beneficiaryNickname').val(),
                             beneficiaryFirstName: $('#beneficiaryFirstName').val(),
                             beneficiaryMiddleName: $('#beneficiaryMiddleName').val(),
                             beneficiaryLastName: $('#beneficiaryLastName').val(),
                             beneficiaryAddress1: $('#beneficiaryAddress1').val(),
                             beneficiaryAddress2: $('#beneficiaryAddress2').val(),
                             beneficiaryCity: $('#beneficiaryCity').val(),
                             beneficiaryState: $('#beneficiaryState').val(),
                             beneficiaryMobile: $('#beneficiaryMobile').val(),
                             beneficiaryNationality: $('#beneficiaryNationality').val(),
                             beneficiaryDob: $('#beneficiaryDob').val(),
                             beneficiaryIdType: $('#beneficiaryIdType').val(),
                             beneficiaryIdNo: $('#beneficiaryIdNo').val(),
                             payInCurrency: $('#payInCurrency').val(),
                             sourceOfFund: $('#sourceOfFund').val(),
                             transactionPurpose: $('#transactionPurpose').val(),
                             valueDate: $('#valueDate').val(),
                             remarks: $('#remarks').val(),
                             payoutAmount: $('#payoutAmount').val(),
                             rate: $('#rate').val(),
                             commission: $('#commission').val(),
                             tax: $('#tax').val(),
                             payInAmount: $('#payInAmount').val(),
                             totalPayInAmount: $('#totalPayInAmount').val(),
                             paymentMode: $('#paymentMode').val()

                            // Include other fields as required
                        };

                        // Save transaction data
                        saveTransaction(transactionData);

                        if (confirmResponse.status === 'success') {
                            alert("Transaction confirmed successfully with Reference Number: " + transactionRefNumber);
                            window.location.href = "transfer-list";
                        }
                    },
                    error: function(errorResponse) {
                        const errorData = errorResponse.responseJSON || {};
                        const transactionData = {
                            ecrn: $('#ecrn').val(),
                            transactionReferenceNumber: transactionRefNumber,
                            paymentStatus: errorData.status,
                            transactionState: state,
                            transactionSubState: subState,

                            firstName: $('#firstName').val(),
                             middleName: $('#middleName').val(),
                             lastName: $('#lastName').val(),
                             dateOfBirth: $('#dateOfBirth').val(),
                             primaryMobileNumber: $('#primaryMobileNumber').val(),
                             emailId: $('#emailId').val(),
                             placeOfBirth: $('#placeOfBirth').val(),
                             address1: $('#address1').val(),
                             address2: $('#address2').val(),
                             city: $('#currentCity').val(),
                             state: $('#state').val(),
                             country: $('#country').val(),
                             countryOfResidence: $('#countryOfResidence').val(),
                             nationality: $('#nationality').val(),
                             customerCategory: $('#customerCategory').val(),
                             customerType: $('#customerType').val(),
                             idType: $('#idType').val(),
                             idNumber: $('#idNumber').val(),
                             issuedBy: $('#issuedBy').val(),
                             issuedOn: $('#issuedOn').val(),
                             dateOfExpiry: $('#dateOfExpiry').val(),
                             visaNumber: $('#visaNumber').val(),
                             visaExpiryDate: $('#visaExpiryDate').val(),
                             visaType: $('#visaType').val(),
                             issuedCountry: $('#issuedCountry').val(),

                             // Beneficiary Details
                             beneficiaryDeliveryOption: $('#beneficiaryDeliveryOption').val(),
                             payOutCountry: $('#payOutCountry').val(),
                             currencies: $('#currencies').val(),
                             beneficiaryBank: $('#beneficiaryBank').val(),
                             beneficiaryBranch: $('#bankBranches').val(),
                             beneficiaryIban: $('#beneficiaryIban').val(),
                             beneficiaryAccountType: $('#beneficiaryAccountType').val(),
                             beneficiaryAccountNo: $('#accountNo').val(),
                             beneficiaryType: $('#beneficiaryType').val(),
                             beneficiaryRelation: $('#beneficiaryRelation').val(),
                             beneficiaryNickname: $('#beneficiaryNickname').val(),
                             beneficiaryFirstName: $('#beneficiaryFirstName').val(),
                             beneficiaryMiddleName: $('#beneficiaryMiddleName').val(),
                             beneficiaryLastName: $('#beneficiaryLastName').val(),
                             beneficiaryAddress1: $('#beneficiaryAddress1').val(),
                             beneficiaryAddress2: $('#beneficiaryAddress2').val(),
                             beneficiaryCity: $('#beneficiaryCity').val(),
                             beneficiaryState: $('#beneficiaryState').val(),
                             beneficiaryMobile: $('#beneficiaryMobile').val(),
                             beneficiaryNationality: $('#beneficiaryNationality').val(),
                             beneficiaryDob: $('#beneficiaryDob').val(),
                             beneficiaryIdType: $('#beneficiaryIdType').val(),
                             beneficiaryIdNo: $('#beneficiaryIdNo').val(),
                             payInCurrency: $('#payInCurrency').val(),
                             sourceOfFund: $('#sourceOfFund').val(),
                             transactionPurpose: $('#transactionPurpose').val(),
                             valueDate: $('#valueDate').val(),
                             remarks: $('#remarks').val(),
                             payoutAmount: $('#payoutAmount').val(),
                             rate: $('#rate').val(),
                             commission: $('#commission').val(),
                             tax: $('#tax').val(),
                             payInAmount: $('#payInAmount').val(),
                             totalPayInAmount: $('#totalPayInAmount').val(),
                             paymentMode: $('#paymentMode').val()

                            // Include other fields as required
                        };

                        // Save transaction data
                        saveTransaction(transactionData);

                        alert('Transaction confirmation failed: ' + (errorData.message || 'Unknown error'));
                    }
                });
            }

            // Function to save the transaction data
            function saveTransaction(data) {
                $.ajax({
                    url: '/api/v1/transfer',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function(response) {
                        console.log('Transaction saved:', response);
                    },
                    error: function(error) {
                        console.error('Failed to save transaction:', error);
                        alert('Failed to save transaction to the database.');
                    }
                });
            }

            document.addEventListener('DOMContentLoaded', function() {
                console.log("Page Loaded");
                toggleFields();

                const idNumber = document.getElementById('idNumber');
                const submitButton = document.getElementById("quoteButton");
                const accountNumber = document.getElementById("accountNo");
                const confirmAccountNumber = document.getElementById("confirmAccountNo");
                const messageElement = document.getElementById("validationMessage");
                const errorMessage = document.getElementById("error-message");
                const amountField = document.getElementById("payInAmount");
                const residentTypeField = document.getElementById('residentTypeId');

                // Function to validate real-time account numbers
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
                        submitButton.disabled = true;
                    } else {
                        messageElement.textContent = "Account numbers match.";
                        messageElement.style.color = "green";
                        validateSubmitButton(); // Check other conditions before enabling
                    }
                }

                // Function to validate the amount field
                function validateAmount() {
                    const value = parseFloat(amountField.value);
                    errorMessage.style.display = "none";
                    if (value < 5 || value > 50000 || isNaN(value)) {
                        errorMessage.style.display = "block";
                        submitButton.disabled = true;
                    } else {
                        validateSubmitButton(); // Check other conditions before enabling
                    }
                }

                // Function to validate all fields for submit button enablement
                function validateSubmitButton() {
                    const idNumberValue = idNumber.value.trim();

                    // Check all conditions: idNumber, amount, and account numbers
                    const isIdNumberValid = idNumberValue !== "";
                    const isAmountValid = !isNaN(parseFloat(amountField.value)) && amountField.value >= 5 && amountField.value <= 50000;
                    const isAccountNumbersMatch = accountNumber.value.trim() === confirmAccountNumber.value.trim();

                    // Enable or disable the submit button based on conditions
                    submitButton.disabled = !(isIdNumberValid && isAmountValid && isAccountNumbersMatch);
                }

                // Add event listeners for validations
                accountNumber.addEventListener('input', validateRealTime);
                confirmAccountNumber.addEventListener('input', validateRealTime);
                residentTypeField.addEventListener('change', toggleFields);
                amountField.addEventListener('input', validateAmount);
                idNumber.addEventListener('input', validateSubmitButton); // Check idNumber on input

                // Initial validation on page load
                validateSubmitButton();

            });

$(document)
.ready(
		function() {
			$('#beneficiaryNationality')
			.on('change',function() {
					let dependent = $(this).val();
					if (dependent) {
						$.ajax({url :'/api/enumEntities/dependent',
							type : 'GET',data : {
									dependent : dependent
									},
									success : function(data) {

									$('#beneficiaryState').empty().append('<option value="" disabled selected>Select Beneficiary State</option>');
									$.each(data,function(index,enumValue) {
									$('#beneficiaryState').append('<option value="' + enumValue.description + '">'+ enumValue.description+ '</option>');
																	});
												},
												error : function() {
													console
															.error("Error fetching states for the selected Natinality.");
												}
											});
								} else {
									$('#beneficiaryState').empty().append('<option value="" disabled selected>Select Beneficiary State</option>');
								}
							});
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
														<td
															onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
															onmouseout="this.style.color='#303030'">${customer.ecrn}</td>
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
									<div class="row"
										style="justify-content: end; align-items: baseline; background: aliceblue;">
										<div class="col-12 col-md-2">
											<select data-select2-selector="icon" class="form-control p-2"
												id="searchBenficery">
												<option value="">Select Benficery</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<label class="form-label">Delivery Option</label><select
												data-select2-selector="icon" class="form-control"
												name="beneficiaryDeliveryOption"
												id="beneficiaryDeliveryOption">
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
												<option value="" disabled selected>Selected
													Currency</option>
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
													class="form-control" id="beneficiaryBank"
													name="beneficiaryBank" data-select2-selector="icon">
													<option value="" disabled selected>Select Bank</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Branch</label> <select
													class="form-control" id="bankBranches"
													name="beneficiaryBranch" data-select2-selector="icon">
													<option value="" disabled selected>Select Branch</option>
												</select>
												<!-- <input type="text" class="form-control" id="branch"
													name="branch" placeholder=""> -->
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Account Type</label> <select
													class="form-control" id="beneficiaryAccountType"
													name="beneficiaryAccountType" data-select2-selector="icon">
													<option value="1">Savings</option>
													<option value="2">Current</option>
												</select>
											</div>
										</div>

									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Account No.</label> <input
													type="password" class="form-control" id="accountNo"
													name="beneficiaryAccountNo" placeholder="Account No.">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Confirm Account No.</label> <input
													type="text" class="form-control" id="confirmAccountNo"
													name="beneficiaryConfirmAccountNo"
													placeholder="Confirm Account No.">
											</div>
											<span id="validationMessage"></span>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">IBAN</label> <input type="text"
													class="form-control" id="beneficiaryIban"
													name="beneficiaryIban" placeholder="IBAN">
											</div>
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
													type="text" class="form-control" id="beneficiaryFirstName"
													name="beneficiaryFirstName" placeholder="First Name">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Middle Name</label> <input
													type="text" class="form-control" id="beneficiaryMiddleName"
													name="beneficiaryMiddleName" placeholder="Middle Name">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Last Name</label> <input
													type="text" class="form-control" id="beneficiaryLastName"
													name="beneficiaryLastName" placeholder="Last Name">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Address 1</label> <input
													type="text" class="form-control" id="beneficiaryAddress1"
													name="beneficiaryAddress1" placeholder="Address">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary Address 2</label> <input
													type="text" class="form-control" id="beneficiaryAddress2"
													name="beneficiaryAddress2" placeholder="Address 2">
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
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Beneficiary State</label> <select
													name="beneficiaryState" id="beneficiaryState"
													class="form-control" data-select2-selector="icon">
													<option value="" disabled selected>Select
														Beneficiary State</option>
													<c:forEach var="states" items="${stateList}">
														<option value="${states.valueId}">${states.description}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Mobile</label> <input type="text"
													class="form-control" id="beneficiaryMobile"
													name="beneficiaryMobile" placeholder="Mobile">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">Date of Birth</label> <input
													type="date" class="form-control" id="beneficiaryDob"
													name="beneficiaryDob">
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">ID Type</label> <select
													data-select2-selector="icon" class="form-control"
													id="beneficiaryIdType" name="beneficiaryIdType">
													<option value="nationalId">National ID</option>
													<option value="passport">Passport</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="mb-1">
												<label class="form-label">ID No.</label> <input type="text"
													class="form-control" id="beneficiaryIdNo"
													name="beneficiaryIdNo" placeholder="ID No.">
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

												<label class="form-label">Pay In Currency<span
													class="text-danger">*</span></label> <select name="payInCurrency"
													id="payInCurrency" class="form-control"
													data-select2-selector="icon">
													<option value="" disabled selected>Select Pay In
														Currency</option>
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
													<option value="SAVG">Savings</option>
												</select>
											</div>
										</div>
										<div class="row">
											<%-- <div class="col-xl-4">
												<label class="form-label">Value Date<span
													class="text-danger">*</span></label> <input type="date"
													class="form-control" id="valueDate" name="valueDate">
											</div> --%>

											<div class="col-xl-4">
												<label class="form-label">PayIn Amount<span
													class="text-danger">*</span></label> <input type="number"
													class="form-control" placeholder="PayIn Amount"
													id="payInAmount" name="payInAmount" min="5" max="50000"
													required>
												<div id="error-message"
													style="color: red; display: none; font-size: 0.875rem; margin-top: 5px;">Amount
													must be between 5 and 50,000!</div>
											</div>

											<div class="col-xl-4">
												<label class="form-label">Payment Mode<span
													class="text-danger">*</span></label> <select class="form-control"
													id="paymentMode" name="paymentMode"
													data-select2-selector="icon">
													<option value="" disabled selected>Select Payment
														Mode</option>
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
												<label class="form-label">Rate<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Rate" id="rate"
													style="color: green;" name="rate" readonly>
											</div>
											<div class="col-xl-4">
												<label class="form-label">Payout Amount<span
													class="text-danger">*</span></label> <input type="text"
													class="form-control" placeholder="Payout Amount"
													style="color: green;" id="payoutAmount" name="payoutAmount"
													readonly>
											</div>

											<div class="col-xl-2">
												<label class="form-label">Commission</label> <input
													type="text" class="form-control" placeholder="Commission"
													style="color: green;" id="commission" name="commission"
													readonly>
											</div>

											<div class="col-xl-2">
												<label class="form-label">Tax</label> <input type="text"
													class="form-control" placeholder="Tax"
													style="color: green;" id="tax" name="tax" readonly>
											</div>


										</div>

										<div class="row">

											<!-- <div class="col-xl-2">
												<div>
													<label class="form-label">Tax</label> <input
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


											<div class="col-xl-4">
												<label class="form-label">Total Pay In Amount</label> <input
													type="text" class="form-control"
													placeholder="Total Pay In Amount" id="totalPayInAmount"
													style="color: green;" name="totalPayInAmount" readonly>
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
								class="btn btn-warning">Proceed</button>
							<div id="quoteMessage"
								style="font-weight: bold; color: #10181166;"></div>
							<input type="hidden" id="quoteId" />
						</div>
						<div class="mt-5 mb-5 text-center"
							style="justify-content: center;">
							<button type="button" onclick="createTransaction()"
								class="btn btn-primary" id="createTransactionSection"
								style="display: none; align-text: center; margin-left: -255px;">Submit</button>
							<div id="transactionMessage"
								style="color: green; font-weight: bold;"></div>
						</div>
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