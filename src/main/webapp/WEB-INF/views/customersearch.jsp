<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
// Ensure the correct fields are toggled on page load
document.addEventListener('DOMContentLoaded', function() {
    console.log("Page Loaded");
    const radioButtons = document.querySelectorAll('input[name="form-radio"]');
    const searchHeading = document.getElementById("search-heading");
    radioButtons.forEach(radio => {
        radio.addEventListener("click", () => {
            // Set the search-heading text to the value of the selected radio button
            searchHeading.textContent = radio.value;
        });
    });

});

</script>
<body>
	<div class="container mx-0">
		<form method="GET" action="/search">
			<div class="row" style="display: flex; align-items: baseline;">
				<div class="col-xl-2" id="customerNumber">
					<label> <input type="radio" name="form-radio"
						class="form-radio" value="Customer Number:" checked>
						Customer Number:
					</label>
				</div>
				<div class="col-xl-1" id="idNo">
					<label> <input type="radio" name="form-radio"
						class="form-radio" value="ID No:">ID No
					</label>
				</div>
				<div class="col-xl-2" id="mobileNumber">
					<label> <input type="radio" name="form-radio"
						class="form-radio" value="Mobile Number:">Mobile Number
					</label>
				</div>
				<div class="col-xl-2" id="customerName">
					<label> <input type="radio" name="form-radio"
						class="form-radio" value="Customer Name:">Customer Name
					</label>
				</div>

				<div class="col-xl-2">
					<div class="search-heading" id="search-heading">Customer
						Number:</div>
				</div>

				<div class="col-xl-3 ps-0">
					<div class="search-bar-container d-flex"
						style="display: flex; justify-content: space-around; align-items: center;">
						<input type="text" class="py-2" id="radio-search"
							placeholder="Search..." style="flex: 1;"> <span
							class="mt-2" style="margin-left: 8px;"> <i
							class="feather-search"></i>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>