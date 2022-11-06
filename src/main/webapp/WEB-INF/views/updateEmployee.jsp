<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Employee</title>

    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style.css"> -->


    <style>

        .form-control{
            background-color: white;
        }
        .form-control::placeholder{
            color: black;
        }
        
        .add-button, .remove-button{
            border-radius: 50%;
            padding: 0.5rem 1rem;
        }
        .accordion{
            margin: 1rem 0;
        }
        #hidden_member_container_card_body{
            position: absolute;
            visibility: hidden;
        }
        #member_container_card_body{
            position: relative;
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

    <div class="container"  
        style="width: 75%;
            box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);
            border-radius: 20px; 
            padding: 1rem; 
            margin-top: 2rem;">
    
    <!-- title -->
    <div class="title d-flex justify-content-center my-3">
        <h1 class="title">Update Employee</h1>
    </div>

    <form:form action="saveUpdatedEmployee" method="post" modelAttribute="employeeToUpdate" path="form" onsubmit="checkForm()">

        <form:hidden path="employeeId"></form:hidden>

        <!-- first name, last name -->
        <div class="row">
            <div class="form-group col-md-6">
                <label>First Name *</label>
                <form:input path="firstName" class="form-control"  required="true"/>
            </div>
            <div class="form-group col-md-6">
                <label>Last Name *</label>
                <form:input path="lastName"  class="form-control"   required="true" />
               
            </div>
        </div>

        <!-- age, sex -->
        <div class="row">
            <div class="form-group col-md-6">
                <label>Age</label>
                <form:input path="age" class="form-control"     readonly="true" />
            </div>
            <div class="form-group col-md-6">
                <label>Sex</label>
                <form:select path="sex"  class="form-control">
                    <form:option value="Male">Male</form:option>
                    <form:option value="Female">Female</form:option>
                    <form:option value="Other">Other</form:option>
                </form:select>
            </div>
        </div>

        <!-- mobile number, religion -->
        <div class="row">
            <div class="form-group col-md-6">
                <label>Mobile Number</label>
                <form:input path="mobileNumber"  class="form-control"     />
            </div>
            <div class="form-group col-md-6">
                <label>Religion</label>
                <form:select path="religion" class="form-control">
                    <form:option value="Hinduism">Hinduism</form:option>
                    <form:option value="Christianity">Christianity</form:option>
                    <form:option value="Islam">Islam</form:option>
                    <form:option value="Sikhism">Sikhism</form:option>
                    <form:option value="Buddhism">Buddhism</form:option>
                    <form:option value="Jainism">Jainism</form:option>
                    <form:option value="Other">Other</form:option>
                </form:select>
            </div>
        </div>
            
        <!-- id, id proof -->
        <div class="row">
            <div class="form-group col-md-6">
                <label>Identity Proof Choice *</label>
                <form:select path="identity" class="form-control" readonly="true" required="true">
                    <form:option value="PAN">PAN</form:option>
                    <form:option value="AADHAR">AADHAR</form:option>
                    <form:option value="PASSPORT">PASSPORT</form:option>
                </form:select>
            </div>
            <div class="form-group col-md-6">
                <label id="identityProofLabel">Choose Identity *</label>
                <form:input path="identityProof"  class="form-control"    readonly="true" required="true" />               
            </div>
        </div>

        <!-- temporary address accordian -->
        <div class="accordion" id="temp_address_accordian">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne_temp_address">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne_temp_address" aria-expanded="true" aria-controls="collapseOne_temp_address">
                        Temporary Address
                    </button>
                </h2>
                <div id="collapseOne_temp_address" class="accordion-collapse collapse" aria-labelledby="headingOne_temp_address" data-bs-parent="#temp_address_accordian">
                    <div class="accordion-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Plot No.</label>
                                <form:input id="plotNo" path="tempAddress.plotNo" class="form-control"     />
                            </div>
                            <div class="form-group col-md-6">
                                <label>Locality</label>
                                <form:input id="locality" path="tempAddress.locality" class="form-control"     />
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>City</label>
                                <form:input id="city" path="tempAddress.city" class="form-control"      />
                            </div>
                            <div class="form-group col-md-6">
                                <label>State</label>
                                <form:input id="state" path="tempAddress.state" class="form-control"    />
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Country</label>
                                <form:input id="country" path="tempAddress.country" class="form-control"  />
                            </div>
                            <div class="form-group col-md-6">
                                <label>Pincode *</label>
                                <form:input id="pincode" path="tempAddress.pincode" class="form-control"   required="true"   />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- permanent address accordian -->
        <div class="accordion" id="perm_address_accordian">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne_perm_address">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne_perm_address" aria-expanded="true" aria-controls="collapseOne_perm_address">
                        Permanent Address
                    </button>
                </h2>
                <div id="collapseOne_perm_address" class="accordion-collapse collapse" aria-labelledby="headingOne_perm_address" data-bs-parent="#perm_address_accordian">
                    <div class="accordion-body">
                        
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="checkbox" onclick="putAddress(this)">
                            <label class="form-check-label" for="checkbox">
                                Same as Temporary Address
                            </label>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Plot No.</label>
                                <form:input id="plotNo_perm" path="permAddress.plotNo" class="form-control"     />
                            </div>
                            <div class="form-group col-md-6">
                                <label>Locality</label>
                                <form:input id="locality_perm" path="permAddress.locality" class="form-control"     />
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>City</label>
                                <form:input id="city_perm" path="permAddress.city" class="form-control"      />
                            </div>
                            <div class="form-group col-md-6">
                                <label>State</label>
                                <form:input id="state_perm" path="permAddress.state" class="form-control"    />
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Country</label>
                                <form:input id="country_perm" path="permAddress.country" class="form-control"    />
                            </div>
                            <div class="form-group col-md-6">
                                <label>Pincode *</label>
                                <form:input id="pincode_perm" path="permAddress.pincode" class="form-control"   required="true"  />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- family accordian -->
        <div class="accordion" id="family_accordian">
            <div class="accordion-item">
                <!-- header -->
                <h1 class="accordion-header d-flex justify-content-between" id="headingOne_family">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne_family" aria-expanded="true" aria-controls="collapseOne_family">
                        
                        Add Family Members

                        <div class="buttons d-flex">
                            <button class="btn btn-success add-button" type="button" onclick="addFamilyMember()"> + </button>
                            <button class="btn btn-danger remove-button" type="button" onclick="removeFamilyMember()"> - </button>
                        </div>
                    </button>
                </h1>
                <div id="collapseOne_family" class="accordion-collapse collapse" aria-labelledby="headingOne_family" data-bs-parent="#family_accordian">
                    <div class="accordion-body container" style="width: 100%;" >

                        <div class="card-body" id="family_main_container" > 
                                              
                        <div id="hidden_member_container_card_body">

                        <c:forEach items="${employeeToUpdate.familyMembers}" var="member">
                                
                                <div class="container family-box" style="width: 100%;padding: 1rem;">
                                    <div class="row">
                                        <input id="firstname" value="${member.firstName}" class="col-md-3 form-group" />
                                        <input id="lastname" value="${member.lastName}" class="col-md-3 form-group" />
                                        <input id="age" value="${member.age}" class="col-md-3 form-group" />
                                        <input id="relation" value="${member.relation}" class="col-md-3 form-group relation_hidden_input">
                                    </div>
                                </div>
                        </c:forEach>

                    </div>
                        
                        <div id="member_container_card_body"></div>
 
                    </div>

                    </div>
                </div>
            </div>
        </div>

        
        <!-- buttons -->
        <div class="d-flex justify-content-center mt-3">
            <input class="btn btn-success" type="submit" style="padding: 1rem 3rem; margin: 1rem;" />
            <a class="btn btn-danger" href="./" style="padding: 1rem 3rem; margin: 1rem;">Cancel</a>
            <input class="btn btn-secondary" type="reset" value="Clear" style="padding: 1rem 3rem; margin: 1rem;" />
        </div>
        

    </form:form>

    
    </div>

    
    
