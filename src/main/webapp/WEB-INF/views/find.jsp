<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Employee</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <style>
        .hide{
            display: none;
        }
        .alert-danger{
                width: 25%;
                position: fixed;
                right: 1px;
                padding-bottom: 0;
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
            /* padding: 0.5rem; */
            border-bottom: 1px solid #eee;
            /* font-size: 1.5rem; */
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
                </ul>
            </div>
        </div>
    </nav>

    <div class="alert alert-danger hide alert-dismissible" id="alert-danger" role="alert">
        <p id="alert-danger-p">Employee does not exist!</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
    </div>

    <div class="container" style="width: 50%;">

        <!-- title -->
        <div class="title d-flex justify-content-center my-3">
            <h1 class="title">Search Employee</h1>
        </div>


        <form   action="findEmployee" method="post" onsubmit="checkForm(this)">
            <div class="row">
                <div class="form-group col-md-6">
                    <label>Identity Proof Choice</label>
                    <select id="identity" name="identity" class="form-control" onblur="setIdentityProofLabel()" required>
                            <option selected disabled value="">Select</option>
                            <option value="PAN">PAN</option>
                            <option value="AADHAR">AADHAR</option>
                            <option value="PASSPORT">PASSPORT</option>
                    </select>
                    <div class="invalid-feedback">Please enter Identity Proof Choice</div>
                </div>
                <div class="form-group col-md-6">
                    <label id="identityProofLabel">Choose Identity</label>
                    <input id="identityProof" name="identityProof" class="form-control" onblur="verifyLength()"  required >
                    <div class="invalid-feedback">Please enter valid Identity Proof <br> <small>Length should be greater than 9 characters </small></div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="form-group  col-md-12 d-flex justify-content-center">
                    <button class="btn btn-success" type="submit" style="padding: 1rem 3rem;  margin: 1rem;">Submit</button>
                    <a class="btn btn-danger" href="./" style="padding: 1rem 3rem;  margin: 1rem;">Cancel</a>
                    <input class="btn btn-secondary" type="reset" value="Clear" style="padding: 1rem 3rem;  margin: 1rem;">
                </div>
            </div>
        </form>     

    </div>

    <script>
        window.onload = (event => {
            var employeeExists = "${employeeExists}";
            console.log("employee exists = ${employeeExists}")

            var params = new URLSearchParams(window.location.search);
            var loanExists = "";
            if(params.has("loanExists"))
                loanExists = params.get("loanExists");
            console.log("loan exists = " + loanExists);

            if(employeeExists == "false"){
                var alertBox = document.getElementById("alert-danger");
                console.log("alert box - " + alertBox);
                alertBox.classList.remove("hide");
                setTimeout(() => {alertBox.classList.add('hide')}, 2000);
            }

            if(loanExists == "false"){
                var alertBox = document.getElementById("alert-danger");
                document.getElementById("alert-danger-p").innerHTML = "Employee does not have any loans!";
                console.log("alert box - " + alertBox);
                alertBox.classList.remove("hide");
                setTimeout(() => {alertBox.classList.add('hide')}, 2000);
            }
            
        });

        function checkForm(form){
            console.log("function check form");

            var params = new URLSearchParams(window.location.search);
            var action = params.get("action");

            var url = "findEmployee?action=" + action;

            form.action = url;

            if (!form.checkValidity()) {
                console.log("invalid form");
                event.preventDefault();
                event.stopPropagation();
                        
            }
            else{
                console.log("valid");
            }

            form.classList.add('was-validated')
        }

        function verifyLength(){
                var id = document.getElementById('identityProof');
                
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