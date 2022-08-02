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

    <div class="alert alert-success alert-dismissible hide" id="alert-success" role="alert">
        <p>Loan Approved</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <div class="alert alert-danger alert-dismissible hide" id="alert-danger" role="alert">
        <p id="alert-danger-p">Loan NOT Approved !</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
    </div>

    <div class="container"  style="width: 75%;box-shadow: 0 3px 10px rgb(0 0 0 / 0.2); border-radius: 20px; margin-bottom: 4rem;">
     
    
    <!-- title -->
    <div class="title d-flex justify-content-center my-3">
        <h1 class="title">Apply Loan</h1>
    </div>

    <form action="saveApplyLoan" method="post" modelAttribute="loan" onsubmit="checkForm(this)">

        <!-- salary details - income, expense -->
        <h5 class="subheading">Salary Details</h5>
        <div class="row">
            <div class="form-group col-md-6">
                <label for="monthlyIncome">Monthly Income</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input id="monthlyIncome" name="monthlyIncome" class="form-control input-comp" type="number" step=".01" required="true" onchange="setValues()">
                </div>
                
            </div>
            <div class="form-group col-md-6">
                <label for="totalMonthlyExpense">Total Monthly Expense</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input id="totalMonthlyExpense" name="totalMonthlyExpense" class="form-control" type="number" required="true" step=".01" onchange="setValues()">
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
                    <input id="loanAmountAsked" name="loanAmountAsked" class="form-control" type="number" required="true" step=".01" onchange="setValues()">
                </div>
                
            </div>
            <div class="form-group col-md-3">
                <label for="rate">ROI (p.a.)</label>
                <input id="rate" name="rate" class="form-control" type="number" required="true" onchange="setValues()" step="0.01">
            </div>
            <div class="form-group col-md-3">
                <label for="tenure">Tenure (in years)</label>
                <input id="tenure" name="tenure" class="form-control" type="number" required="true" step=".01" onchange="setValues()" onblur="checkTenure()">
                <div id="tenure_invalid_feedback" class="hide" style="color: red;">Max tenure is 50 years.</div>
            </div>
            <div class="form-group col-md-3">
                <label for="repaymentFrequency">Repayment Frequency</label>
                <select name="repaymentFrequency" id="repaymentFrequency" class="form-select" onchange="setValues()">
                    <option value="12">Monthly</option>
                    <option value="4">Quaterly</option>
                    <option value="2">Half yearly</option>
                    <option value="1">Yearly</option>
                </select>
            </div>
        </div>

        <!-- derived values - dbr, max eligible loan amt, max emi -->
        <h5 class="subheading"></h5>
        <div class="row results">
            <div class="form-group col-md-4">
                <label for="dbr">DBR (in %)</label>
                <input id="dbr" name="dbr" class="form-control" type="number" readonly>
            </div>
            <div class="form-group col-md-4">
                <label for="maxEligibleLoanAmount">Max Eligible Loan Amount</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input id="maxEligibleLoanAmount" name="maxEligibleLoanAmount" class="form-control" type="number" readonly>
                </div>
                
            </div>
            <div class="form-group col-md-4">
                <label for="maxEligibleEmi">Max Eligible EMI</label>
                <div class="input-box">
                    <span class="input-comp prefix">Rs.</span>
                    <input id="maxEligibleEmi" name="maxEligibleEmi" class="form-control" type="number" readonly>
                </div>
                
            </div>
        </div>

        <button class="btn btn-primary" type="button" 
            style="padding: 1rem 3rem; margin: 2rem 0;"
            onclick="checkApproval()">
            Check
        </button>

        <!-- decision - approved, reason -->
       
        <div class="row results">
            <div class="form-group col-md-6">
                <label for="approved">Approved</label>
                <input id="approved" name="approved" class="form-control" type="text" value="Check" readonly>
            </div>
            <div class="form-group col-md-6 hide" id="reason_div">
                <label for="reason">Reason</label>
                <input id="reason" name="reason" class="form-control" type="text" readonly>
            </div>
        </div>

        <!-- buttons -->
        <div class="d-flex justify-content-center mt-3">
            <input class="btn btn-success" type="submit" style="padding: 1rem 3rem; margin: 1rem;">
            <a class="btn btn-danger" href="./" style="padding: 1rem 3rem; margin: 1rem;">Cancel</a>
            <input class="btn btn-secondary" type="reset" value="Clear"
                style="padding: 1rem 3rem; margin: 1rem;"
                onclick="clearApprovedField()">
        </div>

    </form>


    </div>

    <script>
        let dbr = 0;
        let maxEligibleEmi = 0;
        let maxEligibleLoanAmount = 0;

        function clearApprovedField(){
            var approved_input = document.getElementById('approved');
            approved_input.value = 'Check';
            approved_input.style.backgroundColor = '#eee';
        }

        function checkTenure() {
            var tenure = document.getElementById('tenure');
            var tenure_invalid_feedback = document.getElementById('tenure_invalid_feedback');
            if(tenure.value > 50){
                tenure.value = 0;
                tenure_invalid_feedback.classList.remove("hide");
            }
            else{
                tenure_invalid_feedback.classList.add("hide");
            }
        }
        
        function calculateDBR() {
            // calculated in %
            const totalMonthlyExpense = parseFloat(document.getElementById('totalMonthlyExpense').value);
            const monthlyIncome = parseFloat(document.getElementById('monthlyIncome').value);

            console.log("called dbr - " + totalMonthlyExpense + " - " + monthlyIncome);
            dbr = Math.abs(totalMonthlyExpense) / Math.abs(monthlyIncome);
            dbr = dbr*100;
            console.log("dbr="+dbr);
        }

        function calculateMaxEligibleEMI(){
            console.log("called emi");
            const monthlyIncome = parseFloat(document.getElementById('monthlyIncome').value);
            maxEligibleEmi = ((monthlyIncome - dbr*0.2)*0.8);
        }

        function calculateEligibleLoanAmount(){
            const roi = parseFloat(document.getElementById('rate').value);
            const tenure = parseFloat(document.getElementById('tenure').value);
            const repaymentFrequency = parseFloat(document.getElementById('repaymentFrequency').value);


            console.log("called loan amount");
            let t = tenure * repaymentFrequency;
            let rate = roi/12;
            
            maxEligibleLoanAmount = (maxEligibleEmi * ( (Math.pow(1+rate, t) - 1) / (rate * Math.pow(1+rate, t)))) * 100;
        }

        function setValues(){
            calculateDBR();
            calculateMaxEligibleEMI();
            calculateEligibleLoanAmount();

            console.log("-> dbr="+dbr + " emi="+maxEligibleEmi + " maxloan="+maxEligibleLoanAmount);

            document.getElementById('dbr').value = Math.round(dbr*100)/100;
            document.getElementById('maxEligibleEmi').value = Math.round(maxEligibleEmi*100)/100;
            document.getElementById('maxEligibleLoanAmount').value = Math.round(maxEligibleLoanAmount*100)/100;
        }

        function checkDerivedFields(){
            let dbr = document.getElementById('dbr').value;
            let emi = document.getElementById('maxEligibleEmi').value;
            let loan = document.getElementById('maxEligibleLoanAmount').value;

            if(dbr == '' || emi == '' || loan == '')
                return false;
            else
                return true;
        }

        function checkApproval(){
            let approved = true;
            let reasons = [];

            const loanAmountAsked = document.getElementById('loanAmountAsked').value;

            // loan conditions
            if(loanAmountAsked > maxEligibleLoanAmount){
                approved = false;
                reasons.push("Loan Amount is greater than Max Eligible Loan Amount!");
            }
            if(dbr > 40){
                approved = false;
                reasons.push("DBR should be less than or equal to 40%.");
            }

            console.log("approved = " + approved);

            // putting value in input box
            var approved_input = document.getElementById('approved');            
            var reason_div = document.getElementById('reason_div');

            if(checkDerivedFields() == true && approved == false){
                approved_input.value = 'No';
                approved_input.style.backgroundColor = '#DC3545';    
                reason_div.classList.remove("hide"); 
                document.getElementById('reason').value = reasons.toString();
            }
            if(checkDerivedFields() == true && approved == true){
                // approved
                approved_input.value = 'Yes';
                reason_div.classList.add("hide");
                approved_input.style.backgroundColor = '#198754';
            }
        }

        function checkForm(form){
            // checking if loan is approved or not
            var approved = document.getElementById('approved').value;
            var alert_success = document.getElementById("alert-success");
            var alert_danger = document.getElementById("alert-danger");
            
            if(approved != 'Yes'){
                // alert
                alert_danger.classList.remove("hide");
                alert_success.classList.add("hide");
                setTimeout(() => {alert_danger.classList.add('hide')}, 2000);

                event.preventDefault();
                event.stopPropagation();
            }
            else{
                alert_success.classList.remove("hide");
                alert_danger.classList.add("hide");
                setTimeout(() => {alert_success.classList.add('hide')}, 2000);

                var params = new URLSearchParams(window.location.search);
                var id = params.get("employeeid");
                var url = "saveApplyLoan?employeeid=" + id;
                form.action = url;
            }
            
            

            
        }
          

        

    </script>

    
</body>
</html>