</body>

<script>
    var count;
    var index=-1;

    window.onload = (() => {
        count = (document.getElementById('hidden_member_container_card_body').children.length);
        console.log("count=" + count + " index=" + index);

        createFamily();
    })

    function checkForm(){
        const ages = document.getElementsByClassName("age-field");
        for(let i=0; i<ages.length; i++){
            if(ages[i].value == ''){
                ages[i].value = '0';
            }
        }
    }

    function createFamily(){
        // adding new boxes
        for (let i = 0; i < count; i++) {
            addFamilyMember();            
        }

        // extracting values of already present members and putting it in new boxes
        let family = document.getElementById('hidden_member_container_card_body');
        let relation_inputs = document.getElementsByClassName('relation_hidden_input');

        for(let boxIndex = 0; boxIndex < count; boxIndex++){
            let container = family.children[boxIndex];
            let row = container.children[0].children;        

            let hidden_firstname = row['firstname'].value;
            let hidden_lastname = row['lastname'].value;
            let hidden_age = row['age'].value;
            let hidden_relation = row['relation'].value;

            console.log(hidden_firstname + " - " + hidden_lastname + " - " + hidden_age + " - " + hidden_relation);
            
            let newFirstNameId = "familyMembers[" + boxIndex + "].firstName";
            let newLastNameId = "familyMembers[" + boxIndex + "].lastName";
            let newAgeId = "familyMembers[" + boxIndex + "].age";
            let newRelationId = "familyMembers[" + boxIndex + "].relation";

            document.getElementById(newFirstNameId).value = hidden_firstname;
            document.getElementById(newLastNameId).value = hidden_lastname;
            document.getElementById(newAgeId).value = hidden_age;
            document.getElementById(newRelationId).value = hidden_relation;
        }
    }

    function addFamilyMember(){
        console.log("add family memeber");

        index = index+1;

        var firstname = "familyMembers[" + index + "].firstName";
        var lastname = "familyMembers[" + index + "].lastName";
        var age = "familyMembers[" + index + "].age";
        var relation = "familyMembers[" + index + "].relation";

        var family = `<div class="container new-family-box" style="width: 100%;padding: 1rem;">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label>First Name</label>
                                <input id="`+firstname+`" name="`+firstname+`" class="form-control" />
                            </div>
                            <div class="form-group col-md-3">
                                <label>Last Name</label>
                                <input id="`+lastname+`" name="`+lastname+`" class="form-control" />
                            </div>
                            <div class="form-group col-md-3">
                                <label>Age</label>
                                <input id="`+age+`" name="`+age+`" class="form-control age-field" />
                            </div>
                            <div class="form-group col-md-3">
                                <label>Relation</label>
                                    <select id="`+relation+`" name="`+relation+`" class="form-control">
                                                <option value="Father">Father</option>
                                                <option value="Mother">Mother</option>
                                                <option value="Brother">Brother</option>
                                                <option value="Sister">Sister</option>
                                                <option value="Husband">Husband</option>
                                                <option value="Wife">Wife</option>
                                                <option value="Grand Father">Grand Father</option>
                                                <option value="Grand Mother">Grand Mother</option>
                                                <option value="Uncle">Uncle</option>
                                                <option value="Aunt">Aunt</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>`;
        
        $(document).ready(function() { 
            $('#member_container_card_body').append(family);
        });
    }

    

    function removeFamilyMember(){
        count -= 1;
        
        var family_boxes = document.getElementsByClassName('new-family-box');
        var num = family_boxes.length;
            
        if(num > 0){
            family_boxes[num-1].remove();
        }
    }

    function putAddress(obj) {
        var plotno = document.getElementById('plotNo').value;
        var city = document.getElementById('city').value;
        var state = document.getElementById('state').value;
        var country = document.getElementById('country').value;
        var locality = document.getElementById('locality').value;
        var pincode = document.getElementById('pincode').value;

        console.log(plotno + "-" + city + "-" + state + "-" + country + "-" + locality + "-" + pincode);

        if($(obj).is(":checked")){
                console.log("address checkbox checked");
                document.getElementById('plotNo_perm').value = plotno;
                document.getElementById('city_perm').value = city;
                document.getElementById('state_perm').value = state;
                document.getElementById('country_perm').value = country;
                document.getElementById('locality_perm').value = locality;
                document.getElementById('pincode_perm').value = pincode;
        }
        else{
                console.log("address not checked");
                document.getElementById('plotNo_perm').value = "";
                document.getElementById('city_perm').value = "";
                document.getElementById('state_perm').value = "";
                document.getElementById('country_perm').value = "";
                document.getElementById('locality_perm').value = "";
                document.getElementById('pincode_perm').value = "";
        }
    }


</script>

</html>