function validation(form) {
	    console.log("Validation function triggered");
		let isValid = true;
		
	document.getElementById("adminNameError").innerHTML = "";
    document.getElementById("userNameError").innerHTML = "";
    document.getElementById("phoneNumberError").innerHTML = "";
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("passwordError").innerHTML = "";
	document.getElementById("countryError").innerHTML = "";
	
	if (!form.adminName.value.trim()) {
		 document.getElementById("adminNameError").innerHTML = "Admin Name is required.";
		 isValid = false;
	}
	if (!form.userName.value.trim()) {
		 document.getElementById("userNameError").innerHTML = "user Name is required.";
		 isValid = false;
	}
	if (!form.phoneNumber.value.trim()) {
		 document.getElementById("phoneNumberError").innerHTML = "Phone Number is required.";
		 isValid = false;
	}
	if (!form.email.value.trim()) {
		 document.getElementById("emailError").innerHTML = "Email is required.";
		 isValid = false;
	}
	if (!form.password.value.trim()) {
		 document.getElementById("passwordError").innerHTML = "Password is required.";
		 isValid = false;
	}
	if (!form.country.value) {
	     document.getElementById("countryError").innerHTML = "Country is required.";
	     isValid = false;
	}
	if (!isValid) {
	          document.getElementById("validationError").style.display = "block";
	      }
	return   isValid;
    }