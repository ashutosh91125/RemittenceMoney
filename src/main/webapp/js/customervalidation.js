	function validation(form) {
	    console.log("Validation function triggered");
	
	    
	    document.getElementById("salutationError").innerHTML = "";
	    document.getElementById("firstNameError").innerHTML = "";
	    document.getElementById("lastNameError").innerHTML = "";
	    document.getElementById("nationalityError").innerHTML = "";
	    document.getElementById("secondNationalityError").innerHTML = "";
	    document.getElementById("nativeRegionError").innerHTML = "";
	    document.getElementById("dateOfBirthError").innerHTML = "";
	    document.getElementById("countryOfBirthError").innerHTML = "";
	    document.getElementById("placeOfBirthError").innerHTML = "";
	    document.getElementById("countryOfResidenceError").innerHTML = "";
	    document.getElementById("genderError").innerHTML = "";
		document.getElementById("emailIdError").innerHTML = "";
		
		
	    document.getElementById("buildingNameError").innerHTML = "";
	    document.getElementById("streetNameError").innerHTML = "";
	    document.getElementById("landmarkError").innerHTML = "";
	    document.getElementById("cityError").innerHTML = "";
	    document.getElementById("districtError").innerHTML = "";
	    document.getElementById("countryError").innerHTML = "";
		document.getElementById("stateError").innerHTML = "";
		document.getElementById("zipError").innerHTML = "";
		
		document.getElementById("idTypeError").innerHTML = "";
		document.getElementById("idNumberError").innerHTML = "";
		document.getElementById("nameAsPerIdError").innerHTML = "";
		document.getElementById("issuedCountryError").innerHTML = "";
		document.getElementById("issuedAtError").innerHTML = "";
		document.getElementById("issuedByError").innerHTML = "";
		document.getElementById("issuedOnError").innerHTML = "";
		document.getElementById("dateOfExpiryError").innerHTML = "";
		
		document.getElementById("annualIncomeRangeIdError").innerHTML = "";
		document.getElementById("annualIncomeCurrencyCodeError").innerHTML = "";
		document.getElementById("riskRatingIdError").innerHTML = "";
		document.getElementById("incomeTypeError").innerHTML = "";
		document.getElementById("professionCategoryError").innerHTML = "";
		document.getElementById("employerNameError").innerHTML = "";
		document.getElementById("employerAddressError").innerHTML = "";
		document.getElementById("employerPhoneError").innerHTML = "";
		document.getElementById("txnVolMonthError").innerHTML = "";
		document.getElementById("txnCountMonthError").innerHTML = "";
		document.getElementById("firstLanguageError").innerHTML = "";
		document.getElementById("maritalStatusError").innerHTML = "";
		document.getElementById("occupationIdError").innerHTML = "";
		
		
		issuedOnError.innerHTML = "";
		dateOfExpiryError.innerHTML = "";
		const today = new Date().toISOString().split("T")[0];
		
		

    let isValid = true;

    // Validation logic
    if (!form.salutation.value) {
        document.getElementById("salutationError").innerHTML = "Salutation is required.";
        isValid = false;
    }
    if (!form.firstName.value.trim()) {
        document.getElementById("firstNameError").innerHTML = "First Name is required.";
        isValid = false;
    }
	
    if (!form.lastName.value.trim()) {
        document.getElementById("lastNameError").innerHTML = "Last Name is required.";
        isValid = false;
    }
    if (!form.nationality.value) {
        document.getElementById("nationalityError").innerHTML = "Nationality is required.";
        isValid = false;
    }
    if (form.secondNationality.value && form.nationality.value === form.secondNationality.value) {
        document.getElementById("secondNationalityError").innerHTML = "Secondary nationality cannot be the same Nationality.";
        isValid = false;
    }
	if (!form.nativeRegion.value) {
	     document.getElementById("nativeRegionError").innerHTML = "NativeRegion is required.";
	     isValid = false;
	 }
	 if (!form.dateOfBirth.value) {
	         document.getElementById("dateOfBirthError").innerHTML = "Date of Birth is required.";
	         isValid = false;
	 } else {
	         let dob = new Date(form.dateOfBirth.value);
	         let today = new Date();
	         let age = today.getFullYear() - dob.getFullYear();
	         let m = today.getMonth() - dob.getMonth();
	         if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
	             age--;
	         }
	         if (age < 18) {
	             document.getElementById("dateOfBirthError").innerHTML = "You must be at least 18 years old.";
	             isValid = false;
	         }
	     }
	if (!form.countryOfBirth.value) {
		        document.getElementById("countryOfBirthError").innerHTML = "Country of Birth is required.";
		        isValid = false;
		}
	 if (!form.placeOfBirth.value) {
		        document.getElementById("placeOfBirthError").innerHTML = "Place of birth is required.";
		        isValid = false;
	  	}
	 if (!form.countryOfResidence.value) {
				 document.getElementById("countryOfResidenceError").innerHTML = "Country of Residence is required.";
				 isValid = false;
		}

	if (!form.gender.value) {
				 document.getElementById("genderError").innerHTML = "Gender is required.";
				 isValid = false;
		}		
	 if (!form.emailId.value) {
	     document.getElementById("emailIdError").innerHTML = "Email ID is required.";
	     isValid = false;
	 } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(form.emailId.value)) {
	     document.getElementById("emailIdError").innerHTML = "Invalid email format.";
	     isValid = false;
	 } else {
	     document.getElementById("emailIdError").innerHTML = "";
	 }
	
	
    if (!form.buildingName.value.trim()) {
        document.getElementById("buildingNameError").innerHTML = "Building name is required.";
        isValid = false;
    }
    if (!form.streetName.value.trim()) {
        document.getElementById("streetNameError").innerHTML = "Street is required.";
        isValid = false;
    }
	if (!form.landmark.value.trim()) {
	      document.getElementById("landmarkError").innerHTML = "Land Mark is required.";
	      isValid = false;
	  }
	landmarkError
    if (!form.city.value.trim()) {
        document.getElementById("cityError").innerHTML = "City is required.";
        isValid = false;
    }
	if (!form.district.value.trim()) {
	      document.getElementById("districtError").innerHTML = "District is required.";
	      isValid = false;
	 }
	
    if (!form.country.value.trim()) {
        document.getElementById("countryError").innerHTML = "Country is required.";
        isValid = false;
    }
	if (!form.state.value) {
	        document.getElementById("stateError").innerHTML = "State is required.";
	        isValid = false;
	    }
	
	if (!form.zip.value.trim()) {
	       document.getElementById("zipError").innerHTML = "Zip is required.";
	       isValid = false;
	   }
	if (residentType !== '101') {
	      const idTypeValue = document.getElementById("hiddenIdType").value;

	if (!idTypeValue.trim()) {
	      document.getElementById("idTypeError").innerHTML = "Id Type is required for non-Malaysian residents.";
	      isValid = false;
	  } else {
	           document.getElementById("idTypeError").innerHTML = ""; 
	    }
	  }

	if (!form.idNumber.value.trim()) {
	     document.getElementById("idNumberError").innerHTML = "Id Number is required.";
	     isValid = false;
	 }
	 if (!form.nameAsPerId.value.trim()) {
	 	  document.getElementById("nameAsPerIdError").innerHTML = "Name AS Per Id is required.";
	 	  isValid = false;
	 }
	 if (!form.issuedCountry.value) {
	        document.getElementById("issuedCountryError").innerHTML = "Issued Country is required.";
	        isValid = false;
	    }
		
	if (!form.issuedAt.value) {
		      document.getElementById("issuedAtError").innerHTML = "Issued At is required.";
		      isValid = false;
		 }
	 if (!form.issuedBy.value) {
		      document.getElementById("issuedByError").innerHTML = "Issued By is required.";
		      isValid = false;
		 }
