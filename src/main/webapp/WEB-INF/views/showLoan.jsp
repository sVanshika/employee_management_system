<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:formatNumber value="${emi.installment}" pattern="#.00" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Details</title>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <!-- datatable -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

    <style>
        .container{
            padding: 2rem;
        }
        
        .subheading{
            margin-top: 1rem;
        }
        .tab-pane{
            padding: 2rem 0;
        }
        .input-box{
            position: relative;
        }
        .input-comp{
            position: absolute;
            top: 0;
            left: 0;
        }
        .prefix{
            margin-left: 12px;
            margin-top: 1px;
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
        label{
            font-weight: bold;
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
                    <li class="d-flex" style="margin-left: 155%;">
                        <a href="./logout" class="btn btn-secondary" role="button">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


    <div class="container">

        <!-- title -->
        <div class="title d-flex justify-content-center">
            <h1 class="title">Loan Details</h1>
        </div>

        <!-- salary, loan, profile eligibility, repayment schedule -->
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
              <button class="nav-link active" id="nav-salary-details-tab" data-bs-toggle="tab" data-bs-target="#nav-salary-details" type="button" role="tab" aria-controls="nav-salary-details" aria-selected="true">Salary Details</button>
              
              <button class="nav-link" id="nav-profile-eligibility-tab" data-bs-toggle="tab" data-bs-target="#nav-profile-eligibility" type="button" role="tab" aria-controls="nav-profile-eligibility" aria-selected="false">Profile Eligibility</button>
              
              <button class="nav-link" id="nav-loan-details-tab" data-bs-toggle="tab" data-bs-target="#nav-loan-details" type="button" role="tab" aria-controls="nav-loan-details" aria-selected="false">Loan Details</button>
              
              <button class="nav-link" id="nav-repay-sch-tab" data-bs-toggle="tab" data-bs-target="#nav-repay-sch" type="button" role="tab" aria-controls="nav-repay-sch" aria-selected="false">Repayment Schedule</button>
            </div>
        </nav>
        
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-salary-details" role="tabpanel" aria-labelledby="nav-salary-details-tab">
                <h3 class="heading">Salary Details</h3>
                <div>
                    <div class="form-group row my-3">
                        <label class="col-md-2" for="monthlyIncome">Monthly Income</label>
                        <div class="col-md-4 input-box">
                            <span class="input-comp prefix">Rs.</span>
                            <input value="${loan.monthlyIncome}" id="monthlyIncome" name="monthlyIncome" class="form-control" type="number" readonly>
                        </div>
                    </div>

                    <div class="form-group row my-3">
                        <label class="col-md-2" for="totalMonthlyExpense">Total Monthly Expense</label>
                        <div class="input-box col-md-4">
                            <span class="input-comp prefix">Rs.</span>
                            <input value="${loan.totalMonthlyExpense}" id="totalMonthlyExpense" name="totalMonthlyExpense" class="form-control" type="number" readonly>
                        </div>                
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="nav-profile-eligibility" role="tabpanel" aria-labelledby="nav-profile-eligibility-tab">
                <h3 class="heading">Profile Eligibility</h3>
                <div>
                    <div class="form-group  row my-3">
                        <label class="col-md-2" for="dbr">DBR</label>
                        <div class="col-md-4 input-box">
                            <span class="input-comp prefix">%</span>
                            <input value="${loan.dbr}" id="dbr" name="dbr" class="form-control" type="number" readonly>
                        </div>                        
                    </div>
                    <div class="form-group  row my-3">
                        <label class="col-md-2" for="maxEligibleLoanAmount">Max Eligible Loan Amount</label>
                        <div class="col-md-4 input-box">
                            <span class="input-comp prefix">Rs.</span>
                            <input value='<fmt:formatNumber value="${loan.maxEligibleLoanAmount}" pattern="#.00"/>' id="maxEligibleLoanAmount" name="maxEligibleLoanAmount" class="form-control" type="number" readonly>
                        </div>   
                        
                    </div>
                    <div class="form-group  row my-3">
                        <label class="col-md-2" for="maxEligibleEmi">Max Eligible EMI</label>
                        <div class="col-md-4 input-box">
                            <span class="input-comp prefix">Rs.</span>
                            <input value="${loan.maxEligibleEmi}" id="maxEligibleEmi" name="maxEligibleEmi" class="form-control" type="number" readonly>
                        </div>                   
                    </div>
                </div>
        
                
            </div>

            <div class="tab-pane fade" id="nav-loan-details" role="tabpanel" aria-labelledby="nav-loan-details-tab">
                <h3 class="heading">Loan Details</h3>
                <div>
                    <div class="form-group row my-3">
                        <label class="col-md-2" for="loanAmountAsked">Loan Amount</label>
                        <div class="col-md-4 input-box">
                            <span class="input-comp prefix">Rs.</span>
                            <input value="${loan.loanAmountAsked}" id="loanAmountAsked" name="loanAmountAsked" step=".01" class="form-control" readonly>
                        </div>                
                    </div>
                    <div class="form-group row my-3">
                        <label class="col-md-2" for="emiAmount">EMI</label>
                        <div class="col-md-4 input-box">
                            <span class="input-comp prefix">Rs.</span>
                            <input value="${loan.emiAmount}" name="emiAmount" id="emiAmount" class="form-control" step=".01" type="text" style="padding-left: 6px 12px !important;" readonly>
                        </div>
                    </div>
                    <div class="form-group row my-3">
                        <label class="col-md-2" for="rate">ROI (p.a.)</label>
                        <div class="col-md-4 input-box">
                            <input value="${loan.rate}" id="rate" name="rate" class="form-control" type="number" step=".01" readonly>
                        </div>
                    </div>
                    <div class="form-group row my-3">
                        <label class="col-md-2" for="tenure">Tenure(in years)</label>
                        <div class="col-md-4 input-box">
                            
                            <input value="${loan.tenure}" id="tenure" name="tenure" class="form-control" readonly step=".01">
                        </div>                
                    </div>
                    <div class="form-group row my-3">
                        <label class="col-md-2" for="repaymentFrequency">Repayment Frequency</label>
                        <div class="col-md-4 input-box">
                            <input value="${loan.repaymentFrequency}" name="repaymentFrequency" id="repaymentFrequency" class="form-control" type="text" style="padding-left: 6px 12px !important;" readonly>
                        </div>
                    </div>
                    
                </div>
            </div>

            <div class="tab-pane fade" id="nav-repay-sch" role="tabpanel" aria-labelledby="nav-repay-sch-tab">
                <h3 class="heading">Repayment Schedule</h3>
                <table class="table table-striped" id="rs-table">
                    <thead>
                        <tr>
                            <th>Month</th>
                            <th>Beginning Amount (Rs.)</th>
                            <th>EMI (Rs.)</th>
                            <th>Interest Paid (Rs.)</th>
                            <th>Principal Paid (Rs.)</th>
                            <th>Ending Amount (Rs.)</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${loan.repaymentSchedule}" var="emi">

                            <tr>
                                <th>${emi.month}</th>
                                <th>${emi.beginningAmount}</th>
                                <th>${emi.installment}</th>
                                <th>${emi.interestPaid}</th>
                                <th>${emi.principalPaid}</th>
                                <th>${emi.endingAmount}</th>
                            </tr>

                        </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>


    </div>
    
    <script>
        $(document).ready(function () {
            $('#rs-table').DataTable();
        });

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