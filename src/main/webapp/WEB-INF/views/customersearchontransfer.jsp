<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Search</title>
</head>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    console.log("Page Loaded");
    const radioButtons = document.querySelectorAll('input[name="criteria"]');
    const searchHeading = document.getElementById("search-heading");
    const searchInput = document.getElementById("radio-search");
    const form = document.querySelector('form');

    // Set the initial value for search heading based on the default radio button
    searchHeading.textContent = document.querySelector('input[name="criteria"]:checked').value;

    // Update search heading when a radio button is clicked
    radioButtons.forEach(radio => {
        radio.addEventListener("click", () => {
            searchHeading.textContent = radio.value;
        });
    });

    // Trim the query and store it back in the input before form submission
    form.addEventListener('submit', function(event) {
        searchInput.value = searchInput.value.trim(); // Trim the value and store it back
    });
});
</script>
<style>

.search-button {
    transition: color 0.3s ease; /* Add a smooth color transition */
}

.search-button:hover {
    color: #3903fc; /* Change the color on hover */
}

.search-button:hover i {
    color: #3903fc; /* Change the icon color on hover */
}
</style>
<body>
	<div class="container mx-0 mt-4">
		<form method="GET" action="/searchCustomersOnTransfer">
			<div class="row align-items-center justify-content-between">
				<!-- Heading and Radio Buttons -->
				<div class="col-auto d-flex">
					<h6 class="mb-0 me-3">Customer Search</h6>
					<label class="form-label me-3"> <input type="radio"
						name="criteria" value="Customer Number:" checked> Customer
						No:
					</label> <label class="form-label me-3"> <input type="radio"
						name="criteria" value="ID Number:"> ID No
					</label> <label class="form-label me-3"> <input type="radio"
						name="criteria" value="Mobile Number:"> Mobile No
					</label> <label class="form-label me-3"> <input type="radio"
						name="criteria" value="Customer Name:"> Customer Name
					</label>
				</div>

				<!-- Search Label and Fixed Input Box -->
				<div class="col-auto d-flex align-items-center">
					<label for="radio-search" id="search-heading"
						class="form-label me-2 mb-0">Customer Name:</label> <input
						type="text" class="py-2" id="radio-search" name="query"
						placeholder="Search..." style="flex: 1;">
					<button type="submit" class="mt-2 search-button" style="background: none; border: none; padding: 0; margin-left: 8px;">
                        <i class="feather-search" style="font-size: 24px;"></i>
                    </button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
