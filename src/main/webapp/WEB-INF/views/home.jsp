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
        .btn{
            padding: 1rem 5rem;
            font-size: 2rem;
            margin: 2rem;
        }
        .c1, .c1:hover{
            color: #fff;
            background-color: #fa7466;
            border-color: #fa7466;
        }
        
        .c2, .c2:hover{
            color: #fff;
            background-color: #648cd5;
            border-color: #648cd5;
        }

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

        .heading{
            color: #337ab7;
            text-decoration: none;
        }
        .heading:hover{
            color: #337ab7;
            text-decoration: none;
            cursor: pointer;
        }


    </style>
</head>
<body>
    
    <div style="background-color:#f5f5f5; padding:0.5rem 2rem; margin-bottom:3rem">
        <h3><a href="./" class="heading">NSEL EMPLOYEES</a> </h3>
    </div>

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
            <div class="col-md-6">
                <div class="d-flex flex-column justify-content-center" style="padding-top: 0;">
                    <a class="btn btn-primary c1" href="./addEmployee" role="button">Add Employee</a>
                    <a class="btn btn-warning c2" href="./searchEmployee" role="button">Search Employee</a>

                    <a class="btn btn-warning c1" href="./find?action=update" role="button">Update Employee</a>
                    <a class="btn btn-warning c2" href="./find?action=delete" role="button">Delete Employee</a>
                    <a class="btn btn-primary c1" href="./find?action=applyloan" role="button">Apply Loan</a>
                    <a class="btn btn-primary c1" href="./find?action=loanDetails" role="button">Loan Details</a>
                    
                </div>
            </div>
        </div>
    </div>


    
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