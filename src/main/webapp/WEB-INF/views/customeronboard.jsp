<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <meta name="author" content="theme_ocean">
    <!--! The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags !-->
    <!--! BEGIN: Apps Title-->
    <title>Duralux || Customers Create</title>
    <!--! END:  Apps Title-->
    <!--! BEGIN: Favicon-->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
    <!--! END: Favicon-->
    <!--! BEGIN: Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <!--! END: Bootstrap CSS-->
    <!--! BEGIN: Vendors CSS-->
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/select2-theme.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/css/datepicker.min.css">
    <!--! END: Vendors CSS-->
    <!--! BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/theme.min.css">
    <!--! END: Custom CSS-->
    <!--! HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries !-->
    <!--! WARNING: Respond.js doesn"t work if you view the page via file: !-->
    <!--[if lt IE 9]>
			<script src="https:oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https:oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->


        <!-- for KYC -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'><link rel="stylesheet" href="./style.css">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js'></script><script  src="./script.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>      
        <!-- Feather Icons (optional for search icon) -->
        <script src="https://unpkg.com/feather-icons"></script>


  
   


        
<style>
     .search-bar-container input {
      width: 100%;
    }
        
          .radio-container label {
            display: block;
            margin: 5px 0;
          }
          .search-bar-container {
            margin: 15px 0;
          }
          .search-heading {
            font-size: 17px;    
          }
      
    /* for accordion */
    .accordion-button::after {
        display: none;
    }
    /* Add a custom icon to the left of the accordion button */
    .accordion-button::before {
        content: "\f107"; /* Font Awesome chevron-down icon */
        font-family: 'Font Awesome 5 Free'; 
        font-weight: 900;
        margin-right: 10px;
        font-size: 16px;
        transition: transform 0.3s;
    }

    /* Rotate icon when the accordion is open */
    .accordion-button[aria-expanded="true"]::before {
        transform: rotate(180deg);
    }
