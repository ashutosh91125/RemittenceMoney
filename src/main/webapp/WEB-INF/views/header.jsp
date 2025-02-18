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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/commons.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap')
	;

.user-name {
	font-family: 'Poppins', sans-serif;
	color: #66B2FF; /* Lighter blue */
	font-weight: 600;
	font-size: 16px; /* Slightly smaller */
	margin-left: 10px;
	transition: color 0.3s ease-in-out, transform 0.2s ease-in-out;
}

.user-role {
	font-family: 'Poppins', sans-serif;
	color: #666;
	font-weight: 500;
	font-size: 12px; /* Smaller font size */
	margin-left: 10px;
	margin-top: -3px;
}

.user-branch {
	font-family: 'Poppins', sans-serif;
	color: #888; /* Lighter gray for branch */
	font-weight: 400; /* Less emphasis */
	font-size: 12px; /* Smaller font size to match role */
	margin-left: 10px;
	margin-top: 2px; /* Adjust to ensure it fits below the role */
}

.user-info {
	display: flex;
	flex-direction: column;
	align-items: flex-start; /* Align everything to the left */
}

/* Hover effect for interaction */
.user-name:hover {
	color: #3399FF; /* Slightly darker blue */
	transform: scale(1.1); /* Slightly enlarges on hover */
	text-shadow: 1px 1px 5px rgba(102, 178, 255, 0.5);
}
</style>
</head>

