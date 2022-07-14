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
                }
                //window.location = './searchEmployee';
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

    <div style="background-color:#f5f5f5; padding:0.5rem 2rem; margin-bottom:3rem">
        <h3>NSEL EMPLOYEES</h3>
    </div>

    <div class="alert alert-danger hide alert-dismissible" id="alert-danger" role="alert">
        <p id="alert-danger-p">Employee does not exist</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
    </div>

    <div class="container" style="width: 50%;box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);border-radius: 20px;">

        <!-- title -->
        <div class="title d-flex justify-content-center my-3">
            <h1 class="title">Search Employee</h1>
        </div>


        <form class="needs-validation" novalidate action="showEmployee" method="post" modelAttribute="employeeToSearch">

            <div class="form-row">
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

            <div class="form-row">
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
                    <input id="identityProof" name="identityProof" class="form-control" required >
                    <div class="invalid-feedback">Please enter Identity Proof</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <p>OR</p>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label id="emailId">Email ID</label>
                    <input id="emailId" name="emailId" class="form-control" required >
                    <div class="invalid-feedback">Please enter email</div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group  col-md-12 d-flex justify-content-center">
                    <button class="btn btn-success" type="submit" style="padding: 1rem 3rem;  margin: 1rem;">Submit</button>
                    <a class="btn btn-danger" href="./" style="padding: 1rem 3rem;  margin: 1rem;">Cancel</a>
                    <input class="btn btn-secondary" type="reset" value="Clear" style="padding: 1rem 3rem;  margin: 1rem;">
                </div>
            </div>
        </form>     

    </div>
    
</body>
</html>