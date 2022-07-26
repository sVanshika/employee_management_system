<html>
    <head>
        <title>Success Page</title>
    </head>
    <body>
        <h1>Employee saved</h1>
    </body>
</html>

<!-- <c:forEach begin="1" end="${employeeToUpdate.familyMembers.size()}" var="i">
                                <div class="container family-box" style="width: 100%;padding: 1rem;">
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label>First Name</label>
                                            <form:input path="familyMembers[${i-1}].firstName" class="form-control" />
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Last Name</label>
                                            <form:input path="familyMembers[${i-1}].lastName" class="form-control" />
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Age</label>
                                            <form:input path="familyMembers[${i-1}].age" class="form-control" />
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Relation</label>
                                            <form:select path="familyMembers[${i-1}].relation" class="form-control">
                                                <form:option value="Father">Father</form:option>
                                                <form:option value="Mother">Mother</form:option>
                                                <form:option value="Brother">Brother</form:option>
                                                <form:option value="Sister">Sister</form:option>
                                                <form:option value="Husband">Husband</form:option>
                                                <form:option value="Wife">Wife</form:option>
                                                <form:option value="Grand Father">Grand Father</form:option>
                                                <form:option value="Grand Mother">Grand Mother</form:option>
                                                <form:option value="Uncle">Uncle</form:option>
                                                <form:option value="Aunt">Aunt</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                        </c:forEach> -->



                        // var len = parseInt("${employeeToUpdate.familyMembers.size()}");
                        // console.log("length = " + len);
                    
                        // var family_member_counter;
                        // if(len == 0)
                        //     family_member_counter = -1;
                        // else
                        //     family_member_counter = len;
                             
                    
                        // function addFamilyMember(){
                        //     console.log("add family mmeber ()");
                        //     family_member_counter += 1;
                    
                        //     var html = `
                        //                     <div class="container family-box" style="width: 100%;padding: 1rem; margin-bottom:1rem;">
                        //                         <div class="row">
                        //                             <div class="form-group col-md-3">
                        //                                 <label>First Name</label>
                        //                                 <input path="familyMembers[${family_member_counter-1}].firstName" id="family-member-first-name-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].firstName" class="form-control" >
                        //                             </div>
                        //                             <div class="form-group col-md-3">
                        //                                 <label>Last Name</label>
                        //                                 <input path="familyMembers[${family_member_counter-1}].lastName" id="family-member-last-name-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].lastName" class="form-control" >
                        //                             </div>
                        //                             <div class="form-group col-md-3">
                        //                                 <label>Age</label>
                        //                                 <input path="familyMembers[${family_member_counter-1}].age" id="family-member-age-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].age" class="form-control" >
                        //                             </div>
                        //                             <div class="form-group col-md-3">
                        //                                 <label>Relation</label>
                        //                                 <form:select path="familyMembers[${family_member_counter-1}].relation" id="family-member-relation-`+family_member_counter+`" name="familyMembers[` + family_member_counter + `].relation" class="form-control">
                        //                                     <form:option value="Father">Father</form:option>
                        //                                     <form:option value="Mother">Mother</form:option>
                        //                                     <form:option value="Brother">Brother</form:option>
                        //                                     <form:option value="Sister">Sister</form:option>
                        //                                     <form:option value="Grand Father">Grand Father</form:option>
                        //                                     <form:option value="Grand Mother">Grand Mother</form:option>
                        //                                     <form:option value="Uncle">Uncle</form:option>
                        //                                     <form:option value="Aunt">Aunt</form:option>
                        //                                 </form:select>
                        //                             </div>
                        //                         </div>
                        //                     </div>
                        //     `;
                    
                        //     $(document).ready(function() { 
                        //         $('#member_container_card_body').append(html);
                        //     });
                        // }