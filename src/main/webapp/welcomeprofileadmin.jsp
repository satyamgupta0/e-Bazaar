<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="icon" href="https://www.iconpacks.net/icons/2/free-store-icon-2017-thumb.png" type="icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <title>e-Bazaar</title>
</head>

<body>
    <!-- top navigation bar -->
    <nav class="navbar navbar-expand-lg fixed-top color1">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                aria-controls="offcanvasExample">
                <img src="images/whitemeniIcon.png" style="height: 20px; background-color: transparent;" alt="">
            </button>
            <a class="navbar-brand ms-lg-0 ms-3 fw-bold head1" href="#"><i class="bi bi-emoji-laughing"></i>&nbsp; Welcome Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavBar"
                aria-controls="topNavBar" aria-expanded="false" aria-label="Toggle navigation">
                <img src="images/whitemeniIcon.png" style="height: 20px; background: transparent;" alt="">
            </button>
            <div class="collapse navbar-collapse" id="topNavBar">
                <form class="d-flex ms-auto my-3 my-lg-0">
                    <div class="input-group">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-primary" type="submit">
                            <ion-icon name="search-outline"></ion-icon>
                        </button>
                    </div>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle ms-2" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="bi bi-person-fill"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#"></a></li>
                            <li><a class="dropdown-item" href="welcomeprofileadmin.jsp">Home</a></li>
                            <li>
                                <a class="dropdown-item" href="logout">Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- top navigation bar -->
    <!-- offcanvas -->
    <div class="offcanvas offcanvas-start sidebar-nav color2" tabindex="-1" id="sidebar">
        <div class="offcanvas-body p-0">
            <nav class="color1">
                <ul class="navbar-nav">
                    <hr class="dropdown-divider bg-light" />
                    <li>
                        <div class="small fw-bold text-uppercase px-3 mb-3 head2">
                            Sales
                        </div>
                    </li>
                    <li>
                        <a href="salesHistoryAdmin.jsp" class="nav-link px-3 active head3">
                            <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                            <span>Sales History</span>
                        </a>
                    </li>
                    <li class="my-4">
                        <hr class="dropdown-divider bg-light" />
                    </li>
                    <li>
                        <div class="small fw-bold text-uppercase px-3 mb-3 head2">
                            User Database
                        </div>
                    </li>
                    <li>
                        <a href="userslistforadmin.jsp" class="nav-link px-3 active head3">
                            <span class="me-2"><i class="bi bi-layout-split"></i></span>
                            <span>Registration Details</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="loginlist.jsp" class="nav-link px-3 head3">
                            <span class="me-2"><i class="bi bi-book-fill"></i></span>
                            <span>Login History</span>
                        </a>
                    </li>
                    <li class="my-4">
                        <hr class="dropdown-divider bg-light" />
                    </li>
                    <li>
                        <div class="small fw-bold text-uppercase px-3 mb-3 head2">
                            Product DB
                        </div>
                    </li>



                    <a class="nav-link px-3 sidebar-link head3" data-bs-toggle="collapse" href="#layouts">
                        <span class="me-2"><i class="bi bi-layout-split"></i></span>
                        <span>Product Details</span>
                        <span class="ms-auto">
                            <span class="right-icon">
                                <i class="bi bi-chevron-down"></i>
                            </span>
                        </span>
                    </a>
                    <div class="collapse" id="layouts">
                        <ul class="navbar-nav ps-3">
                            <li>
                                <a href="#" class="nav-link px-3 head3">
                                    <span class="me-2"><i class="bi bi-table"></i></span>
                                    <span>Grocery</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-3 head3">
                                    <span class="me-2"><i class="bi bi-table"></i></span>
                                    <span>Electronics</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-3 head3">
                                    <span class="me-2"><i class="bi bi-table"></i></span>
                                    <span>Clothing</span>
                                </a>
                            </li>
                            
                        </ul>
                    </div>


                    <li>
                        <a href="#" class="nav-link px-3 head3">
                            <span class="me-2"><i class="bi bi-table"></i></span>
                            <span>Sales Table</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- offcanvas -->

    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <p class="dashboard-col head-dash">Dashboard &nbsp;<i class="bi bi-columns-gap"></i></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="card bg-primary text-white h-100 card-style color-d">
                        <div class="card-body py-5 a1">
                            <span>
                                <ion-icon name="bag-check" class="ion-color" size="large"></ion-icon>
                            </span>&nbsp; Order Placed
                        </div>
                        <div class="card-footer d-flex">
                            View Details
                            <span class="ms-auto">
                                <ion-icon name="caret-forward-outline"></ion-icon>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-white h-100 card-style color-a">
                        <div class="card-body py-5 a1">
                            <span>
                                <i class="bi bi-wallet2 ion-color"></i>
                            </span>&nbsp; Total Revenue
                        </div>
                        <div class="card-footer d-flex">
                            View Details
                            <span class="ms-auto">
                                <ion-icon name="caret-forward-outline"></ion-icon>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card bg-success text-white h-100 card-style color-b">
                        <div class="card-body py-5 a1">
                            <span>
                                <i class="bi bi-person-plus-fill"></i></span>&nbsp; New Customers
                        </div>
                        <div class="card-footer d-flex">
                            View Details
                            <span class="ms-auto">
                                <ion-icon name="caret-forward-outline"></ion-icon>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card bg-danger text-white h-100 card-style color-c">
                        <div class="card-body py-5 a1"><span>
                            <ion-icon name="accessibility-outline" class="ion-color"></ion-icon>
                        </span>&nbsp; Total Visitors</div>
                        <div class="card-footer d-flex">
                            View Details
                            <span class="ms-auto">
                                <ion-icon name="caret-forward-outline"></ion-icon>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <div class="card card-1">
                        <div class="card-header" style="background-color: black; color: #FFD700;">
                            <span><i class="bi bi-table me-2"></i></span> Data Table
                        </div>
                        <div class="card-body" style= " background-color: rgb(13,110,253); color: white;">
                            <div class="table-responsive">
                                <table id="example" class="table data-table" style="width: 100%; color: white;">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td><span class="badge bg-dark">Processing</span></td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td><span class="badge bg-warning">Pending</span></td>
                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>Timothy Mooney</td>
                                            <td>Office Manager</td>
                                            <td>London</td>
                                            <td>37</td>
                                            <td>2008/12/11</td>
                                            <td>$136,200</td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Donna Snider</td>
                                            <td>Customer Support</td>
                                            <td>New York</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>$112,000</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>
