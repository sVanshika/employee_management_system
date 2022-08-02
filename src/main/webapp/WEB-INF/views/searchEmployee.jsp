<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Employee</title>

    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <style>
        .alert-success, .alert-danger{
                width: 25%;
                position: fixed;
                right: 1px;
            }
            .hide{
                display: none;
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
    </style>
    <script>
        var employeeExist = "${employeeExist}";
        var errorMessage = "${errorMessage}";

        console.log("exist = " + employeeExist);
        console.log("error = " + errorMessage);

        window.onload = (event) => {
            if(employeeExist == "false"){
               // event.preventDefault();

                var alertBox = document.getElementById('alert-danger');
                if(alertBox != null){
                    alertBox.classList.remove('hide'); 
                    setTimeout(() => {window.location = "./searchEmployee"}, 2000);       
                }
            }

        }

        function setIdentityProofLabel(){
            var idChosen = document.getElementById("identity");
            var identityProofLabel = document.getElementById("identityProofLabel");
            
            console.log("id chosen value = " + idChosen.value);

            identityProofLabel.innerHTML = idChosen.value;

            console.log("id proof label = " + identityProofLabel.innerHTML);
        }
    </script>


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
                </ul>
            </div>
        </div>
    </nav>
    <div class="alert alert-danger hide alert-dismissible" id="alert-danger" role="alert">
        <p id="alert-danger-p">Employee does not exist</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
    </div>

    <div class="container" style="width: 50%;box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);border-radius: 20px;">

        <!-- title -->
        <div class="title d-flex justify-content-center my-3">
            <h1 class="title">Search Employee</h1>
        </div>


        <form class="needs-validation" novalidate action="searchEmployee" method="post" modelAttribute="employeeToSearch">

            <div class="row">
                <div class="form-group col-md-6">
                    <label>First Name</label>
                    <input id="firstName" name="firstName" class="form-control" required >
                    <div class="invalid-feedback">Please enter First Name</div>
                </div>
                <div class="form-group col-md-6">
                    <label>Last Name</label>
                    <input id="lastName" name="lastName" class="form-control" required >
                    <div class="invalid-feedback">Please enter Last Name</div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label>Identity Proof Choice</label>
                    <select id="identity" name="identity" class="form-control" onblur="setIdentityProofLabel()">
                            <option selected disabled value="">Select</option>
                            <option value="PAN">PAN</option>
                            <option value="AADHAR">AADHAR</option>
                            <option value="PASSPORT">PASSPORT</option>
                    </select>
                    <div class="invalid-feedback">Please enter Identity Proof Choice</div>
                </div>
                <div class="form-group col-md-6">
                    <label id="identityProofLabel">Choose Identity</label>
                    <input id="identityProof" name="identityProof" class="form-control" onblur="verifyLength()" >
                    <div class="invalid-feedback">Please enter valid Identity Proof. <br><small>Length should be greater than 9 characters.</small> </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-12" style="text-align: center;">
                    <p>OR</p>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-12">
                    <label id="emailId">Email ID</label>
                    <input id="emailId" name="emailId" class="form-control" required >
                    <div class="invalid-feedback">Please enter email</div>
                </div>
            </div>

            <div class="row">
                <div class="form-group  col-md-12 d-flex justify-content-center">
                    <button class="btn btn-success" type="submit" style="padding: 1rem 3rem;  margin: 1rem;">Submit</button>
                    <a class="btn btn-danger" href="./" style="padding: 1rem 3rem;  margin: 1rem;">Cancel</a>
                    <input class="btn btn-secondary" type="reset" value="Clear" style="padding: 1rem 3rem;  margin: 1rem;">
                </div>
            </div>
        </form>     

    </div>

    <script>
        function verifyLength(){
                var id = document.getElementById('identityProof');
                var pincode = document.getElementById('pincode');
                var pincode_perm = document.getElementById('pincode_perm');
                
                if(id.value.length < 9){
                    console.log("id length is < 9");
                    id.value = "";
                    id.classList.add("is-invalid");
                }
                else{
                    if(id.classList.contains("is-invalid")){
                        id.classList.remove("is-invalid");
                    }
                    id.classList.add("is-valid");
                }
            }
    </script>
    
</body>
</html>