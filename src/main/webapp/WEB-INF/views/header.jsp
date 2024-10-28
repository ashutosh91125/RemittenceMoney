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
<script type="text/javascript">
	function agentClick() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "agentlist", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("agent_Id").innerHTML = xhr.responseText;
			}
		};
		xhr.send();

	}
	function subAgentClick() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "show", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("subAgent_Id").innerHTML = xhr.responseText;
			}
		};
		xhr.send();

	}
</script>

</head>

<body>
	<!--! ================================================================ !-->
	<!--! [Start] Navigation Manu !-->
	<!--! ================================================================ !-->
	<div class="nxl-navigation" id="navBar_Id">
		<div class="navbar-wrapper">
			<div class="m-header">
				<a href="index.html" class="b-brand"> <!-- ========   change your logo hear   ============ -->
					<img src="assets/images/LuluMoney.png" class="img-fluid">
				</a>
			</div>
			<div class="navbar-content">
				<ul class="nxl-navbar">
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-airplay"></i></span> <span class="nxl-mtext">Dashboards</span>
					</a></li>

					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-dollar-sign"></i></span> <span class="nxl-mtext">Remittance
						</span>
					</a></li>

					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-users"></i></span> <span class="nxl-mtext">Admin</span></i></span>
					</a></li>
					<li class="nxl-item nxl-hasmenu"><a onclick="agentClick()"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-users"></i></span> <span class="nxl-mtext">Agents</span>
					</a></li>
					<div id="agent_Id"></div>
					<li class="nxl-item nxl-hasmenu"><a onclick="subAgentClick()"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-users"></i></span> <span class="nxl-mtext">Sub
								Agents</span>
					</a></li>
					<div id="subAgent_Id"></div>

					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-users"></i></span> <span class="nxl-mtext">Customers</span></i></span>
					</a></li>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-dollar-sign"></i></span> <span class="nxl-mtext">All
								Transfers </span></i></span>
					</a></li>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-cast"></i></span> <span class="nxl-mtext">Reports</span><span
							class="nxl-arrow"><i class="feather-chevron-right"></i></span>
					</a>
						<ul class="nxl-submenu">
							<li class="nxl-item"><a class="nxl-link"
								href="reports-sales.html">Transactions Reports</a></li>

						</ul></li>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-settings"></i></span> <span class="nxl-mtext">Settings</span><span
							class="nxl-arrow"><i class="feather-chevron-right"></i></span>
					</a>
						<ul class="nxl-submenu">
							<li class="nxl-item"><a class="nxl-link"
								href="settings-general.html">General</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-general.html">Country</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-seo.html">Roles</a></li>
							<li class="nxl-item"><a class="nxl-link"
								href="settings-tags.html">Permission</a></li>
						</ul></li>
					<li class="nxl-item nxl-hasmenu"><a href="javascript:void(0);"
						class="nxl-link"> <span class="nxl-micon"><i
								class="feather-power"></i></span> <span class="nxl-mtext">Logout</span></i></span>
					</a>
				</ul>

			</div>
		</div>
	</div>

	<header class="nxl-header">
		<div class="header-wrapper">
			<!--! [Start] Header Left !-->
			<div class="header-left d-flex align-items-center gap-4">
				<!--! [Start] nxl-head-mobile-toggler !-->
				<a href="javascript:void(0);" class="nxl-head-mobile-toggler"
					id="mobile-collapse">
					<div class="hamburger hamburger--arrowturn">
						<div class="hamburger-box">
							<div class="hamburger-inner"></div>
						</div>
					</div>
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

				<div class="nxl-drp-link nxl-lavel-mega-menu">
					<!--! [Start] nxl-lavel-mega-menu-wrapper !-->
					<div class="nxl-lavel-mega-menu-wrapper d-flex gap-3">

						<div class="dropdown nxl-h-item nxl-lavel-menu"></div>
						<!--! [End] nxl-lavel-menu !-->
						<!-- neeraj -->
						<!--! [End] nxl-h-item nxl-mega-menu !-->
					</div>
					<!--! [End] nxl-lavel-mega-menu-wrapper !-->
				</div>
				<!--! [End] nxl-lavel-mega-menu !-->
			</div>
			<!--! [End] Header Left !-->
			<!--! [Start] Header Right !-->
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
	<!-- vendors.min.js {always must need to be top} -->
	<script src="assets/vendors/js/tui-code-snippet.min.js"></script>
	<script src="assets/vendors/js/moment.min.js"></script>

	<!--! END: Vendors JS !-->
	<!--! BEGIN: Apps Init  !-->
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/apps-calendar-init.min.js"></script>
	<!--! END: Apps Init !-->
	<!--! BEGIN: Theme Customizer  !-->
	<script src="assets/js/theme-customizer-init.min.js"></script>
	<!--! END: Theme Customizer !-->
</body>

</html>