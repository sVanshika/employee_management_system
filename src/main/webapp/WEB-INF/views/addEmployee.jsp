<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false"%>


<!-- mvn package && copy C:\Users\Vanshika\IdeaProjects\PracticeProject\target\PracticeProject.war  D:\Downloads\wildfly-26.0.1.Final\wildfly-26.0.1.Final\standalone\deployments -->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add New Employee</title>

        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

        <style>
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
            .form{
                clear: both;
            }
            .accordion{
                margin: 1.5rem 0;
            }
            .accordion-button{
                font-size: 14px;
                
            }
            .accordion-header{
                margin: 0;
                background: #eee;
            }.heading{
            color: #337ab7;
            text-decoration: none;
        }
        .heading:hover{
            color: #337ab7;
            text-decoration: none;
            cursor: pointer;
        }
        </style>

        <script>
            
                   
        </script>


    </head>
    <body>
        <div style="background-color:#f5f5f5; padding:0.5rem 2rem; margin-bottom:3rem">
            <h3><a href="./" class="heading">NSEL EMPLOYEES</a> </h3>
        </div>

        <div class="alert alert-success alert-dismissible hide" id="alert-success" role="alert">
            <p>Employee Saved Successfully</p>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <div class="alert alert-danger alert-dismissible hide" id="alert-danger" role="alert">
            <p id="alert-danger-p">Please fill the required fields</p>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
        </div>

        <div class="alert alert-danger alert-dismissible hide" id="alert-duplicate" role="alert">
            <p id="alert-duplicate-p">Employee already exists.</p>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
        </div>

        <div id="alert-sucess-placeholder"></div>
        <div id="alert-danger-placeholder"> </div>


        <div class="container"  style="width: 75%;/* border: 1px solid #f5f5f5; */box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);border-radius: 20px;">

        <!-- title -->
        <div class="title d-flex justify-content-center my-3">
            <h1 class="title">Add New Employee</h1>
        </div>

        

        <form class="form needs-validation" novalidate action="saveEmployee" method="post" modelAttribute="newEmployee" id="form">

            <div>
                <small>All fields marked with * are required</small>
            </div>

            <!-- firstname, lastname -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>First Name *</label>
                    <input id="firstName" name="firstName" class="form-control" required >
                    <div class="invalid-feedback" id="firstName-invalid-feedback">Please enter First Name</div>
                    <!-- <div class="valid-feedback">Looks Good</div> -->
                </div>
                <div class="form-group col-md-6">
                    <label>Last Name *</label>
                    <input id="lastName" name="lastName" class="form-control" required >
                    <div class="invalid-feedback" id="lastName-invalid-feedback">Please enter Last Name</div>
                    <!-- <div class="valid-feedback">Looks Good</div> -->
                </div>
            </div>

            <!-- age , sex -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Age</label>
                    <input id="age" name="age" class="form-control" >
                </div>
                <div class="form-group col-md-6">
                    <label>Sex</label>
                    <select id="sex" name="sex" class="form-control">
                        <option value="" selected disabled>Choose</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
            </div>            
                
            <!-- id -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Identity Proof Choice *</label>
                    <select id="identity" name="identity" class="form-control" onblur="setIdentityProofLabel()" required>
                            <option selected disabled value="">Select</option>
                            <option value="PAN">PAN</option>
                            <option value="AADHAR">AADHAR</option>
                            <option value="PASSPORT">PASSPORT</option>
                    </select>
                    <div class="invalid-feedback" id="id-invalid-feedback">Please enter Identity Proof Choice</div>
                    <!-- <div class="valid-feedback">Looks Good</div> -->
                </div>
                <div class="form-group col-md-6">
                    <label id="identityProofLabel">Choose Identity</label>
                    <input id="identityProof" name="identityProof" class="form-control" onblur="verifyLength()" required >
                    <div class="invalid-feedback" id="idProof-invalid-feedback">
                        Please enter valid Identity Proof. <br><small>Length should be greater than 9 characters.</small>
                    </div>
                </div>
            </div>

            <!-- mobile number, religion, email id -->
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Mobile Number</label>
                    <input id="mobileNumber" name="mobileNumber" class="form-control" >
                </div>
                <div class="form-group col-md-4">
                    <label>Religion</label>
                    <select id="religion" name="religion" class="form-control">
                        <option selected disabled value="">Select</option>
                        <option value="Hinduism">Hinduism</option>
                        <option value="Christianity">Christianity</option>
                        <option value="Islam">Islam</option>
                        <option value="Sikhism">Sikhism</option>
                        <option value="Buddhism">Buddhism</option>
                        <option value="Jainism">Jainism</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Email Id</label>
                    <input id="emailId" name="emailId" class="form-control" type="email">
                </div>
            </div>

            <div class="accordion" id="accordionExample" style="visibility: hidden !important;">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="heading">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse" aria-expanded="true" aria-controls="collapse">
                      Accordion Item #1
                    </button>
                  </h2>
                  <div id="collapse" class="accordion-collapse collapse show" aria-labelledby="heading" data-bs-parent="#accordionExample">
                  </div>
                </div>
            </div>

            <!-- Temporary address accordian -->
            <div class="accordion" id="temp_address_accordian" style="margin-top: -4rem !important;">
                <div class="accordion-item">
                    <h1 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accordian_body" aria-expanded="true" aria-controls="accordian_body">
                            Temporary Address
                        </button>
                    </h1>
                    <div id="accordian_body" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#temp_address_accordian">
                        <div class="accordion-body container" style="width: 100%;">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Plot No.</label>
                                    <input id="plotNo" name="tempAddress.plotNo" class="form-control" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Locality</label>
                                    <input id="locality" name="tempAddress.locality" class="form-control" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>City</label>
                                    <input id="city" name="tempAddress.city" class="form-control" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>State</label>
                                    <input id="state" name="tempAddress.state" class="form-control" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Country</label>
                                    <input id="country" name="tempAddress.country" class="form-control" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Pincode</label>
                                    <input id="pincode" name="tempAddress.pincode" class="form-control" onblur="verifyLength()" required>
                                    <div class="invalid-feedback" id="tempPinCode-invalid-feedback">
                                        Please enter pincode <br><small>Length should be equal to 6 characters.</small>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- Permanent address accordian -->
            <div class="accordion" id="address_accordian">
                <div class="accordion-item">
                    <h1 class="accordion-header" id="headingOne_perm">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accordian_body_perm" aria-expanded="true" aria-controls="accordian_body_perm">
                            Permanent Address
                        </button>
                    </h1>
                    <div id="accordian_body_perm" class="accordion-collapse collapse" aria-labelledby="headingOne_perm" data-bs-parent="#address_accordian">
                        <div class="accordion-body container" style="width: 100%;">
                            
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="checkbox" onchange="putAddress(this)">
                                <label class="form-check-label" for="checkbox">
                                    Same as Temporary Address
                                </label>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Plot No.</label>
                                    <input id="plotNo_perm" name="permAddress.plotNo" class="form-control" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Locality</label>
                                    <input id="locality_perm" name="permAddress.locality" class="form-control" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>City</label>
                                    <input id="city_perm" name="permAddress.city" class="form-control" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>State</label>
                                    <input id="state_perm" name="permAddress.state" class="form-control" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Country</label>
                                    <input id="country_perm" name="permAddress.country" class="form-control" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Pincode</label>
                                    <input id="pincode_perm" name="permAddress.pincode" class="form-control" onblur="verifyLength()" required >
                                    <div class="invalid-feedback" id="permanentPinCode-invalid-feedback">Please enter pincode <br><small>Length should be equal to 6 characters.</small></div>
                                    <!-- <div class="valid-feedback">Looks Good</div> -->
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

            

            <!-- family members accordian -->
            <div class="accordion" id="family_accordian" style="border: 1px solid #eee;">
                <div class="accordion-item">
                    <!-- header -->
                    <h1 class="accordion-header d-flex justify-content-between" id="headingOne_family">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accordian_body_family" aria-expanded="true" aria-controls="accordian_body_family">
                            
                            Add Family Members

                            <div class="buttons d-flex">
                                <button class="btn btn-success add-button" type="button" onclick="addFamilyMember()"> + </button>
                                <button class="btn btn-danger remove-button" type="button" onclick="removeFamilyMember()"> - </button>
                            </div>
                        </button>
                    </h1>

                    <!-- body -->
                    <div id="accordian_body_family" class="accordion-collapse collapse" aria-labelledby="headingOne_family" data-bs-parent="#family_accordian">
                        <div class="accordion-body container" style="width: 100%;" >
                            <div id="member_container_card_body"></div>                           
                        </div>
                    </div>
                </div>
            </div>              

            <!-- terms and conditions -->
            <div class="form-row d-flex justify-content-center" style="margin-top: 2rem;">
                <input class="form-check-input" type="checkbox" value="" id="terms" style="margin-right: 1rem;" required>
                <label class="form-check-label" for="terms">
                    Agree to terms and conditions
                </label>
                <div class="invalid-feedback" id="terms-invalid-feedback">Please agree to terms and conditions</div>
            </div>

            <!-- buttons -->
            <div class="d-flex justify-content-center mt-3">
                <input class="btn btn-success" type="submit" style="padding: 1rem 3rem; margin: 1rem;">
                <a class="btn btn-danger" href="./" style="padding: 1rem 3rem; margin: 1rem;">Cancel</a>
                <input class="btn btn-secondary" type="reset" value="Clear" style="padding: 1rem 3rem; margin: 1rem;">
            </div>
            
           
        </form>

        </div>

        

        <script type="text/javascript">

            window.onload = (event) => {

                var duplicateEmployeeExists = "${duplicateEmployeeExists}";
                console.log("duplicate exists = " + duplicateEmployeeExists);
                if(duplicateEmployeeExists == "true"){
                    fillFields();
                    showDuplicateAlert();                   
                }

                var employeeAdded = "${employeeAdded}";
                console.log("employee added = " + employeeAdded);
                if(employeeAdded == "true"){
                    showSuccessAlert();                
                }
            };

            function fillFields(){
                document.getElementById('firstName').value = "${duplicateEmployee.firstName}";
                document.getElementById('lastName').value = "${duplicateEmployee.lastName}";
                document.getElementById('age').value = "${duplicateEmployee.age}";

                // sex
                var sex = "${duplicateEmployee.sex}";
                if(sex == 'Male')
                    document.getElementById('sex').selectedIndex = 1;
                else if(sex == 'Female')
                    document.getElementById('sex').selectedIndex = 2;
                else
                    document.getElementById('sex').selectedIndex = 3;

                // id
                var identity = "${duplicateEmployee.identity}";
                if(identity == 'PAN')
                    document.getElementById('identity').selectedIndex = 1;
                else if(identity == 'AADHAR')
                    document.getElementById('identity').selectedIndex = 2;
                else
                    document.getElementById('identity').selectedIndex = 3;

                // document.getElementById('identityProof').value = "${duplicateEmployee.identityProof}";
                document.getElementById('mobileNumber').value = "${duplicateEmployee.mobileNumber}";
                
                // religion
                var religion = "${duplicateEmployee.religion}";
                console.log(religion);
                if(religion == 'Hinduism')
                    document.getElementById('religion').selectedIndex = 1;
                else if(religion == 'Christianity')
                    document.getElementById('religion').selectedIndex = 2;
                else if(religion == 'Islam')
                    document.getElementById('religion').selectedIndex = 3;
                else if(religion == 'Sikhism')
                    document.getElementById('religion').selectedIndex = 4;
                else if(religion == 'Buddhism')
                    document.getElementById('religion').selectedIndex = 5; 
                else if(religion == 'Jainism')
                    document.getElementById('religion').selectedIndex = 6;
                else
                    document.getElementById('religion').selectedIndex = 7;
                

                document.getElementById('emailId').value = "${duplicateEmployee.emailId}";

                document.getElementById('plotNo').value = "${duplicateEmployee.tempAddress.plotNo}";
                document.getElementById('locality').value = "${duplicateEmployee.tempAddress.locality}";
                document.getElementById('city').value = "${duplicateEmployee.tempAddress.city}";
                document.getElementById('state').value = "${duplicateEmployee.tempAddress.state}";
                document.getElementById('country').value = "${duplicateEmployee.tempAddress.country}";
                document.getElementById('pincode').value = "${duplicateEmployee.tempAddress.pincode}";

                document.getElementById('pincode_perm').value = "${duplicateEmployee.permAddress.pincode}";
                document.getElementById('plotNo_perm').value = "${duplicateEmployee.permAddress.plotNo}";
                document.getElementById('locality_perm').value = "${duplicateEmployee.permAddress.locality}";
                document.getElementById('city_perm').value = "${duplicateEmployee.permAddress.city}";
                document.getElementById('state_perm').value = "${duplicateEmployee.permAddress.state}";
                document.getElementById('country_perm').value = "${duplicateEmployee.permAddress.country}";
                document.getElementById('pincode_perm').value = "${duplicateEmployee.permAddress.pincode}";

                // <c:forEach items="${duplicateEmployee.familyMembers}" var="member">
                //     addFamilyMember();
                //     console.log("${member.firstName}");


                // </c:forEach>

            }

            function showDuplicateAlert(){
                console.log("---- duplicate alert -----");

                var idType = "${duplicateEmployee.identity}";
                var id = "${duplicateEmployee.identityProof}";
                    
                var alertBox = document.getElementById("alert-duplicate");
                console.log("alert box - " + alertBox);
                alertBox.classList.remove("hide");

                var alertBoxP = document.getElementById("alert-duplicate-p");    
                alertBoxP.innerHTML = "Employee already exists. " + idType + " - " + id;

                setTimeout(() => {alertBox.classList.add('hide')}, 2000);
            }

            function showSuccessAlert(){
                console.log("---- success alert -----");
                var alertBoxDanger = document.getElementById('alert-danger');
                alertBoxDanger.classList.add('hide');

                var alertBox = document.getElementById('alert-success');
                alertBox.classList.remove('hide');

                setTimeout(() => {window.location = "./"}, 1000);
            }

            function setIdentityProofLabel(){
                    var idChosen = document.getElementById("identity");
                    var identityProofLabel = document.getElementById("identityProofLabel");
                
                    identityProofLabel.innerHTML = idChosen.value + " *";
                }

            var family_member_counter = -1;

            function addFamilyMember(){
                console.log("add family mmeber ()");

                family_member_counter += 1;



                var html = `
                            <div class="container family-box" style="width: 100%;padding: 1rem; margin-bottom:1rem;">
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label>First Name</label>
                                        <input id="family-member-first-name-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].firstName" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Last Name</label>
                                        <input id="family-member-last-name-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].lastName" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Age</label>
                                        <input id="family-member-age-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].age" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Relation</label>
                                        <select id="family-member-relation-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].relation" class="form-control">
                                            <option selected disabled value="">Select</option>
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
                            </div>
                `;


                $(document).ready(function() { 
                    $('#member_container_card_body').append(html);
                });
            }

            function removeFamilyMember(){
                family_member_counter -= 1;
                var family_boxes = document.getElementsByClassName('family-box');
                var num = family_boxes.length;
                if(num > 0){
                    // var card_body = document.getElementById('member_container_card_body');
                    // card_body.removeChild(family_boxes[num-1]); 
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

            function verifyLength(){
                var id = document.getElementById('identityProof');
                var pincode = document.getElementById('pincode');
                var pincode_perm = document.getElementById('pincode_perm');
                
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

                if(pincode.value.length != 6){
                    pincode.value = "";
                    pincode.classList.add("is-invalid");
                }
                else{
                    if(pincode.classList.contains("is-invalid")){
                        pincode.classList.remove("is-invalid");
                    }
                    pincode.classList.add("is-valid");
                }

                if(pincode_perm.value.length != 6){
                    pincode_perm.value = "";
                    pincode_perm.classList.add("is-invalid");
                }
                else{
                    if(pincode_perm.classList.contains("is-invalid")){
                        pincode_perm.classList.remove("is-invalid");
                    }
                    pincode_perm.classList.add("is-valid");
                }
            }

            function validation(){
                    var firstName = document.getElementById('firstName').value;
                    var lastName = document.getElementById('lastName').value;
                    var id = document.getElementById('identity').value;
                    var idProof = document.getElementById('identityProof').value;
                    var tempPinCode = document.getElementById('pincode').value;
                    var permanentPinCode = document.getElementById('pincode_perm').value;
                    var terms = document.getElementById('terms');

                    var invalidFields = [];

                    if(firstName.length < 3){
                        invalidFields.push('First Name ');
                    }
                    
                    if(lastName.length < 3){
                        invalidFields.push('Last Name ');
                    }
                    
                    if(idProof.length < 9){
                        document.getElementById('identityProof').classList.add("is-invalid");
                        invalidFields.push('Identity Proof ');
                         
                    }
                    
                    if(tempPinCode.length < 6){
                        document.getElementById('pincode').classList.add("is-invalid");
                        invalidFields.push('Temporary Address - PinCode ');
                    }
                    
                    if(permanentPinCode.length < 6){
                        document.getElementById('pincode_perm').classList.add("is-invalid");
                        invalidFields.push('Permanent Address - PinCode ');
                    }
                    
                    if(terms.checked == false)
                        invalidFields.push('Agree to terms and conditions');
                    

                    console.log("invalid fields - " + invalidFields);


                    if(invalidFields.length != 0){
                    // invalid fields are present
                        // event.preventDefault();
                        // event.stopPropagation();

                        console.log('!! invalid list length != 0');

                        var alertBox = document.getElementById('alert-danger');
                        if(alertBox != null){
                            alertBox.classList.remove('hide');
                            var alertBoxP = document.getElementById('alert-danger-p');
                            alertBoxP.innerHTML = 'Please fill the required fields: ' + invalidFields;
                            setTimeout(() => {alertBox.classList.add('hide')}, 8000);
                        }
                        else{
                            var alert_danger = document.getElementById('alert-danger-placeholder');
                            
                            var div = document.createElement("div");
                            div.classList.add("alert");
                            div.classList.add("alert-danger");
                            div.classList.add("hide");
                            div.classList.add("alert-dismissible");
                            div.setAttribute("id", "alert-danger");
                            div.setAttribute("role", "alert");

                            var p = document.createElement("p");
                            p.setAttribute("id", "alert-danger-p");
                            p.innerText = "Please fill the required fields"

                            var button = document.createElement("button");
                            button.classList.add(["btn-close"]);
                            button.setAttribute("type", "button");
                            button.setAttribute("data-bs-dismiss", "alert");
                            button.setAttribute("aria-label", "Close");

                            div.appendChild(p);
                            div.appendChild(button);

                            alert_danger.appendChild(div);
                        }
                    
                    }
                    else{
                        var alertBox = document.getElementById('alert-success');
                        alertBox.classList.remove('hide');
                    }
                // })
            }

            (function () {
                'use strict'

                var forms = document.querySelectorAll('.needs-validation')

                Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                    form.addEventListener(
                        'submit', 
                        function (event) {
                            if (!form.checkValidity()) {

                                console.log("calling validation()");
                                validation();

                                event.preventDefault();
                                event.stopPropagation();
                                // alert('Please fill the required fields.')
                            }
                            else{

                                // var alertBoxDanger = document.getElementById('alert-danger');
                                // alertBoxDanger.classList.add('hide');

                                // var alertBox = document.getElementById('alert-success');
                                // alertBox.classList.remove('hide');

                                // alert('Employee added successfully !');
                            }

                            form.classList.add('was-validated')
                        },
                        false
                    )
                })
            })()


        </script>

        </div>
    </body>
</html>

