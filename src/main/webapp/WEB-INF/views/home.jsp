<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nucleus Employee</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <style>
        .btn-primary{
            padding: 1rem 5rem;
            font-size: 2rem;
            margin: 2rem;
            width: 350px;
        }
        .btn-primary:hover{
            background-color: white;
            border: 3px solid #204d74;
            color: #204d74;
            /* font-weight: bold; */
            padding: 0.5rem 5rem;
        }
        /* .c1, .c1:hover{
            color: #fff;
            background-color: #fa7466;
            border-color: #fa7466;
        }
        
        .c2, .c2:hover{
            color: #fff;
            background-color: #648cd5;
            border-color: #648cd5;
        } */

        .alert{
            z-index: 10;
        }
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

        .navbar-nav>li:last-child{
            margin-left: 200%;
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

                    <li class="d-flex">
                        <a href="./logout" class="btn btn-secondary" role="button">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="alert alert-success alert-dismissible hide" id="alert-success" role="alert">
        <p id="alert-p">Employee Saved Successfully</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    

    

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img 
                    alt="image"  
                    src="https://img.freepik.com/premium-vector/happy-business-colleagues-team-portrait_179970-1271.jpg?w=2000"
                    style="width: 100%;" 
                >
            </div>
            <div class="col-md-6 d-flex justify-content-center align-items-center">
                <div class="heading">
                    <h1>NSEL</h1>
                    <h1>Employees</h1>
                </div>
                
            </div>
        </div>

        <div class="row">
            <div class="title">
                <h2>Manage Employee</h2>
            </div>
            <div class="row">
                <div class="col">
                    <a class="btn btn-primary c1" href="./addEmployee" role="button">Add Employee</a>
                </div>
                <div class="col">
                    <a class="btn btn-primary c2" href="./searchEmployee" role="button">Search Employee</a>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <a class="btn btn-primary c1" href="./find?action=update" role="button">Update Employee</a>
                </div>
                <div class="col">
                    <a class="btn btn-primary c2" href="./find?action=delete" role="button">Delete Employee</a>
                </div>
            </div>


          
        </div>

        <div class="row">
            <div class="title">
                <h2>Manage Loans</h2>
            </div>
            <div class="row">
                <div class="col">
                    <a class="btn btn-primary c1" href="./find?action=applyloan" role="button">Apply Loan</a>
                </div>
                <div class="col">
                    <a class="btn btn-primary c1" href="./find?action=loanDetails" role="button">Loan Details</a>
                </div>
            </div>
        </div>
    </div>

    <div class="footer" style="margin-top: 3rem;"></div>


    
    <script>
        window.onload = (event) => {
            const params = new URLSearchParams(window.location.search);
            if(params.has('action')){
                const id = params.get('employeeid');
                const action = params.get('action');

                var msg = "";

                if(action == 'update')
                    msg = "Employee updated successfully. ID = " + id;
                if(action == 'delete')
                    msg = "Employee deleted successfully. ID = " + id;

                showSuccessAlert(msg);
            }
        }

        function showSuccessAlert(msg){
            console.log("---- success alert -----");
        
            var alertBox = document.getElementById('alert-success');
            alertBox.classList.remove('hide');

            var alertMsg = document.getElementById('alert-p');
            alertMsg.innerHTML = msg;
            
            setTimeout(() => {
                alertBox.classList.add('hide');
                window.location = "./";
            }, 2000);
        }
    </script>
    

</body>
</html>