function goBack() {
    window.history.back();
}

function validateLengthWithMaxMessage(inputId, maxLength, errorId) {
    const input = document.getElementById(inputId);
    const error = document.getElementById(errorId);

    if (input.value.length > maxLength) {
        input.value = input.value.slice(0, maxLength);
        error.textContent = `Maximum allowed characters reached.`;
    } else {
        error.textContent = '';
    }
}

function toggleDiv(divId) {
    const element = document.getElementById(divId);
    element.classList.toggle("show");
}

function toggleDropdown(element) {
    const dropdownMenu = element.nextElementSibling;
    dropdownMenu.classList.toggle('show');
}

$(document).ready(function () {
    $('.ajax-link').on('click', function (e) {
//        e.preventDefault();

        const url = $(this).data('url');

        $.ajax({
            url: url,
            method: 'GET',
            success: function (response) {
                window.location.href = url;
            },
            error: function (xhr, status, error) {
                alert('Failed to load content: ' + error);
            }
        });
    });
});


/*$(document).ready(function() {
    $(".ajax-link").click(function(e) {
        e.preventDefault(); // Prevent default link behavior

        var url = $(this).data("url"); // Get the URL from data attribute
		console.log(url);
        // Load content dynamically using AJAX
        $.ajax({
            url: url,
            type: "GET",
            success: function(response) {
				console.log(response);
                $(".nxl-container").html(response); // Inject response into the div
                history.pushState(null, "", url); // Change the URL without reloading
            },
            error: function(xhr, status, error) {
                $(".nxl-container").html("<p>Error loading content. Please try again.</p>");
                console.error("AJAX Error:", status, error);
            }
        });
    });

    // Handle browser back/forward button navigation
    window.onpopstate = function() {
        var currentUrl = window.location.pathname;
        $.ajax({
            url: currentUrl,
            type: "GET",
            success: function(response) {
                $(".nxl-container").html(response);
            },
            error: function(xhr, status, error) {
                $(".nxl-container").html("<p>Error loading content.</p>");
            }
        });
    };
});*/

