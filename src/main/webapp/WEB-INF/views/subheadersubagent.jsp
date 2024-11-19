<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keyword" content="">
<meta name="author" content="theme_ocean">

<title>Duralux || Projects Create</title>

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
	href="assets/vendors/css/jquery.steps.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/quill.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendors/css/datepicker.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
<script type="text/javascript">
// Get the current path of the page (e.g., "registersubagent.jsp")
const currentPath = window.location.pathname.split('/').pop();

// Select all links with the class 'nav-link'
const links = document.querySelectorAll('.nav-link');


links.forEach(link => {
    // Check if the link's href matches the current path
    if (link.getAttribute('href') === currentPath) {
        // Add the 'active' class if it matches
        link.classList.add('active');
    } else {
        // Remove the 'active' class from links that don't match (optional)
        link.classList.remove('active');
    }
});
</script>
</head>

<body>
	<ul class="nav nav-tabs flex-wrap w-100 text-center customers-nav-tabs"
		id="myTab" role="tablist">
		<li class="nav-item flex-fill border-top" role="presentation"><a
			href="registersubagent.jsp" class="nav-link active"
			data-bs-toggle="tab" data-bs-target="#profileTab" role="tab">Agent
				Details</a></li>
		<li class="nav-item flex-fill border-top" role="presentation"><a
			href="contactdetailssubagent.jsp" class="nav-link"
			data-bs-toggle="tab" data-bs-target="#passwordTab" role="tab">Contact
				Details</a></li>
		<li class="nav-item flex-fill border-top" role="presentation"><a
			href="regurilitysubagent.jsp" class="nav-link" data-bs-toggle="tab"
			data-bs-target="#billingTab" role="tab">Regulatory Details </a></li>
		<li class="nav-item flex-fill border-top" role="presentation"><a
			href="auditsubagent.jsp" class="nav-link" data-bs-toggle="tab"
			data-bs-target="#connectionTab" role="tab">Audit Tails</a></li>
	</ul>

	<script src="assets/vendors/js/vendors.min.js"></script>
	<script src="assets/vendors/js/jquery.steps.min.js"></script>
	<script src="assets/vendors/js/jquery.validate.min.js"></script>
	<script src="assets/vendors/js/select2.min.js"></script>
	<script src="assets/vendors/js/select2-active.min.js"></script>
	<script src="assets/vendors/js/quill.min.js"></script>
	<script src="assets/vendors/js/datepicker.min.js"></script>
	<script src="assets/js/common-init.min.js"></script>
	<script src="assets/js/projects-create-init.min.js"></script>
	<script src="assets/js/theme-customizer-init.min.js"></script>
</body>

</html>