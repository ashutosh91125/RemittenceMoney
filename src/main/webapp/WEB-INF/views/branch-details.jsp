<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">

<title>Branch Details</title>

<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">
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
Rotate icon when the accordion is open /
.accordion-button[aria-expanded="true"]::before {
	transform: rotate(180deg);
}

.spinner-container {
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	display: none;
}

</style>
<script type="text/javascript" src="js/commons.js"></script>
<script>
	function viewUpdateBranch() {
		const formData = $("#branchForm").serialize(); // Serialize form data for submission
		const id = $("#id").val();
		$('#loader').show();
		$('#submitButton').prop('disabled', true);

		$.ajax({
			url : "/branch?branchId=" + id,
			type : "GET",
			contentType : "application/x-www-form-urlencoded",
			data : formData,
			success : function(response) {
				$('#loader').hide();
				$('#submitButton').prop('disabled', false);

				// Replace the current content with the response (HTML view)
				$('body').html(response);
			},
			error : function(xhr) {
				$('#loader').hide();
				$('#submitButton').prop('disabled', false);
				alert("Error: " + xhr.responseText);
			}
		});
	}
	$(document).ready(function() {
		const status = document.getElementById('status');

		if (status.value === 'true') {
			status.value = 'Active';
		} else {
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
						<h5 class="m-b-10">Branch</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item">Branch Details</li>
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
		<!-- [ page-header ] end -->

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
		<form:form id="branchForm" modelAttribute="branch"
			onsubmit="event.preventDefault(); viewUpdateBranch();">
			<form:hidden path="id" value="" />

			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item" style="background: aliceblue;">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: aliceblue;"
							onclick="toggleDiv('panelsStayOpen-collapseOne')">Branch
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
											<label class="form-label">Branch ID<span
												class="text-danger"> </span></label>
											<form:input path="id" type="text" class="form-control"
												id="brancID" placeholder="Branch ID" readonly="true"
												required='true' />
											<span id="brancIDError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Branch Mode<span
                                                class="text-danger"> </span></label>
                                            <form:input path="branchMode" class="form-control"
                                                id="branchMode" readonly="true" required='true' />
                                            <span id="branchModeError" class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Branch Type<span
                                                class="text-danger"> </span></label>
                                            <form:input path="branchType" class="form-control"
                                                id="branchType" readonly="true" required='true' />
                                            <span id="branchTypeError" class="text-danger"></span>
                                        </div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Branch Name<span
                                                class="text-danger"> </span></label>
                                            <form:input path="branchName" type="text"
                                                class="form-control" id="branchName"
                                                placeholder="Branch Name" readonly="true" required='true' />
                                            <span id="branchNameError" class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Agent<span
                                                class="text-danger"> </span></label> <input value="${agent}"
                                                class="form-control" id="agent" readonly="true"
                                                required='true' /> <span id="agentError"
                                                class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">State<span
												class="text-danger"> </span></label> <input value="${states }"
												class="form-control" id="state" readonly="true"
												required='true' /> <span id="branchChannelIdError"
												class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
								    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Branch Display Name<span
                                                class="text-danger"> </span></label>
                                            <form:input path="branchDisplayName" type="text"
                                                class="form-control" id="branchDisplayName"
                                                placeholder="Branch Display Name" readonly="true"
                                                required='true' />
                                            <span id="branchDisplayNameError" class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 1<span
												class="text-danger"> </span></label>
											<form:input path="address1" type="text" class="form-control"
												id="address1" placeholder="Address1" readonly="true"
												required='true' />
											<span id="address1Error" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Address 2<span
												class="text-danger"> </span></label>
											<form:input path="address2" type="text" class="form-control"
												id="address2" placeholder="Address2" readonly="true"
												required='true' />
											<span id="address2Error" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
								    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Address 3</label>
                                            <form:input path="address3" type="text" class="form-control"
                                                id="address3" placeholder="Address3" readonly="true"
                                                required='true' />
                                            <span id="address3Error" class="text-danger"></span>
                                        </div>
                                    </div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">City<span
												class="text-danger"> </span></label>
											<form:input path="city" type="text" class="form-control"
												id="city" placeholder="City" readonly="true" required='true' />
											<span id="cityError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Zip/PoBox</label>
											<form:input path="zip" type="text" class="form-control"
												id="zip" placeholder="Zip/PoBox" readonly="true"
												required='true' />
											<span id="zipError" class="text-danger"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">CDP Channel</label>
											<form:input path="cdpChannel" class="form-control"
												id="cdpChannel" readonly="true" required='true' />
											<span id="cdpChannelError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">RAAS Channel</label>
											<form:input path="raasChannel" class="form-control"
												id="raasChannel" readonly="true" required='true' />
											<span id="raasChannelError" class="text-danger"></span>
										</div>
									</div>
									<div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Status <span
                                                class="text-danger"> </span></label>
                                            <form:input path="status" class="form-control" id="status"
                                                readonly="true" placeholder="Status" />
                                        </div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-xl-4">
										<div class="mb-4">
											<label class="form-label">Remarks<span
												class="text-danger"> </span></label>
											<form:input path="remarks" type="text" class="form-control"
												id="remarks" placeholder="Remarks" readonly="true" />
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
														id="email" placeholder="Email" readonly="true"
														required='true' />
													<span id="emailError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mobile</label>
													<form:input path="mobile" type="tel" class="form-control"
														id="mobile" placeholder="Mobile" readonly="true"
														required='true' />
													<span id="mobileError" class="text-danger"></span>

												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Phone<span
														class="text-danger"> </span></label>
													<form:input path="phone" type="tel" class="form-control"
														id="phone" placeholder="Phone" readonly="true"
														required='true' />
													<span id="phoneError" class="text-danger"></span>
												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Contact Person<span
														class="text-danger"> </span></label>
													<form:input path="contactPerson" type="tel"
														class="form-control" id="contactPerson"
														placeholder="Contact Person" readonly="true"
														required='true' />
													<span id="contactPersonError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Mis Email Id<span
														class="text-danger"> </span></label>
													<form:input path="misEmailId" type="email"
														class="form-control" id="misEmailId"
														placeholder="Mis Email Id" readonly="true" required='true' />
													<span id="misEmailIdError" class="text-danger"></span>
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
							onclick="toggleDiv('panelsStayOpen-collapseThree')">Regulatory
							Details</button>
					</h2>
					<div id="panelsStayOpen-collapseThree"
						class="accordion-collapse collapse">
						<div class="accordion-body mt-3" style="background: aliceblue;">
							<div class="card-body personal-info">
								<div class="main-content">
									<div class="card-body pass-security">
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Licence Number<span
														class="text-danger"> </span></label>
													<form:input path="licenceNo" type="text"
														class="form-control" id="licenceNo"
														placeholder="Licence Number" readonly="true"
														required='true' />
													<span id="licenceNoError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Outlet Code<span
														class="text-danger"> </span></label>
													<form:input path="outletCode" type="text"
														class="form-control" id="outletCode"
														placeholder="Outlet Code" readonly="true" required='true' />
													<span id="outletCodeError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Working Hours<span
														class="text-danger"> </span></label>
													<form:input path="workingHours" class="form-control"
														id="working" readonly="true" required='true' />
													<span id="workingError" class="text-danger"></span>
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
							onclick="toggleDiv('panelsStayOpen-collapseSeven')">Audit
							Tails</button>
					</h2>
					<div id="panelsStayOpen-collapseSeven"
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
													<label class="form-label">Created On<span
														class="text-danger"> </span></label>
													<form:input path="createdOn" type="text"
														class="form-control" id="createdOn"
														placeholder="Created On" readonly="true" />
												</div>
											</div>
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified By<span
														class="text-danger"> </span></label>
													<form:input path="modifiedBy" type="text"
														class="form-control" id="modifiedBy"
														placeholder="Modified By" readonly="true" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl-4">
												<div class="mb-4">
													<label class="form-label">Modified On<span
														class="text-danger"> </span></label>
													<form:input path="modifiedOn" type="text"
														class="form-control" id="modifiedOn"
														placeholder="Modified On" readonly="true" />
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
				<!-- <div class="mt-5 mb-5 text-center"
					style="display: flex; justify-content: center">
					<button id="submitButton" type="submit" class="btn btn-primary">Update</button>
				</div> --> 
			</c:if>
		</form:form>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


	<script src="assets/vendors/js/vendors.min.js"></script>
	<!-- vendors.min.js {always must need to be top} -->
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<!--! END: Vendors JS !-->
	<!--! BEGIN: Apps Init  !-->
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
	<!--! END: Theme Customizer !-->
</body>

</html>