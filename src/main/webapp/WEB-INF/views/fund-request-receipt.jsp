<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Funding Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .box{
            text-align: center;
            border: 2px solid black;
            border-radius: 8px;
            padding: 5px 0;
            font-weight: 600;
            min-height: 40px;

        }
        .text{
            font-size: large;
            font-weight: 700;
        }
        .box2{
            text-align: center;
            border: 2px solid black;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container px-5">
        <div class="row">
            <div class="col-12 text-center border-bottom border-black">
                <h2><b>${fundRequest.agentName}</b></h2>
                <P><b>Head Office</b></P>
                <h6><b>${fundRequest.agentAddress}</b></h6>
                <h3 class="mt-4"><b>Bank Funding Receipt</b></h3>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <p class="text">Request No.</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.depositRequestNumber}</p>
            </div>
            <div class="col-1"></div>
            <div class="col">
                <p class="text">Funding Bank & Branch</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.fundingBank}, <br> ${fundRequest.fundingBankBranch}</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <p class="text">Depositing Bank</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.depositBank}</p>
            </div>
            <div class="col-1"></div>
            <div class="col">
                <p class="text">Funding Bank A/c No.</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.fundingAcNumber}</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <p class="text">Depositing Mode</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.depositMode}</p>
            </div>
            <div class="col-1"></div>
            <div class="col">
                <p class="text">Funding Amount</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.amount} ${fundRequest.depositCurrency}</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <p class="text">Deposited on</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.depositDate}</p>
            </div>
            <div class="col-1"></div>
            <div class="col">
                <p class="text">Reference No.</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.referenceNumber}</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <p class="text">Deposited By</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.depositBy}</p>
            </div>
            <div class="col-1"></div>
            <div class="col">
                <p class="text">Approved By</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.approvedBy}</p>
            </div>
        </div>
        <div class="row mt-2 text-center border-bottom border-black">
            <div class="col-2">
                <p class="text text-start">Remarks</p>
            </div>
            <div class="col-10 ">
                <p class="box2 py-3" style="margin-left: 75px; padding-left: 20px; padding-right: 20px; text-align: left; border-radius: 0;">${fundRequest.remarks}</p>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <p class="text">Created On</p>
            </div>
            <div class="col">
                <p class="box">${dateFundCreated}</p>
            </div>
            <div class="col-1"></div>
            <div class="col">
                <p class="text">Created By</p>
            </div>
            <div class="col">
                <p class="box">${fundRequest.createdBy}</p>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <p class="text">Agent's Signature & Seal</p>
            </div>
        </div>
    </div>
</body>
</html>