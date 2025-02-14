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