//	 if (issuedOn && issuedOn > today) {
//		        issuedOnError.innerHTML = "Issued date cannot be in the future.";
//		        isValid = false;
//		 }
//
//		    // Check if dateOfExpiry is later than issuedOn
//	 if (issuedOn && dateOfExpiry && dateOfExpiry <= issuedOn) {
//		        dateOfExpiryError.innerHTML = "Expiry date must be later than the issued date.";
//		        isValid = false;
//		}	
			
	if (!form.annualIncomeRangeId.value) {
				document.getElementById("annualIncomeRangeIdError").innerHTML = "Annual Income is required.";
				isValid = false;
		}
					

	if (!form.annualIncomeCurrencyCode.value) {
				 document.getElementById("annualIncomeCurrencyCodeError").innerHTML = "Annual Income Currency is required.";
				 isValid = false;
		 }
	if (!form.riskRatingId.value) {
		 	 document.getElementById("riskRatingIdError").innerHTML = "Risk Rating Id is required.";
		 	 isValid = false;
		}
	if (!form.incomeType.value) {
			 document.getElementById("incomeTypeError").innerHTML = "Income Type is required.";
			isValid = false;
		 }
	if (!form.professionCategory.value) {
		 	 document.getElementById("professionCategoryError").innerHTML = "Profession Category is required.";
		 	 isValid = false;
		  }	
		  
	if (!form.employerName.value.trim()) {
		  		 document.getElementById("employerNameError").innerHTML = "Employee Name is required.";
		  		  isValid = false;
		  }

	if (!form.employerAddress.value.trim()) {
		  		   document.getElementById("employerAddressError").innerHTML = "Employee Address is required.";
		  		   isValid = false;
		  }

	if (!form.employerPhone.value.trim()) {
		  			document.getElementById("employerPhoneError").innerHTML = "Employee Phone No. is required.";
		  			 isValid = false;
		 }
	if (!form.txnVolMonth.value.trim()) {
		 		document.getElementById("txnVolMonthError").innerHTML = "Transaction Volume Month is required.";
		 		 isValid = false;
		}
	if (!form.txnCountMonth.value.trim()) {
		 		 document.getElementById("txnCountMonthError").innerHTML = "Transaction Count Month is required.";
		 		 isValid = false;
		}
	if (!form.firstLanguage.value.trim()) {
		 		 document.getElementById("firstLanguageError").innerHTML = "First Language is required.";
		 		 isValid = false;
		}
	if (!form.maritalStatus.value) {
				 document.getElementById("maritalStatusError").innerHTML = "Marital Status is required.";
				 isValid = false;
		}
		if (!form.occupationId.value) {
				 document.getElementById("occupationIdError").innerHTML = "Occupation Id is required.";
				 isValid = false;
		}
				
		var primaryMobileNumber = $("#primaryMobileNumber").val();
		var primaryMobileNumberError = document.getElementById("primaryMobileNumberError");

	
		primaryMobileNumberError.innerHTML = ""; // Clear any previous error

		if (!primaryMobileNumber) {
		    primaryMobileNumberError.innerHTML = "Primary mobile number is required.";
		    isValid = false;
		} else {
		    // Check if mobile number is in the correct format (10-15 digits)
		    if (!/^\d{10,15}$/.test(primaryMobileNumber)) {
		        primaryMobileNumberError.innerHTML = "Enter a valid mobile number (10-15 digits).";
		        isValid = false;
		    } else {
		        // Make the AJAX call to verify if the mobile number exists
		        $.ajax({
		            url: "/caas/api/v2/customer/verify-mobile", 
		            type: "GET",
		            async: false,  // Ensure synchronous behavior for validation
		            data: { primaryMobileNumber: primaryMobileNumber },
		            success: function (response) {
		                console.log("API Response: ", response);
		                
		                // If the response contains a message
		                if (response && response.message) {
		                    primaryMobileNumberError.innerHTML = response.message;  // Show the server message

		                    // If customer already exists, mark as invalid
		                    if (response.message === "Customer already exists with this mobile number.") {
		                        isValid = false; // Mobile number exists, so not valid
		                    } else {
		                        isValid = true;  // Mobile number is available
		                    }
		                } else {
		                    primaryMobileNumberError.innerHTML = "Unexpected response from the server.";
		                    isValid = false;
		                }
		            },
		            error: function (xhr, status, error) {
		                console.log("AJAX Error Status: ", status);  // Log the status
		                console.log("AJAX Error Response: ", xhr.responseText);  // Log response details
		                primaryMobileNumberError.innerHTML = "Error verifying mobile number.";
		                isValid = false;  // In case of error, mark as invalid
		            }
		        });
		    }
		}
	 

//    if (!isValid) {
//        alert("Please fill in all required fields.");
//    }

    return isValid;
}
