<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">

<title>Staff Details</title>

<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/select2-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/datepicker.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEJr1X2X-0yyJ9s5ANx6kPqcp8TDCwNjdbREKxQl11jOlWEeUwzoytbDxs9yE"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js'></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Feather Icons (optional for search icon) -->
<script src="https://unpkg.com/feather-icons"></script>

<link rel="stylesheet" type="text/css" href="css/common.css">





<style>
.search-bar-container input {
	width: 100%;
}

.radio-container label {
	display: block;
	margin: 5px 0;
}

.search-bar-container {
	margin: 15px 0;
}

.search-heading {
	font-size: 17px;
}

/  for accordion  /
.accordion-button::after {
	display: none;
}
/  Add a custom icon to the left of the accordion button  /
.accordion-button::before {
	content: "\f107"; /  Font Awesome chevron-down icon  /
	font-family: 'Font Awesome 5 Free';
	font-weight: 900;
	margin-right: 10px;
	font-size: 16px;
	transition: transform 0.3s;
}

/  Rotate icon when the accordion is open  /
.accordion-button[aria-expanded="true"]::before {
	transform: rotate(180deg);
}

.accordion-button {
	background-color: aliceblue;
}

.accordion .accordion-item {
	background-color: aliceblue;
}

.spinner-container {
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	display: none;
}

/  Ensure the .form-control class applies uniformly to inputs and selects  /
.form-control {
	width: 100%;
	/  Ensures input and select elements take up the full column width  /
	height: 46px;
	/  Set a consistent height for both input fields and selects  /
	padding: 10px; /  Adds padding for better appearance  /
	box-sizing: border-box; /  Ensures padding doesn't affect width  /
}

/  Optional: Remove any internal margins/padding that could affect layout  /
.col-xl-4 {
	padding-left: 8px;
	padding-right: 8px;
}

.mb-4 {
	margin-bottom: 1.5rem; /  Maintain consistent spacing between fields  /
}

/  Remove any width restrictions if there are any  /
.form-control:focus {
	border-color: #5e72e4; /  Optional: focus effect  /
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	/  Optional: focus effect  /
}

#search-result td {
	padding: 5px; /  Adjust padding  /
	font-size: 12px; /  Adjust font size  /
	white-space: nowrap; /  Prevent wrapping  /
}

#search-result th {
	padding: 5px; /  Adjust padding  /
	font-size: 12px; /  Adjust font size  /
	white-space: nowrap; /  Prevent wrapping  /
}

.hidden {
	display: none;
}
</style>
<script type="text/javascript" src="js/commons.js"></script>
<script>

     function registerStaff() {
//         const formData = $("#staffForm").serialize(); 
		const id = $('#id').val();
        $('#submitButton').prop('disabled', true);
        $.ajax({
            url: "/staff-update-form?id=" +id,
            type: "GET",
            contentType: "application/x-www-form-urlencoded",
//             data: formData,
            success: function(response) {
                $('#loader').hide();
                $('#submitButton').prop('disabled', false);
//                 alert(response);
                $('body').html(response);
            },
            error: function(xhr) {
                $('#loader').hide();
                $('#submitButton').prop('disabled', false);
                alert("Error: " + xhr.responseText);
            }
        });
    }
