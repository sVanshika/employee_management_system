<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Employee</title>

    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- sweet alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>

        .form-control[readonly]{
            background-color: white;
        }
        .form-control[readonly]::placeholder{
            color: black;
        }
        
        .btn-dark:hover{
            color: #fff;
        }
        /* navbar and hero section */
        .heading{
            color: #337ab7;
            text-decoration: none;
            text-align: center;
        }
        .heading h1{
            font-size: 60px;
        }
        .navbar-brand{
            color: #337ab7 !important;
            font-size: 24px ;
        }
        .nav-link{
            font-size: 20px;
            color: black;
            margin-left: 4rem;
        }
        .nav-link:hover{
            text-decoration: none;
            color: #337ab7;
        }
        .dropdown-item{
            padding: 0.5rem;
            border-bottom: 1px solid #eee;
            font-size: 1.5rem;
        }
        .accordion-btn:focus-visible{
            outline: none !important;
        }
    </style>


</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="./">NSEL</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./">Home</a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Employee
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="./addEmployee">Add</a></li>
                            <li><a class="dropdown-item" href="./searchEmployee">Search</a></li>
                            <li><a class="dropdown-item" href="./find?action=update">Update</a></li>
                            <li><a class="dropdown-item" href="./find?action=delete ">Delete</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Loan
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="./find?action=applyloan">Apply Loan</a></li>
                            <li><a class="dropdown-item" href="./find?action=loanDetails">Loan Details</a></li>
                        </ul>
                    </li>
                    <li class="d-flex" style="margin-left: 200%;">
                        <a href="./logout" class="btn btn-secondary" role="button">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container"  style="width: 75%;
        box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);
        border-radius: 20px;
        ">
    <!-- title -->
    <div class="title d-flex justify-content-center my-3">
        <h1 class="title">Delete Employee</h1>
    </div>

    

    <form action="deleteEmployee?employeeid=${employee.employeeId}" method="post">

        <div class="row">
            <div class="form-group col-md-6">
                <label>First Name</label>
                <input id="firstName" name="firstName" class="form-control" type="text" placeholder="${employee.firstName}" readonly >
            </div>
            <div class="form-group col-md-6">
                <label>Last Name</label>
                <input id="lastName" name="lastName" class="form-control"  type="text" placeholder="${employee.lastName}" readonly  >
               
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label>Age</label>
                <input id="age" name="age" class="form-control"  type="text" placeholder="${employee.age}" readonly >
            </div>
            <div class="form-group col-md-6">
                <label>Sex</label>
                <input id="sex" name="sex" class="form-control" type="text" placeholder="${employee.sex}" readonly >
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label>Mobile Number</label>
                <input id="mobileNumber" name="mobileNumber" class="form-control"  type="text" placeholder="${employee.mobileNumber}" readonly >
            </div>
            <div class="form-group col-md-6">
                <label>Religion</label>
                <input id="religion" name="religion" class="form-control"  type="text" placeholder="${employee.religion}" readonly >
            </div>
        </div>
            
        <div class="row">
            <div class="form-group col-md-6">
                <label>Identity Proof Choice</label>
                <input type="text" id="idProofChoice" class="form-control" placeholder="${employee.identity}" readonly >
            </div>
            <div class="form-group col-md-6">
                <label id="identityProofLabel">Choose Identity</label>
                <input id="identityProof" name="identityProof" class="form-control"  type="text" placeholder="${employee.identityProof}" readonly  >               
            </div>
        </div>


        <div class="accordion" id="accordionAddress">
            <div class="card">
                <div class="card-header" id="temporaryAddress">
                    
                        <button class="btn mb-0 accordion-btn" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            Temporary Address
                        </button>
                    
                </div>
          
                <div id="collapseOne" class="collapse" aria-labelledby="temporaryAddress" data-parent="#accordionAddress">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Plot No.</label>
                                <input id="plotNo" name="address.plotNo" class="form-control"  type="text" placeholder="${employee.tempAddress.plotNo}" readonly >
                            </div>
                            <div class="form-group col-md-6">
                                <label>Locality</label>
                                <input id="locality" name="address.locality" class="form-control"  type="text" placeholder="${employee.tempAddress.locality}" readonly >
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>City</label>
                                <input id="city" name="address.city" class="form-control"  type="text" placeholder="${employee.tempAddress.city}" readonly  >
                            </div>
                            <div class="form-group col-md-6">
                                <label>State</label>
                                <input id="state" name="address.state" class="form-control"  type="text" placeholder="${employee.tempAddress.state}" readonly >
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Country</label>
                                <input id="country" name="address.country" class="form-control"  type="text" placeholder="${employee.tempAddress.country}" readonly >
                            </div>
                            <div class="form-group col-md-6">
                                <label>Pincode</label>
                                <input id="pincode" name="address.pincode" class="form-control"  type="text" placeholder="${employee.tempAddress.pincode}" readonly  >
                            </div>
                        </div>

                    </div>

                    
                </div>

            </div>

            <div class="card">
                
                <div class="card-header" id="permanentAddress">
                    <button class="btn mb-0 accordion-btn" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Permanent Address
                    </button>                          
                </div>
          
                <div id="collapseTwo" class="collapse" aria-labelledby="permanentAddress" data-parent="#accordionAddress">
                    <div class="card-body">
                        
                        <!-- <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="checkbox">
                            <label class="form-check-label" for="checkbox">
                                Same as Temporary Address
                            </label>
                        </div> -->

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Plot No.</label>
                                <input id="plotNo_perm" name="permAddress.plotNo" class="form-control"  type="text" placeholder="${employee.permAddress.plotNo}" readonly >
                                
                            </div>
                            <div class="form-group col-md-6">
                                <label>Locality</label>
                                <input id="locality_perm" name="permAddress.locality" class="form-control"  type="text" placeholder="${employee.permAddress.locality}" readonly >
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>City</label>
                                <input id="city_perm" name="permAddress.city" class="form-control"  type="text" placeholder="${employee.permAddress.city}" readonly >
                            </div>
                            <div class="form-group col-md-6">
                                <label>State</label>
                                <input id="state_perm" name="permAddress.state" class="form-control"  type="text" placeholder="${employee.permAddress.state}" readonly >
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Country</label>
                                <input id="country_perm" name="permAddress.country" class="form-control"  type="text" placeholder="${employee.permAddress.country}" readonly >
                            </div>
                            <div class="form-group col-md-6">
                                <label>Pincode</label>
                                <input id="pincode_perm" name="permAddress.pincode" class="form-control" required  type="text" placeholder="${employee.permAddress.pincode}" readonly >
                            </div>
                        </div>

                    </div>
                </div>
                
            </div>

        </div> 
        
        <div class="accordion" id="accordionFamily">
            <div class="card">
            
                <div class="card-header" id="familyMembers">
                    <button class="btn mb-0 accordion-btn" type="button" data-toggle="collapse" data-target="#collapseOneFamily" aria-expanded="false" aria-controls="collapseOneFamily">
                            Family Members
                    </button>                          
                </div>
          
                <div id="collapseOneFamily" class="collapse" aria-labelledby="familyMembers" data-parent="#accordionFamily">
                    
                    <c:forEach items="${employee.familyMembers}" var="member">
                        <div class="card-body" id="member_container_card_body"> 
                            <div class="container" style="width: 100%;padding: 1rem;">
                                <div class="row">
                                    <div class="form-group col-md-3">
                                        <label>First Name</label>
                                        <input id="family-member-first-name" value="${member.firstName}" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Last Name</label>
                                        <input id="family-member-last-name" value="${member.lastName}" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Age</label>
                                        <input id="family-member-age" value="${member.age}" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Relation</label>
                                        <input id="family-member-relation" value="${member.relation}" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                    
                </div>
                
            </div>
            
            
        
        </div>
        
        <div class="d-flex justify-content-center mt-3">
            <input class="btn btn-danger"
                style="padding: 1rem 3rem;  margin: 1rem;" 
                onclick="return confirm('Are you sure?');"
                type="submit"
                value="Delete"
            />
                <!-- Delete -->
            <!-- </button> -->
            <a class="btn btn-dark" href="./" style="padding: 1rem 3rem;  margin: 1rem;">Cancel</a>
            
        </div>

        
        

    </form>

   
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html> 