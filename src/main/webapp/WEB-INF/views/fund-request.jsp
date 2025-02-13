<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Form</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .main-content {
            padding-top: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
        }
        .card {
            max-width: 500px;
            width: 100%;
        }
        .header-section {
            background-color: #66B2FF;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 15px;
        }
        .custom-button-spacing {
            margin-right: 6px;
        }
        .d-flex {
            gap: 5px;
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="main-content">
        <div class="card shadow-lg p-4">
            <div class="header-section">
                <h4 class="mb-0" style="color: white;">FUND REQUEST FORM</h4>
            </div>
            <form id="depositForm" class="w-100 mt-3">
                <div class="mb-3">
                    <label class="form-label">Amount</label>
                    <input type="number" name="amount" class="form-control" placeholder="Enter amount" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deposit Date</label>
                    <input type="date" name="depositDate" class="form-control" id="depositDate" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deposit Mode</label>
                    <div class="d-flex">
                        <label><input type="radio" name="depositMode" value="Cash Deposit" required> Cash Deposit</label>
                        <label><input type="radio" name="depositMode" value="Online Transfer" required> Online Transfer</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Reference Number</label>
                    <input type="text" name="referenceNumber" class="form-control" placeholder="Enter reference number" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Upload Bank Receipt</label>
                    <input type="file" name="bankReceipt" class="form-control" id="bankReceipt" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deposit By</label>
                    <input type="text" name="depositBy" class="form-control" placeholder="Enter depositor name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Remarks</label>
                    <textarea name="remarks" rows="3" class="form-control" placeholder="Enter remarks"></textarea>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-center mt-4">
                    <button type="button" class="btn btn-lg btn-outline-primary custom-button-spacing" id="submitBtn">Submit</button>
                    <button type="reset" class="btn btn-lg btn-outline-secondary custom-button-spacing">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <!-- JavaScript for AJAX Submission -->
    <script>
        $(document).ready(function () {
            // Set max deposit date to today
            document.getElementById('depositDate').setAttribute('max', new Date().toISOString().split('T')[0]);

            $("#submitBtn").click(function () {
                let formData = new FormData();

                // Create JSON object for text fields
                let depositData = {
                    amount: $("input[name='amount']").val(),
                    depositDate: $("input[name='depositDate']").val(),
                    depositMode: $("input[name='depositMode']:checked").val(),
                    referenceNumber: $("input[name='referenceNumber']").val(),
                    depositBy: $("input[name='depositBy']").val(),
                    remarks: $("textarea[name='remarks']").val()
                };

                // Append JSON object as string
                formData.append("data", JSON.stringify(depositData));

                // Append file
                let file = $("#bankReceipt")[0].files[0];
                if (file) {
                    formData.append("bankReceipt", file);
                }

                // AJAX call
                $.ajax({
                    url: "/api/deposit/save",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        alert(response.message);
                        if (response.status) {
                            $("#depositForm")[0].reset();
                        }
                    },
                    error: function (xhr) {
                        alert("Error: " + xhr.responseText);
                    }
                });
            });
        });
    </script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

</body>
</html>
