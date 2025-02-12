<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="keyword" content="">
  <meta name="author" content="theme_ocean">
  <title>LuLu Money</title>
  <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
  <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="assets/vendors/css/vendors.min.css">
  <link rel="stylesheet" type="text/css" href="assets/vendors/css/daterangepicker.min.css">
  <link rel="stylesheet" type="text/css" href="assets/vendors/css/jquery-jvectormap.min.css">
  <link rel="stylesheet" type="text/css" href="assets/vendors/css/select2.min.css">
  <link rel="stylesheet" type="text/css" href="assets/vendors/css/select2-theme.min.css">
  <link rel="stylesheet" type="text/css" href="assets/vendors/css/jquery.time-to.min.css">
  <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
  <style>
    .nxl-content {
      margin: 0 auto;
      padding: 20px;
    }

    .card-body {
      margin: 10px;
    }


    .card:hover {
        transform: scale(1.05);
        background-color: #FF9800; /* You can choose a hover color */
      }

      .card {
        border-radius: 10px;
        overflow: hidden;
        transition: transform 0.3s ease, background-color 0.3s ease;
      }

    /* Ensure that columns are side by side on larger screens */
    .row {
      display: flex;
      flex-wrap: wrap;
    }

    /* Make the columns take half of the width on larger screens */
    .col-half {
      flex: 1 0 50%; /* 50% width per column */
      max-width: 50%;
    }

    /* Responsive Design: Stack cards vertically on small screens */
    @media (max-width: 768px) {
      .col-half {
        flex: 1 0 100%; /* 100% width on small screens */
        max-width: 100%;
      }
    }
  </style>
</head>

