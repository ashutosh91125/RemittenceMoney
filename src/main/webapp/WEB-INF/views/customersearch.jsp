<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Search</title>
</head>
<script type="text/javascript">
// Ensure the correct fields are toggled on page load
document.addEventListener('DOMContentLoaded', function() {
    console.log("Page Loaded");
    const radioButtons = document.querySelectorAll('input[name="criteria"]');
    const searchHeading = document.getElementById("search-heading");
    
    // Set the initial value for search heading based on the default radio button
    searchHeading.textContent = document.querySelector('input[name="criteria"]:checked').value;
    
    radioButtons.forEach(radio => {
        radio.addEventListener("click", () => {
            // Update the search-heading text when a radio button is clicked
            searchHeading.textContent = radio.value;
        });
    });
});
</script>
<body>
	<div class="container mx-0">
		<form method="GET" action="/searchCustomers">
			<div class="row" style="display: flex; align-items: baseline;">
				<div class="col-xl-2" id="customerNumber">
					<label  class="form-label"><input type="radio" name="criteria" class="form-radio"
						value="Customer Number:" checked> Customer No:</label>
				</div>
				<div class="col-xl-1" id="idNo">
					<label class="form-label"><input type="radio" name="criteria" class="form-radio"
						value="ID Number:"> ID No</label>
				</div>
				<div class="col-xl-2" id="mobileNumber">
					<label class="form-label"><input type="radio" name="criteria" class="form-radio"
						value="Mobile Number:"> Mobile No</label>
				</div>
				<div class="col-xl-2" id="customerName">
					<label class="form-label"><input type="radio" name="criteria" class="form-radio"
						value="Customer Name:"> Customer Name</label>
				</div>

				<div class="col-xl-2" style="padding-left: 58px;">
					<div class="form-label" id="search-heading">Customer
						Number:</div>
				</div>

				<div class="col-xl-3 ps-0">
					<div class="search-bar-container d-flex"
						style="display: flex; justify-content: space-around; align-items: center;">
						<input type="text" class="py-2" id="radio-search" name="query"
							placeholder="Search..." style="flex: 1;">
						<button type="submit" class="mt-2"
							style="background: none; border: none; padding: 0; margin-left: 8px;">
							<i class="feather-search" style="font-size: 24px;"></i>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
