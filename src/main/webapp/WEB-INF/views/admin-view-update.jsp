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
function updateAdmin() {
	/* if(!validation($("#adminForm")))  {
        return false;  
    } */
    const id = $('#id').val();
    const formData = $("#adminForm").serializeArray(); 
    const data = {};
    formData.forEach(item => data[item.name] = item.value); 

    $('#loader').show();
    $('#submitButton').prop('disabled', true);
    $.ajax({
        url: "/admin-update?id=" + id,
        type: "PUT",
        contentType: "application/json", // Send JSON data
        data: JSON.stringify(data),
        success: function(response) {
            $('#loader').hide();
            $('#submitButton').prop('disabled', false);
            alert(response);
        },
        error: function(xhr) {
            $('#loader').hide();
            $('#submitButton').prop('disabled', false);
            alert("Error: " + xhr.responseText);
        }
    });
}

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
							class="feather-user-plus me-2"></i> <span>Add Admin</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content p-3">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<%-- <jsp:include page="subheaderagent.jsp"></jsp:include> --%>
					</div>
					<form:form method="post" modelAttribute="user" id="adminForm"
						enctype="multipart/form-data" onsubmit="event.preventDefault(); updateAdmin();">
						<form:hidden path="id" value="" id="id"/>
						<div class="card-body lead-status">

							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Admin Name<span
										class="text-danger">*</span></label>
									<form:input path="adminName" type="text" class="form-control"
										id="adminName" placeholder="Admin Name" />
									<span id="adminNameError" style="color: red;"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">User Name<span
										class="text-danger">*</span></label>
									<form:input path="username" type="text" class="form-control"
										id="userName" placeholder="User Name" />
									<span id="userNameError" style="color: red;"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Phone Number <span
										class="text-danger">*</span></label>
									<form:input path="phoneNumber" type="text" class="form-control"
										id="phoneNumber" placeholder="Phone Number" />
									<span id="phoneNumberError" style="color: red;"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Email<span
										class="text-danger">*</span></label>
									<form:input path="email" type="text" class="form-control"
										id="email" placeholder="Email" />
									<span id="emailError" style="color: red;"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Country<span
										class="text-danger">*</span></label> <select class="form-control"
										id="country" name="country">
										<c:forEach items="${countryList}" var="country">
											<option value="${country.valueId}">${country.description}</option>
										</c:forEach>
									</select> <span id="countryError" style="color: red;"></span>
								</div>

							</div>
							<div class="row">
								<div class="col-10"></div>
								<div class="col-2 text-end mb-2">
									<button type="submit"
										class="btn btn-primary btn-lg next-button">Submit</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>



	<!-- Vendor JS Files -->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/dataTables.min.js"></script>
	<script src="assets/vendors/js/dataTables.bs5.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script type="text/javascript" src="js/adminSignUp.js"></script>

</body>
</html>
