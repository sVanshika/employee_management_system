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

    <style></style>

</head>
<body>
    
    <jsp:include page="header.jsp" />

    <div class="container" style="margin-top: 2rem;">

        <div class="heading">
            <h2>Apply Loan</h2>
        </div>

        <form onsubmit="formSubmit()">
            <div class="form-check">
                <input type="radio" name="newCustomerCheckBox" id="newCustomerCheckBox" class="form-check-input">
                <label for="newCustomerCheckBox" class="form-check-label">New Customer</label>
            </div>

            <div class="form-check">
                <input type="radio" name="existingCustomerCheckBox" id="existingCustomerCheckBox" class="form-check-input">
                <label for="existingCustomerCheckBox" class="form-check-label">Existing Customer</label>
            </div>
        </form>

    </div>


</body>
</html>