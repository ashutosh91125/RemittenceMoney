$(document).ready(function () {
    $("#customerOnboardForm").on("submit", function (e) {
        e.preventDefault();

        if (!validation(this)) {
            return false;
        }

        $('#loader').show();
        $("#customerOnboardForm button[type='submit']").prop('disabled', true);
        const formData = new FormData(this);

        $.ajax({
            url: "/createUser",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                $('#loader').hide();
                $("#customerOnboardForm button[type='submit']").prop('disabled', false);

                if (response && response.status === "success" && response.data && response.data.ecrn) {
                    alert("Customer Onboarded successfully with ECRN: " + response.data.ecrn);
                } else {
                    alert("Customer Onboarded successfully!");
                }

                $("#customerOnboardForm")[0].reset();
                window.location.reload();
            },
            error: function (xhr) {
                $('#loader').hide();
                $("#customerOnboardForm button[type='submit']").prop('disabled', false);

                try {
                    let response = JSON.parse(xhr.responseText);

                    if ((response.status === "failure" || response.status === "failed") && response.message) {
                        alert("Error: " + response.message);
                    } else if (response.code === 504 && response.message) {
                        alert("Server Error: " + response.message);
                    } else if (response.error) {
                        alert("Error: " + response.error);
                    } else {
                        alert("Something went wrong!");
                    }
                } catch (e) {
                    alert("Something went wrong!");
                }
            }
        });
    });
});