<body>
	<!--! ================================================================ !-->
	<!--! [Start] Navigation Manu !-->
	<!--! ================================================================ !-->
	<div class="nxl-navigation">
		<div class="navbar-wrapper">
			<div class="m-header">
				<a href="/welcome" class="b-brand"> <!-- ========   change your logo hear   ============ -->
					<img src="assets/images/LuluMoney.png" class="img-fluid">
				</a>
			</div>
				<div class="navbar-content">
				<ul class="nxl-navbar">
					
					<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/welcome"><span class="nxl-micon"><i
								class="feather-airplay"></i></span> <span class="nxl-mtext">Dashboards</span>
						</a></li>

					<c:if test="${sessionScope.role == 'STAFF_TR'}">
					
							<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/transfer"> <span class="nxl-micon"><i
									class="feather-dollar-sign"></i></span> <span class="nxl-mtext">New
									Transfer </span>
						</a></li>
					</c:if>

					<c:if test="${pageContext.request.isUserInRole('ADMIN')}">
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/adminlist"> <span class="nxl-micon"><i
									class="feather-users"></i></span> <span class="nxl-mtext">All
									Admins</span>
						</a></li>
					</c:if>

					<c:if
						test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('ADMIN')}">
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/agentlist"> <span class="nxl-micon"><i
									class="feather-users"></i></span> <span class="nxl-mtext">All
									Agents</span>
						</a></li>
					</c:if>

					<c:if
						test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('AGENT') or pageContext.request.isUserInRole('ADMIN')}">
						
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/branch-list"> <span class="nxl-micon"><i
									class="bi bi-bezier me-1"></i></span><span class="nxl-mtext">All
									Branches</span>
						</a></li>
					</c:if>
					<c:if
						test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('AGENT') or pageContext.request.isUserInRole('ADMIN')}">
						
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/staff-list""> <span class="nxl-micon"><i
									class="feather-users"></i></span> <span class="nxl-mtext">All
									Agent Staff</span>
						</a></li>
					</c:if>

					<c:if test="${pageContext.request.isUserInRole('AGENT')}">
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/fund-request-list"><span class="nxl-micon"><img
									src="<c:url value='assets/images/fund-arrow.png'/>" alt="#"
									style="width: 24px; height: 24px;" /></span><span
								class="nxl-mtext">Fund Request</span>
						</a></li>
					</c:if>

					<c:if
						test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('ADMIN')}">
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/lulu-staff-list"> <span
								class="nxl-micon"><i class="feather-users"></i></span> <span
								class="nxl-mtext">Lulu Staff</span>
						</a></li>
					</c:if>

					<c:if test="${sessionScope.role == 'STAFF_TR'}">
					
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/customer"> <span
								class="nxl-micon"><i class="feather-users"></i></span> <span
								class="nxl-mtext">Customers</span>
						</a></li>
					</c:if>

					<c:if test="${pageContext.request.isUserInRole('STAFF_ALL')}">
						
						<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="#"><span class="nxl-micon"><img
									src="<c:url value='assets/images/fund-request.png'/>" alt="#"
									style="width: 24px; height: 24px;" />
							</span><span class="nxl-mtext">Approve Fund</span>
						</a></li>
					</c:if>

					
					<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/transfer-list"> <span class="nxl-micon"><i
								class="feather-dollar-sign"></i></span> <span class="nxl-mtext">Transaction
								Enquiry</span>
					</a></li>
					<%--
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-cast"></i></span> <span class="nxl-mtext">Reports</span><span
							class="nxl-arrow"><i class="feather-chevron-right"></i></span>
					</a>

						<ul class="nxl-submenu collapse">
							<li class="nxl-item"><a class="nxl-link"
								href="reports-sales.html">Transactions Reports</a></li>

						</ul>
					</li>
					--%>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-settings"></i></span> <span class="nxl-mtext">Settings</span><span
							class="nxl-arrow"><i class="feather-chevron-right"></i></span>
					</a>
						<ul class="nxl-submenu show">
							<!-- <li class="nxl-item"><a class="nxl-link"
								href="/update-password">Update Password</a></li> -->
								<li class="nxl-item"><a href="#"
							class="nxl-link ajax-link" data-url="/update-password">Update Password</a></li>
							<%--
							<li class="nxl-item"><a class="nxl-link"
								href="settings-general.html">General</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-general.html">Country</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-seo.html">Roles</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-tags.html">Permission</a></li>
					    --%>
						</ul></li>
					
					<li class="nxl-item nxl-hasmenu"><a href="#"
							class="nxl-link ajax-link" data-url="/logout"><i class="feather-power"></i> <span
							class="nxl-mtext">Logout</span>
					</a>
					</li>
				</ul>

			</div>
		</div>
	</div>
	
	<!--! ================================================================ !-->
	<div class="nxl-header">
		<div class="header-wrapper">
			<!--! [Start] Header Left !-->
			<div class="header-left d-flex align-items-center gap-4">
				<!--! [Start] nxl-head-mobile-toggler !-->
				<a href="javascript:void(0);" class="nxl-head-mobile-toggler"
					id="mobile-collapse">
					
				</a>
				<!--! [Start] nxl-head-mobile-toggler !-->
				<!--! [Start] nxl-navigation-toggle !-->
				<div class="nxl-navigation-toggle">
					<a href="javascript:void(0);" id="menu-mini-button"> <i
						class="feather-align-left"></i>
					</a> <a href="javascript:void(0);" id="menu-expend-button"
						style="display: none"> <i class="feather-arrow-right"></i>
					</a>
				</div>
				<!--! [End] nxl-navigation-toggle !-->
				<!--! [Start] nxl-lavel-mega-menu-toggle !-->
				<div class="nxl-lavel-mega-menu-toggle d-flex d-lg-none">
					<a href="javascript:void(0);" id="nxl-lavel-mega-menu-open"> <i
						class="feather-align-left"></i>
					</a>
				</div>
				<!--! [End] nxl-lavel-mega-menu-toggle !-->
				<div class="nxl-h-item d-none d-sm-flex"></div>
                <div class="dropdown nxl-h-item ms-auto">
                    <a href="javascript:void(0);" data-bs-toggle="dropdown"
                        role="button" data-bs-auto-close="outside"
                        class="d-flex align-items-center">
                        <div class="user-info text-start me-2">
                            <span class="user-name fw-bold d-block"> <c:out
                                    value="IP: ${sessionScope.ipAddress}" />
                            </span> <span class="user-role d-block"> <c:out
                                    value="Logged in at: ${sessionScope.loginTime}" />
                            </span>
                        </div>
                    </a>
                </div>
			
			</div>
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
					<div class="dropdown nxl-h-item ms-auto">
						<a href="javascript:void(0);" data-bs-toggle="dropdown"
							role="button" data-bs-auto-close="outside"
							class="d-flex align-items-center"> <!-- User Details (Name + Role + Branch) -->
							<div class="user-info text-start me-2">
								<span class="user-name fw-bold d-block"> <c:out
										value="${sessionScope.loggedInUser}" />
								</span> <span class="user-role d-block"> <c:out
										value="${sessionScope.roleName}" />
								</span> <span class="user-branch d-block"> <c:out
										value="${sessionScope.branchName}" />
								</span>
							</div> <!-- Profile Image --> <img src="assets/images/avatar/1.png"
							alt="user-image" class="img-fluid user-avtar">
						</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>

</body>

</html>