<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Form</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" href="assets/css/theme.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .main-content {
            padding-top: 80px; /* Adjust according to header height */
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px); /* Remaining height after header */
        }
        .card {
            max-width: 500px;
            width: 100%;
        }
        .radio-group {
            display: flex;
            align-items: center;
        }
        .radio-group label {
            margin-right: 15px;
            display: flex;
            align-items: center;
        }
        .radio-group input[type="radio"] {
            margin-right: 5px;
            cursor: pointer;
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
    <%@ include file="header.jsp" %> <!-- Include the header -->
    <div class="main-content">
        <div class="card shadow-lg p-4" style="margin-top: 470px;">
            <div class="header-section">
                <h4 class="mb-0" style="color: white;">FUND REQUEST FORM</h4>
            </div>
            <form action="#" method="POST" enctype="multipart/form-data" class="w-100 mt-3">
                <div class="mb-3">
                    <label class="form-label">Amount</label>
                    <input type="number" name="amount" class="form-control" placeholder="Enter amount" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deposit Date</label>
                    <input type="date" name="deposit_date" class="form-control" id="deposit_date" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deposit Mode</label>
                    <div class="radio-group">
                        <label for="cash">
                            <input type="radio" id="cash" name="deposit_mode" value="Cash Deposit" required>
                            Cash Deposit
                        </label>
                        <label for="online">
                            <input type="radio" id="online" name="deposit_mode" value="Online Transfer" required>
                            Online Transfer
                        </label>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Reference Number</label>
                    <input type="number" name="reference_number" class="form-control" placeholder="Enter reference number" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Upload Bank Receipt</label>
                    <input type="file" name="bank_receipt" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Deposit By</label>
                    <input type="text" name="deposit_by" class="form-control" placeholder="Enter depositor name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Remarks</label>
                    <textarea name="remarks" rows="3" class="form-control" placeholder="Enter remarks"></textarea>
                </div>

                <!-- Center the submit and reset buttons -->
                <div class="d-flex justify-content-center mt-4">
                            <button type="submit" class="btn btn-lg btn-outline-primary custom-button-spacing">Submit</button>
                            <button type="reset" class="btn btn-lg btn-outline-secondary custom-button-spacing">Reset</button>
                        </div>
            </form>
        </div>

    </div>
    <script>
        // Set the max attribute to the current date
        document.getElementById('deposit_date').setAttribute('max', new Date().toISOString().split('T')[0]);
    </script>

    <script src="assets/vendors/js/vendors.min.js"></script>
    <script src="assets/js/common-init.min.js"></script>
    <script src="assets/js/theme-customizer-init.min.js"></script>
</body>
</html>
