<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">
<!--! The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags !-->
<!--! BEGIN: Apps Title-->
<title>Duralux || Calendar</title>
<!--! END:  Apps Title-->
<!--! BEGIN: Favicon-->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.ico">
<!--! END: Favicon-->
<!--! BEGIN: Bootstrap CSS-->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<!--! END: Bootstrap CSS-->
<!--! BEGIN: Vendors CSS-->
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/vendors.min.css">
<link type="text/css" rel="stylesheet"
	href="assets/vendors/css/tui-calendar.min.css">
<link type="text/css" rel="stylesheet"
	href="assets/vendors/css/tui-theme.min.css">
<link type="text/css" rel="stylesheet"
	href="assets/vendors/css/tui-time-picker.min.css">
<link type="text/css" rel="stylesheet"
	href="assets/vendors/css/tui-date-picker.min.css">
<!--! END: Vendors CSS-->
<!--! BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">

</head>

<body>
	<div class="nxl-navigation" id="navBar_Id">
		<div class="navbar-wrapper">
			<div class="m-header">
				<a href="index.html" class="b-brand"> <!-- ========   change your logo hear   ============ -->
					<img src="assets/images/LuluMoney.png" class="img-fluid">
				</a>
			</div>
			<div class="navbar-content">
				<ul class="nxl-navbar">
					<li class="nxl-item nxl-hasmenu"><a href="welcome"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-airplay"></i></span> <span class="nxl-mtext">Dashboards</span>
					</a></li>

                    <c:if
                        test="${pageContext.request.isUserInRole('STAFF_TR')}">
					<li class="nxl-item nxl-hasmenu"><a href="/transfer"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-dollar-sign"></i></span> <span class="nxl-mtext">Transfer
						</span>
					</a></li>
					</c:if>

					<c:if test="${pageContext.request.isUserInRole('ADMIN')}">
						<li class="nxl-item nxl-hasmenu"><a href="adminlist"
							class="nxl-link"> <span class="nxl-micon"><i
									class="feather-users"></i></span> <span class="nxl-mtext">Admin</span></i></span>
						</a></li>
					</c:if>

					<c:if
						test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('ADMIN')}">
						<li class="nxl-item nxl-hasmenu"><a href="agentlist"
							class="nxl-link"> <span class="nxl-micon"><i
									class="feather-users"></i></span> <span class="nxl-mtext">Agents</span>
						</a></li>
					</c:if>

					<c:if
						test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('AGENT') or pageContext.request.isUserInRole('ADMIN')}">
						<li class="nxl-item nxl-hasmenu"><a href="branch-list"
							class="nxl-link"> <span class="nxl-micon"><i
									class="feather-users"></i></span> <span class="nxl-mtext">Branch</span>
						</a></li>
					</c:if>
                    <c:if
                        test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('AGENT') or pageContext.request.isUserInRole('ADMIN')}">
					<li class="nxl-item nxl-hasmenu"><a href="/staff-list"
                        class="nxl-link"> <span class="nxl-micon"><i
                                class="feather-users"></i></span> <span class="nxl-mtext">Staff</span>
                    </a></li>
                    </c:if>

                    <c:if test="${pageContext.request.isUserInRole('STAFF_TR')}">
					<li class="nxl-item nxl-hasmenu"><a href="customer"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-users"></i></span> <span class="nxl-mtext">Customers</span>
					</a></li>
					</c:if>

					<li class="nxl-item nxl-hasmenu"><a href="transfer-list"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-dollar-sign"></i></span> <span class="nxl-mtext">All
								Transfers </span>
					</a></li>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-cast"></i></span> <span class="nxl-mtext">Reports</span><span
							class="nxl-arrow"><i class="feather-chevron-right"></i></span>
					</a>
						<ul class="nxl-submenu collapse">
							<li class="nxl-item"><a class="nxl-link"
								href="reports-sales.html">Transactions Reports</a></li>

						</ul></li>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);" class="nxl-link">
							<span class="nxl-micon"><i class="feather-settings"></i></span> <span
							class="nxl-mtext">Settings</span><span class="nxl-arrow"><i
								class="feather-chevron-right"></i></span>
					</a>
						<ul class="nxl-submenu show">
							<li class="nxl-item"><a class="nxl-link"
								href="settings-general.html">General</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-general.html">Country</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-seo.html">Roles</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-tags.html">Permission</a></li>
						</ul></li>
					<li class="nxl-item nxl-hasmenu"><a
						href="${pageContext.request.contextPath}/logout" class="nxl-link">
							<span class="nxl-micon"><i class="feather-power"></i></span> <span
							class="nxl-mtext">Logout</span>
					</a>
				</ul>

			</div>
		</div>
	</div>

	<header class="nxl-header">
		<div class="header-wrapper">

			<div class="header-right ms-auto">
				<div class="d-flex align-items-center">
					<div class="nxl-h-item d-none d-sm-flex"></div>
					<div class="dropdown nxl-h-item">
						<a class="nxl-head-link me-3" data-bs-toggle="dropdown" href="#"
							role="button" data-bs-auto-close="outside"> <i
							class="feather-bell"></i> <span
							class="badge bg-danger nxl-h-badge">3</span>
						</a>

					</div>
					<div class="dropdown nxl-h-item">
						<a href="javascript:void(0);" data-bs-toggle="dropdown"
							role="button" data-bs-auto-close="outside"> <img
							src="assets/images/avatar/1.png" alt="user-image"
							class="img-fluid user-avtar me-0">
						</a>

					</div>
				</div>
			</div>
			<!--! [End] Header Right !-->
		</div>
	</header>

	<!--! BEGIN: Vendors JS !-->
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/tui-code-snippet.min.js"></script>
	<script src="assets/vendors/js/moment.min.js"></script>

	<script src="assets/js/common-init.min.js"></script>
</body>

</html>