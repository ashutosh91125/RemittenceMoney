function validation(form) {
    	let isValid = true; 
		$(".text-danger1").text("").css("color", "red");
		const id = $(form).find("#id").val();
		const branches = $(form).find("#branches").val();
		const firstName = $(form).find("#firstName").val().trim();
		const lastName = $(form).find("#lastName").val().trim();
		const username = $(form).find("#username").val().trim();
		const email = $(form).find("#email").val().trim();
		const mobile = $(form).find("#mobile").val().trim();
		
		if (!branches || branches.length === 0 || branches.includes("Select")) {
		    $("#branchError").text("Branch is required.");
		    isValid = false;
		}

		if (!firstName || firstName === "" ) {
				$("#firstNameError").text("First Name  is required.");
				isValid = false;
			}
			
		if (!lastName || lastName === "" ) {
				 $("#lastNameError").text("Last Name  is required.");
				 isValid = false;
			 }
		 if (!username || username === "" ) {
			 	 $("#usernameError").text("User Name  is required.");
			 	  isValid = false;
			 }
		
		 if (email === "") {
			  	  $("#emailError").text("Email is required.");
			  	  isValid = false;
			  }
			  
	     if (mobile === "") {
			  	  $("#mobileError").text("Mobile is required.");
			  	  isValid = false;
			}
		if (!isValid) {
			       document.getElementById("validationError").style.display = "block";
		   }
  return isValid;
}