</style>

    </head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <!--! ================================================================ !-->
    <!--! [Start] Navigation Manu !-->
    <!--! ================================================================ !-->
   
    <!--! ================================================================ !-->
    <!--! [End]  Navigation Manu !-->
    <!--! ================================================================ !-->
    <!--! ================================================================ !-->
    <!--! [Start] Header !-->
    <!--! ================================================================ !-->
    <header class="nxl-header">
        <div class="header-wrapper">
            <!--! [Start] Header Left !-->
            <div class="header-left d-flex align-items-center gap-4">
                <!--! [Start] nxl-head-mobile-toggler !-->
                <a href="javascript:void(0);" class="nxl-head-mobile-toggler" id="mobile-collapse">
                    <div class="hamburger hamburger--arrowturn">
                        <div class="hamburger-box">
                            <div class="hamburger-inner"></div>
                        </div>
                    </div>
                </a>
                <!--! [Start] nxl-head-mobile-toggler !-->
                <!--! [Start] nxl-navigation-toggle !-->
                <div class="nxl-navigation-toggle">
                    <a href="javascript:void(0);" id="menu-mini-button">
                        <i class="feather-align-left"></i>
                    </a>
                    <a href="javascript:void(0);" id="menu-expend-button" style="display: none">
                        <i class="feather-arrow-right"></i>
                    </a>
                </div>
                <!--! [End] nxl-navigation-toggle !-->
                <!--! [Start] nxl-lavel-mega-menu-toggle !-->
                <div class="nxl-lavel-mega-menu-toggle d-flex d-lg-none">
                    <a href="javascript:void(0);" id="nxl-lavel-mega-menu-open">
                        <i class="feather-align-left"></i>
                    </a>
                </div>
                <!--! [End] nxl-lavel-mega-menu-toggle !-->
                <!--! [Start] nxl-lavel-mega-menu !-->
                <div class="nxl-drp-link nxl-lavel-mega-menu">
                    <div class="nxl-lavel-mega-menu-toggle d-flex d-lg-none">
                        <a href="javascript:void(0)" id="nxl-lavel-mega-menu-hide">
                            <i class="feather-arrow-left me-2"></i>
                            <span>Back</span>
                        </a>
                    </div>
                    <!--! [Start] nxl-lavel-mega-menu-wrapper !-->
                    <div class="nxl-lavel-mega-menu-wrapper d-flex gap-3">
                        <!--! [Start] nxl-lavel-menu !-->
                        <div class="dropdown nxl-h-item nxl-lavel-menu">
                            <!-- <a href="javascript:void(0);" class="avatar-text avatar-md bg-primary text-white" data-bs-toggle="dropdown" data-bs-auto-close="outside">
                                <i class="feather-plus"></i>
                            </a> -->
                            <div class="dropdown-menu nxl-h-dropdown">
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-send"></i>
                                            <span>Applications</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="apps-chat.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Chat</span>
                                        </a>
                                        <a href="apps-email.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Email</span>
                                        </a>
                                        <a href="apps-tasks.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Tasks</span>
                                        </a>
                                        <a href="apps-notes.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Notes</span>
                                        </a>
                                        <a href="apps-storage.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Storage</span>
                                        </a>
                                        <a href="apps-calendar.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Calendar</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown-divider"></div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-cast"></i>
                                            <span>Reports</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="reports-sales.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Sales Report</span>
                                        </a>
                                        <a href="reports-leads.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Leads Report</span>
                                        </a>
                                        <a href="reports-project.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Project Report</span>
                                        </a>
                                        <a href="reports-timesheets.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Timesheets Report</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-at-sign"></i>
                                            <span>Proposal</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="proposal.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Proposal</span>
                                        </a>
                                        <a href="proposal-view.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Proposal View</span>
                                        </a>
                                        <a href="proposal-edit.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Proposal Edit</span>
                                        </a>
                                        <a href="proposal-create.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Proposal Create</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-dollar-sign"></i>
                                            <span>Payment</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="payment.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Payment</span>
                                        </a>
                                        <a href="invoice-view.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Invoice View</span>
                                        </a>
                                        <a href="invoice-create.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Invoice Create</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-users"></i>
                                            <span>Customers</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="customers.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Customers</span>
                                        </a>
                                        <a href="customers-view.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Customers View</span>
                                        </a>
                                        <a href="customers-create.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Customers Create</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-alert-circle"></i>
                                            <span>Leads</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="leads.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Leads</span>
                                        </a>
                                        <a href="leads-view.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Leads View</span>
                                        </a>
                                        <a href="leads-create.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Leads Create</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-briefcase"></i>
                                            <span>Projects</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="projects.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Projects</span>
                                        </a>
                                        <a href="projects-view.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Projects View</span>
                                        </a>
                                        <a href="projects-create.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Projects Create</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-layout"></i>
                                            <span>Widgets</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <a href="widgets-lists.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Lists</span>
                                        </a>
                                        <a href="widgets-tables.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Tables</span>
                                        </a>
                                        <a href="widgets-charts.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Charts</span>
                                        </a>
                                        <a href="widgets-statistics.html" class="dropdown-item">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Statistics</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown nxl-level-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="feather-power"></i>
                                            <span>Authentication</span>
                                        </span>
                                        <i class="feather-chevron-right ms-auto me-0"></i>
                                    </a>
                                    <div class="dropdown-menu nxl-h-dropdown">
                                        <div class="dropdown nxl-level-menu">
                                            <a href="javascript:void(0);" class="dropdown-item">
                                                <span class="hstack">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Login</span>
                                                </span>
                                                <i class="feather-chevron-right ms-auto me-0"></i>
                                            </a>
                                            <div class="dropdown-menu nxl-h-dropdown">
                                                <a href="./auth-login-cover.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Cover</span>
                                                </a>
                                                <a href="./auth-login-minimal.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Minimal</span>
                                                </a>
                                                <a href="./auth-login-creative.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Creative</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="dropdown nxl-level-menu">
                                            <a href="javascript:void(0);" class="dropdown-item">
                                                <span class="hstack">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Register</span>
                                                </span>
                                                <i class="feather-chevron-right ms-auto me-0"></i>
                                            </a>
                                            <div class="dropdown-menu nxl-h-dropdown">
                                                <a href="./auth-register-cover.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Cover</span>
                                                </a>
                                                <a href="./auth-register-minimal.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Minimal</span>
                                                </a>
                                                <a href="./auth-register-creative.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Creative</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="dropdown nxl-level-menu">
                                            <a href="javascript:void(0);" class="dropdown-item">
                                                <span class="hstack">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Error-404</span>
                                                </span>
                                                <i class="feather-chevron-right ms-auto me-0"></i>
                                            </a>
                                            <div class="dropdown-menu nxl-h-dropdown">
                                                <a href="./auth-404-cover.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Cover</span>
                                                </a>
                                                <a href="./auth-404-minimal.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Minimal</span>
                                                </a>
                                                <a href="./auth-404-creative.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Creative</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="dropdown nxl-level-menu">
                                            <a href="javascript:void(0);" class="dropdown-item">
                                                <span class="hstack">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Reset Pass</span>
                                                </span>
                                                <i class="feather-chevron-right ms-auto me-0"></i>
                                            </a>
                                            <div class="dropdown-menu nxl-h-dropdown">
                                                <a href="./auth-reset-cover.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Cover</span>
                                                </a>
                                                <a href="./auth-reset-minimal.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Minimal</span>
                                                </a>
                                                <a href="./auth-reset-creative.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Creative</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="dropdown nxl-level-menu">
                                            <a href="javascript:void(0);" class="dropdown-item">
                                                <span class="hstack">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Verify OTP</span>
                                                </span>
                                                <i class="feather-chevron-right ms-auto me-0"></i>
                                            </a>
                                            <div class="dropdown-menu nxl-h-dropdown">
                                                <a href="./auth-verify-cover.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Cover</span>
                                                </a>
                                                <a href="./auth-verify-minimal.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Minimal</span>
                                                </a>
                                                <a href="./auth-verify-creative.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Creative</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="dropdown nxl-level-menu">
                                            <a href="javascript:void(0);" class="dropdown-item">
                                                <span class="hstack">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Maintenance</span>
                                                </span>
                                                <i class="feather-chevron-right ms-auto me-0"></i>
                                            </a>
                                            <div class="dropdown-menu nxl-h-dropdown">
                                                <a href="./auth-maintenance-cover.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Cover</span>
                                                </a>
                                                <a href="./auth-maintenance-minimal.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Minimal</span>
                                                </a>
                                                <a href="./auth-maintenance-creative.html" class="dropdown-item">
                                                    <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                    <span>Creative</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropdown-divider"></div>
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="feather-plus"></i>
                                    <span>Add New Items</span>
                                </a>
                            </div>
                        </div>
                        <!--! [End] nxl-lavel-menu !-->
                        <!--! [Start] nxl-h-item nxl-mega-menu !-->
                        <div class="dropdown nxl-h-item nxl-mega-menu">
                            <!-- <a href="javascript:void(0);" class="btn btn-light-brand" data-bs-toggle="dropdown" data-bs-auto-close="outside"> Mega Menu </a> -->
                            <div class="dropdown-menu nxl-h-dropdown" id="mega-menu-dropdown">
                                <div class="d-lg-flex align-items-start">
                                    <!--! [Start] nxl-mega-menu-tabs !-->
                                    <div class="nav flex-column nxl-mega-menu-tabs" role="tablist" aria-orientation="vertical">
                                        <button class="nav-link active nxl-mega-menu-sm" data-bs-toggle="pill" data-bs-target="#v-pills-general" type="button" role="tab">
                                            <span class="menu-icon">
                                                <i class="feather-airplay"></i>
                                            </span>
                                            <span class="menu-title">General</span>
                                            <span class="menu-arrow">
                                                <i class="feather-chevron-right"></i>
                                            </span>
                                        </button>
                                        <button class="nav-link nxl-mega-menu-md" data-bs-toggle="pill" data-bs-target="#v-pills-applications" type="button" role="tab">
                                            <span class="menu-icon">
                                                <i class="feather-send"></i>
                                            </span>
                                            <span class="menu-title">Applications</span>
                                            <span class="menu-arrow">
                                                <i class="feather-chevron-right"></i>
                                            </span>
                                        </button>
                                        <button class="nav-link nxl-mega-menu-lg" data-bs-toggle="pill" data-bs-target="#v-pills-integrations" type="button" role="tab">
                                            <span class="menu-icon">
                                                <i class="feather-link-2"></i>
                                            </span>
                                            <span class="menu-title">Integrations</span>
                                            <span class="menu-arrow">
                                                <i class="feather-chevron-right"></i>
                                            </span>
                                        </button>
                                        <button class="nav-link nxl-mega-menu-xl" data-bs-toggle="pill" data-bs-target="#v-pills-components" type="button" role="tab">
                                            <span class="menu-icon">
                                                <i class="feather-layers"></i>
                                            </span>
                                            <span class="menu-title">Components</span>
                                            <span class="menu-arrow">
                                                <i class="feather-chevron-right"></i>
                                            </span>
                                        </button>
                                        <button class="nav-link nxl-mega-menu-xxl" data-bs-toggle="pill" data-bs-target="#v-pills-authentication" type="button" role="tab">
                                            <span class="menu-icon">
                                                <i class="feather-cpu"></i>
                                            </span>
                                            <span class="menu-title">Authentication</span>
                                            <span class="menu-arrow">
                                                <i class="feather-chevron-right"></i>
                                            </span>
                                        </button>
                                        <button class="nav-link nxl-mega-menu-full" data-bs-toggle="pill" data-bs-target="#v-pills-miscellaneous" type="button" role="tab">
                                            <span class="menu-icon">
                                                <i class="feather-bluetooth"></i>
                                            </span>
                                            <span class="menu-title">Miscellaneous</span>
                                            <span class="menu-arrow">
                                                <i class="feather-chevron-right"></i>
                                            </span>
                                        </button>
                                    </div>
                                    <!--! [End] nxl-mega-menu-tabs !-->
                                    <!--! [Start] nxl-mega-menu-tabs-content !-->
                                    <div class="tab-content nxl-mega-menu-tabs-content">
                                        <!--! [Start] v-pills-general !-->
                                        <div class="tab-pane fade show active" id="v-pills-general" role="tabpanel">
                                            <div class="mb-4 rounded-3 border">
                                                <img src="assets/images/banner/mockup.png" alt="" class="img-fluid rounded-3">
                                            </div>
                                            <h6 class="fw-bolder">Duralux - Admin Dashboard UiKit</h6>
                                            <p class="fs-12 fw-normal text-muted text-truncate-3-line">Get started Duralux with Duralux up and running. Duralux bootstrap template docs helps you to get started with simple html codes.</p>
                                            <a href="javascript:void(0);" class="fs-13 fw-bold text-primary">Get Started &rarr;</a>
                                        </div>
                                        <!--! [End] v-pills-general !-->
                                        <!--! [Start] v-pills-applications !-->
                                        <div class="tab-pane fade" id="v-pills-applications" role="tabpanel">
                                            <div class="row g-4">
                                                <div class="col-lg-6">
                                                    <h6 class="dropdown-item-title">Applications</h6>
                                                    <a href="apps-chat.html" class="dropdown-item">
                                                        <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                        <span>Chat</span>
                                                    </a>
                                                    <a href="apps-email.html" class="dropdown-item">
                                                        <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                        <span>Email</span>
                                                    </a>
                                                    <a href="apps-tasks.html" class="dropdown-item">
                                                        <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                        <span>Tasks</span>
                                                    </a>
                                                    <a href="apps-notes.html" class="dropdown-item">
                                                        <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                        <span>Notes</span>
                                                    </a>
                                                    <a href="apps-storage.html" class="dropdown-item">
                                                        <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                        <span>Storage</span>
                                                    </a>
                                                    <a href="apps-calendar.html" class="dropdown-item">
                                                        <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                        <span>Calendar</span>
                                                    </a>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="nxl-mega-menu-image">
                                                        <img src="assets/images/general/full-avatar.png" alt="" class="img-fluid full-user-avtar">
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="border-top-dashed">
                                            <div class="d-lg-flex align-items-center justify-content-between">
                                                <div>
                                                    <h6 class="menu-item-heading text-truncate-1-line">Need more application?</h6>
                                                    <p class="fs-12 text-muted mb-0 text-truncate-3-line">We are ready to build custom applications.</p>
                                                </div>
                                                <div class="mt-2 mt-lg-0">
                                                    <a href="mailto:theme_ocean@gmail.com" class="fs-13 fw-bold text-primary">Contact Us &rarr;</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--! [End] v-pills-applications !-->
                                        <!--! [Start] v-pills-integrations !-->
                                        <div class="tab-pane fade" id="v-pills-integrations" role="tabpanel">
                                            <div class="row g-lg-4 nxl-mega-menu-integrations">
                                                <div class="col-lg-12 d-lg-flex align-items-center justify-content-between mb-4 mb-lg-0">
                                                    <div>
                                                        <h6 class="fw-bolder text-dark">Integrations</h6>
                                                        <p class="fs-12 text-muted mb-0">Connect amazing apps on your bucket.</p>
                                                    </div>
                                                    <div class="mt-2 mt-lg-0">
                                                        <a href="javascript:void(0);" class="fs-13 text-primary">Add New &rarr;</a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/app-store.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">App Store</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/spotify.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Spotify</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/figma.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Figma</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/shopify.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Shopify</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/paypal.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Paypal</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/gmail.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Gmail</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/dropbox.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Dropbox</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/google-drive.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Google Drive</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/github.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Github</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/gitlab.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Gitlab</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/facebook.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Facebook</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/pinterest.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Pinterest</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/instagram.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Instagram</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/twitter.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Twitter</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:void(0);" class="dropdown-item">
                                                        <div class="menu-item-icon">
                                                            <img src="assets/images/brand/youtube.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="menu-item-title">Youtube</div>
                                                        <div class="menu-item-arrow">
                                                            <i class="feather-arrow-right"></i>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <hr class="border-top-dashed">
                                            <p class="fs-13 text-muted mb-0">Need help? Contact our <a href="javascript:void(0);" class="fst-italic">support center</a></p>
                                        </div>
                                        <!--! [End] v-pills-integrations !-->
                                        <!--! [Start] v-pills-components !-->
                                        <div class="tab-pane fade" id="v-pills-components" role="tabpanel">
                                            <div class="row g-4 align-items-center">
                                                <div class="col-xl-8">
                                                    <div class="row g-4">
                                                        <div class="col-lg-4">
                                                            <h6 class="dropdown-item-title">Navigation</h6>
                                                            <a href="javascript:void(0);" class="dropdown-item">CRM</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Analytics</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Sales</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Leads</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Projects</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Timesheets</a>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <h6 class="dropdown-item-title">Pages</h6>
                                                            <a href="javascript:void(0);" class="dropdown-item">Leads </a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Payments</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Projects</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Proposals</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Customers</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Documentations</a>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <h6 class="dropdown-item-title">Authentication</h6>
                                                            <a href="javascript:void(0);" class="dropdown-item">Login</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Regiser</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Error-404</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Reset Pass</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Verify OTP</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Maintenance</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4">
                                                    <div class="nxl-mega-menu-image">
                                                        <img src="assets/images/banner/1.jpg" alt="" class="img-fluid">
                                                    </div>
                                                    <div class="mt-4">
                                                        <a href="mailto:theme_ocean@gmail.com" class="fs-13 fw-bold">View all resources on Duralux &rarr;</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--! [End] v-pills-components !-->
                                        <!--! [Start] v-pills-authentication !-->
                                        <div class="tab-pane fade" id="v-pills-authentication" role="tabpanel">
                                            <div class="row g-4 align-items-center nxl-mega-menu-authentication">
                                                <div class="col-xl-8">
                                                    <div class="row g-4">
                                                        <div class="col-lg-4">
                                                            <h6 class="dropdown-item-title">Cover</h6>
                                                            <a href="./auth-login-cover.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Login</span>
                                                            </a>
                                                            <a href="./auth-register-cover.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Register</span>
                                                            </a>
                                                            <a href="./auth-404-cover.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Error-404</span>
                                                            </a>
                                                            <a href="./auth-reset-cover.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Reset Pass</span>
                                                            </a>
                                                            <a href="./auth-verify-cover.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Verify OTP</span>
                                                            </a>
                                                            <a href="./auth-maintenance-cover.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Maintenance</span>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <h6 class="dropdown-item-title">Minimal</h6>
                                                            <a href="./auth-login-minimal.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Login</span>
                                                            </a>
                                                            <a href="./auth-register-minimal.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Register</span>
                                                            </a>
                                                            <a href="./auth-404-minimal.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Error-404</span>
                                                            </a>
                                                            <a href="./auth-reset-minimal.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Reset Pass</span>
                                                            </a>
                                                            <a href="./auth-verify-minimal.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Verify OTP</span>
                                                            </a>
                                                            <a href="./auth-maintenance-minimal.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Maintenance</span>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <h6 class="dropdown-item-title">Creative</h6>
                                                            <a href="./auth-login-creative.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Login</span>
                                                            </a>
                                                            <a href="./auth-register-creative.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Register</span>
                                                            </a>
                                                            <a href="./auth-404-creative.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Error-404</span>
                                                            </a>
                                                            <a href="./auth-reset-creative.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Reset Pass</span>
                                                            </a>
                                                            <a href="./auth-verify-creative.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Verify OTP</span>
                                                            </a>
                                                            <a href="./auth-maintenance-creative.html" class="dropdown-item">
                                                                <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                                                <span>Maintenance</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4">
                                                    <div id="carouselResourcesCaptions" class="carousel slide" data-bs-ride="carousel">
                                                        <div class="carousel-indicators">
                                                            <button type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide-to="0" class="active" aria-current="true"></button>
                                                            <button type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide-to="1"></button>
                                                            <button type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide-to="2"></button>
                                                            <button type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide-to="3"></button>
                                                            <button type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide-to="4"></button>
                                                            <button type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide-to="5"></button>
                                                        </div>
                                                        <div class="carousel-inner rounded-3">
                                                            <div class="carousel-item active">
                                                                <div class="nxl-mega-menu-image">
                                                                    <img src="assets/images/banner/6.jpg" alt="" class="img-fluid d-block w-100">
                                                                </div>
                                                                <div class="carousel-caption">
                                                                    <h5 class="carousel-caption-title text-truncate-1-line">Shopify eCommerce Store</h5>
                                                                    <p class="carousel-caption-desc">Some representative placeholder content for the first slide.</p>
                                                                </div>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <div class="nxl-mega-menu-image">
                                                                    <img src="assets/images/banner/5.jpg" alt="" class="img-fluid d-block w-100">
                                                                </div>
                                                                <div class="carousel-caption">
                                                                    <h5 class="carousel-caption-title text-truncate-1-line">iOS Apps Development</h5>
                                                                    <p class="carousel-caption-desc">Some representative placeholder content for the second slide.</p>
                                                                </div>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <div class="nxl-mega-menu-image">
                                                                    <img src="assets/images/banner/4.jpg" alt="" class="img-fluid d-block w-100">
                                                                </div>
                                                                <div class="carousel-caption">
                                                                    <h5 class="carousel-caption-title text-truncate-1-line">Figma Dashboard Design</h5>
                                                                    <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                </div>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <div class="nxl-mega-menu-image">
                                                                    <img src="assets/images/banner/3.jpg" alt="" class="img-fluid d-block w-100">
                                                                </div>
                                                                <div class="carousel-caption">
                                                                    <h5 class="carousel-caption-title text-truncate-1-line">React Dashboard Design</h5>
                                                                    <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                </div>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <div class="nxl-mega-menu-image">
                                                                    <img src="assets/images/banner/2.jpg" alt="" class="img-fluid d-block w-100">
                                                                </div>
                                                                <div class="carousel-caption">
                                                                    <h5 class="carousel-caption-title text-truncate-1-line">Standup Team Meeting</h5>
                                                                    <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                </div>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <div class="nxl-mega-menu-image">
                                                                    <img src="assets/images/banner/1.jpg" alt="" class="img-fluid d-block w-100">
                                                                </div>
                                                                <div class="carousel-caption">
                                                                    <h5 class="carousel-caption-title text-truncate-1-line">Zoom Team Meeting</h5>
                                                                    <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                            <span class="visually-hidden">Previous</span>
                                                        </button>
                                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselResourcesCaptions" data-bs-slide="next">
                                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                            <span class="visually-hidden">Next</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--! [End] v-pills-authentication !-->
                                        <!--! [Start] v-pills-miscellaneous !-->
                                        <div class="tab-pane fade nxl-mega-menu-miscellaneous" id="v-pills-miscellaneous" role="tabpanel">
                                            <!-- Nav tabs -->
                                            <ul class="nav nav-tabs flex-column flex-lg-row nxl-mega-menu-miscellaneous-tabs" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#v-pills-projects" type="button" role="tab">
                                                        <span class="menu-icon">
                                                            <i class="feather-cast"></i>
                                                        </span>
                                                        <span class="menu-title">Projects</span>
                                                    </button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#v-pills-services" type="button" role="tab">
                                                        <span class="menu-icon">
                                                            <i class="feather-check-square"></i>
                                                        </span>
                                                        <span class="menu-title">Services</span>
                                                    </button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#v-pills-features" type="button" role="tab">
                                                        <span class="menu-icon">
                                                            <i class="feather-airplay"></i>
                                                        </span>
                                                        <span class="menu-title">Features</span>
                                                    </button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#v-pills-blogs" type="button" role="tab">
                                                        <span class="menu-icon">
                                                            <i class="feather-bold"></i>
                                                        </span>
                                                        <span class="menu-title">Blogs</span>
                                                    </button>
                                                </li>
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content nxl-mega-menu-miscellaneous-content">
                                                <div class="tab-pane fade active show" id="v-pills-projects" role="tabpanel">
                                                    <div class="row g-4">
                                                        <div class="col-xxl-2 d-lg-none d-xxl-block">
                                                            <h6 class="dropdown-item-title">Categories</h6>
                                                            <a href="javascript:void(0);" class="dropdown-item">Support</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Services</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Applicatios</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">eCommerce</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Development</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Miscellaneous</a>
                                                        </div>
                                                        <div class="col-xxl-10">
                                                            <div class="row g-4">
                                                                <div class="col-xl-6">
                                                                    <div class="d-lg-flex align-items-center gap-3">
                                                                        <div class="wd-150 rounded-3">
                                                                            <img src="assets/images/banner/1.jpg" alt="" class="img-fluid rounded-3">
                                                                        </div>
                                                                        <div class="mt-3 mt-lg-0 ms-lg-3 item-text">
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Shopify eCommerce Store</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nam ullam iure eum sed rerum libero quis doloremque maiores veritatis?</p>
                                                                            <div class="hstack gap-2 mt-3">
                                                                                <div class="avatar-image avatar-sm">
                                                                                    <img src="assets/images/avatar/1.png" alt="" class="img-fluid">
                                                                                </div>
                                                                                <a href="javascript:void(0);" class="fs-12">Alexandra Della</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-6">
                                                                    <div class="d-lg-flex align-items-center gap-3">
                                                                        <div class="wd-150 rounded-3">
                                                                            <img src="assets/images/banner/2.jpg" alt="" class="img-fluid rounded-3">
                                                                        </div>
                                                                        <div class="mt-3 mt-lg-0 ms-lg-3 item-text">
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">iOS Apps Development</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nam ullam iure eum sed rerum libero quis doloremque maiores veritatis?</p>
                                                                            <div class="hstack gap-2 mt-3">
                                                                                <div class="avatar-image avatar-sm">
                                                                                    <img src="assets/images/avatar/2.png" alt="" class="img-fluid">
                                                                                </div>
                                                                                <a href="javascript:void(0);" class="fs-12">Green Cute</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-6">
                                                                    <div class="d-lg-flex align-items-center gap-3">
                                                                        <div class="wd-150 rounded-3">
                                                                            <img src="assets/images/banner/3.jpg" alt="" class="img-fluid rounded-3">
                                                                        </div>
                                                                        <div class="mt-3 mt-lg-0 ms-lg-3 item-text">
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Figma Dashboard Design</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nam ullam iure eum sed rerum libero quis doloremque maiores veritatis?</p>
                                                                            <div class="hstack gap-2 mt-3">
                                                                                <div class="avatar-image avatar-sm">
                                                                                    <img src="assets/images/avatar/3.png" alt="" class="img-fluid">
                                                                                </div>
                                                                                <a href="javascript:void(0);" class="fs-12">Malanie Hanvey</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-6">
                                                                    <div class="d-lg-flex align-items-center gap-3">
                                                                        <div class="wd-150 rounded-3">
                                                                            <img src="assets/images/banner/4.jpg" alt="" class="img-fluid rounded-3">
                                                                        </div>
                                                                        <div class="mt-3 mt-lg-0 ms-lg-3 item-text">
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">React Dashboard Design</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nam ullam iure eum sed rerum libero quis doloremque maiores veritatis?</p>
                                                                            <div class="hstack gap-2 mt-3">
                                                                                <div class="avatar-image avatar-sm">
                                                                                    <img src="assets/images/avatar/4.png" alt="" class="img-fluid">
                                                                                </div>
                                                                                <a href="javascript:void(0);" class="fs-12">Kenneth Hune</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="v-pills-services" role="tabpanel">
                                                    <div class="row g-4 nxl-mega-menu-miscellaneous-services">
                                                        <div class="col-xl-8">
                                                            <div class="row g-4">
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg rounded bg-primary text-white">
                                                                            <i class="feather-bar-chart-2 mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Analytics Services</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg rounded bg-danger text-white">
                                                                            <i class="feather-feather mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Content Writing</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg rounded bg-warning text-white">
                                                                            <i class="feather-bell mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">SEO (Search Engine Optimization)</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg rounded bg-success text-white">
                                                                            <i class="feather-shield mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Security Services</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg rounded bg-teal text-white">
                                                                            <i class="feather-shopping-cart mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">eCommerce Services</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg rounded bg-dark text-white">
                                                                            <i class="feather-life-buoy mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Support Services</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <div class="p-3 bg-soft-dark text-dark rounded d-lg-flex align-items-center justify-content-between">
                                                                        <div class="fs-13">
                                                                            <i class="feather-star me-2"></i>
                                                                            <span>View all services on Duralux.</span>
                                                                        </div>
                                                                        <div class="mt-2 mt-lg-0">
                                                                            <a href="javascript:void(0);" class="fs-13 text-primary">Learn More &rarr;</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-4">
                                                            <div id="carouselServicesCaptions" class="carousel slide" data-bs-ride="carousel">
                                                                <div class="carousel-indicators">
                                                                    <button type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide-to="0" class="active" aria-current="true"></button>
                                                                    <button type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide-to="1"></button>
                                                                    <button type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide-to="2"></button>
                                                                    <button type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide-to="3"></button>
                                                                    <button type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide-to="4"></button>
                                                                    <button type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide-to="5"></button>
                                                                </div>
                                                                <div class="carousel-inner rounded-3">
                                                                    <div class="carousel-item active">
                                                                        <div class="nxl-mega-menu-image">
                                                                            <img src="assets/images/banner/6.jpg" alt="" class="img-fluid d-block w-100">
                                                                        </div>
                                                                        <div class="carousel-caption">
                                                                            <h5 class="carousel-caption-title text-truncate-1-line">Shopify eCommerce Store</h5>
                                                                            <p class="carousel-caption-desc">Some representative placeholder content for the first slide.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <div class="nxl-mega-menu-image">
                                                                            <img src="assets/images/banner/5.jpg" alt="" class="img-fluid d-block w-100">
                                                                        </div>
                                                                        <div class="carousel-caption">
                                                                            <h5 class="carousel-caption-title text-truncate-1-line">iOS Apps Development</h5>
                                                                            <p class="carousel-caption-desc">Some representative placeholder content for the second slide.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <div class="nxl-mega-menu-image">
                                                                            <img src="assets/images/banner/4.jpg" alt="" class="img-fluid d-block w-100">
                                                                        </div>
                                                                        <div class="carousel-caption">
                                                                            <h5 class="carousel-caption-title text-truncate-1-line">Figma Dashboard Design</h5>
                                                                            <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <div class="nxl-mega-menu-image">
                                                                            <img src="assets/images/banner/3.jpg" alt="" class="img-fluid d-block w-100">
                                                                        </div>
                                                                        <div class="carousel-caption">
                                                                            <h5 class="carousel-caption-title text-truncate-1-line">React Dashboard Design</h5>
                                                                            <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <div class="nxl-mega-menu-image">
                                                                            <img src="assets/images/banner/2.jpg" alt="" class="img-fluid d-block w-100">
                                                                        </div>
                                                                        <div class="carousel-caption">
                                                                            <h5 class="carousel-caption-title text-truncate-1-line">Standup Team Meeting</h5>
                                                                            <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <div class="nxl-mega-menu-image">
                                                                            <img src="assets/images/banner/1.jpg" alt="" class="img-fluid d-block w-100">
                                                                        </div>
                                                                        <div class="carousel-caption">
                                                                            <h5 class="carousel-caption-title text-truncate-1-line">Zoom Team Meeting</h5>
                                                                            <p class="carousel-caption-desc">Some representative placeholder content for the third slide.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide="prev">
                                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                    <span class="visually-hidden">Previous</span>
                                                                </button>
                                                                <button class="carousel-control-next" type="button" data-bs-target="#carouselServicesCaptions" data-bs-slide="next">
                                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                    <span class="visually-hidden">Next</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="v-pills-features" role="tabpanel">
                                                    <div class="row g-4 nxl-mega-menu-miscellaneous-features">
                                                        <div class="col-xl-8">
                                                            <div class="row g-4">
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg bg-soft-primary text-primary border-soft-primary rounded">
                                                                            <i class="feather-bell mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Notifications</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg bg-soft-danger text-danger border-soft-danger rounded">
                                                                            <i class="feather-bar-chart-2 mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Analytics</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg bg-soft-success text-success border-soft-success rounded">
                                                                            <i class="feather-link-2 mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Ingetrations</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg bg-soft-indigo text-indigo border-soft-indigo rounded">
                                                                            <i class="feather-book mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Documentations</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg bg-soft-warning text-warning border-soft-warning rounded">
                                                                            <i class="feather-shield mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Security</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="d-flex align-items-start gap-3">
                                                                        <div class="avatar-text avatar-lg bg-soft-teal text-teal border-soft-teal rounded">
                                                                            <i class="feather-life-buoy mx-auto"></i>
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Support</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum dolor sit amet consectetur adipisicing elit Unde numquam rem dignissimos. elit Unde numquam rem dignissimos.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xxl-3 offset-xxl-1 col-xl-4">
                                                            <div class="nxl-mega-menu-image">
                                                                <img src="assets/images/banner/1.jpg" alt="" class="img-fluid">
                                                            </div>
                                                            <div class="mt-4">
                                                                <a href="mailto:theme_ocean@gmail.com" class="fs-13 fw-bold">View all features on Duralux &rarr;</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="v-pills-blogs" role="tabpanel">
                                                    <div class="row g-4">
                                                        <div class="col-xxl-2 d-lg-none d-xxl-block">
                                                            <h6 class="dropdown-item-title">Categories</h6>
                                                            <a href="javascript:void(0);" class="dropdown-item">Support</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Services</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Applicatios</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">eCommerce</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Development</a>
                                                            <a href="javascript:void(0);" class="dropdown-item">Miscellaneous</a>
                                                        </div>
                                                        <div class="col-xxl-10">
                                                            <div class="row g-4">
                                                                <div class="col-xxl-4 col-lg-6">
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="wd-100 rounded-3">
                                                                            <img src="assets/images/banner/1.jpg" alt="" class="img-fluid rounded-3 border border-3">
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Lorem ipsum dolor sit</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eius dolor quo commodi nisi animi error minus quia aliquam.</p>
                                                                            <span class="fs-11 text-gray-500">26 March, 2023</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xxl-4 col-lg-6">
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="wd-100 rounded-3">
                                                                            <img src="assets/images/banner/2.jpg" alt="" class="img-fluid rounded-3 border border-3">
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Lorem ipsum dolor sit</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eius dolor quo commodi nisi animi error minus quia aliquam.</p>
                                                                            <span class="fs-11 text-gray-500">26 March, 2023</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xxl-4 col-lg-6">
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="wd-100 rounded-3">
                                                                            <img src="assets/images/banner/3.jpg" alt="" class="img-fluid rounded-3 border border-3">
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Lorem ipsum dolor sit</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eius dolor quo commodi nisi animi error minus quia aliquam.</p>
                                                                            <span class="fs-11 text-gray-500">26 March, 2023</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xxl-4 col-lg-6">
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="wd-100 rounded-3">
                                                                            <img src="assets/images/banner/4.jpg" alt="" class="img-fluid rounded-3 border border-3">
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Lorem ipsum dolor sit</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eius dolor quo commodi nisi animi error minus quia aliquam.</p>
                                                                            <span class="fs-11 text-gray-500">26 March, 2023</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xxl-4 col-lg-6">
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="wd-100 rounded-3">
                                                                            <img src="assets/images/banner/5.jpg" alt="" class="img-fluid rounded-3 border border-3">
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Lorem ipsum dolor sit</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eius dolor quo commodi nisi animi error minus quia aliquam.</p>
                                                                            <span class="fs-11 text-gray-500">26 March, 2023</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xxl-4 col-lg-6">
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="wd-100 rounded-3">
                                                                            <img src="assets/images/banner/6.jpg" alt="" class="img-fluid rounded-3 border border-3">
                                                                        </div>
                                                                        <div>
                                                                            <a href="javascript:void(0);">
                                                                                <h6 class="menu-item-heading text-truncate-1-line">Lorem ipsum dolor sit</h6>
                                                                            </a>
                                                                            <p class="fs-12 fw-normal text-muted mb-0 text-truncate-2-line">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eius dolor quo commodi nisi animi error minus quia aliquam.</p>
                                                                            <span class="fs-11 text-gray-500">26 March, 2023</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <div class="p-3 bg-soft-dark text-dark rounded d-flex align-items-center justify-content-between gap-4">
                                                                        <div class="fs-13 text-truncate-1-line">
                                                                            <i class="feather-star me-2"></i>
                                                                            <strong>Version 2.3.2 is out!</strong>
                                                                            <span>Learn more about our news and schedule reporting.</span>
                                                                        </div>
                                                                        <div class="wd-100 text-end">
                                                                            <a href="javascript:void(0);" class="fs-13 text-primary">Learn More &rarr;</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--! [End] v-pills-miscellaneous !-->
                                    </div>
                                    <!--! [End] nxl-mega-menu-tabs-content !-->
                                </div>
                            </div>
                        </div>
                        <!--! [End] nxl-h-item nxl-mega-menu !-->
                    </div>
                    <!--! [End] nxl-lavel-mega-menu-wrapper !-->
                </div>
                <!--! [End] nxl-lavel-mega-menu !-->
            </div>
            <!--! [End] Header Left !-->
            <!--! [Start] Header Right !-->
            <div class="header-right ms-auto">
                <div class="d-flex align-items-center">
                    <div class="dropdown nxl-h-item nxl-header-search">
                        <!-- <a href="javascript:void(0);" class="nxl-head-link me-0" data-bs-toggle="dropdown" data-bs-auto-close="outside">
                            <i class="feather-search"></i>
                        </a> -->
                        <div class="dropdown-menu dropdown-menu-end nxl-h-dropdown nxl-search-dropdown">
                            <div class="input-group search-form">
                                <span class="input-group-text">
                                    <i class="feather-search fs-6 text-muted"></i>
                                </span>
                                <input type="text" class="form-control search-input-field" placeholder="Search....">
                                <span class="input-group-text">
                                    <button type="button" class="btn-close"></button>
                                </span>
                            </div>
                            <div class="dropdown-divider mt-0"></div>
                            <div class="search-items-wrapper">
                                <div class="searching-for px-4 py-2">
                                    <p class="fs-11 fw-medium text-muted">I'm searching for...</p>
                                    <div class="d-flex flex-wrap gap-1">
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Projects</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Leads</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Contacts</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Inbox</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Invoices</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Tasks</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Customers</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Notes</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Affiliate</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Storage</a>
                                        <a href="javascript:void(0);" class="flex-fill border rounded py-1 px-2 text-center fs-11 fw-semibold">Calendar</a>
                                    </div>
                                </div>
                                <div class="dropdown-divider"></div>
                                <div class="recent-result px-4 py-2">
                                    <h4 class="fs-13 fw-normal text-gray-600 mb-3">Recnet <span class="badge small bg-gray-200 rounded ms-1 text-dark">3</span></h4>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-text rounded">
                                                <i class="feather-airplay"></i>
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">CRM dashboard redesign</a>
                                                <p class="fs-11 text-muted mb-0">Home / project / crm</p>
                                            </div>
                                        </div>
                                        <div>
                                            <a href="javascript:void(0);" class="badge border rounded text-dark">/<i class="feather-command ms-1 fs-10"></i></a>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-text rounded">
                                                <i class="feather-file-plus"></i>
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Create new document</a>
                                                <p class="fs-11 text-muted mb-0">Home / tasks / docs</p>
                                            </div>
                                        </div>
                                        <div>
                                            <a href="javascript:void(0);" class="badge border rounded text-dark">N /<i class="feather-command ms-1 fs-10"></i></a>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-text rounded">
                                                <i class="feather-user-plus"></i>
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Invite project colleagues</a>
                                                <p class="fs-11 text-muted mb-0">Home / project / invite</p>
                                            </div>
                                        </div>
                                        <div>
                                            <a href="javascript:void(0);" class="badge border rounded text-dark">P /<i class="feather-command ms-1 fs-10"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="dropdown-divider my-3"></div>
                                <div class="users-result px-4 py-2">
                                    <h4 class="fs-13 fw-normal text-gray-600 mb-3">Users <span class="badge small bg-gray-200 rounded ms-1 text-dark">5</span></h4>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image rounded">
                                                <img src="assets/images/avatar/1.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Alexandra Della</a>
                                                <p class="fs-11 text-muted mb-0">alex.della@outlook.com</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-chevron-right"></i>
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image rounded">
                                                <img src="assets/images/avatar/2.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Green Cute</a>
                                                <p class="fs-11 text-muted mb-0">green.cute@outlook.com</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-chevron-right"></i>
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image rounded">
                                                <img src="assets/images/avatar/3.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Malanie Hanvey</a>
                                                <p class="fs-11 text-muted mb-0">malanie.anvey@outlook.com</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-chevron-right"></i>
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image rounded">
                                                <img src="assets/images/avatar/4.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Kenneth Hune</a>
                                                <p class="fs-11 text-muted mb-0">kenth.hune@outlook.com</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-chevron-right"></i>
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-0">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image rounded">
                                                <img src="assets/images/avatar/5.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Archie Cantones</a>
                                                <p class="fs-11 text-muted mb-0">archie.cones@outlook.com</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-chevron-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown-divider my-3"></div>
                                <div class="file-result px-4 py-2">
                                    <h4 class="fs-13 fw-normal text-gray-600 mb-3">Files <span class="badge small bg-gray-200 rounded ms-1 text-dark">3</span></h4>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image bg-gray-200 rounded">
                                                <img src="assets/images/file-icons/css.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Project Style CSS</a>
                                                <p class="fs-11 text-muted mb-0">05.74 MB</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-download"></i>
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image bg-gray-200 rounded">
                                                <img src="assets/images/file-icons/zip.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Dashboard Project Zip</a>
                                                <p class="fs-11 text-muted mb-0">46.83 MB</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-download"></i>
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-0">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="avatar-image bg-gray-200 rounded">
                                                <img src="assets/images/file-icons/pdf.png" alt="" class="img-fluid">
                                            </div>
                                            <div>
                                                <a href="javascript:void(0);" class="font-body fw-bold d-block mb-1">Project Document PDF</a>
                                                <p class="fs-11 text-muted mb-0">12.85 MB</p>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="avatar-text avatar-md">
                                            <i class="feather-download"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="dropdown-divider mt-3 mb-0"></div>
                                <a href="javascript:void(0);" class="p-3 fs-10 fw-bold text-uppercase text-center d-block">Loar More</a>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown nxl-h-item nxl-header-language d-none d-sm-flex">
                        <!-- <a href="javascript:void(0);" class="nxl-head-link me-0 nxl-language-link" data-bs-toggle="dropdown" data-bs-auto-close="outside">
                            <img src="assets/vendors/img/flags/4x3/us.svg" alt="" class="img-fluid wd-20">
                        </a> -->
                        <div class="dropdown-menu dropdown-menu-end nxl-h-dropdown nxl-language-dropdown">
                            <div class="dropdown-divider mt-0"></div>
                            <div class="language-items-wrapper">
                                <div class="select-language px-4 py-2 hstack justify-content-between gap-4">
                                    <div class="lh-lg">
                                        <h6 class="mb-0">Select Language</h6>
                                        <p class="fs-11 text-muted mb-0">12 languages avaiable!</p>
                                    </div>
                                    <a href="javascript:void(0);" class="avatar-text avatar-md" data-bs-toggle="tooltip" title="Add Language">
                                        <i class="feather-plus"></i>
                                    </a>
                                </div>
                                <div class="dropdown-divider"></div>
                                <div class="row px-4 pt-3">
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/sa.svg" alt="" class="img-fluid"></div>
                                            <span>Arabic</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/bd.svg" alt="" class="img-fluid"></div>
                                            <span>Bengali</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/ch.svg" alt="" class="img-fluid"></div>
                                            <span>Chinese</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/nl.svg" alt="" class="img-fluid"></div>
                                            <span>Dutch</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select active">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/us.svg" alt="" class="img-fluid"></div>
                                            <span>English</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/fr.svg" alt="" class="img-fluid"></div>
                                            <span>French</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/de.svg" alt="" class="img-fluid"></div>
                                            <span>German</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/in.svg" alt="" class="img-fluid"></div>
                                            <span>Hindi</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/ru.svg" alt="" class="img-fluid"></div>
                                            <span>Russian</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/es.svg" alt="" class="img-fluid"></div>
                                            <span>Spanish</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/tr.svg" alt="" class="img-fluid"></div>
                                            <span>Turkish</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-4 col-6 language_select">
                                        <a href="javascript:void(0);" class="d-flex align-items-center gap-2">
                                            <div class="avatar-image avatar-sm"><img src="assets/vendors/img/flags/1x1/pk.svg" alt="" class="img-fluid"></div>
                                            <span>Urdo</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="nxl-h-item d-none d-sm-flex">
                        <div class="full-screen-switcher">
                            <!-- <a href="javascript:void(0);" class="nxl-head-link me-0" onclick="$('body').fullScreenHelper('toggle');">
                                <i class="feather-maximize maximize"></i>
                                <i class="feather-minimize minimize"></i>
                            </a> -->
                        </div>
                    </div>
                    <div class="nxl-h-item dark-light-theme">
                        <!-- <a href="javascript:void(0);" class="nxl-head-link me-0 dark-button">
                            <i class="feather-moon"></i>
                        </a> -->
                        <a href="javascript:void(0);" class="nxl-head-link me-0 light-button" style="display: none">
                            <i class="feather-sun"></i>
                        </a>
                    </div>
                    <div class="dropdown nxl-h-item">
                        <a href="javascript:void(0);" class="nxl-head-link me-0" data-bs-toggle="dropdown" role="button" data-bs-auto-close="outside">
                            <i class="feather-clock"></i>
                            <span class="badge bg-success nxl-h-badge">2</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end nxl-h-dropdown nxl-timesheets-menu">
                            <div class="d-flex justify-content-between align-items-center timesheets-head">
                                <h6 class="fw-bold text-dark mb-0">Timesheets</h6>
                                <a href="javascript:void(0);" class="fs-11 text-success text-end ms-auto" data-bs-toggle="tooltip" title="Upcomming Timers">
                                    <i class="feather-clock"></i>
                                    <span>3 Upcomming</span>
                                </a>
                            </div>
                            <div class="d-flex justify-content-between align-items-center flex-column timesheets-body">
                                <i class="feather-clock fs-1 mb-4"></i>
                                <p class="text-muted">No started timers found yes!</p>
                                <a href="javascript:void(0);" class="btn btn-sm btn-primary">Started Timer</a>
                            </div>
                            <div class="text-center timesheets-footer">
                                <a href="javascript:void(0);" class="fs-13 fw-semibold text-dark">Alls Timesheets</a>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown nxl-h-item">
                        <a class="nxl-head-link me-3" data-bs-toggle="dropdown" href="#" role="button" data-bs-auto-close="outside">
                            <i class="feather-bell"></i>
                            <span class="badge bg-danger nxl-h-badge">3</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end nxl-h-dropdown nxl-notifications-menu">
                            <div class="d-flex justify-content-between align-items-center notifications-head">
                                <h6 class="fw-bold text-dark mb-0">Notifications</h6>
                                <a href="javascript:void(0);" class="fs-11 text-success text-end ms-auto" data-bs-toggle="tooltip" title="Make as Read">
                                    <i class="feather-check"></i>
                                    <span>Make as Read</span>
                                </a>
                            </div>
                            <div class="notifications-item">
                                <img src="assets/images/avatar/2.png" alt="" class="rounded me-3 border">
                                <div class="notifications-desc">
                                    <a href="javascript:void(0);" class="font-body text-truncate-2-line"> <span class="fw-semibold text-dark">Malanie Hanvey</span> We should talk about that at lunch!</a>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="notifications-date text-muted border-bottom border-bottom-dashed">2 minutes ago</div>
                                        <div class="d-flex align-items-center float-end gap-2">
                                            <a href="javascript:void(0);" class="d-block wd-8 ht-8 rounded-circle bg-gray-300" data-bs-toggle="tooltip" title="Make as Read"></a>
                                            <a href="javascript:void(0);" class="text-danger" data-bs-toggle="tooltip" title="Remove">
                                                <i class="feather-x fs-12"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="notifications-item">
                                <img src="assets/images/avatar/3.png" alt="" class="rounded me-3 border">
                                <div class="notifications-desc">
                                    <a href="javascript:void(0);" class="font-body text-truncate-2-line"> <span class="fw-semibold text-dark">Valentine Maton</span> You can download the latest invoices now.</a>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="notifications-date text-muted border-bottom border-bottom-dashed">36 minutes ago</div>
                                        <div class="d-flex align-items-center float-end gap-2">
                                            <a href="javascript:void(0);" class="d-block wd-8 ht-8 rounded-circle bg-gray-300" data-bs-toggle="tooltip" title="Make as Read"></a>
                                            <a href="javascript:void(0);" class="text-danger" data-bs-toggle="tooltip" title="Remove">
                                                <i class="feather-x fs-12"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="notifications-item">
                                <img src="assets/images/avatar/4.png" alt="" class="rounded me-3 border">
                                <div class="notifications-desc">
                                    <a href="javascript:void(0);" class="font-body text-truncate-2-line"> <span class="fw-semibold text-dark">Archie Cantones</span> Don't forget to pickup Jeremy after school!</a>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="notifications-date text-muted border-bottom border-bottom-dashed">53 minutes ago</div>
                                        <div class="d-flex align-items-center float-end gap-2">
                                            <a href="javascript:void(0);" class="d-block wd-8 ht-8 rounded-circle bg-gray-300" data-bs-toggle="tooltip" title="Make as Read"></a>
                                            <a href="javascript:void(0);" class="text-danger" data-bs-toggle="tooltip" title="Remove">
                                                <i class="feather-x fs-12"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center notifications-footer">
                                <a href="javascript:void(0);" class="fs-13 fw-semibold text-dark">Alls Notifications</a>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown nxl-h-item">
                        <a href="javascript:void(0);" data-bs-toggle="dropdown" role="button" data-bs-auto-close="outside">
                            <img src="assets/images/avatar/1.png" alt="user-image" class="img-fluid user-avtar me-0">
                        </a>
                        <div class="dropdown-menu dropdown-menu-end nxl-h-dropdown nxl-user-dropdown">
                            <div class="dropdown-header">
                                <div class="d-flex align-items-center">
                                    <img src="assets/images/avatar/1.png" alt="user-image" class="img-fluid user-avtar">
                                    <div>
                                        <h6 class="text-dark mb-0">Alexandra Della <span class="badge bg-soft-success text-success ms-1">PRO</span></h6>
                                        <span class="fs-12 fw-medium text-muted">alex.della@outlook.com</span>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-item" data-bs-toggle="dropdown">
                                    <span class="hstack">
                                        <i class="wd-10 ht-10 border border-2 border-gray-1 bg-success rounded-circle me-2"></i>
                                        <span>Active</span>
                                    </span>
                                    <i class="feather-chevron-right ms-auto me-0"></i>
                                </a>
                                <div class="dropdown-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-10 ht-10 border border-2 border-gray-1 bg-warning rounded-circle me-2"></i>
                                            <span>Always</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-10 ht-10 border border-2 border-gray-1 bg-success rounded-circle me-2"></i>
                                            <span>Active</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-10 ht-10 border border-2 border-gray-1 bg-danger rounded-circle me-2"></i>
                                            <span>Bussy</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-10 ht-10 border border-2 border-gray-1 bg-info rounded-circle me-2"></i>
                                            <span>Inactive</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-10 ht-10 border border-2 border-gray-1 bg-dark rounded-circle me-2"></i>
                                            <span>Disabled</span>
                                        </span>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-10 ht-10 border border-2 border-gray-1 bg-primary rounded-circle me-2"></i>
                                            <span>Cutomization</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-item" data-bs-toggle="dropdown">
                                    <span class="hstack">
                                        <i class="feather-dollar-sign me-2"></i>
                                        <span>Subscriptions</span>
                                    </span>
                                    <i class="feather-chevron-right ms-auto me-0"></i>
                                </a>
                                <div class="dropdown-menu">
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Plan</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Billings</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Referrals</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Payments</span>
                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Statements</span>
                                        </span>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="javascript:void(0);" class="dropdown-item">
                                        <span class="hstack">
                                            <i class="wd-5 ht-5 bg-gray-500 rounded-circle me-3"></i>
                                            <span>Subscriptions</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class="feather-user"></i>
                                <span>Profile Details</span>
                            </a>
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class="feather-activity"></i>
                                <span>Activity Feed</span>
                            </a>
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class="feather-dollar-sign"></i>
                                <span>Billing Details</span>
                            </a>
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class="feather-bell"></i>
                                <span>Notifications</span>
                            </a>
                            <a href="javascript:void(0);" class="dropdown-item">
                                <i class="feather-settings"></i>
                                <span>Account Settings</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="./auth-login-minimal.html" class="dropdown-item">
                                <i class="feather-log-out"></i>
                                <span>Logout</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!--! [End] Header Right !-->
        </div>
    </header>
    <!--! ================================================================ !-->
    <!--! [End] Header !-->
    <!--! ================================================================ !-->
    <!--! ================================================================ !-->
    <!--! [Start] Main Content !-->
    <!--! ================================================================ !-->
    <main class="nxl-container">
        <div class="nxl-content">
            <!-- [ page-header ] start -->
            <div class="page-header">
                <div class="page-header-left d-flex align-items-center">
                    <div class="page-header-title">
                        <h5 class="m-b-10">Customers</h5>
                    </div>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item">Add Customer</li>
                    </ul>
                </div>
                <div class="page-header-right ms-auto">
                    <div class="page-header-right-items">
                        <div class="d-flex d-md-none">
                            <a href="javascript:void(0)" class="page-header-right-close-toggle">
                                <i class="feather-arrow-left me-2"></i>
                                <span>Back</span>
                            </a>
                        </div>
                        <div class="d-flex align-items-center gap-2 page-header-right-items-wrapper">
                            <!-- <a href="javascript:void(0);" class="btn btn-light-brand successAlertMessage">
                                <i class="feather-layers me-2"></i>
                                <span>Save as Draft</span>
                            </a> -->
                            <a href="javascript:void(0);" class="btn btn-primary successAlertMessage">
                                <i class="feather-user-plus me-2"></i>
                                <span>Add Customer</span>
                            </a>
                        </div>
                    </div>
                    <div class="d-md-none d-flex align-items-center">
                        <a href="javascript:void(0)" class="page-header-right-open-toggle">
                            <i class="feather-align-right fs-20"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- [ page-header ] end -->
            <!-- [ Main Content ] start -->

