function validationForm(){
	console.log("Validation function triggered");
		
		    
	document.getElementById("companyIdError").innerHTML = "";
	document.getElementById("countriesError").innerHTML = "";
	document.getElementById("currenciesError").innerHTML = "";
	document.getElementById("companyNameError").innerHTML = "";
	document.getElementById("companyDisplayNameError").innerHTML = "";
	document.getElementById("address1Error").innerHTML = "";
	document.getElementById("address2Error").innerHTML = "";
	document.getElementById("timeZoneError").innerHTML = "";
	
	if (!form.companyId.value) {
	      document.getElementById("companyIdError").innerHTML = "Company Id is required.";
	      isValid = false;
	  }
		   
			
	
}