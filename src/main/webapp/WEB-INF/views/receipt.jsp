<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
    <title>LULUMONEY</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            color: #1b426b;
        }

        .custom-gap {
                margin-bottom: 30px; /* You can adjust this value as needed */
        }

        .header {
            text-align: center;
            line-height: 1.6;
        }

        .header h1 {
            font-size: 18px;
            margin: 0;
            font-weight: bold;
        }

        .header p {
            font-size: 12px;
            margin: 5px 0;
        }

        .header .info {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            font-size: 14px;
            margin-top: 10px;
        }

        .info div {
            margin: 5px 10px;
        }

        .yo-pin {
            font-weight: bold;
            font-size: 14px;
        }

        .date {
            font-size: 12px;
            margin-top: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th,
        td {
            padding: 8px;
        }

        th {
            background-color: #f4f4f4;
            text-align: left;
        }

        .section-title {
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .beneficiary {
            border-bottom: 1px solid black;
        }
        .checkbox {
            display: inline-block;
            width: 12px;
            height: 12px;
            border: 1px solid #000;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-10">
                <div class="header">
                    <h1>LULU MONEY (MALAYSIA) SDN BHD (274631-K) - KOTA KINABALU</h1>
                    <p>Lot 36 Ground Floor Center Point No.1 Lorong Centre Point, Pusat Bandar Kota Kinabalu 88000 Kota Kinabalu Sabah, KOTA KINABALU, 010-2651056,</p>
                    <p>kotaKinabalu.branch@my.lulujourney.com</p>
                    <p>Monday to Sunday 10am-7pm</p>
                </div>

                <table class="mt-4">
                    <tr>
                        <td colspan="4"><b> YO Pin </b> <b> : ${transaction_ref_number}</b> </td>
                    </tr>
                    <tr>
                        <td colspan="2">Date <b>:</b> ${date}</td>
                        <td><strong>Lulu Now-Account Credit</strong></td>
                        <td>${transaction_ref_number}</td>
                    </tr>
                    <tr class="beneficiary py-5">
                        <td colspan="2" class="pt-3"> <strong>Customer Details</strong></td>
                        <td colspan="2" class="pt-3"><strong>Payment Details</strong></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="border-top: 2px solid black; height: 0;"></td>
                    </tr>
                    <tr>
                        <td>Customer No</td>
                        <td> <b>:</b>   <strong>${customerNo}</strong></td>
                        <td>PayoutAmount</td>
                        <td> <b>:</b>   <strong>${payoutAmount} ${payOutCurrency}</strong></td>
                    </tr>
                    <tr>
                        <td>Customer Name</td>
                        <td> <b>:</b>   ${customerName}</td>
                        <td>Rate</td>
                        <td> <b>:</b>   ${rate}</td>
                    </tr>
                    <tr>
                        <td>Mobile/Phone</td>
                        <td> <b>:</b>   ${customerPhone}</td>
                        <td>PayinAmount</td>
                        <td><b>:</b>   ${payInAmount}</td>
                    </tr>
                    <tr>
                        <td>Cust. ID/ExpiryDate</td>
                        <td> <b>:</b>   ${customerIdType} / ${customerIdNo} / ${idDateOfExpiry}</td>
                        <td>Commission</td>
                        <td> <b>:</b> ${commission} ${payInCurrency}</td>
                    </tr>
                    <tr>
                        <td>Nationality/ID Issue At</td>
                        <td> <b>:</b>   ${nationality} / ${issuedAt}</td>
                        <td>Tax</td>
                        <td> <b>:</b>   ${tax} ${payInCurrency}</td>
                    </tr>
                    <tr>
                        <td>Source of Funds/Purpose</td>
                        <td> <b>:</b>   ${sourceOfFund} / ${purposeOfTxn}</td>
                        <td>Other Charges</td>
                        <td> <b>:</b>   ${otherCharges} ${payInCurrency}</td>
                    </tr>
                    <tr>
                        <td>Cust Address/City</td>
                        <td> <b>:</b>   Beverly Hills, Lot C11 Block C Phase 5, Kota Kinabalu, ${customerCity} <br></br> MALAYSIA.POBox 88200 / KOTA KINABALU</td>
                        <td>Total Paying Amount</td>
                        <td> <b>:</b>   ${totalPayInAmount} ${payInCurrency}</td>
                    </tr>
                    <tr>
                        <td>Employer Name</td>
                        <td> <b>:</b>   ${employerName}</td>
                        <td>Card</td>
                        <td> <b>:</b>   0.00 </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Cash</td>
                        <td> <b>:</b>   0.0</td>
                    </tr>
                    <tr>
                        <td>Profession/Occupation</td>
                        <td> <b>:</b>   ${occupation}</td>
                        <td>CQ/Bank </td>
                        <td> <b>:</b>   0.00 </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>BalancePaid</td>
                        <td> <b>:</b>   0.0</td>
                    </tr>
                    <tr class="beneficiary">
                        <td colspan="4"><b>Beneficiary Details</b></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="border-top: 2px solid black; height: 0;"></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td> <b>:</b>   ${beneficiaryName}</td>
                        <td>Mobile</td>
                        <td> <b>:</b>   ${beneficiaryPhone}</td>
                    </tr>
                    <tr>
                        <td>Relation</td>
                        <td> <b>:</b>   ${beneficiaryRelation}</td>
                        <td>Nationality</td>
                        <td> <b>:</b>   ${beneficiaryNationality}</td>
                    </tr>
                    <tr>
                        <td>Bene. Bank</td>
                        <td> <b>:</b>   ${benBank}</td>
                        <td>Bene. IBAN</td>
                        <td> <b>:</b>   ${iban}</td>
                    </tr>
                    <tr>
                        <td>Account No</td>
                        <td> <b>:</b>   ${accountNo}</td>
                        <td>Remarks</td>
                        <td> <b>:</b> ${remarks}</td>
                    </tr>
                    <tr>
                        <td colspan="4" class="py-3"></td>
                    </tr>
                    <tr>
                        <td>Bene Branch</td>
                        <td colspan="3"> <b>:</b>  ${benBranch}</td>
                    </tr>
                    <tr>
                        <td>Benef Address</td>
                        <td colspan="3"> <b>:</b>   ${beneficiaryAddress}</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <label class="d-inline">
                                <span class="checkbox"></span> I hereby confirm that the transaction executed is correct, the funds were derived from legal sources, and the purpose of the transaction is not intended for any illegal activity.
                                <br></br>
                                By signing this form I expressly consent to the transfer of my personal data entered above to Lulu Money Malaysia Sdn Bhd and its affiliates for the purpose of providing the money transfer service to me with the understanding of the data processing activities mentioned in LMM data Protection policy.
                            </label><br></br>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="col-2">
                <!-- <img src="image.png" alt=""> -->
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row mb-5 d-flex justify-content-between"> <!-- Use d-flex and justify-content-between to space columns -->
            <div class="col-5"> <!-- Set the width of the first column to 5/12 of the row -->
                <b>Created By</b>
                <p>Dayang Sarminee Abdul Wahap</p>
            </div>
            <div class="col-5 text-right"> <!-- Set the width of the second column to 5/12 of the row and align text to the right -->
                <b>Cashier</b>
                <p>Dayang Sarminee Abdul Wahap</p>
            </div>
        </div>

        <div class="row custom-gap d-flex justify-content-between"> <!-- Use d-flex and justify-content-between to space columns -->
            <div class="col text-left">
                <b>Customer's Signature</b>
            </div>
        </div>
        <div class="row custom-gap d-flex justify-content-between">
            <div class="col text-right">
                <b>Agent&apos;s Signature &amp; Seal</b>
            </div>
        </div>
        <div class="row mb-4"> <!-- Use d-flex and justify-content-between to space columns -->

        </div>
        <div class="row mb-5 d-flex justify-content-between">
            <div class="col-1 text-left">
            </div>
            <div class="col-1 text-right"> <!-- Align the image to the right -->
                <a href="https://imgbb.com/"><img src="https://i.ibb.co/Tqc6K5Xm/image.png" alt="image" border="0" /></a>
            </div>
        </div>
    </div>
</body>

</html>
