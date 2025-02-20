function validation(form) {
    	let isValid = true; 
		const agentId = $(form).find("#agentId").val().trim();
		const agentName = $(form).find("#agentName").val().trim();
		const countries = $(form).find("#countries").val();
		const currencies = $(form).find("#currencies").val();
		const state = $(form).find("#state").val();
		const agentDisplayName = $(form).find("#agentDisplayName").val().trim();
		const address1 = $(form).find("#address1").val().trim();
		const address2 = $(form).find("#address2").val().trim();
		const city = $(form).find("#city").val().trim();
		const zip = $(form).find("#zip").val().trim();
		const timeZone = $(form).find("#timeZone").val();
		const email = $(form).find("#email").val().trim();
		const mobile = $(form).find("#mobile").val().trim();
		const phone = $(form).find("#phone").val().trim();
		const contactPerson = $(form).find("#contactPerson").val().trim();
		const misEmailId = $(form).find("#misEmailId").val().trim();
		const taxIdentificationNumber = $(form).find("#taxIdentificationNumber").val().trim();
		const licenceNo = $(form).find("#licenceNo").val().trim();
		const working = $(form).find("#working").val();
		const daily = $(form).find("#daily").val().trim();
		const settlementMode = $(form).find("#settlementMode").val();
		const settlementType = $(form).find("#settlementType").val();
		const perTransactionLimit = $(form).find("#perTransactionLimit").val().trim();
		const clientSecret = $(form).find("#clientSecret").val();
		const clientId = $(form).find("#clientId").val();
		const scope = $(form).find("#scope").val();
		const grantType = $(form).find("#grantType").val();
		const perDayLimit = $(form).find("#perDayLimit").val().trim();
		const perMonthLimit = $(form).find("#perMonthLimit").val().trim();
		const adminUserName = $(form).find("#adminUserName").val();
		const adminPassword = $(form).find("#adminPassword").val();	
		const username = $(form).find("#username").val();	
		const branchLocationId = $(form).find("#branchLocationId").val();
		$(".text-danger1").text("").css("color", "red");

	if (agentId === "") {
		$("#agentIdError").text("Agent Id is required.");
//        $("#branchName").after('<span class="error" style="color:red;">Branch Name is required.</span>');
		 isValid = false;
    }
    if (agentName === "") {
		$("#agentNameError").text("Agent Name is required.");
        isValid = false;
    }

    if (!countries ||countries === "" || countries === "Select") {
		$("#countriesError").text("Country is required.");
        isValid = false;
    }
	if (!currencies ||currencies === "" || currencies === "Select") {
		$("#currenciesError").text("Country Currency is required.");
	    isValid = false;
    }
	if (!state ||state === "" || state === "Select") {
	   	$("#stateError").text("State is required.");
	   	isValid = false;
	}
	if (agentDisplayName === "") {
		$("#agentDisplayNameError").text("Agent Display Nameis required.");
	       isValid = false;
	}
	if (address1 === "") {
		$("#address1Error").text("Address1 is required.");
			   isValid = false;
	 }
	if (address2 === "") {
		$("#address2Error").text("Address2 is required.");
		 isValid = false;
	 }
	 if (city === "") {
		$("#cityError").text("City is required.");
		 isValid = false;
	 }
	 if (zip === "") {
	 	$("#zipError").text("Zip is required.");
	 	 isValid = false;
	  }
	 if (!timeZone || timeZone === "" || timeZone === "Select") {
	 		$("#timeZoneError").text("TimeZone  is required.");
	 		 isValid = false;
	 	 }
	 if (contactPerson === "") {
		 $("#contactPersonError").text("Contact Person is required.");
		  isValid = false;
	 }
	 if (email === "") {
		$("#emailError").text("Email is required.");
		 isValid = false;
	 }
	 if (phone === "") {
		$("#phoneError").text("Phone is required.");
		 isValid = false;
	 }
	 if (misEmailId === "") {
		$("#misEmailIdError").text("Mis EmailId is required.");
		 isValid = false;
	 }
	 
	 if (taxIdentificationNumber === "") {
		$("#taxIdentificationNumberError").text("Tax Identification NumberId is required.");
		 isValid = false;
	 }
	 if (licenceNo === "") {
		$("#licenceNoError").text("Licenec No is required.");
		 isValid = false;
	 }
	if (!working || working === "" || working === "Select") {
		$("#workingError").text("Working Hours is required.");
	 	isValid = false;
	}
	if (misEmailId === "") {
		$("#misEmailIdError").text("Mis EmailId is required.");
		 isValid = false;
	 }
	if (daily === "") {
	 	$("#dailyError").text("Daily is required.");
	 	 isValid = false;
	 }
    if (!settlementMode || settlementMode === "" || settlementMode === "Select") {
	 	$("#settlementModeError").text("Settlement Mode  is required.");
	 	 isValid = false;
	 }
	 if (!settlementType || settlementType === "" || settlementType === "Select") {
	 	 $("#settlementTypeError").text("Settlement Type  is required.");
	 	  isValid = false;
	 }
	 if (!perTransactionLimit || perTransactionLimit === "" || perTransactionLimit === "Select") {
	  	 $("#perTransactionLimitError").text("Per Transaction Limit  is required.");
	  	  isValid = false;
	  }
	 if (!perDayLimit || perDayLimit === "" || perDayLimit === "Select") {
	     $("#perDayLimitError").text("Per Day Limit  is required.");
	      isValid = false;
	  }
	 if (!perMonthLimit || perMonthLimit === "" || perMonthLimit === "Select") {
		 $("#perMonthLimitError").text("Per Month Limit  is required.");
		  isValid = false;
	  }

	 if (clientSecret === "") {
	  	 $("#clientSecretError").text("Client Secret is required.");
	  	  isValid = false;
	  }
	 if (clientId === "") {
	  	 $("#clientIdError").text("Client Id is required.");
	  	  isValid = false;
	  }
	 if (scope === "") {
	  	 $("#scopeError").text("Scope is required.");
	  	  isValid = false;
	  }
	 if (grantType === "") {
	  	 $("#grantTypeError").text("Grant Type is required.");
	  	  isValid = false;
	  }
	  if (adminUserName === "") {
	  	 $("#adminUserNameError").text("User Name is required.");
	  	  isValid = false;
	  }
	  if (adminPassword === "") {
		 $("#adminPasswordError").text("Password is required.");
		  isValid = false;
	  }
	  if (username === "") {
	     $("#userNameError").text("User Name is required.");
	     isValid = false;
	  }
	  if (branchLocationId === "") {
	  		$("#branchLocationIdError").text("Agent Location Id is required.");
	          isValid = false;
	      }
	  if (!isValid) {
	          document.getElementById("validationError").style.display = "block";
	      }
    return isValid;
}
