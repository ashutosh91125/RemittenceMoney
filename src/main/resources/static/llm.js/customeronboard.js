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
	function toggleFields() {
	    const residentType = document.getElementById('residentType').value;
	    const idTypeInput = document.getElementById("idType");
	    const issuedCountryInput = document.querySelector("[name='issuedCountry']");
	    const issuedAtInput = document.querySelector("[name='issuedAt']");
	    const issuedDateExpiryNonResident = document.getElementById('issuedDateExpiryNonResident');
	    const issuedForNonResidents = document.getElementById('issuedForNonResidents');

	    if (residentType === '101') {
	        idTypeInput.value = "MALAYSIA ID CARD(MYKAD)";
	        issuedCountryInput.value = "MY";
	        issuedAtInput.value = "MALAYSIA";
	        issuedCountryInput.disabled = true;
	        issuedAtInput.disabled = true;
	        issuedDateExpiryNonResident.style.display = 'none';
	        issuedForNonResidents.style.display = 'none';
	        document.getElementById('idNumberField').style.display = 'block';
	        document.getElementById('idDetailsFields').style.display = 'none';
	        document.getElementById('additionalIdDetails').style.display = 'none';
	        document.getElementById('expiryAndStatusFields').style.display = 'none';
	    } else if (residentType === '100') {
	        idTypeInput.value = "PASSPORT";
	        issuedCountryInput.value = "";
	        issuedAtInput.value = "";
	        issuedCountryInput.disabled = false;
	        issuedAtInput.disabled = false;
	        issuedForNonResidents.style.display = 'block';
	        issuedDateExpiryNonResident.style.display = 'block';
	        document.getElementById('idNumberField').style.display = 'block';
	        document.getElementById('idDetailsFields').style.display = 'block';
	        document.getElementById('additionalIdDetails').style.display = 'block';
	        document.getElementById('expiryAndStatusFields').style.display = 'block';
	    } else {
	        issuedDateExpiryNonResident.style.display = 'none';
	        issuedForNonResidents.style.display = 'none';
	        document.getElementById('idNumberField').style.display = 'none';
	        document.getElementById('idDetailsFields').style.display = 'none';
	        document.getElementById('additionalIdDetails').style.display = 'none';
	        document.getElementById('expiryAndStatusFields').style.display = 'none';
	    }
	}


	 function toggleCustomerRemarks() {
	        const showRemarks = document.getElementById("showRemarksOnTxn").value;
	        const remarksContainer = document.getElementById("customerRemarksContainer");

	        if (showRemarks === "true") {
	            remarksContainer.style.display = "block";
	        } else {
	            remarksContainer.style.display = "none";
	        }
	    }
	// Initial check to set visibility based on the default selected value
	document.addEventListener('DOMContentLoaded', function() {
		console.log("Page Loaded");
		 toggleCustomerRemarks();
			toggleFields();
	});