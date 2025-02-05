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
	function viewAdminUpdateForm() {
		const id = $("#id").val();
		$.ajax({
			url : "/admin-update-form?id=" + id,
			type : "GET",
			contentType : "application/x-www-form-urlencoded",
			/*   data: formData, */
			success : function(response) {
				$('#loader').hide();
				$('#submitButton').prop('disabled', false);
				 $('body').html(response);
// 				alert(response);
				console.log(response);
			},
			error : function(xhr) {
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
						<!-- <a href="javascript:void(0);"
							class="btn btn-primary successAlertMessage"> <i
							class="feather-user-plus me-2"></i> <span>Add Admin</span>
						</a> -->
					</div>
				</div>
			</div>
		</div>
		<div class="nxl-content p-3">
			<div class="main-content">
				<div class="card border-top-0">
					<form:form method="post" enctype="multipart/form-data"
						modelAttribute="user"
						onsubmit="event.preventDefault(); viewAdminUpdateForm() "
						id="adminForm">
						<form:hidden path="id" value="" id="id" />
						<div class="card-body lead-status">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Admin Name</label>
									<form:input path="adminName" type="text" class="form-control"
										id="adminName" placeholder="Admin Name" readonly="true" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">User Name</label>
									<form:input path="username" type="text" class="form-control"
										id="userName" placeholder="User Name" readonly="true" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Phone Number</label>
									<form:input path="phoneNumber" type="text" class="form-control"
										id="phoneNumber" placeholder="Phone Number" readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Email</label>
									<form:input path="email" type="text" class="form-control"
										id="email" placeholder="Email" readonly="true" />
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Country</label>
									<input value="${country }" id="countries"
										class="form-control" placeholder="Country" readonly="true" />
								</div>
							</div>
							<!-- <div class="mt-5 mb-5 text-center"
								style="display: flex; justify-content: center">
								<button id="submitButton" type="submit" class="btn btn-primary">Update</button>
							</div> --> 
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
</body>
</html>
