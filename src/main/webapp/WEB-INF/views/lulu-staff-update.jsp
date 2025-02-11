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
<title>Lulu Staff Update</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/dataTables.bs5.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<script type="text/javascript" src="js/commons.js"></script>
<script type="text/javascript">
function updateLuluStaff() {
    document.getElementById("adminNameError").innerHTML = "";
    document.getElementById("userNameError").innerHTML = "";
    document.getElementById("phoneNumberError").innerHTML = "";
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("countryError").innerHTML = "";
    document.getElementById("validationError").style.display = "none";

    let isValid = true;
    const adminName = document.getElementById("adminName").value.trim();
    const userName = document.getElementById("userName").value.trim();
    const phoneNumber = document.getElementById("phoneNumber").value.trim();
    const email = document.getElementById("email").value.trim();
    const country = document.getElementById("country").value;

    if (!adminName) {
        document.getElementById("adminNameError").innerHTML = "Lulu Staff Name is required.";
        isValid = false;
    }
    if (!userName) {
        document.getElementById("userNameError").innerHTML = "User Name is required.";
        isValid = false;
    }


    if (!phoneNumber) {
        document.getElementById("phoneNumberError").innerHTML = "Phone Number is required.";
        isValid = false;
    }


    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email) {
        document.getElementById("emailError").innerHTML = "Email is required.";
        isValid = false;
    } else if (!emailRegex.test(email)) {
        document.getElementById("emailError").innerHTML = "Enter a valid Email.";
        isValid = false;
    }


    if (!country) {
        document.getElementById("countryError").innerHTML = "Country is required.";
        isValid = false;
    }


    if (!isValid) {
        document.getElementById("validationError").style.display = "block";
        return;
    }


    const id = $('#id').val();
    const formData = $("#luluStaffForm").serializeArray();
    const data = {};
    formData.forEach(item => data[item.name] = item.value);

    $('#loader').show();
    $('#submitButton').prop('disabled', true);
    $.ajax({
        url: "/lulu-staff-update?id=" + id,
        type: "PUT",
        contentType: "application/json", // Send JSON data
        data: JSON.stringify(data),
        success: function(response) {
            $('#loader').hide();
            $('#submitButton').prop('disabled', false);
            alert(response);
            window.location.href = "/lulu-staff-list";
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
	<div class="page-header" style="background: aliceblue;">
				<div class="page-header-left d-flex align-items-center">
					<div class="page-header-title">
						<h5 class="m-b-10">Lulu Staff</h5>
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/welcome">Home</a></li>
						<li class="breadcrumb-item">Lulu Staff Update</li>
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
							<a onclick="goBack()"> <i
								class="bi bi-arrow-left-circle-fill text-primary"
								style="font-size: 30px;"></i></a>
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

		<div class="nxl-content p-3">
			<div class="main-content">
				<div class="card border-top-0">
					<div class="card-header p-0">
						<%-- <jsp:include page="subheaderagent.jsp"></jsp:include> --%>
					</div>
					<form:form method="post" modelAttribute="user" id="luluStaffForm"
						enctype="multipart/form-data"
						onsubmit="event.preventDefault(); updateLuluStaff();">
						<form:hidden path="id" value="" id="id" />
						<div class="card-body lead-status">

							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Full Name<span
										class="text-danger">*</span></label>
									<form:input path="adminName" type="text" class="form-control"
										id="adminName" placeholder="Lulu Staff Name" />
									<span id="adminNameError" style="color: red;"></span>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
									<label class="form-label">Username<span
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
										class="text-danger">*</span></label>
                                    <form:select path="country" data-select2-selector="tag"
                                        id="country" title="Select a country" class="form-control">
                                        <form:options items="${countryList}"
                                            itemValue="valueId" itemLabel="description" />
                                    </form:select>
									</select> <span id="countryError" style="color: red;"></span>
								</div>

							</div>
							<div class="mt-5 mb-5 text-center"
								style="display: flex; justify-content: center">
								<span id="validationError"
									style="color: #ff000087; display: none;"><b>Please
										fill all the required fields before submitting!</b></span>
							</div>
							<div class="mt-5 mb-5 text-center"
								style="display: flex; justify-content: center">
								<button id="submitButton" type="submit" class="btn btn-primary">Submit</button>
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


</body>
</html>
