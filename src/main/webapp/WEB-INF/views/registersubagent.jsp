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

</head>

<body>
	<div class="nxl-navigation">
		<jsp:include page="header.jsp"></jsp:include>

	</div>

	<div class="nxl-container">
		<div class="page-header">
			<div class="page-header-right ms-auto">
				<div class="page-header-right-items">
					<div
						class="d-flex align-items-center gap-2 page-header-right-items-wrapper">

						<a href="javascript:void(0);" class="btn btn-primary "> <i
							class="feather-user-plus me-2"></i> <span>Add SubAgent</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content" style="margin-top: -89px;">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<jsp:include page="subheadersubagent.jsp"></jsp:include>
					</div>
					<form:form action="subgent" modelAttribute="subAgentDTO"
						method="post">
						<form:hidden path="step" value="1" />
						<div class="card-body lead-status">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Company</label>
									<form:select path="agent" class="form-control" multiple="false">
										<form:options items="${agentList}" itemValue="aId"
											itemLabel="companyName" />
									</form:select>
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-2">
									<label class="form-label">Agent Mode</label>
									<div>
										<div>
											<form:radiobutton path="agentMode" value="true" id="Active"
												class="form-check-input" />
											<label for="Active">Head office</label> &nbsp;&nbsp;
											<form:radiobutton path="agentMode" value="false"
												id="Inactive" class="form-check-input" />
											<label for="Inactive"> Transaction</label>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">AgentType</label>
									<form:select path="agentTypes" class="form-control"
										multiple="false">
										<form:options item="agentTypeList" itemValue="agentTypeId"
											itemLabel="type" />
									</form:select>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Agent Channel</label> <select
										class="form-control" id="currencySelect">
										<option value="" disabled="" selected="">Select
											Currency</option>
										<option value="Web">Web</option>
										<option value="Digital">Digital</option>
										<option value="mobile">mobile</option>
										<option value="FC WholeSale Agent">FC WholeSale Agent</option>
									</select>
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Agent Channel Id</label>
									<form:input path="agentChannelId" type="text"
										class="form-control" id="statusInput"
										placeholder="Agent Channel Id" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">AgentName</label>
									<form:input path="SubAgentName" type="text"
										class="form-control" id="sourceInput"
										placeholder="Sub Agent Name" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">AgentDisplayName</label>
									<form:input path="SubAgentDisplayName" type="text"
										class="form-control" id="visibilityInput"
										placeholder="AgentDisplayName" />
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Address1</label>
									<form:input path="address1" type="text" class="form-control"
										id="statusInput" placeholder="Address1" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Address2</label>
									<form:input path="address2" type="text" class="form-control"
										id="visibilityInput" placeholder="Address2" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Address3</label>
									<form:input path="address3" type="text" class="form-control"
										id="visibilityInput" placeholder="Address3" />
								</div>

								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">City</label>
									<form:input path="city" type="text" class="form-control"
										id="statusInput" placeholder="City" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">State</label>
									<form:input path="state" type="text" class="form-control"
										id="visibilityInput" placeholder="State" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Zip/PoBox</label>
									<form:input path="zip" type="text" class="form-control"
										id="sourceInput" placeholder="Zip/PoBox" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Working Hours </label>
									<form:select path="working" class="form-control" multiple="false">
										<form:options items="${workinghourslist}" itemValue="id"
											itemLabel="timeRange" />
									</form:select>
								</div>
							</div>
							<div class="row">
								<div class="col-10"></div>
								<div class="col-2 text-end mb-2">
									<button type="submit"
										class="btn btn-primary btn-lg next-button">Next</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Vendor JS Files -->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/dataTables.min.js"></script>
	<script src="assets/vendors/js/dataTables.bs5.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
</body>
</html>
