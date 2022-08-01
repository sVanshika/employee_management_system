<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        .heading{
            color: #337ab7;
            text-decoration: none;
        }
        .heading:hover{
            color: #337ab7;
            text-decoration: none;
            cursor: pointer;
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
    </style>

</head>
<body>

    <div style="background-color:#f5f5f5; padding:0.5rem 2rem; margin-bottom:3rem">
        <h3><a href="./" class="heading">NSEL EMPLOYEES</a> </h3>
    </div>


    <div class="container">

        <!-- title -->
        <div class="title d-flex justify-content-center">
            <h1 class="title">${employee.firstName}'s Loan Details</h1>
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
                            <input value="${loan.maxEligibleLoanAmount}" id="maxEligibleLoanAmount" name="maxEligibleLoanAmount" class="form-control" type="number" readonly>
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