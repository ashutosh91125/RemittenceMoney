function validation(form) {
    	let isValid = true; 
		 
		const branchName = $(form).find("#branchName").val().trim();
		const agent = $(form).find("#agent").val();
		const branchType = $(form).find("#branchType").val();
		const cdpChannel = $(form).find("#cdpChannel").val();
		const branchDisplayName = $(form).find("#branchDisplayName").val().trim();
		const address1 = $(form).find("#address1").val().trim();
		const address2 = $(form).find("#address2").val().trim();
		const city = $(form).find("#city").val().trim();
		const branchMode = $(form).find("#branchMode").val().trim();
		const state = $(form).find("#state").val();
		const contactPerson = $(form).find("#contactPerson").val().trim();
		const email = $(form).find("#email").val().trim();
		const phone = $(form).find("#phone").val().trim();
		const misEmailId = $(form).find("#misEmailId").val().trim();
		const licenceNo = $(form).find("#licenceNo").val().trim();
		const outletCode = $(form).find("#outletCode").val().trim();
		const workingHours = $(form).find("#workingHours").val();
		const raasChannel = $(form).find("#raasChannel").val();
		// Clear all previous error messages and set text color to red
		$(".text-danger1").text("").css("color", "red");


    if (branchName === "") {
		$("#branchNameError").text("Branch Name is required.");
//        $("#branchName").after('<span class="error" style="color:red;">Branch Name is required.</span>');
        isValid = false;
    }

    if (!agent ||agent === "" || agent === "Select") {
		$("#agentError").text("Agent is required.");
        isValid = false;
    }
	if (!branchType ||  branchType === "" || branchType === "Select") {
		$("#branchTypeError").text("Branch Type is required.");
	       isValid = false;
	}
	if (!cdpChannel || cdpChannel === ""  || cdpChannel === "Select") {
	   	$("#cdpChannelError").text("Cdp Channel is required.");
	          isValid = false;
	 }
	if (branchDisplayName === "") {
		$("#branchDisplayNameError").text("Branch Display Name is required.");
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
	 if (!state || state === "" || state === "Select") {
	 		$("#stateError").text("State  is required.");
	 		 isValid = false;
	 	 }
	 if (branchMode === "") {
		$("#branchModeError").text("Branch Mode is required.");
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
	
	 if (licenceNo === "") {
		$("#licenceNoError").text("Licenec No is required.");
		 isValid = false;
	 }
	 if (outletCode === "") {
		$("#outletCodeError").text("OutLet Code is required.");
		isValid = false;
	}
	if (!workingHours || workingHours === "" || workingHours === "Select") {
		$("#workingHoursError").text("Working Hours is required.");
	 	isValid = false;
	}
	if (!raasChannel || raasChannel === ""  || raasChannel === "Select") {
		$("#raasChannelError").text("RAAS Channel is required.");
		 isValid = false;
	 }
	 if (!isValid) {
	 	          document.getElementById("validationError").style.display = "block";
	 	      }
    return isValid;
}