function copyAddress() {
    const checkbox = document.getElementById("sameAsCurrentAddress");
    const permanentCountryDropdown = document.getElementById("permanentCountry");
    const permanentStateDropdown = document.getElementById("parStateDropdown");
    const currentCountry = document.getElementById("currentCountry");
    const currentState = document.getElementById("stateDropdown");

    if (checkbox.checked) {
        document.getElementById("permanentBuildingName").value = document.getElementById("currentBuildingName").value;
        document.getElementById("permanentStreetName").value = document.getElementById("currentStreetName").value;
        document.getElementById("permanentLandmark").value = document.getElementById("currentLandmark").value;
        document.getElementById("permanentCity").value = document.getElementById("currentCity").value;
        document.getElementById("permanentDistrict").value = document.getElementById("currentDistrict").value;
        document.getElementById("permanentZip").value = document.getElementById("currentZip").value;

        permanentCountryDropdown.value = currentCountry.value;
        $(permanentCountryDropdown).trigger('change'); 
        setTimeout(() => {
            permanentStateDropdown.value = currentState.value;
        }, 500);
    } else {
        document.getElementById("permanentBuildingName").value = "";
        document.getElementById("permanentStreetName").value = "";
        document.getElementById("permanentLandmark").value = "";
        document.getElementById("permanentCity").value = "";
        document.getElementById("permanentDistrict").value = "";
        document.getElementById("permanentZip").value = "";

        permanentCountryDropdown.selectedIndex = 0; 
        permanentStateDropdown.innerHTML = '<option value="" disabled selected>Select State</option>'; 
    }
}


	function toggleDiv(divId) {
		const element = document.getElementById(divId);
		element.classList.toggle("show");
	}

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
	function toggleFields() {
	    const residentType = document.getElementById('residentType').value;
	    const idTypeDropdowns = document.querySelectorAll("[id^='idTypeDropdown']");
	    const issuedDateExpiryNonResident = document.getElementById('issuedDateExpiryNonResident');
	    const issuedForNonResidents = document.getElementById('issuedForNonResidents');
	    const idDetails = document.getElementById('idDetails');
	    const idDetailsFields = document.getElementById('idDetailsFields');
	    const idNumberField = document.getElementById('idNumberField');
	//     const nonResident = document.getElementById('nonResident');
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
	//         nonResident.style.display = 'none';
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
	//         nonResident.style.display = 'flex';
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
	//         nonResident.style.display = 'none';
	        customerIdentityContainer.style.display = 'none';
	    }
	}


    function toggleCustomerRemarks() {
        const showRemarks = document.getElementById("showRemarksOnTxn").value;
        const remarksContainer = document.getElementById("customerRemarksContainer");

        if (showRemarks === "1") {
            remarksContainer.style.display = "block";
        } else {
            remarksContainer.style.display = "none";
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        console.log("Page Loaded");
        document.getElementById('idNumber').addEventListener('input', function () {
                const idNumber = this.value.trim();
                const residentType = document.getElementById('residentType').value;
                const dateOfBirth = document.getElementById('dateOfBirth').value;
                const placeOfBirth = document.getElementById('placeOfBirth').value.trim();
                const gender = document.getElementById('gender').value;

                const errorSpan = document.getElementById('idNumberError');
                errorSpan.textContent = ""; 

                if (residentType !== "101") {
                    return; 
                }
                const placeOfBirthMatch = placeOfBirth.match(/\((\d+)\)$/); 
                const placeOfBirthCode = placeOfBirthMatch ? placeOfBirthMatch[1] : null;
                if (idNumber.length < 12) {
                    errorSpan.textContent = "ID Number must be 12 digit.";
                    return;
                }
                if (dateOfBirth) {
                    const dobParts = dateOfBirth.split("-");
                    const expectedDob = dobParts[0].substring(2) + dobParts[1] + dobParts[2]; 
                    if (idNumber.substring(0, 6) !== expectedDob) {
                        errorSpan.textContent = "First 6 characters must match Date of Birth";
                        return;
                    }
                } else {
                    errorSpan.textContent = "Please select Date of Birth";
                    return;
                }
                if (placeOfBirthCode && idNumber.substring(6, 8) !== placeOfBirthCode) {
                    errorSpan.textContent = "7th and 8th digit must be Place of Birth code";
                    return;
                } else if (!placeOfBirthCode) {
                    errorSpan.textContent = "Please select Place of Birth";
                    return;
                }

                const expectedGenderChar = gender === "Male" ? "1" : "0";
                if (idNumber.charAt(11) !== expectedGenderChar) {
                    errorSpan.textContent = "Last digit must be 1 for Male or 0 for Female";
                    return;
                }

                errorSpan.textContent = "";
            });
        document.getElementById('primaryMobileNumber').addEventListener('input', function () {
            const mobileNumber = this.value.trim();
            const errorSpan = document.getElementById('primaryMobileNumberError');
            errorSpan.textContent = ""; 

            if (mobileNumber.length >= 10 && /^\d{10,15}$/.test(mobileNumber)) {
                $.ajax({
                    url: '/caas/api/v2/customer/verify-mobile',
                    type: 'GET',
                    data: { primaryMobileNumber: mobileNumber },
                    success: function (response) {
                        if (response && response.message === "Customer already exists with this mobile number.") {
                            errorSpan.textContent = response.message; 
                        } else {
                            errorSpan.textContent = "";
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", status, error);
                        errorSpan.textContent = "Error checking mobile number. Please try again.";
                    }
                });
            } else {
                errorSpan.textContent = "Enter a valid mobile number (10-15 digits).";
            }
        });
        const today = new Date().toISOString().split("T")[0];
           const tomorrow = new Date();
           tomorrow.setDate(tomorrow.getDate() + 1);
           const tomorrowString = tomorrow.toISOString().split("T")[0];

           const issuedOnInput = document.querySelector('input[name="idDetails[0].issuedOn"]');
           const dateOfExpiryInput = document.querySelector('input[name="idDetails[0].dateOfExpiry"]');

           issuedOnInput.setAttribute("max", today);
           dateOfExpiryInput.setAttribute("min", tomorrowString);


           issuedOnInput.addEventListener('change', function () {
               const issuedOnValue = this.value;
               const dateOfExpiryValue = dateOfExpiryInput.value;

               const issuedOnError = document.getElementById('issuedOnError');
               issuedOnError.textContent = "";

               if (!issuedOnValue) {
                   issuedOnError.textContent = "Issued On date is required.";
                   return;
               }

           });

           dateOfExpiryInput.addEventListener('change', function () {
               const dateOfExpiryValue = this.value;
               const issuedOnValue = issuedOnInput.value;

               const dateOfExpiryError = document.getElementById('dateOfExpiryError');
               dateOfExpiryError.textContent = "";

               if (!dateOfExpiryValue) {
                   dateOfExpiryError.textContent = "Date of Expiry is required.";
                   return;
               }
           });
        toggleFields();
        toggleCustomerRemarks();
    });