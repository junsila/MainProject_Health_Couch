<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Admin</title>
        <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 11]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="" />
        <meta name="keywords" content="">
        <meta name="author" content="Phoenixcoded" />
        <!-- Favicon icon -->
        <link rel="icon" href="" type="image/x-icon">

        <!-- vendor css -->
        <link rel="stylesheet" href="../Assets/Template/Admin/assets/css/style.css">



    </head>
    <body style="background-image: url('') ;background-repeat: repeat;background-size: cover">
        <!-- [ Pre-loader ] start -->
        <div class="loader-bg">
            <div class="loader-track">
                <div class="loader-fill"></div>
            </div>
        </div>
        <!-- [ Pre-loader ] End -->
        <!-- [ navigation menu ] start -->
        <nav class="pcoded-navbar  ">
            <div class="navbar-wrapper  ">
                <div class="navbar-content scroll-div " >

                    <div class="">
                        <div class="main-menu-header">
                            <img class="img-radius" src="" alt="">
                            <div class="user-details">
                                <span>Junu</span>
                                <div id="more-details">Admin<i class="fa fa-chevron-down m-l-5"></i></div>
                            </div>
                        </div>
                        <div class="collapse" id="nav-user-link">
                            <ul class="list-unstyled">
                               
                                <li class="list-group-item"><a href="../Logout.jsp"><i class="feather icon-log-out m-r-5"></i>Logout</a></li>
                            </ul>
                        </div>
                    </div>

                    <ul class="nav pcoded-inner-navbar ">

                        <li class="nav-item">
                            <a href="Homepage.jsp" class="nav-link ">
                                <span class="pcoded-micon">
                                    <i class="feather icon-home"></i>
                                </span>
                                <span class="pcoded-mtext">Dashboard</span>
                            </a>
                        </li>
                       

                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link ">
                                <span class="pcoded-micon">
                                    <i class="feather icon-layout"></i>
                                </span>
                                <span class="pcoded-mtext">User Verification</span></a>
                            <ul class="pcoded-submenu">
                                <li><a href="UserList.jsp" target="_blank">New</a></li>
                                <li><a href="AcceptedUserList.jsp" target="_blank">Accepted</a></li>
                                <li><a href="RejectedUserList.jsp" target="_blank">Rejected</a></li>
                            </ul>
                        </li>
                        
                       <li class="nav-item">
                           <a href="ViewComplaint.jsp" class="nav-link ">
                                <span class="pcoded-micon">
                                    <i class="feather icon-home"></i>
                                </span>
                                <span class="pcoded-mtext">Complaint</span>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="Viewfeedback.jsp" class="nav-link ">
                                <span class="pcoded-micon">
                                    <i class="feather icon-home"></i>
                                </span>
                                <span class="pcoded-mtext">Feedback</span>
                            </a>
                        </li>



                    </ul>


                </div>
            </div>
        </nav>
        <!-- [ navigation menu ] end -->
        <!-- [ Header ] start -->
        <header class="navbar pcoded-header navbar-expand-lg navbar-light header-dark">


            <div class="m-header" style='background: #fff;'>
                <a class="mobile-menu" id="mobile-collapse" href="#!" style="left: 230px;"><span></span></a>
                <a href="#!" class="b-brand">
                    <!-- ========   change your logo here   ============ -->
                    <img src="../Assets/Template/Main/assets/img/logo/logo.png" class="logo">
                </a>
                <a href="#!" class="mob-toggler">
                    <i class="feather icon-more-vertical"></i>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        
                        
                    </li>
                    
                   
                     
                    
                </ul>
            </div>


        </header>
        <!-- [ Header ] end -->



        <!-- [ Main Content ] start -->
        <div class="pcoded-main-container">
            <div class="pcoded-content">
                <!-- [ breadcrumb ] start -->
                <div class="page-header">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="page-header-title">
                                   
                                </div>
                                <ul class="breadcrumb">
                                    
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
               
                            
                                
                            </div>
                        </div>
                        
                   
                 
                    

                   
                         
                    
                                
                        
                   
                    
                   
        
        <!-- [ Main Content ] end -->
        <!-- Warning Section start -->
        <!-- Older IE warning message -->
        <!--[if lt IE 11]>
            <div class="ie-warning">
                <h1>Warning!!</h1>
                <p>You are using an outdated version of Internet Explorer, please upgrade
                   <br/>to any of the following web browsers to access this website.
                </p>
                <div class="iew-container">
                    <ul class="iew-download">
                        <li>
                            <a href="http://www.google.com/chrome/">
                                <img src="../Assets/Template/Admin/assets/images/browser/chrome.png" alt="Chrome">
                                <div>Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.mozilla.org/en-US/firefox/new/">
                                <img src="../Assets/Template/Admin/assets/images/browser/firefox.png" alt="Firefox">
                                <div>Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com">
                                <img src="../Assets/Template/Admin/assets/images/browser/opera.png" alt="Opera">
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.apple.com/safari/">
                                <img src="../Assets/Template/Admin/assets/images/browser/safari.png" alt="Safari">
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                                <img src="../Assets/Template/Admin/assets/images/browser/ie.png" alt="">
                                <div>IE (11 & above)</div>
                            </a>
                        </li>
                    </ul>
                </div>
                <p>Sorry for the inconvenience!</p>
            </div>
        <![endif]-->
        <!-- Warning Section Ends -->

        <!-- Required Js -->
        <script src="../Assets/Template/Admin/assets/js/vendor-all.min.js"></script>
        <script src="../Assets/Template/Admin/assets/js/plugins/bootstrap.min.js"></script>
        <script src="../Assets/Template/Admin/assets/js/pcoded.min.js"></script>

        <!-- Apex Chart -->
        <script src="../Assets/Template/Admin/assets/js/plugins/apexcharts.min.js"></script>


        <!-- custom-chart js -->
        <script src="../Assets/Template/Admin/assets/js/pages/dashboard-main.js"></script>
    </body>

</html>
