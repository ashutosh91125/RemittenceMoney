//$(document).ready(function () {
//    $("tr[data-customer-ecrn]").on("click", function () {
//        var customerEcrn = $(this).data("customer-ecrn");
//        console.log("Fetching customer for ECRN:", customerEcrn);
//		$("#idDetailsSection").fadeIn();
//        $.ajax({
//            url: '/caas/api/v2/customer/' + customerEcrn,
//            type: 'GET',
//            success: function (response) {
//                console.log(response);
//                if (response) {
//                    if(response.amlScanStatus != 'Accepted' && response.customerStatus != 'ACTIVE'){
//                        alert("Customer is not valid for transaction!");
//                        return;
//                    }
//					$('#customerId').val(response.id || '');
//                    $('#ecrn').val(response.ecrn?.trim() || '');
//                    $('#firstName').val(response.firstName?.trim() || '');
//                    $('#middleName').val(response.middleName?.trim() || '');
//                    $('#lastName').val(response.lastName?.trim() || '');
//                    $('#currentCity').val(response.city?.trim() || '');
//                    $('#placeOfBirth').val(response.placeOfBirth?.trim() || '');
//                    $('#dateOfBirth').val(response.dateOfBirth?.trim() || '');
//                    $('#emailId').val(response.emailId?.trim() || '');
//                    $('#primaryMobileNumber').val(response.primaryMobileNumber?.trim() || '');
//                    $('#state').val(response.state?.trim() || '');
//                    $('#residentTypeId').val(response.residentTypeId || '');
//                    $('#visaType').val(response.visaType?.trim() || '');
//                    $('#idNumber').val(response.idNumber?.trim() || '');
////                     $('#idType').val(response.idType || '');
//                    $('#issuedBy').val(response.issuedBy?.trim() || '');
//                    $('#issuedOn').val(response.issuedOn?.trim() || '');
//                    $('#dateOfExpiry').val(response.dateOfExpiry?.trim() || '');
//                    $('#visaExpiryDate').val(response.visaExpiryDate?.trim() || '');
//                    $('#visaNumber').val(response.visaNumber?.trim() || '');
//
//					if (response.id) {
//					                        fetchIdDetails(response.id);
//					                    }
//                    // Map country code to country name
//                    if (response.country) {
//                        fetchEnumValue('country', response.country, function (country) {
//                            $('#country').val(country || response.country);
//                        });
//                        fetchEnumValue('country', response.countryOfResidence, function (country) {
//                            $('#countryOfResidence').val(country || response.countryOfResidence);
//                        });
//                        fetchEnumValue('country', response.nationality, function (country) {
//                            $('#nationality').val(country || response.nationality);
//                        });
//                        fetchEnumValue('country', response.issuedCountry, function (country) {
//                            $('#issuedCountry').val(country || response.issuedCountry);
//                        });
//                        fetchEnumValue('idTypes', response.idType, function (idTypes) {
//                            $('#idType').val(idTypes || response.idType);
//                        });
//                    }
//                    var mergedAddress1 = [
//                        response.buildingName?.trim(),
//                        response.streetName?.trim(),
//                        response.landmark?.trim(),
//                        response.district?.trim(),
//                        response.zip ? ', Zip - ' + response.zip.trim() : ''
//                    ].filter(Boolean).join(' ');
//                    $('#address1').val(mergedAddress1);
//                    var mergedAddress2 = [
//                        response.parBuildingName?.trim(),
//                        response.parStreetName?.trim(),
//                        response.parLandmark?.trim(),
//                        response.parDistrict?.trim(),
//                        response.parZip ? ', Zip - ' + response.parZip.trim() : ''
//                    ].filter(Boolean).join(' ');
//                    $('#address2').val(mergedAddress2);
//                    toggleFields();
//                    fetchBeneficiaries(customerEcrn);
//                } else {
//                    console.error("No customer data found for the provided ECRN.");
//                }
//            },
//            error: function (xhr, status, error) {
//                if (xhr.status === 404) {
//                    alert("Customer not found for the provided ECRN.");
//                } else {
//                    alert("An error occurred while fetching customer data.");
//                }
//            }
//        });
//
$(document).ready(function () {
    $("tr[data-customer-ecrn]").on("click", function () {
        var customerEcrn = $(this).data("customer-ecrn");
        console.log("Fetching customer for ECRN:", customerEcrn);
		$("#idDetailsSection").fadeIn();
        $.ajax({
            url: '/caas/api/v2/customer/' + customerEcrn,
            type: 'GET',
            success: function (response) {
                console.log(response);
                if (response) {
                    if(response.amlScanStatus != 'Accepted' && response.customerStatus != 'ACTIVE'){
                        alert("Customer is not valid for transaction!");
                        return;
                    }
					$('#customerId').val(response.id || '');
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
					if (response.id) {
										                        fetchIdDetails(response.id);
										                    }
					if (Array.isArray(response.idDetails) && response.idDetails.length > 0){
						var firstObject = response.idDetails[0];
						console.log(firstObject);
						if(firstObject.activeStatus === true){
							if(firstObject.id || firstObject.idType || firstObject.idNumber || firstObject.visaNumber || firstObject.visaExpiryDate || firstObject.nameAsPerId
								|| firstObject.issuedCountry || firstObject.issuedBy || firstObject.issuedAt || firstObject.issuedOn || firstObject.activeStatus || firstObject.visaType){
									$('#visaType').val(firstObject.visaType);
									$('#idNumber').val(firstObject.idNumber);
									$('#idType').val(firstObject.idType);
									$('#issuedBy').val(firstObject.issuedBy);
									$('#issuedOn').val(firstObject.issuedOn);
									$('#dateOfExpiry').val(firstObject.dateOfExpiry);
									$('#visaExpiryDate').val(firstObject.visaExpiryDate);
									$('#visaNumber').val(firstObject.visaNumber);
									$('#issuedCountry').val(firstObject.issuedCountry);

								}

						}else {
							    console.log("No valid idDetails found.");
							    $('#visaType').val('');
							    $('#idNumber').val('');
							    $('#idType').val('');
							    $('#issuedBy').val('');
							    $('#issuedOn').val('');
							    $('#dateOfExpiry').val('');
							    $('#visaExpiryDate').val('');
							    $('#visaNumber').val('');
							    $('#issuedCountry').val('');
							    $('#visaNumber').val('');
							}

					}

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
					fetchBeneficiaries(customerEcrn);
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

		function fetchIdDetails(customerId) {
		    $.ajax({
		        url: '/caas/api/v2/customer/id-detail/' + customerId,
		        type: 'GET',
		        success: function (idDetailsList) {
		            console.log("Fetched ID Details:", idDetailsList);
		            var idDetailsTable = $("#search-result2 tbody");
		            idDetailsTable.empty();

		            if (idDetailsList.length > 0) {
		                idDetailsList.forEach(function (idDetail) {
							fetchEnumValue("idTypes", idDetail.idType, function (fullIdType) {
							                        var idTypeDisplay = fullIdType || idDetail.idType || '';
		                    fetchEnumValue("country", idDetail.issuedCountry, function (fullCountryName) {
		                        var issuedCountry = fullCountryName || idDetail.issuedCountry || '';
								var activeStatusDisplay = idDetail.activeStatus ? 'Active' : 'Inactive';
		                        var row = `<tr>
									<td class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
									onmouseout="this.style.color='#303030'">${idDetail.idNumber || ''}</td>
		                            <td>${idTypeDisplay}</td>
		                            <td>${idDetail.issuedBy || ''}</td>
									<td>${idDetail.issuedOn || ''}</td>
		                            <td>${idDetail.dateOfExpiry || ''}</td>
		                             <td>${issuedCountry}</td>
									<td>${activeStatusDisplay}</td>
		                            <td class="text-end" onclick="openPopup('${idDetail.idNumber}', ${idDetail.activeStatus})">
									<i class="bi bi-pencil-square"></i>
		                            </td>
		                        </tr>`;
		                        idDetailsTable.append(row);
		                    });
		                });
						});
		            } else {
		                idDetailsTable.append('<tr><td colspan="10" class="text-center">No ID details found</td></tr>');
		            }
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching ID details:", error);
		            alert("Failed to retrieve ID details.");
		        }
		    });
		}

     // Fetch Beneficiaries Function
       /* function fetchBeneficiaries(ecrn) {
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
        }*/
		function fetchBeneficiaries(ecrn) {
		    $.ajax({
		        url: '/api/v1/beneficiaries/get-list-by-ecrn/' + ecrn,
		        type: 'GET',
		        success: function (response) {
		            if (response.success && response.data?.length > 0) {
		                console.log("Beneficiaries fetched successfully:", response.data);
		                let tableBody = $('#search-result1 tbody');
		                tableBody.empty();


		                response.data.forEach(function (beneficiary) {
		                    $.ajax({
		                        url: '/api/v1/banks/' + beneficiary.beneficiaryBank,
		                        type: 'GET',
		                        success: function (bankResponse) {
		                            let bankName = bankResponse?.bankName || "Unknown Bank";
									var status = bankResponse.status ? 'Active' : 'Inactive';
									console.log(bankName,"search-result1");
									let row = `<tr data-beneficiary-id="${beneficiary.id}">
									                                <td class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
																		onmouseout="this.style.color='#303030'">${beneficiary.fullName}</td>
									                                <td>${bankName}</td>
									                                <td>${beneficiary.beneficiaryAccountNo}</td>
																	<td>${status}</td>
																	<td class="text-end" onclick="openPopupForBeneficiary('${beneficiary.id}', ${beneficiary.status})">
																	<i class="bi bi-pencil-square"></i>
																	</td>
									                            </tr>`;
		                            tableBody.append(row);
		                        },
		                        error: function () {
		                            console.error("Error fetching bank name for bank ID:", beneficiary.beneficiaryBank);
									let row = `<tr data-beneficiary-id="${beneficiary.id}">
									                               <td class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
																	onmouseout="this.style.color='#303030'" >${beneficiary.fullName}</td>
									                               <td>Unknown Bank</td>
									                               <td>${beneficiary.beneficiaryAccountNo}</td>
																   <td>${status}</td>
									                           </tr>`;
		                            tableBody.append(row);
		                        }
		                    });
		                });
						tableBody.on('click', '.clickable', function () {
						                    let beneficiaryId = $(this).closest('tr').data('beneficiary-id');
						                    if (beneficiaryId) {
						                        fetchBeneficiaryDetails(beneficiaryId);
						                    }
						                });
		            } else {
		                console.warn(response.message || "No beneficiaries found for the provided ECRN.");
		                let tableBody = $('#search-result1 tbody');
		                tableBody.empty(); // Clear any existing rows
		                tableBody.append('<tr><td colspan="3">No beneficiaries found</td></tr>');
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
                    var selectedId = $(this).val();
                    if (selectedId) {
                        fetchBeneficiaryDetails(selectedId); 
                    }
                });

    function fetchBeneficiaryDetails(beneficiaryId) {
        $.ajax({
            url: '/api/v1/beneficiaries/' + beneficiaryId,
            type: 'GET',
            success: function (response) {
            	console.log(response);
                if (response && response.data) { 
                    var beneficiary = response.data;
                    $('#beneficiaryDeliveryOption').val(beneficiary.beneficiaryDeliveryOption?.trim() || '').change();
                    $('#payOutCountry').val(beneficiary.payOutCountry?.trim() || '').change();
                    $('#currencies').val(beneficiary.currencies?.trim() || '').change();
					if (beneficiary.beneficiaryBank && beneficiary.beneficiaryBranch) {
					    // Parallel AJAX calls for bank and branch details
					    const bankRequest = $.ajax({
					        url: '/api/v1/banks/' + beneficiary.beneficiaryBank,
					        type: 'GET',
					    });

					    const branchRequest = $.ajax({
					        url: '/api/v1/banks/routing-code/' + beneficiary.beneficiaryBranch,
					        type: 'GET',
					    });

					    // Wait for both requests to complete
						$.when(bankRequest, branchRequest)
						    .done(function (bankResponse, branchResponse) {
						        // Log the responses for debugging
						        console.log("Bank Response:", bankResponse[0]);
						        console.log("Branch Response:", branchResponse[0]);

						        // Handle bank response
						        if (bankResponse[0]) {
						            $('#beneficiaryBank').empty(); // Clear any existing options
						            $('#beneficiaryBank').append(
						                new Option(bankResponse[0].bankName, bankResponse[0].bankId) // Use bankName as display and bankId as value
						            );
						            $('#beneficiaryBank').val(bankResponse[0].bankId).change(); // Set the selected value
						        } else {
						            $('#beneficiaryBank').empty(); // Clear dropdown if no bank data
						            $('#beneficiaryBank').append(new Option('Select Bank', '')).change(); // Add default option
						        }

						        // Handle branch response
						        if (branchResponse[0]) {
						            $('#bankBranches').empty(); // Clear any existing options
						            $('#bankBranches').append(
						                new Option(branchResponse[0].branchName, branchResponse[0].routingCode) // Use branchName as display and routingCode as value
						            );
						            $('#bankBranches').val(branchResponse[0].routingCode).change(); // Set the selected value
						        } else {
						            $('#bankBranches').empty(); // Clear dropdown if no branch data
						            $('#bankBranches').append(new Option('Select Branch', '')).change(); // Add default option
						        }
						    })
						    .fail(function () {
						        console.error('Error fetching bank or branch details.');
						        $('#beneficiaryBank').empty();
						        $('#beneficiaryBank').append(new Option('Select Bank', '')).change();
						        $('#bankBranches').empty();
						        $('#bankBranches').append(new Option('Select Branch', '')).change();
						    });

					} else {
					    // Fetch individually if only one is present
					    if (beneficiary.beneficiaryBank) {
					        fetchBankDetails(beneficiary.beneficiaryBank);
					    }
					    if (beneficiary.beneficiaryBranch) {
					        fetchBranchDetails(beneficiary.beneficiaryBranch);
					    }
					}
                    $('#beneficiaryAccountType').val(beneficiary.beneficiaryAccountType?.trim() || '').change();
                    $('#accountNo').val(beneficiary.beneficiaryAccountNo?.trim() || '');
                    $('#confirmAccountNo').val(beneficiary.beneficiaryAccountNo?.trim() || '');
                    $('#beneficiaryAccountName').val(beneficiary.beneficiaryAccountName?.trim() || '');
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

	function fetchBankDetails(bankId) {
	    $.ajax({
	        url: '/api/v1/banks/' + bankId,
	        type: 'GET',
	        success: function (bankResponse) {
	            if (bankResponse) {
	                $('#beneficiaryBank').empty();
	                $('#beneficiaryBank').append(
	                    new Option(bankResponse.bankName, bankResponse.bankId)
	                );
	                $('#beneficiaryBank').val(bankResponse.bankId).change();
	            } else {
	                $('#beneficiaryBank').val('').change();
	            }
	        },
	        error: function () {
	            console.error('Error fetching bank details.');
	            $('#beneficiaryBank').val('').change();
	        },
	    });
	}

	function fetchBranchDetails(branch) {
	    $.ajax({
	        url: '/api/v1/banks/routing-code/' + branch,
	        type: 'GET',
	        success: function (branchResponse) {
				console.log("branchResponse"+branchResponse);
	            if (branchResponse) {
	                $('#bankBranches').empty();
	                $('#bankBranches').append(
	                    new Option(branchResponse.branchName, branchResponse.routingCode)
	                );
	                $('#bankBranches').val(branchResponse.routingCode).change();
	            } else {
	                $('#bankBranches').val('').change();
	            }
	        },
	        error: function () {
	            console.error('Error fetching branch details.');
	            $('#bankBranches').val('').change();
	        },
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
   const currencySelect = $('#currencies');
   $('#payOutCountry').on('change', function() {
       let dependent = $(this).val();


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

                   const currenciesDropdown = $('#currencies');

                   currenciesDropdown.empty().append('<option value="" disabled selected>Select Currency</option>');
                   $.each(data, function (index, enumValue) {
                       currenciesDropdown.append('<option value="' + enumValue.valueId + '">' + enumValue.description + '</option>');
                   });

                   // Automatically select the first currency (if any)
                   if (data.length > 0) {
                       const firstCurrency = data[0].valueId;
                       currenciesDropdown.val(firstCurrency).trigger('change'); // Trigger change event for Select2
                   }
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
       $('#bankBranches').empty().append('<option value="" disabled selected>Select Branch</option>');

       if (bankId) {
		$.ajax({
		    url: '/api/v1/banks/branches/by-bank/' + bankId,
		    type: 'GET',
		    success: function(data) {
		        if (!data || data.length === 0) {
		            $('#bankBranches').append(new Option('No Branches Available', '')).change();
		            console.warn("No branches found for the selected bank.");
		            return;
		        }
		        $.each(data, function(index, branch) {
		            $('#bankBranches').append(new Option(branch.branchName, branch.routingCode));
		        });
		    },
		    error: function() {
		        console.error("Error fetching branches for the selected bank.");
		    }
		});

       }
   });

  // Listen to Select2's change event
  currencySelect.on('select2:select change', function (e) {
      const selectedValue = $(this).val(); // Get the selected value
      //const selectedText = $(this).find("option:selected").text(); // Get the selected text
      $('#selectedPayoutCurrency').text(selectedValue ? '(' + selectedValue +')' : 'None'); // Update label
  });

});
// Function to call the quote service
function getQuote() {
    // Get the values from the form
    const sendingCountryCode = $('#userCountry').val();
    const sendingCurrencyCode = $('#payInCurrency').val();
    const receivingCountryCode = $('#payOutCountry').val();
    const receivingCurrencyCode = $('#currencies').val();
    const sendingAmount = $('#payInAmount').val();
    const receivingMode = $('#beneficiaryDeliveryOption').val();

    const beneficiaryBank = $('#beneficiaryBank').val();
    const bankBranches = $('#bankBranches').val();
    const beneficiaryAccountType = $('#beneficiaryAccountType').val();
    const beneficiaryFirstName = $('#beneficiaryFirstName').val();
    const beneficiaryLastName = $('#beneficiaryLastName').val();
    const beneficiaryAddress1 = $('#beneficiaryAddress1').val();
    const beneficiaryCity = $('#beneficiaryCity').val();
    const beneficiaryNationality = $('#beneficiaryNationality').val();



    const sourceOfFund = $('#sourceOfFund').val();
    const transactionPurpose = $('#transactionPurpose').val();
    const paymentMode = $('#paymentMode').val();

    // Check if any required field is empty
    let isValid = true;

    if (!sendingCurrencyCode) {
        $('#payInCurrencyError').text('PayIn Currency is required.');
        isValid = false;
    } else {
        $('#payInCurrencyError').text('');
    }

    if (!receivingCountryCode) {
        $('#payOutCountryError').text('Payout country is required.');
        isValid = false;
    } else {
        $('#payOutCountryError').text('');
    }

    if (!receivingCurrencyCode) {
        $('#currenciesError').text('Currency is required.');
        isValid = false;
    } else {
        $('#currenciesError').text('');
    }

    if (!sendingAmount) {
        $('#payInAmountError').text('Sending amount is required.');
        isValid = false;
    } else {
        $('#payInAmountError').text('');
    }

    if (!receivingMode) {
        $('#beneficiaryDeliveryOptionError').text('Delivery option is required.');
        isValid = false;
    } else {
        $('#beneficiaryDeliveryOptionError').text('');
    }
    if (!beneficiaryBank) {
        $('#beneficiaryBankError').text('Bank is required.');
        isValid = false;
    } else {
        $('#beneficiaryBankError').text('');
    }
    if (!bankBranches) {
        $('#bankBranchesError').text('Branch is required.');
        isValid = false;
    } else {
        $('#bankBranchesError').text('');
    }
    if (!beneficiaryAccountType) {
        $('#beneficiaryAccountTypeError').text('Account Type is required.');
        isValid = false;
    } else {
        $('#beneficiaryAccountTypeError').text('');
    }
    if (!beneficiaryFirstName) {
        $('#beneficiaryFirstNameError').text('First Name is required.');
        isValid = false;
    } else {
        $('#beneficiaryFirstNameError').text('');
    }
    if (!beneficiaryLastName) {
        $('#beneficiaryLastNameError').text('Last Name is required.');
        isValid = false;
    } else {
        $('#beneficiaryLastNameError').text('');
    }

    if (!beneficiaryAddress1) {
        $('#beneficiaryAddress1Error').text('Beneficiary Address1 is required.');
        isValid = false;
    } else {
        $('#beneficiaryAddress1Error').text('');
    }

    if (!beneficiaryCity) {
        $('#beneficiaryCityError').text('Beneficiary City is required.');
        isValid = false;
    } else {
        $('#beneficiaryCityError').text('');
    }

    if (!beneficiaryNationality) {
        $('#beneficiaryNationalityError').text('Nationality is required.');
        isValid = false;
    } else {
        $('#beneficiaryNationalityError').text('');
    }

    if (!paymentMode) {
        $('#paymentModeError').text('Payment Mode is required.');
        isValid = false;
    } else {
        $('#paymentModeError').text('');
    }
    if (!transactionPurpose) {
        $('#transactionPurposeError').text('Transaction Purpose is required.');
        isValid = false;
    } else {
        $('#transactionPurposeError').text('');
    }
    if (!sourceOfFund) {
        $('#sourceOfFundError').text('Source Of Fund is required.');
        isValid = false;
    } else {
        $('#sourceOfFundError').text('');
    }

    // If any field is invalid, return early and stop the quote generation
    if (!isValid) {
        document.getElementById("validationError").style.display = "block";
        return; // Exit the function early if validation fails
    } else {
        document.getElementById("validationError").style.display = "none";
    }

    const payload = {
        sending_country_code: sendingCountryCode,
        sending_currency_code: sendingCurrencyCode,
        receiving_country_code: receivingCountryCode,
        receiving_currency_code: receivingCurrencyCode,
        sending_amount: sendingAmount,
        receiving_mode: receivingMode,
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
                $('#quoteMessage').html(`Quote Created Successfully, Expires in <span id="countdown" style="color: red; font-weight: bold;">${remainingTime}</span> seconds!`);
                $('#quoteButton').hide();
                $('#createTransactionSection').show();
                const interval = setInterval(() => {
                    remainingTime--;
                    $('#countdown').text(remainingTime);
                    if (remainingTime < 0) {
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
                        quote_id: $('#quoteId').val(),
                         ordering_institution: {
                             name: "abc",
                             institution_address: {
                                 country_code: "SG",
                                 address_line: "ZAYED TOWER",
                                 address_type: "PRESENT",
                                 town_name: "HAWALLI",
                                 post_code: "123456",
                                 building_number: "AB1234"
                             }
                         }
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
                    error: function(jqXHR) {
                        $('#loader').hide();
                        console.log(jqXHR); // Debugging log

                        let errorMessage = 'Failed to create transaction. Please try again.';

                        try {
                            const response = JSON.parse(jqXHR.responseText);
                            if (response.details) {
                                errorMessage = Object.values(response.details)[0]; // Extract the first error message
                            } else if (response.message) {
                                errorMessage = response.message; // Use the main error message
                            }
                        } catch (e) {
                            console.error('Error parsing response:', e);
                        }

                        alert(errorMessage);
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
                             beneficiaryAccountName: $('#beneficiaryAccountName').val(),
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
                    error: function(jqXHR) {
                        $('#loader').hide();
                        console.log(jqXHR); // Debugging log

                        let errorMessage = 'Transaction confirmation failed. Please try again.';
                        try {
                            const response = JSON.parse(jqXHR.responseText);
                            if (response.details) {
                                errorMessage = Object.values(response.details)[0]; // Extract the first error message
                            } else if (response.message) {
                                errorMessage = response.message; // Use the main error message
                            }
                        } catch (e) {
                            console.error('Error parsing response:', e);
                        }
                        const transactionData = {
                            ecrn: $('#ecrn').val(),
                            transactionReferenceNumber: transactionRefNumber,
                            paymentStatus: 'failed',
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
                             beneficiaryAccountName: $('#beneficiaryAccountName').val(),
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

                        alert(errorMessage);
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

/*            document.addEventListener('DOMContentLoaded', function() {
                console.log("Page Loaded");
                toggleFields();

                const idNumber = document.getElementById('idNumber');
                const submitButton = document.getElementById("quoteButton");
                const accountNumber = document.getElementById("accountNo");
                const confirmAccountNumber = document.getElementById("confirmAccountNo");
                const messageElement = document.getElementById("validationMessage");
                const dailyCreditLimit = parseFloat("${dailyCreditLimit}");
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
//                        submitButton.disabled = true;
                    } else {
                        messageElement.textContent = "Account numbers match.";
                        messageElement.style.color = "green";
//                        validateSubmitButton(); // Check other conditions before enabling
                    }
                }

                // Function to validate the amount field
                function validateAmount() {
                    const payInAmount = parseFloat(amountField.value);
                    errorMessage.style.display = "none";
                    if (!isNaN(payInAmount) && payInAmount > dailyCreditLimit) {
                        errorMessage.style.display = "block";
                        submitButton.disabled = true;
                    } else {
                        errorMessage.style.display = "none";
//                        validateSubmitButton(); // Check other conditions before enabling
                    }
                }

                // Function to validate all fields for submit button enablement
//                function validateSubmitButton() {
//                    const idNumberValue = idNumber.value.trim();
//
//                    // Check all conditions: idNumber, amount, and account numbers
//                    const isIdNumberValid = idNumberValue !== "";
//                    const isAmountValid = !isNaN(parseFloat(amountField.value)) && amountField.value >= 5 && amountField.value <= 50000;
//                    const isAccountNumbersMatch = accountNumber.value.trim() === confirmAccountNumber.value.trim();
//
//                    // Enable or disable the submit button based on conditions
//                    submitButton.disabled = !(isIdNumberValid && isAmountValid && isAccountNumbersMatch);
//                }

                // Add event listeners for validations
                accountNumber.addEventListener('input', validateRealTime);
                confirmAccountNumber.addEventListener('input', validateRealTime);
                residentTypeField.addEventListener('change', toggleFields);
                amountField.addEventListener('input', validateAmount);
                idNumber.addEventListener('input', validateSubmitButton); // Check idNumber on input

                // Initial validation on page load
//                validateSubmitButton();

            });*/

			window.onload = function () {
                    const payInCurrencySelect = document.getElementById('payInCurrency');
                    const selectedValueId = payInCurrencySelect.options[payInCurrencySelect.selectedIndex]?.value || '';
                    document.getElementById('selectedPayInCurrency').textContent = '(' + selectedValueId + ')';
            };
            $(document).ready(function () {

                    const currencySelect = $('#currencies');

                    if (!currencySelect.hasClass('select2-hidden-accessible')) {
                        currencySelect.select2();
                    }

                    currencySelect.on('select2:select', function (e) {
                        console.log('Dropdown changed (Select2)!');
                        const selectedValue = e.params.data.id;
                        console.log('Selected value (Select2):', selectedValue);
                        $('#selectedPayoutCurrency').text(selectedValue ? '(' + selectedValue +')' : 'None');
                    });
                });
document.addEventListener('DOMContentLoaded', function () {
    console.log("Page Loaded");
    const accountNumber = document.getElementById("accountNo");
    const confirmAccountNumber = document.getElementById("confirmAccountNo");
    const messageElement = document.getElementById("validationMessage");
    const accountNoError = document.getElementById("accountNoError");
    const submitButton = document.getElementById("quoteButton");
    const residentTypeField = document.getElementById('residentTypeId');
    const dailyCreditLimit = document.getElementById('dailyCreditLimit');
    const dailyCredit = document.getElementById('dailyCredit');
    const perDayLimit = document.getElementById('perDayLimit');
    const perMonthLimit = document.getElementById('perMonthLimit');

    const payInAmount = document.getElementById('payInAmount');
    const errorMessage = document.getElementById('error-message');
	const MAX_LENGTH = 34;
    function validateAccountNumbers() {
        const accountNumberValue = accountNumber.value.trim();
        const confirmAccountNumberValue = confirmAccountNumber.value.trim();

        accountNoError.textContent = "";
        messageElement.textContent = "";

		if (accountNumberValue.length > MAX_LENGTH) {
		     messageElement.textContent = `Maximum allowed characters reached for Account Number.`;
		     messageElement.style.color = "red";
		     accountNumber.value = accountNumberValue.slice(0, MAX_LENGTH); // Truncate input
		     return;
		 }

		if (confirmAccountNumberValue.length > MAX_LENGTH) {
		     messageElement.textContent = `Maximum allowed characters reached for Confirm Account Number.`;
		     messageElement.style.color = "red";
		     confirmAccountNumber.value = confirmAccountNumberValue.slice(0, MAX_LENGTH); // Truncate input
		     return;
		 }
        if (accountNumberValue === "" || confirmAccountNumberValue === "") {
            accountNoError.textContent = "Account number is required.";
            messageElement.textContent = "Confirm account number is required.";
            messageElement.style.color = "red";
        } else if (accountNumberValue !== confirmAccountNumberValue) {
            messageElement.textContent = "Account numbers do not match!";
            messageElement.style.color = "red";
        } else {
            messageElement.textContent = "Account numbers match.";
            messageElement.style.color = "green";
        }
    }

    function validatePayInAmount() {
        const payInAmountValue = parseFloat(payInAmount.value.trim());
        const creditLimit = parseFloat(dailyCreditLimit.value.trim());
        const dailyCreditValue = parseFloat(dailyCredit.value.trim());
        const perDay = parseFloat(perDayLimit.value.trim());
        const perMonth = parseFloat(perMonthLimit.value.trim());

        errorMessage.style.display = "none"; // Reset the error message

        if (payInAmountValue > creditLimit) {
            errorMessage.textContent = `PayIn Amount cannot exceed per transaction limit of ${creditLimit}.`;
            errorMessage.style.display = "block";
            return; // Stop further checks
        } else if (payInAmountValue > dailyCreditValue) {
            errorMessage.textContent = `PayIn Amount cannot exceed daily credit limit of ${dailyCreditValue}.`;
            errorMessage.style.display = "block";
            return; // Stop further checks
        } else if (payInAmountValue > perDay) {
            errorMessage.textContent = `PayIn Amount cannot exceed per day limit of ${perDay}.`;
            errorMessage.style.display = "block";
            return; // Stop further checks
        } else if (payInAmountValue > perMonth) {
            errorMessage.textContent = `PayIn Amount cannot exceed per month limit of ${perMonth}.`;
            errorMessage.style.display = "block";
            return; // Stop further checks
        } else {
            errorMessage.style.display = "none"; // No error
        }
    }

    function validateForm(event) {
        const accountNumberValue = accountNumber.value.trim();
        const confirmAccountNumberValue = confirmAccountNumber.value.trim();

        let isValid = true;

        // Check if account numbers are empty
        if (accountNumberValue === "" || confirmAccountNumberValue === "") {
            isValid = false;
            accountNoError.textContent = "Account number is required.";
            messageElement.textContent = "Confirm account number is required.";
            messageElement.style.color = "red";
        }

        // Check if account numbers match
        if (accountNumberValue !== confirmAccountNumberValue) {
            isValid = false;
            messageElement.textContent = "Account numbers do not match!";
            messageElement.style.color = "red";
        }

        // Prevent form submission if validation fails
        if (!isValid) {
            event.preventDefault();
        }
    }

    residentTypeField.addEventListener('change', toggleFields);
    accountNumber.addEventListener("input", validateAccountNumbers);
    confirmAccountNumber.addEventListener("input", validateAccountNumbers);
    payInAmount.addEventListener("input", validatePayInAmount);
    submitButton.addEventListener("click", validateForm);
});

			$(document).ready(function () {
				    $('#beneficiaryNationality').on('change', function () {
				        let dependent = $(this).val();
				        if (dependent) {
				            $.ajax({
				                url: '/api/enumEntities/dependent',
				                type: 'GET',
				                data: {
				                    dependent: dependent
				                },
				                success: function (data) {
				                    $('#beneficiaryState')
				                        .empty()
				                        .append('<option value="" disabled selected>Select Beneficiary State</option>');

				                    $.each(data, function (index, enumValue) {
				                        $('#beneficiaryState').append(
				                            '<option value="' + enumValue.description + '">' + enumValue.description + '</option>'
				                        );
				                    });
				                },
				                error: function () {
				                    console.error("Error fetching states for the selected Nationality.");
				                }
				            });
				        } else {
				            $('#beneficiaryState')
				                .empty()
				                .append('<option value="" disabled selected>Select Beneficiary State</option>');
				        }
				    });
				});


function showSelectBeneficiaryDiv() {
	const beneficiaryDiv = document.getElementById("selectBeneficiaryDiv");
	if (beneficiaryDiv.style.display === "none" || beneficiaryDiv.style.display === "") {
			beneficiaryDiv.style.display = "block";
			} else {
				beneficiaryDiv.style.display = "none";
			}
		}
		function validateLengthWithMaxMessage(inputId, maxLength, errorId) {
		    const input = document.getElementById(inputId);
		    const error = document.getElementById(errorId);

		    if (input.value.length > maxLength) {
		        input.value = input.value.slice(0, maxLength);
		        error.textContent = `Maximum allowed characters  reached.`;
		    } else {
		        error.textContent = '';
		    }
		}

			function openPopup(idNumber, activeStatus) {
			    const activeButton = document.querySelector('#openPopup .btn-primary');
			    const deactiveButton = document.querySelector('#openPopup .btn-danger');
			    const container = document.querySelector('.nxl-container');
	
	
			    container.classList.add('blur-background');
	
	
			    const activeLink = document.querySelector('#activeLink');
			    const deactiveLink = document.querySelector('#deactiveLink');
	
			    if (activeStatus) {
			        activeButton.setAttribute('disabled', true);
			        deactiveButton.removeAttribute('disabled');
			    } else {
			        activeButton.removeAttribute('disabled');
			        deactiveButton.setAttribute('disabled', true);
			    }
	
			    activeLink.setAttribute('href', `/caas/api/v2/iddetail/get-by-idnumber/${idNumber}?activeStatus=true`);
			    deactiveLink.setAttribute('href', `/caas/api/v2/iddetail/get-by-idnumber/${idNumber}?activeStatus=false`);
	
	
			    $('#openPopup').show();
			}
			function openPopupForBeneficiary(beneficiaryId, activeStatus) {
			   
			    const activeButton = document.querySelector('#activeLinkBeneficiary');
			    const deactiveButton = document.querySelector('#deactiveLinkBeneficiary');
			    const container = document.querySelector('.nxl-container');

			  
			    container.classList.add('blur-background');

			    
			    activeButton.href = `/api/v1/beneficiaries/status/${beneficiaryId}?status=true`;
			    deactiveButton.href = `/api/v1/beneficiaries/status/${beneficiaryId}?status=false`;

			    if (activeStatus) {
			        activeButton.setAttribute('disabled', true);
			        deactiveButton.removeAttribute('disabled');
			    } else {
			        activeButton.removeAttribute('disabled');
			        deactiveButton.setAttribute('disabled', true);
			    }
			    $('#openPopupForBeneficiary').modal('show');
			}
			function closePopup() {
			    const container = document.querySelector('.nxl-container');
			    container.classList.remove('blur-background');
			    $('#openPopup').hide();
				$('#openPopupForBeneficiary').modal('hide');
					
			}