<!-- Include Font Awesome for Custom Icons (Optional) -->
<!-- <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script> -->

<div class="container mx-0">
  <div class="row">
    <!-- Radio Buttons -->
    <div class="col-6">
      <div class="radio-container d-flex mt-3">
        <label class="me-3">
          <input type="radio" name="form-radio" class="form-radio" value="Customer Number:" checked> Customer Number
        </label>
        <label class="me-3">
          <input type="radio" name="form-radio" class="form-radio" value="ID No:"> ID No
        </label>
        <label class="me-3">
          <input type="radio" name="form-radio" class="form-radio" value="Mobile Number:"> Mobile Number
        </label>
        <label class="me-3">
          <input type="radio" name="form-radio" class="form-radio" value="Customer Name:"> Customer Name
        </label>
      </div>
    </div>

    <!-- Search Heading -->
    <div class="col-3 d-flex justify-content-end pt-2">
      <div class="search-heading mt-2" id="search-heading">Customer Number:</div>
    </div>

    <!-- Search Bar -->
    <div class="col-3 ps-0">
      <div class="search-bar-container d-flex">
        <input type="text" class="py-2 me-2" id="radio-search" placeholder="Search...">
        <span class="mt-2"><i data-feather="search"></i></span>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function () {
    // Set the default value in the search heading on page load
    const defaultValue = $('input[name="form-radio"]:checked').val();
    $('#search-heading').text(defaultValue);

    // Handle radio button change
    $('.form-radio').change(function () {
      const value = this.value;

      // Update the heading above the search bar with the selected value
      $('#search-heading').text(value);

      // Clear the search input field when a new radio button is selected
      $('#radio-search').val('');
    });

    // Initialize Feather Icons
    feather.replace();
  });
