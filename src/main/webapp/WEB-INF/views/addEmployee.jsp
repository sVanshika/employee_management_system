<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        </style>

        <script>
            function setIdentityProofLabel(){
                var idChosen = document.getElementById("identity");
                var identityProofLabel = document.getElementById("identityProofLabel");
            
                identityProofLabel.innerHTML = idChosen.value + " *";
            }

            
            
   
        </script>


    </head>
    <body>
        <div style="background-color:#f5f5f5; padding:0.5rem 2rem; margin-bottom:3rem">
            <h3>NSEL EMPLOYEES</h3>
        </div>

        <div class="alert alert-success alert-dismissible hide" id="alert-success" role="alert">
            <p>Employee Saved Successfully</p>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <div class="alert alert-danger alert-dismissible hide" id="alert-danger" role="alert">
            <p id="alert-danger-p">Please fill the required fields</p>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
        </div>

        <div id="alert-sucess-placeholder"></div>
        <div id="alert-danger-placeholder"> </div>


        <div class="container"  style="width: 50%;/* border: 1px solid #f5f5f5; */box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);border-radius: 20px;">

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
                    <input id="identityProof" name="identityProof" class="form-control" required >
                    <div class="invalid-feedback" id="idProof-invalid-feedback">Please enter Identity Proof</div>
                    <!-- <div class="valid-feedback">Looks Good</div> -->
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
                    <input id="religion" name="religion" class="form-control" >
                </div>
                <div class="form-group col-md-4">
                    <label>Email Id</label>
                    <input id="emailId" name="emailId" class="form-control" type="email">
                </div>
            </div>

            <!-- temporary and permanent accordian -->
            <div class="accordion" id="accordionAddress">
                <div class="card">
                
                    <div class="card-header" id="temporaryAddress">
                        <button class="btn mb-0" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                Temporary Address
                        </button>                          
                    </div>
              
                    <div id="collapseOne" class="collapse" aria-labelledby="temporaryAddress" data-parent="#accordionAddress">
                        <div class="card-body">
                            
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
                                    <input id="pincode" name="tempAddress.pincode" class="form-control" required>
                                    <div class="invalid-feedback" id="tempPinCode-invalid-feedback">Please enter pincode</div>
                                    <!-- <div class="valid-feedback">Looks Good</div> -->

                                </div>
                            </div>

                        </div>
                    </div>
                    
                </div>
                
                <div class="card">
                
                    <div class="card-header" id="permanentAddress">
                        <button class="btn mb-0" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Permanent Address
                        </button>                          
                    </div>
              
                    <div id="collapseTwo" class="collapse" aria-labelledby="permanentAddress" data-parent="#accordionAddress">
                        <div class="card-body">
                            
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
                                    <input id="pincode_perm" name="permAddress.pincode" class="form-control" required >
                                    <div class="invalid-feedback" id="permanentPinCode-invalid-feedback">Please enter pincode</div>
                                    <!-- <div class="valid-feedback">Looks Good</div> -->
                                </div>
                            </div>

                        </div>
                    </div>
                    
                </div>
            
            </div> 
            
            <!-- family members accordian -->
            <div class="accordion" id="accordionFamily">
                <div class="card">
                
                    <div class="card-header" id="familyMembers">
                        <button class="btn mb-0" type="button" data-toggle="collapse" data-target="#collapseOneFamily" aria-expanded="false" aria-controls="collapseOneFamily">
                                Add Family Members
                        </button>                          
                    </div>
              
                    <div id="collapseOneFamily" class="collapse" aria-labelledby="familyMembers" data-parent="#accordionFamily">
                        
                        <div class="container" style="width: 100%;">
                        <button class="btn btn-warning" type="button" onclick="addFamilyMember()">
                            Add +
                        </button>

                        <div class="card-body" id="member_container_card_body"> 
                            <div class="container" style="width: 100%;border: 1px solid lightgrey;border-radius: 1rem;padding: 1rem; margin-bottom:1rem;">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>First Name</label>
                                        <input id="family-member-first-name" name="familyMembers[0].firstName" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Last Name</label>
                                        <input id="family-member-last-name" name="familyMembers[0].lastName" class="form-control" >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Age</label>
                                        <input id="family-member-age" name="familyMembers[0].age" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Relation</label>
                                        <input id="family-member-relation" name="familyMembers[0].relation" class="form-control" >
                                    </div>
                                </div>
                            </div>
                        </div>

                        </div>

                        
                    </div>
                    
                </div>
                
                
            
            </div>  

            <!-- terms and conditions -->
            <div class="form-row">
                <input class="form-check-input" type="checkbox" value="" id="terms" required>
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

        

        <script type="text/javascript">

            var family_member_counter = 0;

            function addFamilyMember(){
                console.log("add family mmeber ()");

                family_member_counter += 1;

                var html = `
                <div class="container" style="width: 100%;border: 1px solid lightgrey;border-radius: 1rem;padding: 1rem; margin-bottom:1rem;">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>First Name</label>
                                        <input id="family-member-first-name" name="familyMembers[` + family_member_counter + `].firstName" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Last Name</label>
                                        <input id="family-member-last-name" name="familyMembers[` + family_member_counter + `].lastName" class="form-control" >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Age</label>
                                        <input id="family-member-age" name="familyMembers[` + family_member_counter + `].age" class="form-control" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Relation</label>
                                        <input id="family-member-relation" name="familyMembers[` + family_member_counter + `].relation" class="form-control" >
                                    </div>
                                </div>
                            </div>
                `;

                // var member_container = document.getElementById('member_container_card_body');
                // member_container.append(html);

                $(document).ready(function() {

                $('#member_container_card_body').append(html);
                });
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

            function validation(){
                    var firstName = document.getElementById('firstName').value;
                    var lastName = document.getElementById('lastName').value;
                    var id = document.getElementById('identity').value;
                    var idProof = document.getElementById('identityProof').value;
                    var tempPinCode = document.getElementById('pincode').value;
                    var permanentPinCode = document.getElementById('pincode_perm').value;
                    var terms = document.getElementById('terms');

                    var invalidFields = [];

                    if(firstName.length < 3)
                        invalidFields.push('First Name ');
                    
                    if(lastName.length < 3)
                        invalidFields.push('Last Name ');
                    
                    if(idProof.length == 0)
                        invalidFields.push('Identity Proof ');
                    
                    if(tempPinCode.length == 0)
                        invalidFields.push('Temporary Address - PinCode ');
                    
                    if(permanentPinCode.length == 0)
                        invalidFields.push('Permanent Address - PinCode ');
                    
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

                            var string = "";
                            invalidFields.forEach((s) => {
                                string = string.concat([s + " "]);
                            });
                            

                            alertBoxP.innerHTML = 'Please fill the required fields: ' + invalidFields;
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

        //                     <div class="alert alert-danger alert-dismissible hide" id="alert-danger" role="alert">
        //     <p id="alert-danger-p">Please fill the required fields</p>
        //     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick=""></button>
        // </div>
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

                                var alertBoxDanger = document.getElementById('alert-danger');
                                alertBoxDanger.classList.add('hide');

                                var alertBox = document.getElementById('alert-success');
                                alertBox.classList.remove('hide');

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

