function validation(form){
	document.getElementById("firstNameError").innerHTML = "";
	document.getElementById("lastNameError").innerHTML = "";
	document.getElementById("nationalityError").innerHTML = "";
	document.getElementById("dateOfBirthError").innerHTML = "";
	
	document.getElementById("buildingNameError").innerHTML = "";
	document.getElementById("streetNameError").innerHTML = "";
	document.getElementById("landmarkError").innerHTML = "";
	document.getElementById("cityError").innerHTML = "";
	document.getElementById("districtError").innerHTML = "";
	document.getElementById("countryError").innerHTML = "";
	let isValid = true;
	let firstName = form.firstName.value.trim();
	let lastName  = form.lastName.value.trim();
	let nationality = form.nationality.value.trim();
	let dateOfBirth = form.dateOfBirth.value.trim();
	
	let buildingName = form.buildingName.value.trim();
	let streetName = form.streetName.value.trim();
	let landmark = from.landmark.value.trim();
	let city = form.city.value.trim();
	let district = form.district.value.trim();
	let country = form.country.value.trim();

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
		if(buildingName == "" || buildingName==null){
						document.getElementById("buildingNameError").innerHTML = "Building Name Is Required";
						isValid = false; 
					} 
		if(streetName == "" || streetName==null){
						document.getElementById("streetNameError").innerHTML = "Street  Is Required";
						isValid = false; 
					} 
		if(landmark == "" || landmark==null){
						document.getElementById("landmarkError").innerHTML = "LandMark  Is Required";
						isValid = false; 
					} 
		if(city == "" || city==null){
						document.getElementById("cityError").innerHTML = "City  Is Required";
						isValid = false; 
					} 			
		
		if(district == "" || district==null){
						document.getElementById("districtError").innerHTML = "District Is Required";
						isValid = false; 
						} 
		if(country == "" || country==null){
				document.getElementById("buildingNameError").innerHTML = "Country Is Required";
				isValid = false; 
			} 
		if (!isValid) {
		       // Optionally show a general error message
		       alert("Please fill in all required fields.");
		   }
	return isValid;  
}