<body>
  <div>
    <jsp:include page="header.jsp"></jsp:include>
    <main class="nxl-container">
      <div class="nxl-content">
        <div class="main-content" style="background: aliceblue;">

          <!-- First Row -->
          <div class="row" style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; padding: 10px;">
            <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
              <!-- First column: Admin -->
              <div class="col-half">
                <div class="card stretch stretch-full border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #E0F7FA;">
                  <div class="card-body rounded-3 text-center">
                    <div class="fs-4 fw-bolder text-dark mt-3 mb-1"><span>${subAdminCount}</span></div>
                    <p class="fs-12 fw-medium text-muted text-spacing-1 mb-0 text-truncate-1-line">Admin</p>
                  </div>
                </div>
              </div>
            </c:if>

            <c:if test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('ADMIN')}">
              <!-- Second column: Agent -->
              <div class="col-half">
                <div class="card stretch stretch-full border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #FFECB3;">
                  <div class="card-body rounded-3 text-center">
                    <div class="fs-4 fw-bolder text-dark mt-3 mb-1"><span>${agentCount}</span></div>
                    <p class="fs-12 fw-medium text-muted text-spacing-1 mb-0 text-truncate-1-line">Agent</p>
                  </div>
                </div>
              </div>
            </c:if>

            <c:if test="${pageContext.request.isUserInRole('SUB_ADMIN') or pageContext.request.isUserInRole('AGENT') or pageContext.request.isUserInRole('ADMIN')}">
              <!-- Third column: Branch -->
              <div class="col-half">
                <div class="card stretch stretch-full border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #C8E6C9;">
                  <div class="card-body rounded-3 text-center">
                    <div class="fs-4 fw-bolder text-dark mt-3 mb-1"><span>${branchCount}</span></div>
                    <p class="fs-12 fw-medium text-muted text-spacing-1 mb-0 text-truncate-1-line">Branch</p>
                  </div>
                </div>
              </div>

              <!-- Fourth column: Customer -->
              <div class="col-half">
                <div class="card stretch stretch-full border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #FFCDD2;">
                  <div class="card-body rounded-3 text-center">
                    <div class="fs-4 fw-bolder text-dark mt-3 mb-1"><span>${customerCount}</span></div>
                    <p class="fs-12 fw-medium text-muted text-spacing-1 mb-0 text-truncate-1-line">Customer</p>
                  </div>
                </div>
              </div>
            </c:if>
          </div>

          <!-- Second Row (Staff) -->
          <c:if test="${pageContext.request.isUserInRole('STAFF') or pageContext.request.isUserInRole('STAFF_TR') or pageContext.request.isUserInRole('STAFF_HO')}">
            <div class="row" style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; padding: 10px;">
              <div class="col-half">
                  <div class="card stretch stretch-full border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #FFCDD2;">
                    <div class="card-body rounded-3 text-center">
                      <div class="fs-4 fw-bolder text-dark mt-3 mb-1"><span>${transferCount}</span></div>
                      <p class="fs-12 fw-medium text-muted text-spacing-1 mb-0 text-truncate-1-line">Transfers</p>
                    </div>
                  </div>
              </div>
            </div>
          </c:if>
          <!-- Third Row (Lulu Staff) -->
            <c:if test="${pageContext.request.isUserInRole('STAFF_ALL') }">
              <div class="row" style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; padding: 10px;">
                <div class="col-half">
                    <div class="card stretch stretch-full border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #FFCDD2;">
                      <div class="card-body rounded-3 text-center">
                        <div class="fs-4 fw-bolder text-dark mt-3 mb-1"><span>0</span></div>
                        <p class="fs-12 fw-medium text-muted text-spacing-1 mb-0 text-truncate-1-line">Fund Requests</p>
                      </div>
                    </div>
                </div>
              </div>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('AGENT') }">
                <div class="row" style="display: grid; grid-template-columns: 1fr; gap: 20px; padding: 10px;">
                    <div class="col-12">
                        <!-- Card for Funding Bank Details -->
                        <div class="card border border-dashed border-gray-5" style="transition: transform 0.3s ease, background-color 0.3s ease; background-color: #ede6f5; cursor: pointer; height: auto; border-radius: 20px;">
                            <div class="card-body rounded-3 p-4">
                                <!-- Card Header -->
                                <h5 class="fs-5 fw-bolder text-dark mb-3" style="font-size: 1.2rem; text-align: left;">Funding Bank Details</h5>

                                <!-- Bank Details (Side by Side) -->
                                <div class="bank-details" style="display: flex; gap: 20px; text-align: left; flex-wrap: wrap;">
                                    <div class="mb-2" style="flex: 1;">
                                        <strong class="fs-6" style="font-size: 1.1rem; font-weight: bold; color: #333;">Bank Name:</strong>
                                        <p class="fs-6 text-muted">${bankName}</p>
                                    </div>
                                    <div class="mb-2" style="flex: 1;">
                                        <strong class="fs-6" style="font-size: 1.1rem; font-weight: bold; color: #333;">Branch Name:</strong>
                                        <p class="fs-6 text-muted">${branchName}</p>
                                    </div>
                                    <div class="mb-2" style="flex: 1;">
                                        <strong class="fs-6" style="font-size: 1.1rem; font-weight: bold; color: #333;">Account Number:</strong>
                                        <p class="fs-6 text-muted">${accountNumber}</p>
                                    </div>
                                </div>

                                <!-- Interactive Button
                                <button class="btn btn-primary mt-3" style="transition: background-color 0.3s ease; background-color: #3F51B5; border-color: #3F51B5; width: 100%;">View More Details</button> -->
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
      </div>
    </main>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>

  <!-- Vendor JS Files -->
  <script src="assets/vendors/js/vendors.min.js"></script>
  <script src="assets/vendors/js/apexcharts.min.js"></script>
  <script src="assets/vendors/js/jquery.time-to.min.js"></script>
  <script src="assets/vendors/js/circle-progress.min.js"></script>
  <script src="assets/js/common-init.min.js"></script>
  <script src="assets/js/analytics-init.min.js"></script>
  <script src="assets/js/theme-customizer-init.min.js"></script>
</body>

</html>