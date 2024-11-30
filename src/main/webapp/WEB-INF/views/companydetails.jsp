<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">
<title>payment.html</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#country')
								.on(
										'change',
										function() {
											let dependent = $(this).val(); // Get the selected country value
											if (dependent) { // Check if a country is selected
												$
														.ajax({
															url : '/api/enumEntities/dependent', // Ensure this matches your controller's URL mapping
															type : 'GET',
															data : {
																dependent : dependent
															}, // Pass the selected country ID
															success : function(
																	data) {
																// Clear the state dropdown and populate with new options
																$(
																		'#countryCurrency')
																		.empty()
																		.append(
																				'<option value="" disabled selected>Select Currency</option>');
																$
																		.each(
																				data,
																				function(
																						index,
																						enumValue) {
																					$(
																							'#countryCurrency')
																							.append(
																									'<option value="' + enumValue.valueId + '">'
																											+ enumValue.description
																											+ '</option>');
																				});
															},
															error : function() {
																console
																		.error("Error fetching currency for the selected country.");
															}
														});
											} else {
												// Reset the state dropdown if no country is selected
												$('#countryCurrency')
														.empty()
														.append(
																'<option value="" disabled selected>Select Currency</option>');
											}
										});
					});
</script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="nxl-container" style="background: aliceblue;">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
						<a href="javascript:void(0);"
							class="btn btn-primary successAlertMessage"> <i
							class="feather-user-plus me-2"></i> <span>Add Agent</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content" style="margin-top: -89px;">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<jsp:include page="subheaderagent.jsp"></jsp:include>
					</div>
					<form:form action="agent" modelAttribute="agent" method="post" onsubmit="return validationForm(this)">
						<form:hidden path="step" value="1" />
						<div class="card-body lead-status">

							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Company Id<span
										class="text-danger">*</span></label>
									<form:input path="companyId" type="text" class="form-control"
										id="statusInput" placeholder="Company Id" />
									<span id="companyIdError" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Country<span
										class="text-danger">*</span></label>
									<form:select path="countries" class="form-control"
										data-select2-selector="icon" multiple="false"
										id="country">
										<form:option value="" disabled="true" selected="true">Country</form:option>
										<form:options items="${countryList}" itemValue="valueId"
											itemLabel="description" />
									</form:select>
									<span id="countriesError" class="text-danger"></span>
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Country Currency<span
										class="text-danger">*</span></label>
									<form:select path="currencies" id="countryCurrency"
										class="form-control" data-select2-selector="icon"
										multiple="false">
										<form:option value="" disabled="true" selected="true">Country Currency</form:option>
									</form:select>
									<span id="currenciesError" class="text-danger"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Company Name<span
										class="text-danger">*</span></label>
									<form:input path="companyName" type="text" class="form-control"
										id="statusInput" placeholder="Company Name" />
									<span id="companyNameError" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Company Display Name<span
										class="text-danger">*</span></label>
									<form:input path="companyDisplayName" type="text"
										class="form-control" id="sourceInput"
										placeholder="Company Display Name" />
									<span id="companyDisplayNameError" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Address1<span
										class="text-danger">*</span></label>
									<form:input path="address1" type="text" class="form-control"
										id="visibilityInput" placeholder="Address1" />
									<span id="address1Error" class="text-danger"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Address2<span
										class="text-danger">*</span></label>
									<form:input path="address2" type="text" class="form-control"
										id="statusInput" placeholder="Address2" />
									<span id="address2Error" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Address3</label>
									<form:input path="address3" type="text" class="form-control"
										id="sourceInput" placeholder="Address3" />
									<span id="address3Error" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">City<span class="text-danger">*</span></label>
									<form:input path="city" type="text" class="form-control"
										id="visibilityInput" placeholder="City" />
									<span id="cityError" class="text-danger"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">State</label>
									<form:input path="state" type="text" class="form-control"
										id="statusInput" placeholder="State" />
									<span id="stateError" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Zip/PoBox</label>
									<form:input path="zip" type="text" class="form-control"
										id="sourceInput" placeholder="Zip/PoBox" />
									<span id="zipError" class="text-danger"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">TimeZone<span
										class="text-danger">*</span></label>
									<%-- <form:select path="timeZone" class="form-control"
										multiple="false">
										<form:options items="${timezonelist}" itemValue="timeZoneId"
											itemLabel="zone" />
									</form:select> --%>
									<span id="timeZoneError" class="text-danger"></span>
								</div>

							</div>
							<div class="row">
								<div class="col-10"></div>
								<div class="col-2 text-end mb-2">
									<button type="submit" onclick="submit()"
										class="btn btn-primary btn-lg next-button">Next</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


	<script src="js/agent.js"></script>
	<!-- Vendor JS Files -->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/dataTables.min.js"></script>
	<script src="assets/vendors/js/dataTables.bs5.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
</body>
</html>
