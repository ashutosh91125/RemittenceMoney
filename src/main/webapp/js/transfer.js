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
					if (response.amlScanStatus !== 'Accepted' || response.customerStatus !== 'ACTIVE') {
					           alert("Customer is not valid for transaction!");
					           return;
					       }
					if (Array.isArray(response.idDetails) && response.idDetails.length > 0) {
					                       var activeIdDetail = response.idDetails.find(function(detail) {
					                           return detail.activeStatus === true;
					                       });
					                       
					                       if (!activeIdDetail) {
					                           alert("This Customer Does Not Have Any Active Id!");
					                           return;
					                       }
										   var accordionDiv = document.getElementById("accordionPanelsStayOpenExample");
										       accordionDiv.style.pointerEvents = "auto";
										       accordionDiv.style.opacity = "1";

					                       $('#visaType').val(activeIdDetail.visaType || '');
					                       $('#idNumber').val(activeIdDetail.idNumber || '');
					                       $('#idType').val(activeIdDetail.idType || '');
					                       $('#issuedBy').val(activeIdDetail.issuedBy || '');
					                       $('#issuedOn').val(activeIdDetail.issuedOn || '');
					                       $('#dateOfExpiry').val(activeIdDetail.dateOfExpiry || '');
					                       $('#visaExpiryDate').val(activeIdDetail.visaExpiryDate || '');
					                       $('#visaNumber').val(activeIdDetail.visaNumber || '');
					                       $('#issuedCountry').val(activeIdDetail.issuedCountry || '');
					                   } else {
					                       // idDetails is not available or empty.
					                       console.log("No idDetails available.");
					                       alert("No idDetails available.");
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
					if (response.profBase64Data && response.profContentType) {
					                       $("#profilePhoto").attr("src", `data:${response.profContentType};base64,${response.profBase64Data}`);
					                   } else {
					                       $("#profilePhoto").attr("src", "/path/to/default/image.jpg"); // Placeholder if no image available
					                   }
					if (response.id) {
										                        fetchIdDetails(response.id);
										                    }
					/*if (Array.isArray(response.idDetails) && response.idDetails.length > 0){
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

					}*/
					
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
						let lastFiveRecords = idDetailsList.slice(-5);
		                idDetailsList.forEach(function (idDetail) {
							fetchEnumValue("idTypes", idDetail.idType, function (fullIdType) {
							                        var idTypeDisplay = fullIdType || idDetail.idType || '';
		                    fetchEnumValue("country", idDetail.issuedCountry, function (fullCountryName) {
		                        var issuedCountry = fullCountryName || idDetail.issuedCountry || '';
								var activeStatusDisplay = idDetail.activeStatus ? 'Active' : 'Inactive';
		                        var row = `<tr>
									<td class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
									onmouseout="this.style.color='#303030'" onclick="openPopupForIdDetails('${idDetail.idNumber}', '${idDetail.customerId}')">${idDetail.idNumber || ''}</td>
		                            <td>${idTypeDisplay}</td>
		                            <td>${idDetail.issuedBy || ''}</td>
									<td>${idDetail.issuedOn || ''}</td>
		                            <td>${idDetail.dateOfExpiry || ''}</td>
		                             <td>${issuedCountry}</td>
									<td>${activeStatusDisplay}</td>
		                            <td class="text-end" >
									<i class="feather feather-eye me-2" class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
										onmouseout="this.style.color='#303030'" onclick="openPopupForIdDetails('${idDetail.idNumber}', '${idDetail.customerId}')"></i>
									<i class="feather feather-edit-3 me-2" 	class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
										onmouseout="this.style.color='#303030'" onclick="openPopupForIdDetailsUpdate('${idDetail.idNumber}', '${idDetail.customerId}')"></i>
								 <!--	<i class="bi bi-check-circle text-success" 	class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
									onmouseout="this.style.color='#303030'" onclick="openPopup('${idDetail.idNumber}', ${idDetail.activeStatus})"></i> -->
		                            </td>
		                        </tr>`;
		                        idDetailsTable.append(row);
		                    });
		                });
						});
		            } else {
						let tableBody = $('#search-result2 tbody');
							                tableBody.empty(); // Clear any existing rows
							                tableBody.append('<tr><td colspan="3">No ID details found</td></tr>');
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
									console.log(bankName,"search-result1");
									let statusText = beneficiary.status ? 'Active' : 'Inactive';
									let row = `<tr data-beneficiary-id="${beneficiary.id}">
									                                <td class="clickable" onmouseover="this.style.cursor='pointer';this.style.color='#263cab'"
																		onmouseout="this.style.color='#303030'">${beneficiary.fullName}</td>
									                                <td>${bankName}</td>
									                                <td>${beneficiary.beneficiaryAccountNo}</td>
																	<td>${statusText}</td>
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
                    if(!beneficiary.status){
                    alert("Beneficiary Not Active!");
                    return;
                    }
                    console.log(beneficiary);
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
                        window.location.reload();
                    }
                }, 1000);
                console.log(remainingTime);
            }
            else {
                $('#quoteMessage').text('Failed to generate quote. Please try again.').css('color', 'red');
                $('#createTransactionSection').hide(); // Ensure it remains hidden
            }
        },

        error: function(jqXHR) {
            $('#loader').hide();
            $('#createTransactionSection').hide();
            console.log(jqXHR); // Debugging log

            let errorMessage = 'Failed to generate quote. Please try again.';

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
                             window.location.href = "/transfer-details?transactionReferenceNumber=" + transactionRefNumber ;
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
	const beneficiaryDob = document.getElementById('beneficiaryDob');
	const MAX_LENGTH = 34;
	
	const today = new Date().toISOString().split("T")[0];
	const tomorrow = new Date();
	      tomorrow.setDate(tomorrow.getDate() + 1);
    const tomorrowString = tomorrow.toISOString().split("T")[0];
	beneficiaryDob.setAttribute("max", today);
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

		    $('#openPopup').show();
		   
		    activeLink.onclick = function(event) {
		        event.preventDefault(); 
		        updateStatus(idNumber, true);
		    };

		    deactiveLink.onclick = function(event) {
		        event.preventDefault(); 
		        updateStatus(idNumber, false);
		    };
		}

		function updateStatus(idNumber, status) {
			const container = document.querySelector('.nxl-container');
		    $.ajax({
		        url: `/caas/api/v2/iddetail/get-by-idnumber/${idNumber}?activeStatus=${status}`,
		        type: 'GET',
		        success: function(response) {
		            console.log("Status updated successfully:", response);
		            $('#openPopup').hide();
		            container.classList.remove('blur-background');
					window.location.reload();
					
		        },
		        error: function(xhr, status, error) {
		            console.error("Error updating status:", error);
		            alert("Failed to update status. Please try again.");
		        }
		    });
		}


		function openPopupForBeneficiary(beneficiaryId, activeStatus) {
		    const activeButton = document.querySelector('#activeButton');
		    const deactiveButton = document.querySelector('#deactiveButton');
		    const container = document.querySelector('.nxl-container');

		    container.classList.add('blur-background');

		   
		    if (activeStatus) {
		        activeButton.setAttribute('disabled', true);
		        deactiveButton.removeAttribute('disabled');
		    } else {
		        activeButton.removeAttribute('disabled');
		        deactiveButton.setAttribute('disabled', true);
		    }

		    
		    activeButton.onclick = function(event) {
		        event.preventDefault();
		        updateBeneficiaryStatus(beneficiaryId, true);
		    };

		    deactiveButton.onclick = function(event) {
		        event.preventDefault();
		        updateBeneficiaryStatus(beneficiaryId, false);
		    };

		  
		    $('#openPopupForBeneficiary').show();
		}

		
		function updateBeneficiaryStatus(beneficiaryId, status) {
		    const container = document.querySelector('.nxl-container');
		    $.ajax({
		        url: `/api/v1/beneficiaries/status/${beneficiaryId}?status=${status}`,
		        type: 'GET',
		        success: function(response) {
		            console.log("Status updated successfully:", response);
					alert("Status updated successfully:", response);
		            $('#openPopupForBeneficiary').hide();
		            container.classList.remove('blur-background');
					window.location.reload();
		        },
		        error: function(xhr, status, error) {
		            console.error("Error updating status:", error);
		            alert("Failed to update status. Please try again.");
		        }
		    });
		}
		function openPopupForIdDetails(idNumber, customerId) {
		    const popupIdDetails = document.getElementById('popupIdDetails');
		    const container = document.querySelector('.nxl-container');

		    $.ajax({
		      url: '/caas/api/v2/customer/id-detail/' + customerId,
		      type: 'GET',
		      success: function (response) {
		        console.log("ID details fetched by customerId", response);

		        if (Array.isArray(response) && response.length > 0) {
		          $('#idDetailsContainer').empty(); 
		          $.each(response, function(index, idDetail) {
		            let idDetailHtml = `
		              <div class="id-detail-item mb-4">
		                <div class="row">
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">ID Type</label>
		                    <input type="text" name="idType" class="form-control" placeholder="Id Type" value="${idDetail.idType || ''}" readonly id="idTypes-${index}">
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">ID No.</label>
		                    <input type="text" name="idNumber" class="form-control" placeholder="ID No." value="${idDetail.idNumber || ''}" readonly>
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Name as per ID</label>
		                    <input type="text" name="nameAsPerId" class="form-control" placeholder="Name as per ID" value="${idDetail.nameAsPerId || ''}" readonly>
		                  </div>
		                </div>

		                <div class="row mt-2">
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Issued Country</label>
		                    <input type="text" name="issuedCountry" class="form-control" placeholder="Issued Country" value="${idDetail.issuedCountry || ''}" readonly id="issuedCountrys-${index}">
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Issued at</label>
		                    <input type="text" name="issuedAt" class="form-control" placeholder="Issued at" value="${idDetail.issuedAt || ''}" readonly id="issuedAts-${index}">
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Issued By</label>
		                    <input type="text" name="issuedBy" class="form-control" placeholder="Issued By" value="${idDetail.issuedBy || ''}" readonly>
		                  </div>
		                </div>

		                <div class="row mt-2">
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Issued on</label>
		                    <input type="text" name="issuedOn" class="form-control" placeholder="Date of Issue" value="${idDetail.issuedOn || ''}" readonly>
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Date of Expiry</label>
		                    <input type="text" name="dateOfExpiry" class="form-control" placeholder="Date of Expiry" value="${idDetail.dateOfExpiry || ''}" readonly>
		                  </div>
		                </div>

		                <div class="row mt-2">
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">ID Front</label>
		                    <img src="data:${idDetail.frontContentType};base64,${idDetail.frontBase64Data}" alt="ID Front" class="img-thumbnail id-picture" style="width: 300px; height: 180px;">
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">ID Back</label>
		                    <img src="data:${idDetail.backContentType};base64,${idDetail.backBase64Data}" alt="ID Back" class="img-thumbnail id-picture" style="width: 300px; height: 180px;">
		                  </div>
		                </div>

		                ${idDetail.visaDetails ? `
		                <div class="row mt-4" id="visaDetails-${index}">
		                  <h5 class="fw-bold mb-0 me-4">
		                    <span class="d-block mb-4">Visa Details</span>
		                  </h5>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Visa Number</label>
		                    <input type="text" name="visaNumber" class="form-control" placeholder="Visa Number" value="${idDetail.visaDetails.visaNumber || ''}" readonly>
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Visa Expiry Date</label>
		                    <input type="text" name="visaExpiryDate" class="form-control" placeholder="Visa Expiry Date" value="${idDetail.visaDetails.visaExpiryDate || ''}" readonly>
		                  </div>
		                  <div class="col-12 col-md-4">
		                    <label class="form-label">Visa Type</label>
		                    <input type="text" name="visaType" class="form-control" placeholder="Visa Type" value="${idDetail.visaDetails.visaType || ''}" readonly>
		                  </div>
		                </div>
		                ` : ''}
		              </div>`;
		              
		          
		            $('#idDetailsContainer').append(idDetailHtml);

		            
		            if (idDetail.idType) {
		              fetchEnumValue("idTypes", idDetail.idType, function(description) {
		                $(`#idTypes-${index}`).val(description || "Unknown Type");
		              });
		            }
		            if (idDetail.issuedCountry) {
		              fetchEnumValue("country", idDetail.issuedCountry, function(description) {
		                $(`#issuedCountrys-${index}`).val(description || "Unknown Country");
		              });
		            }
		            if (idDetail.issuedAt) {
		              fetchEnumValue("country", idDetail.issuedAt, function(description) {
		                $(`#issuedAts-${index}`).val(description || "Unknown Country");
		              });
		            }
		          });

	
		          popupIdDetails.style.display = 'block';
		          container.classList.add('blur-background');

		          $('.id-picture').on('click', function() {
		            
		            const imgElement = this;
		            if (imgElement.requestFullscreen) {
		              imgElement.requestFullscreen();
		            } else if (imgElement.webkitRequestFullscreen) { 
		              imgElement.webkitRequestFullscreen();
		            } else if (imgElement.msRequestFullscreen) { 
		              imgElement.msRequestFullscreen();
		            } else {
		              alert("Fullscreen mode is not supported by your browser.");
		            }
		          });
		        } else {
		          alert("No ID details found for this customer.");
		        }
		      },
		      error: function (xhr, status, error) {
		        console.error("Error fetching ID details:", error);
		        alert("Failed to fetch ID details. Please try again.");
		      }
		    });
		  }
		  function openPopupForIdDetailsUpdate(idNumber, customerId) {
		  		    const popupIdDetails = document.getElementById('popupIdDetails');
		  		    const container = document.querySelector('.nxl-container');
					const today = new Date().toISOString().split('T')[0];
		  		    $.ajax({
		  		      url: '/caas/api/v2/customer/id-detail/' + customerId,
		  		      type: 'GET',
		  		      success: function (response) {
		  		        console.log("ID details fetched by customerId", response);

		  		        if (Array.isArray(response) && response.length > 0) {
		  		          $('#idDetailsContainer').empty(); 
		  		          $.each(response, function(index, idDetail) {
		  		            let idDetailHtml = `
		  		              <div class="id-detail-item mb-4">
		  		                <div class="row">
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">ID Type</label>
		  		                    <input type="text" name="idType" class="form-control" placeholder="Id Type" value="${idDetail.idType || ''}" readonly id="idTypes-${index}">
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">ID No.</label>
		  		                    <input type="text" name="idNumber" class="form-control" placeholder="ID No." value="${idDetail.idNumber || ''}" readonly>
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Name as per ID</label>
		  		                    <input type="text" name="nameAsPerId" class="form-control" placeholder="Name as per ID" value="${idDetail.nameAsPerId || ''}" readonly>
		  		                  </div>
		  		                </div>

		  		                <div class="row mt-2">
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Issued Country</label>
		  		                    <input type="text" name="issuedCountry" class="form-control" placeholder="Issued Country" value="${idDetail.issuedCountry || ''}" readonly id="issuedCountrys-${index}">
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Issued at</label>
		  		                    <input type="text" name="issuedAt" class="form-control" placeholder="Issued at" value="${idDetail.issuedAt || ''}" readonly id="issuedAts-${index}">
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Issued By</label>
		  		                    <input type="text" name="issuedBy" class="form-control" placeholder="Issued By" value="${idDetail.issuedBy || ''}" readonly>
		  		                  </div>
		  		                </div>

		  		                <div class="row mt-2">
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Issued on</label>
		  		                    <input type="text" name="issuedOn" class="form-control" placeholder="Date of Issue" value="${idDetail.issuedOn || ''}" readonly>
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Date of Expiry</label>
		  		                    <input type="date" name="dateOfExpiry" id="dateOfExpiry" class="form-control" placeholder="Date of Expiry" min="${today}" value="${idDetail.dateOfExpiry || ''}" >
		  		                  </div>
								  <div class="col-12 col-md-4">
								  <label class="form-label">Id Status<span class="text-danger">*</span></label>								  
								  <select data-select2-selector="icon" class="form-control p-2" name="activeStatus" id="activeStatus-${index}">
								   <option value="false" ${idDetail.activeStatus === false ? 'selected' : ''}>Inactive</option>
								   <option value="true" ${idDetail.activeStatus === true ? 'selected' : ''}>Active</option>
								 </select>
								 </div>
		  		                </div>

		  		                <div class="row mt-2">
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">ID Front</label>
		  		                    <img src="data:${idDetail.frontContentType};base64,${idDetail.frontBase64Data}" alt="ID Front" class="img-thumbnail id-picture" style="width: 300px; height: 180px;">
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">ID Back</label>
		  		                    <img src="data:${idDetail.backContentType};base64,${idDetail.backBase64Data}" alt="ID Back" class="img-thumbnail id-picture" style="width: 300px; height: 180px;">
		  		                  </div>
		  		                </div>

		  		                ${idDetail.visaDetails ? `
		  		                <div class="row mt-4" id="visaDetails-${index}">
		  		                  <h5 class="fw-bold mb-0 me-4">
		  		                    <span class="d-block mb-4">Visa Details</span>
		  		                  </h5>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Visa Number</label>
		  		                    <input type="text" name="visaNumber" class="form-control" placeholder="Visa Number" value="${idDetail.visaDetails.visaNumber || ''}" readonly>
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Visa Expiry Date</label>
		  		                    <input type="text" name="visaExpiryDate" class="form-control" placeholder="Visa Expiry Date" value="${idDetail.visaDetails.visaExpiryDate || ''}" readonly>
		  		                  </div>
		  		                  <div class="col-12 col-md-4">
		  		                    <label class="form-label">Visa Type</label>
		  		                    <input type="text" name="visaType" class="form-control" placeholder="Visa Type" value="${idDetail.visaDetails.visaType || ''}" readonly>
		  		                  </div>
		  		                </div>
		  		                ` : ''}
		  		              </div>`;
		  		              
		  		            $('#idDetailsContainer').append(idDetailHtml);

		  		            
		  		            if (idDetail.idType) {
		  		              fetchEnumValue("idTypes", idDetail.idType, function(description) {
		  		                $(`#idTypes-${index}`).val(description || "Unknown Type");
		  		              });
		  		            }
		  		            if (idDetail.issuedCountry) {
		  		              fetchEnumValue("country", idDetail.issuedCountry, function(description) {
		  		                $(`#issuedCountrys-${index}`).val(description || "Unknown Country");
		  		              });
		  		            }
		  		            if (idDetail.issuedAt) {
		  		              fetchEnumValue("country", idDetail.issuedAt, function(description) {
		  		                $(`#issuedAts-${index}`).val(description || "Unknown Country");
		  		              });
		  		            }
		  		          });
						  $('#idDetailsContainer').append(`
						    <div class="row mt-4">
						      <div class="col-12 text-center" style="display: flex;justify-content: center;">
						        <button type="button" class="btn btn-primary" id="updateIdDetailsButton">Submit</button>
						      </div>
						    </div>
						  `);
						  $('#updateIdDetailsButton').on('click', function() {
						   
						 let updatedIdDetails = [];
						 $('.id-detail-item').each(function () {
							let idDetail = {
							    idNumber: $(this).find('input[name="idNumber"]').val(),
							    dateOfExpiry: $(this).find('input[name="dateOfExpiry"]').val(),
								activeStatus: $(this).find('select[name="activeStatus"]').val()
							    
							  };
							  updatedIdDetails.push(idDetail);
							});

							console.log("Updated ID Details:", updatedIdDetails);

							
							$.ajax({
							  url: '/caas/api/v2/iddetail/date-of-expiry/update',
							  type: 'PUT',
							  contentType: 'application/json',
							  data: JSON.stringify(updatedIdDetails),
							  success: function (response) {
								alert("Id  Updated Successfully!");
								window.location.reload();
							  },
							  error: function (xhr, status, error) {
							      console.error('Error updating ID details:', error);
							      alert('Failed to update ID details. Please try again.');
							  }
							});

							
						  });
		  		          popupIdDetails.style.display = 'block';
		  		          container.classList.add('blur-background');

		  		          $('.id-picture').on('click', function() {
		  		            
		  		            const imgElement = this;
		  		            if (imgElement.requestFullscreen) {
		  		              imgElement.requestFullscreen();
		  		            } else if (imgElement.webkitRequestFullscreen) { 
		  		              imgElement.webkitRequestFullscreen();
		  		            } else if (imgElement.msRequestFullscreen) { 
		  		              imgElement.msRequestFullscreen();
		  		            } else {
		  		              alert("Fullscreen mode is not supported by your browser.");
		  		            }
		  		          });
		  		        } else {
		  		          alert("No ID details found for this customer.");
		  		        }
		  		      },
		  		      error: function (xhr, status, error) {
		  		        console.error("Error fetching ID details:", error);
		  		        alert("Failed to fetch ID details. Please try again.");
		  		      }
		  		    });
		  		  }
				  function addIdentity() {
				      const popupIdDetailsForUpdate = document.getElementById('popupIdDetailsForCraete');
				      const container = document.querySelector('.nxl-container');
					  const today = new Date().toISOString().split('T')[0];

				      container.classList.add('blur-background');
				      popupIdDetailsForUpdate.style.display = 'block';

				      fetchAndPopulateDropdown('/api/enumEntities/country', '#issuedCountry1', 'Issued Country');
//				      fetchAndPopulateDropdown('/api/enumEntities/idTypes', '#idType1', 'Id Type');
				      fetchAndPopulateDropdown('/api/enumEntities/country', '#issuedAt1', 'Issued at');
					  fetchIdTypes();
					
					  
				  }

				  function fetchAndPopulateDropdown(url, dropdownSelector, defaultText) {
				      $.ajax({
				          url: url,
				          type: 'GET',
				          success: function (response) {
				              console.log(response);
				              const dropdown = $(dropdownSelector);
				              dropdown.empty();
				              dropdown.append(`<option value="" disabled selected>${defaultText}</option>`);

				              if (response && response.key) {
				                  $.each(response.values, function (index, obj) {
				                      dropdown.append(`<option value="${obj.valueId}">${obj.description}</option>`);
				                  });
				              } else {
				                  console.error(`No data found in response for ${defaultText}.`);
				              }
				          },
				          error: function () {
				              console.error(`Error fetching data for ${defaultText}.`);
				          }
				      });
				  }
				  function fetchIdTypes() {
				      $.ajax({
				          url: '/api/enumEntities/idTypes',
				          type: 'GET',
				          success: function (response) {
				              console.log(response);
				              const dropdown = $('#idType1');
				              dropdown.empty(); 
							  let hasValue2 = false;

				              if (response && Array.isArray(response)) {
				                  $.each(response, function (index, obj) {
				                      dropdown.append(`<option value="${obj.valueId}">${obj.description}</option>`);
									  if (obj.valueId == 2) hasValue2 = true;
									  
				                  });
				              } else if (response && response.values && Array.isArray(response.values)) {
				                  $.each(response.values, function (index, obj) {
				                      dropdown.append(`<option value="${obj.valueId}">${obj.description}</option>`);
									  if (obj.valueId == 2) hasValue2 = true;
									  $('#visa_details').show(); 
				                  });
				              } else {
				                  console.error("No data found for Id Type.");
				              }
							  if (hasValue2) {
							                  dropdown.val(2).trigger('change');
							              }
				          },
				          error: function () {
				              console.error("Error fetching Id Types.");
				          }
				      });
				  }
				  $(document).on('change', '#idType1', function () {
				      if ($(this).val() == '2') {
				          $('#visa_details').show(); 
				      } else {
				          $('#visa_details').hide();
				      }
				  })
				  $(document).ready(function () {
				      fetchIdTypes();
				  });
				  
				  document.addEventListener("DOMContentLoaded", function () {
				      const today = new Date();
				      const tomorrow = new Date();
				      tomorrow.setDate(today.getDate() + 1);

				      const todayString = today.toISOString().split("T")[0];
				      const tomorrowString = tomorrow.toISOString().split("T")[0];

				      document.getElementById("issuedOn1").setAttribute("max", todayString);
				      document.getElementById("dateOfExpiry1").setAttribute("min", tomorrowString);
					  document.getElementById("idNumber1").addEventListener("input", function () {
					         let idNumber = this.value;
					         if (idNumber.trim().length > 0) {
					             verifyIdNumber(idNumber, function (exists) {
					                 const errorElement = document.getElementById("idNumber1Error");
					                 if (exists) {
					                     errorElement.innerText = "Please change ID Number, this ID is already available.";
					                 } else {
					                     errorElement.innerText = "";
					                 }
					             });
					         }
					     });


						 document.getElementById("createIdDetailsButton").addEventListener("click", function (event) {
						         event.preventDefault(); 

						         const idNumber = document.getElementById("idNumber1").value;

						         verifyIdNumber(idNumber, function (exists) {
						             if (exists) {
						                 return;
						             }

						             if (!validateForm()) {
						                 return;
						             }

						             const ecrn = document.getElementById("ecrn").value;
						             const formData = new FormData();
						             formData.append("idType", document.getElementById("idType1").value);
						             formData.append("idNumber", document.getElementById("idNumber1").value);
						             formData.append("nameAsPerId", document.getElementById("nameAsPerId1").value);
						             formData.append("issuedCountry", document.getElementById("issuedCountry1").value);
						             formData.append("issuedAt", document.getElementById("issuedAt1").value);
						             formData.append("issuedBy", document.getElementById("issuedBy1").value);
						             formData.append("issuedOn", document.getElementById("issuedOn1").value);
						             formData.append("dateOfExpiry", document.getElementById("dateOfExpiry1").value);
						             formData.append("visaNumber", document.getElementById("visaNumber1").value);
						             formData.append("visaExpiryDate", document.getElementById("visaExpiryDate1").value);
						             formData.append("visaType", document.getElementById("visaType1").value);

						             const frontFile = document.getElementById("frontPictureFile").files[0];
						             const backFile = document.getElementById("backPictureFile").files[0];

						             if (frontFile) {
						                 formData.append("frontPictureFile", frontFile);
						             }
						             if (backFile) {
						                 formData.append("backPictureFile", backFile);
						             }

						             $.ajax({
						                 url: '/caas/api/v2/customer/id-details?ecrn=' + ecrn,
						                 type: 'POST',
						                 data: formData,
						                 contentType: false,
						                 processData: false,
						                 success: function (response) {
						                     alert("ID Added Successfully!");
						                     window.location.reload();
						                 },
						                 error: function (xhr, status, error) {
						                     console.error('Error updating ID details:', error);
						                     alert('Failed to create ID details. Please try again.');
						                 }
						             });
						         });
						     });

				      function verifyIdNumber(idNumber,callback) {
				          $.ajax({
				              url: '/caas/api/v2/iddetail/verify-idNumber?idNumber=' + idNumber,
				              type: 'GET',
				              success: function (response) {
								console.log(response);
				                  if (response) {
				                      document.getElementById("idNumber1Error").innerText = "Please change Id Number, this ID is already available.";
				                      callback(true);
				                  } else {
				                      document.getElementById("idNumber1Error").innerText = "";
				                     callback(false);
				                  }
				              },
							  error: function (xhr, status, error) {
							  	console.error('Error verify ID details:', error);
								callback(false);
							  	}
				          });
				      }
				      function validateForm() {
				          let isValid = true;

				          function setError(id, message) {
				              document.getElementById(id).innerText = message;
				              isValid = false;
				          }

				          function clearError(id) {
				              document.getElementById(id).innerText = "";
				          }

				       
				          const requiredFields = [
				              { id: "idType1", errorId: "idType1Error", message: "ID Type is required." },
				              { id: "idNumber1", errorId: "idNumber1Error", message: "ID Number is required." },
				              { id: "nameAsPerId1", errorId: "nameAsPerId1Error", message: "Name as per ID is required." },
				              { id: "issuedCountry1", errorId: "issuedCountry1Error", message: "Issued Country is required." },
				              { id: "issuedAt1", errorId: "issuedAt1Error", message: "Issued at is required." },
				              { id: "issuedBy1", errorId: "issuedBy1Error", message: "Issued By is required." },
				             
				          ];

				          requiredFields.forEach(field => {
				              const value = document.getElementById(field.id).value.trim();
				              if (value === "") {
				                  setError(field.errorId, field.message);
				              } else {
				                  clearError(field.errorId);
				              }
				          });			        
				          return isValid;
				      }
				  });
					function closePopup() {
					    const container = document.querySelector('.nxl-container');
					    container.classList.remove('blur-background');
					    $('#openPopup').hide();
						$('#openPopupForBeneficiary').hide();
						$('#popupIdDetails').hide();
						$('#popupIdDetailsForUpdate').hide();	
						$('#popupIdDetailsForCraete').hide();
					}
					
					$(document).on('mouseenter', '.passport-picture', function(e) {
					      var imgSrc = $(this).attr('src');
					      $('#imagePreview').html('<img src="' + imgSrc + '">');
					      $('#imagePreview').fadeIn(200);
					    });
							