$(document).ready(function () {
    const status = document.getElementById('status'); 
    
    if (status.value === 'true') {
    	status.value = 'Active';
    }
    else{
    	status.value = 'Inactive';
    }
});
</script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="nxl-content" style="background: aliceblue;">

			<div class="page-header" style="background: aliceblue;">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Staff</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Staff Details</li>
					</ul>
				</div>
				<div class="page-header-right ms-auto">
					<div class="page-header-right-items">
						<div class="d-flex d-md-none">
							<a href="javascript:void(0)"
								class="page-header-right-close-toggle"> <i
								class="feather-arrow-left me-2"></i> <span>Back</span>
							</a>
						</div>
						<!-- <div
							class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
							<a href="javascript:void(0);"
								class="btn btn-primary successAlertMessage">  <i class="feather-user-plus me-2"></i>
								<span>Transfer</span>
							</a>
						</div> -->
						<div>
							<a onclick="goBack()" class="back-btn">
   								 <i class="bi bi-arrow-left-circle text-primary normal-icon"></i>
    							 <i class="bi bi-arrow-left-circle-fill text-primary hover-icon"></i>
							</a>
						</div>
							<label class="form-label">Back</label>
					</div>
					<div class="d-md-none d-flex align-items-center">
						<a href="javascript:void(0)" class="page-header-right-open-toggle">
							<i class="feather-align-right fs-20"></i>
						</a>
					</div>
				</div>
			</div>
		</div>		

		 <div class="spinner-container" id="loader">
			<div class="spinner-border text-primary" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-pzjw8f+ua7Kw1TIq0FB2a7oI4GvYbgPpQXqzZyoxFQsF3jyBzJrb8tO9gW0Gi7km"
			crossorigin="anonymous"></script>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<form:form id="staffForm" modelAttribute="staff" onsubmit="event.preventDefault(); registerStaff();">
		<form:hidden path="id" value="" id="id"/>
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseOne')">Staff
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show">
						<div class="accordion-body mt-2"
							style="background: aliceblue; margin-top: -40px;">
							<div class="main-content">
								<div class="row">
								    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Branch<span
                                                class="text-danger"> </span></label>
                                             <c:set var="branchNames" value="" />
											<%-- <c:forEach var="branch" items="${branches}">
   											 <c:set var="branchNames" value="${branchNames}${branch}, " />
											</c:forEach>
											<input type="text" class="form-control" id="branch" 
      										 value="${fn:substring(branchNames, 0, fn:length(branchNames) - 2)}" readonly="true" required="true" /> --%>
      										 <input type="text" class="form-control" id="branch" 
      										 value="${branches}" readonly="true" required="true" />
                                            <span id="branchError" class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">First Name<span
												class="text-danger"> </span></label>
											<form:input path="firstName" type="text"
                                                class="form-control" id="firstName"
                                                placeholder="Enter your First Name" required='true' readonly="true" />

											<span id="firstNameError" class="text-danger"></span>
										</div>
									</div>
									 <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Middle Name<span
                                                class="text-danger"> </span></label>
                                            <form:input path="middleName" type="text"
                                                class="form-control" id="middleName"
                                                placeholder="Enter your Middle Name" required='true' readonly="true" />

                                            <span id="firstNameError" class="text-danger"></span>
                                        </div>
                                    </div>
								</div>
								<div class="row"> 
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Last Name<span
                                                class="text-danger"> </span></label>
                                            <form:input path="lastName" type="text"
                                                class="form-control" id="lastName"
                                                placeholder="Enter your Last Name" required='true' readonly="true" />

                                            <span id="lastNameError" class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Username<span
                                            class="text-danger"> </span></label>
                                            <form:input path="username" type="text"
                                            class="form-control" id="username"
                                            placeholder="Set your Username" required='true' readonly="true" />

                                            <span id="usernameError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Status</label>
                                            <form:input path="status"  class="form-control"
                                                id="status" readonly="true" placeholder="Status"/>
                                        </div>
                                    </div>
								</div>
								<div class="row">
								
								    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Remarks</label>
                                            <form:input path="remarks" type="text" class="form-control"
                                                id="remarks" placeholder="Remarks" readonly="true"/>
                                        </div>
                                    </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseTwo')">Contact
							Details</button>
					</h2>

					<div id="panelsStayOpen-collapseTwo"
						class="accordion-collapse collapse">
						<hr class="my-0">
						<div class="card-body pass-security">
							<div class="accordion-body mt-3">
								<div class="card-body personal-info">
									<div class="main-content">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Email<span
														class="text-danger"> </span></label>
													<form:input path="email" type="email" class="form-control"
														id="email" placeholder="Email" required='true' readonly="true" />
													<span id="emailError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mobile</label>
													<form:input path="mobile" type="tel" class="form-control"
														id="mobile" placeholder="Mobile" required='true' readonly="true" />
													<span id="mobileError" class="text-danger"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseThree')">Audit
							Tails</button>
					</h2>
					<div id="panelsStayOpen-collapseThree"
						class="accordion-collapse collapse">
						<div class="accordion-body" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Created By<span
														class="text-danger"> </span></label>
													<form:input path="createdBy" type="text"
														class="form-control" id="createdBy"
														placeholder="Created By" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Created On</label>
													<form:input path="createdOn" type="text"
														class="form-control" id="createdOn"
														placeholder="Created On" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified By</label>
													<form:input path="modifiedBy" type="text"
														class="form-control" id="modifiedBy"
														placeholder="Modified By" readonly="true"/>
												</div>
											</div>
										</div>
										<div class="row">
											 <div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified On</label>
													<form:input path="modifiedOn" type="text" class="form-control"
														id="modifiedOn" placeholder="Modified On" readonly="true"/>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 
			</div> 
			<c:if test="${pageContext.request.isUserInRole('AGENT')}">
			<!--  <div class="mt-5 mb-5 text-center"
				style="display: flex; justify-content: center">
				<button id="submitButton" type="submit" class="btn btn-primary">Update</button>
			</div>  -->
			</c:if>
		</form:form>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>



	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>

</body>

</html>