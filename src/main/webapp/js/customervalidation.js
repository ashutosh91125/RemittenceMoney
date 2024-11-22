function validation(form){
	document.getElementById("firstNameError").innerHTML = "";
	document.getElementById("lastNameError").innerHTML = "";
	document.getElementById("nationalityError").innerHTML = "";
	document.getElementById("dateOfBirthError").innerHTML = "";
	
	let isValid = true;
	let firstName = form.firstName.value.trim();
	let lastName  = form.lastName.value.trim();
	let nationality =form.nationality.value.trim();
	let dateOfBirth =form.dateOfBirth.value.trim();

	if(firstName == "" || firstName==null){
		document.getElementById("firstNameError").innerHTML = "First Name Is Required";
		isValid = false; 
	} 
	if(lastName == ""  || lastName==null){
		document.getElementById("lastNameError").innerHTML = "Last Name Is Required";
		isValid = false; 
	}
	if(nationality == ""){
			document.getElementById("nationalityError").innerHTML = "Nationality Is Required";
			isValid = false; 
		}
	if(dateOfBirth == ""){
			document.getElementById("dateOfBirthError").innerHTML = "Date Of Birth Is Required";
			isValid = false; 
		}else{
			let dob = new Date(dateOfBirth);
			let today = new Date();
			let age = today.getFullYear() - dob.getFullYear();
			let m = today.getMonth() - dob.getMonth();
			if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
						age--;
			}
			if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
						age--;
			}
			if (age < 18) {
						document.getElementById("dateOfBirthError").innerHTML = "You must be at least 18 years old";
						isValid = false;
			}
		}
		if (!isValid) {
		       // Optionally show a general error message
		       alert("Please fill in all required fields.");
		   }
	return isValid;  
}
