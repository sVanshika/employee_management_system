<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Loan</title>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <!-- <link rel="stylesheet" type="text/css" href="../../resources/style.css"> -->

    <style>
        .container{
            padding: 2rem;
        }
        
        .subheading{
            margin-top: 1rem;
        }
        
        .hide{
            visibility: hidden;
        }
        .alert{
            z-index: 10;
            padding-bottom: 0;
        }
        .alert-success, .alert-danger{
            width: 25%;
            position: fixed;
            right: 1px;
        }
        /* .hide{
            display: none;
        } */
        .input-box{
            position: relative;
        }
        .input-comp{
            position: absolute;
            top: 0;
            left: 0;
        }
        .prefix{
            z-index: 9;
            background-color: #E9ECEF;
            padding: 0.4rem 1rem;
            border-radius: 0.3rem;
        }
        .form-control{
            padding-left: 4rem;
        }
        .form-control[readonly]{
            background-color: white;
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

    <div class="container"  style="width: 75%;box-shadow: 0 3px 10px rgb(0 0 0 / 0.2); border-radius: 20px;">
     
    
    <!-- title -->
    <div class="title d-flex justify-content-center my-3">
        <h1 class="title">${employee.firstName} 's Loan Details</h1>
    </div>

    <form>

        <!-- salary details - income, expense -->
        <h5 class="subheading">Salary Details</h5>
        <div class="row">
            <div class="form-group col-md-6">
                <label for="monthlyIncome">Monthly Income</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input value="${loan.monthlyIncome}" id="monthlyIncome" name="monthlyIncome" class="form-control" type="number" readonly>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="totalMonthlyExpense">Total Monthly Expense</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input value="${loan.totalMonthlyExpense}" id="totalMonthlyExpense" name="totalMonthlyExpense" class="form-control" type="number" readonly>
                </div>                
            </div>
        </div>

        <!-- loan details - loan amount, rate, tenure, repayment frequency -->
        <h5 class="subheading">Loan Details</h5>
        <div class="row">
            <div class="form-group col-md-3">
                <label for="loanAmountAsked">Loan Amount</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input value="${loan.loanAmountAsked}" id="loanAmountAsked" name="loanAmountAsked" class="form-control" readonly>
                </div>                
            </div>
            <div class="form-group col-md-3">
                <label for="rate">ROI (p.a.)</label>
                <input value="${loan.rate}" id="rate" name="rate" class="form-control" type="number" readonly>
            </div>
            <div class="form-group col-md-3">
                <label for="tenure">Tenure (in years)</label>
                <input value="${loan.tenure}" id="tenure" name="tenure" class="form-control" type="number" readonly>
                <!-- <div id="tenure_invalid_feedback" class="hide" style="color: red;">Max tenure is 50 years.</div> -->
            </div>
            <div class="form-group col-md-3">
                <label for="repaymentFrequency">Repayment Frequency</label>
                <input value="${loan.repaymentFrequency}" name="repaymentFrequency" id="repaymentFrequency" class="form-select" type="text" readonly>
            </div>
        </div>

        <!-- derived values - dbr, max eligible loan amt, max emi -->
        <h5 class="subheading"></h5>
        <div class="row results">
            <div class="form-group col-md-4">
                <label for="dbr">DBR (in %)</label>
                <input value="${loan.dbr}" id="dbr" name="dbr" class="form-control" type="number" readonly>
            </div>
            <div class="form-group col-md-4">
                <label for="maxEligibleLoanAmount">Max Eligible Loan Amount</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input value="${loan.maxEligibleLoanAmount}" id="maxEligibleLoanAmount" name="maxEligibleLoanAmount" class="form-control" type="number" readonly>
                </div>   
                
            </div>
            <div class="form-group col-md-4">
                <label for="maxEligibleEmi">Max Eligible EMI</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input value="${loan.maxEligibleEmi}" id="maxEligibleEmi" name="maxEligibleEmi" class="form-control" type="number" readonly>
                </div>                   
            </div>
        </div>

        <!-- buttons -->
        <div class="d-flex justify-content-center mt-3">
            <!-- <input class="btn btn-success" type="submit" style="padding: 1rem 3rem; margin: 1rem;"> -->
            <a class="btn btn-danger" href="./" style="padding: 1rem 3rem; margin: 1rem;">Home</a>
            <!-- <input class="btn btn-secondary" type="reset" value="Clear"
                style="padding: 1rem 3rem; margin: 1rem;"
                onclick="clearApprovedField()"> -->
        </div>

    </form>


    </div>

    <script>
        window.onload = (() => {
            setRepaymentFrequency();
        })

        function setRepaymentFrequency(){
            console.log("set rf");
            let rf = document.getElementById('repaymentFrequency').value;
            console.log(rf);
            if(rf == "12.0")
                document.getElementById('repaymentFrequency').value = "Monthly";
            else if(rf == "4.0")
                document.getElementById('repaymentFrequency').value = "Quarterly";
            else if(rf == "2.0")
                document.getElementById('repaymentFrequency').value = "Half Yearly";
            else
                document.getElementById('repaymentFrequency').value = "Yearly";
            
        }
    </script>

    
    
</body>
</html>