</script>


            <div class="accordion" id="accordionPanelsStayOpenExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#panelsStayOpen-collapseOne" 
                            aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                        Personal Details
                    </button>
                    </h2>
                    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                        <div class="accordion-body">

                            <div class="main-content">
                                <div class="mb-4 d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 me-4">
                                        <span class="d-block mb-2">Personal Information:</span>
                                        <span class="fs-12 fw-normal text-muted text-truncate-1-line">Following information is publicly displayed, be careful! </span>
                                    </h5>
                                    <!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Add New</a> -->
                                </div>

                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Salutation <span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div>    
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">First Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Middle Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Middle Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Last Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Last Name">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Preferred Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Preferred Name">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Nationality <span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Secondary Nationality <span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div> 
                                    </div>                          
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Native Region<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Native Region">
                                        </div>  
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Date of Birth<span class="text-danger">*</span></label>
                                            <input type="date" class="form-control" placeholder="Date of Birth">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Country of Birth<span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Place of Birth <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Native Region">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Resident Type Id<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Resident Type Id">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Country of Residence<span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div>
                                        
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Gender<span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Mothers Maiden Name<span class="text-danger">*</span></label>
                                            <input type="Text" class="form-control" placeholder="Occupation Id">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Primary Mobile Number<span class="text-danger">*</span></label>
                                            <input type="tel" class="form-control" placeholder="Occupation Id">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Secondary Mobile Number<span class="text-danger">*</span></label>
                                            <input type="tel" class="form-control" placeholder="Secondary Mobile Number">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Email</label><span class="text-danger">*</span></label>
                                            <input type="email" class="form-control" placeholder="Email">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">     
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Phone Number<span class="text-danger">*</span></label>
                                            <input type="tel" class="form-control" placeholder="Phone Number">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Occupation Id<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Occupation Id">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Political Exposed Person<span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">No</option>
                                                <option value="coustomer">Yes</option>                              
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Additional Documents<span class="text-danger">*</span></label>
                                            <input type="file" class="form-control" placeholder="Additional Documents">
                                        </div>
                                    </div>
                                    <div class="col-xl-4"></div>
                                    <div class="col-xl-4"></div>                               
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#panelsStayOpen-collapseTwo" 
                            aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                        Address
                    </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="card-body personal-info">
                                <div class="mb-4 d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 me-4">
                                        <span class="d-block mb-2">Current Address</span>
                                        <span class="fs-12 fw-normal text-muted text-truncate-1-line">Following information is publicly displayed, be careful! </span>
                                    </h5>
                                </div>

                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Building Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Building Name">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Street Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Street Name">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Land Mark<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Land Mark">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">City<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="City">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">District<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="District">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">State<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="State">
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Country<span class="text-danger">*</span></label>
                                            <select class="form-control" data-select2-selector="icon">
                                                <option value="lead">Mr</option>
                                                <option value="coustomer">Mrs</option>
                                                <option value="coustomer">Miss</option>
                                            </select>
                                        </div> 
                                    </div>                          
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Zip<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Zip">
                                        </div>  
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Po. Box<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Po.Box">
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="mb-4">
                                            <label class="form-label">Mobile Number<span class="text-danger">*</span></label>
                                            <input type="tel" class="form-control" placeholder="Mobile Number">
                                        </div>
                                    </div>
                                    <div class="col-xl-4">

                                    </div>
                                    <div class="col-xl-4">

                                    </div>
                                </div>



                                <!-- <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Building Name: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-home"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="Building Name">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Street Name: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="Street Name">
                                        </div>
                                    </div>
                                </div>

                                
                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Landmark: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="Landmark">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">City: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="City">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">District: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="District">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">State: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="State">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Country: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-globe"></i></div>
                                            <select class="form-select form-control">
                                                <option data-country="af">Afghanistan</option>
                                                <option data-country="ax">Åland Islands</option>
                                                <option data-country="al">Albania</option>
                                                <option data-country="zm">Zambia</option>
                                                <option data-country="zw">Zimbabwe</option>
                                              </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Zip: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="number" class="form-control" id="" placeholder="Zip">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Po. Box: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-map-pin"></i></div>
                                            <input type="text" class="form-control" id="" placeholder="Po Box">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Mobile number: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text"><i class="feather-phone"></i></div>
                                            <input type="tel" class="form-control" id="" placeholder="Mobile Number">
                                        </div>
                                    </div>
                                </div> -->

                                <hr class="my-0">
                                <div class="card-body pass-security">
                                    <div class="mb-4 d-flex align-items-center justify-content-between">
                                        <h5 class="fw-bold mb-0 me-4">
                                            <span class="d-block mb-2">Permanent Address:</span>
                                            <span class="fs-12 fw-normal text-muted text-truncate-1-line">Keep your account more secure with following preferences. </span>
                                        </h5>
                                        <!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Check Auth</a> -->
                                    </div>

                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Building Name<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Building Name">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Street Name<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Street Name">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Land Mark<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Land Mark">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">City<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="City">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">District<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="District">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">State<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="State">
                                            </div>
                                        </div>                                       
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Country<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Mr</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div>                          
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Zip<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Zip">
                                            </div>  
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Mobile Number<span class="text-danger">*</span></label>
                                                <input type="tel" class="form-control" placeholder="Mobile Number">
                                            </div>
                                        </div>
                                    </div>
                                          
                                </div>

                            </div>
                        
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#panelsStayOpen-collapseFive" 
                            aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
                        Visa Details
                    </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="card-body personal-info">
                                <div class="mb-4 d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 me-4">
                                        <span class="d-block mb-2">Visa Details</span>
                                        <span class="fs-12 fw-normal text-muted text-truncate-1-line">Following information is publicly displayed, be careful! </span>
                                    </h5>
                                </div>
                              
                                <div class="card-body pass-security">
                                    <div class="row">                                            
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Id Number<span class="text-danger">*</span></label>
                                                <input type="number" class="form-control" placeholder="Id Number">
                                            </div>  
                                        </div>                                           
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Visa Number<span class="text-danger">*</span></label>
                                                <input type="number" class="form-control" placeholder="Visa Number">
                                            </div>  
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Visa Expiry Date<span class="text-danger">*</span></label>
                                                <input type="Date" class="form-control">
                                            </div>  
                                        </div>                                         
                                    </div>

                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Name as per Id<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Name as per Id">
                                            </div>  
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Issued Country<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">UK</option>
                                                    <option value="coustomer">india</option>
                                                    <option value="lead">Yea</option>
                                                    <option value="coustomer">No</option>                                   
                                                </select>
                                            </div> 
                                        </div> 
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Issued By<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Issued By">
                                            </div>  
                                        </div>
                                    </div>
                                    <div class="row">                                                                                      
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Issued at<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Issued at">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Issued on<span class="text-danger">*</span></label>
                                                <input type="date" class="form-control">
                                            </div>
                                        </div>                                                                 
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Date of Expiry<span class="text-danger">*</span></label>
                                                <input type="date" class="form-control">
                                            </div>
                                        </div>                          
                                    </div>

                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Default Status<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Yes</option>
                                                    <option value="coustomer">No</option>                                   
                                                </select>
                                            </div> 
                                        </div> 
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Active Status<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Yes</option>
                                                    <option value="coustomer">No</option>                                   
                                                </select>
                                            </div> 
                                        </div> 
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Id Front<span class="text-danger">*</span></label>
                                                <input type="file" class="form-control" placeholder="Id Front">
                                            </div>  
                                        </div>               
                                    </div>
                                    <div class="row">                                                                                                       
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Id Back<span class="text-danger">*</span></label>
                                                <input type="file" class="form-control" placeholder="Id Back">
                                            </div>
                                        </div>
                                    </div>                                                                 
                                </div>

                            </div>
                        
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#panelsStayOpen-collapseThree" 
                            aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                       KYC
                    </button>
                    </h2>
                    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="card-body pass-info">
                                <div class="mb-4 d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 me-4">
                                        <span class="d-block mb-2">Document Details</span>
                                    </h5>
                                </div>                                  


                                <div class="row mb-4 align-items-center">
                                    <div class="col-lg-4">
                                        <label for="" class="fw-semibold">Select id type: </label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <div class="input-group-text" ><i class="feather-user"></i></div>
                                            <select class="form-select form-control"  id="search-select">                               
                                                <option value="Paris">National Id</option>
                                                <option value="London">Visa card</option>
                                              </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <hr>
                                <!-- cards content -->
                                <section>
                                    <div class="dropdown-content-bond" style="display: none;">                                              

                                        <div class="row">                                            
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Id Number<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Id Number">
                                                </div>  
                                            </div>                                           
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Name as per Id<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Name as per Id">
                                                </div>  
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued Country<span class="text-danger">*</span></label>
                                                    <select class="form-control" data-select2-selector="icon">
                                                        <option value="lead">Mr</option>
                                                        <option value="coustomer">Mrs</option>
                                                        <option value="coustomer">Miss</option>
                                                    </select>
                                                </div> 
                                            </div>                                                     
                                        </div>

                                        <div class="row">
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued By<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Issued By">
                                                </div>  
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued at<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Issued at">
                                                </div>
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued on<span class="text-danger">*</span></label>
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>                                                                 
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Date of Expiry<span class="text-danger">*</span></label>
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Default Status<span class="text-danger">*</span></label>
                                                    <select class="form-control" data-select2-selector="icon">
                                                        <option value="lead">Yes</option>
                                                        <option value="coustomer">No</option>                                   
                                                    </select>
                                                </div> 
                                            </div> 
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Active Status<span class="text-danger">*</span></label>
                                                    <select class="form-control" data-select2-selector="icon">
                                                        <option value="lead">Yes</option>
                                                        <option value="coustomer">No</option>                                   
                                                    </select>
                                                </div> 
                                            </div>                
                                        </div>
                                        <div class="row">                                                                
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Id Front<span class="text-danger">*</span></label>
                                                    <input type="file" class="form-control" placeholder="Id Front">
                                                </div>  
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Id Back<span class="text-danger">*</span></label>
                                                    <input type="file" class="form-control" placeholder="Id Back">
                                                </div>
                                            </div>
                                        </div>                                      
                                    </div>

                                    <div class="dropdown-content-bond" style="display: none;">
                                        <div class="row">                                            
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Id Number<span class="text-danger">*</span></label>
                                                    <input type="number" class="form-control" placeholder="Id Number">
                                                </div>  
                                            </div>                                           
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Visa Number<span class="text-danger">*</span></label>
                                                    <input type="number" class="form-control" placeholder="Visa Number">
                                                </div>  
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Visa Expiry Date<span class="text-danger">*</span></label>
                                                    <input type="Date" class="form-control">
                                                </div>  
                                            </div>                                         
                                        </div>

                                        <div class="row">
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Name as per Id<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Name as per Id">
                                                </div>  
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued Country<span class="text-danger">*</span></label>
                                                    <select class="form-control" data-select2-selector="icon">
                                                        <option value="lead">UK</option>
                                                        <option value="coustomer">india</option>
                                                        <option value="lead">Yea</option>
                                                        <option value="coustomer">No</option>                                   
                                                    </select>
                                                </div> 
                                            </div> 
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued By<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Issued By">
                                                </div>  
                                            </div>
                                        </div>
                                        <div class="row">                                                                                      
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued at<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="Issued at">
                                                </div>
                                            </div>
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Issued on<span class="text-danger">*</span></label>
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>                                                                 
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Date of Expiry<span class="text-danger">*</span></label>
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>                          
                                        </div>

                                        <div class="row">
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Default Status<span class="text-danger">*</span></label>
                                                    <select class="form-control" data-select2-selector="icon">
                                                        <option value="lead">Yes</option>
                                                        <option value="coustomer">No</option>                                   
                                                    </select>
                                                </div> 
                                            </div> 
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Active Status<span class="text-danger">*</span></label>
                                                    <select class="form-control" data-select2-selector="icon">
                                                        <option value="lead">Yes</option>
                                                        <option value="coustomer">No</option>                                   
                                                    </select>
                                                </div> 
                                            </div> 
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Id Front<span class="text-danger">*</span></label>
                                                    <input type="file" class="form-control" placeholder="Id Front">
                                                </div>  
                                            </div>               
                                        </div>
                                        <div class="row">                                                                                                       
                                            <div class="col-xl-4">
                                                <div class="mb-4">
                                                    <label class="form-label">Id Back<span class="text-danger">*</span></label>
                                                    <input type="file" class="form-control" placeholder="Id Back">
                                                </div>
                                            </div>
                                        </div>                                      

                                    </div>                                                                             
                                </section>

                                <script>
                                    const deafultValue = 3;                                      
                                    $(document).ready(function(){                                       
                                    $('#search-select').prop('selectedIndex', deafultValue);                                    
                                    $(".dropdown-content-bond").hide();                                      
                                    $(".dropdown-content-bond").eq( deafultValue ).show();                                      
                                    $("#search-select").change(function(){                                            
                                        $('.dropdown-content-bond').hide();
                                    
                                        var currentIndex = $(this).prop('selectedIndex');
                                        console.log(currentIndex);
                                        $(".dropdown-content-bond").eq( currentIndex ).show(); 
                                    });
                                    
                                    });
                                </script>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#panelsStayOpen-collapseSix" 
                            aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
                        Social Details
                    </button>
                    </h2>
                    <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="card-body personal-info">
                                <div class="d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 me-4">
                                        <span class="d-block">Social Details</span>
                                        <span class="fs-12 fw-normal text-muted text-truncate-1-line">Following information is publicly displayed, be careful! </span>
                                    </h5>
                                </div>
                              
                                <div class="card-body pass-security">
                                    <div class="row my-5">
                                        <div class="col-xl-4">
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="feather-linkedin"></i></div>
                                                <input type="text" class="form-control" id="" placeholder="www.linked.com">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="feather-twitter"></i></div>
                                                <input type="text" class="form-control" id="" placeholder="www.twitter.com">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="feather-facebook"></i></div>
                                                <input type="text" class="form-control" id="" placeholder="www.facebook.com">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row my-5">
                                        <div class="col-xl-4">
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="feather-instagram"></i></div>
                                                <input type="text" class="form-control" id="" placeholder="www.instagram.com">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="feather-youtube"></i></div>
                                                <input type="text" class="form-control" id="" placeholder="www.youtube.com">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="feather-link"></i></div>
                                                <input type="text" class="form-control" id="" placeholder="www.link.com">
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>  
                        </div>
                    </div>    
                </div>          
                
                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#panelsStayOpen-collapseFour" 
                            aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                        Other Information
                    </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <div class="card-body personal-info">
                                <div class="mb-4 d-flex align-items-center justify-content-between">
                                    <h5 class="fw-bold mb-0 me-4">
                                        <span class="d-block mb-2">Other Information</span>
                                        <span class="fs-12 fw-normal text-muted text-truncate-1-line">Following information is publicly displayed, be careful! </span>
                                    </h5>
                                    <!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Add New</a> -->
                                </div>

                                <div class="card-body pass-security">
                                    <div class="mb-4 d-flex align-items-center justify-content-between">
                                        <h5 class="fw-bold mb-0 me-4">
                                            <span class="d-block mb-2">Permanent Address:</span>
                                            <span class="fs-12 fw-normal text-muted text-truncate-1-line">Keep your account more secure with following preferences. </span>
                                        </h5>
                                        <!-- <a href="javascript:void(0);" class="btn btn-sm btn-light-brand">Check Auth</a> -->
                                    </div>

                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Customer type id<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Customer type id">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Annual Income Range Id<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Annual Income Range Id">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Annual Income Currency Code<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">AE</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div>                                      
                                    </div>

                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Social Security Number<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Social Security Number">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Tax Registration Number<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Tax Registration Number">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Transaction Issued Country<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Uk</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div>                                      
                                    </div>

                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Employer Name<span class="text-danger">*</span></label>
                                                <input type="number" class="form-control" placeholder="Employer Name">
                                            </div> 
                                        </div>  
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Employer Address<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Employer Address">
                                            </div> 
                                        </div>  
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Employer Phone<span class="text-danger">*</span></label>
                                                <input type="tel" class="form-control" placeholder="Employer Phone">
                                            </div> 
                                        </div>  
                                    </div>                        
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Employer ecrn<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Employer ecrn">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Employer Establishment Id<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Employer Establishment Id">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Risk Rating Id<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Risk Rating Id">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">PEP Catagory<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="PEP Catagory">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Personal Mohre Id<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Personal Mohre Id">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Income Type<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Mr</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div>                                              
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Profession Catagory<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Mr</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div>                          
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Reason For Acc.<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Reason For Acc.">
                                            </div>  
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Transaction Volume Month<span class="text-danger">*</span></label>
                                                <input type="tel" class="form-control" placeholder="Transaction Volume Month">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">                                                                    
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Customer Remark<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Customer Remark">
                                            </div>  
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Transaction Count Month<span class="text-danger">*</span></label>
                                                <input type="Text" class="form-control" placeholder="Transaction Count Month">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Show Remark on Transaction<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Mr</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="row">                                                                        
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Customer Remark<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Customer Remark">
                                            </div>  
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Agent Referenc Number<span class="text-danger">*</span></label>
                                                <input type="tel" class="form-control" placeholder="Agent Referenc Number">
                                            </div>
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Social Links<span class="text-danger">*</span></label>
                                                <input type="tel" class="form-control" placeholder="Social Links">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">          
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">First Language<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">Mr</option>
                                                    <option value="coustomer">Mrs</option>
                                                    <option value="coustomer">Miss</option>
                                                </select>
                                            </div> 
                                        </div> <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Marital Status<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="coustomer">Unmarried</option>
                                                    <option value="lead">Married</option>                                 
                                                </select>
                                            </div> 
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">DNFBP<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">No</option>
                                                    <option value="coustomer">Yes</option>                             
                                                </select>
                                            </div> 
                                        </div>             
                                    </div>
                                    <div class="row"> 
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">DPMS<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="DPMS">
                                            </div>
                                        </div>                                               
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Profile Catagory<span class="text-danger">*</span></label>
                                                <select class="form-control" data-select2-selector="icon">
                                                    <option value="lead">No</option>
                                                    <option value="coustomer">Yes</option>
                                                </select>
                                            </div> 
                                        </div>
                                        <div class="col-xl-4">
                                            <div class="mb-4">
                                                <label class="form-label">Profile Photo<span class="text-danger">*</span></label>
                                                <input type="file" class="form-control" placeholder="Profile Photo">
                                            </div>
                                        </div>                                            
                                    </div>
                            </div>    
                        </div>
                    </div>
                </div>
                
            </div>
            <!-- [ Main Content ] end -->
        </div>
        <!-- [ Footer ] start -->
        <footer class="footer">
            <!-- <p class="fs-11 text-muted fw-medium text-uppercase mb-0 copyright">
                <span>Copyright ©</span>
                <script>
                    document.write(new Date().getFullYear());
                </script>
            </p>
            <div class="d-flex align-items-center gap-4">
                <a href="javascript:void(0);" class="fs-11 fw-semibold text-uppercase">Help</a>
                <a href="javascript:void(0);" class="fs-11 fw-semibold text-uppercase">Terms</a>
                <a href="javascript:void(0);" class="fs-11 fw-semibold text-uppercase">Privacy</a>
            </div> -->
        </footer>
        <!-- [ Footer ] end -->
    </main>
   	
    <script src="assets/vendors/js/vendors.min.js"></script>
    <!-- vendors.min.js {always must need to be top} -->
    <script src="assets/vendors/js/select2.min.js"></script>
    <script src="assets/vendors/js/select2-active.min.js"></script>
    <script src="assets/vendors/js/datepicker.min.js"></script>
    <script src="assets/vendors/js/lslstrength.min.js"></script>
    <!--! END: Vendors JS !-->
    <!--! BEGIN: Apps Init  !-->
    <script src="assets/js/common-init.min.js"></script>
    <script src="assets/js/customers-create-init.min.js"></script>
    <!--! END: Apps Init !-->
   

</html>