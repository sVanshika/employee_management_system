package base.spring.controller;

import base.model.Employee;
import base.service.EmployeeService;

import java.util.List;

// import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/addEmployee")
    public ModelAndView addEmployee(){
        System.out.println("======== add employee ========");
        String view = "addEmployee";
        String model = "newEmployee";
        Employee employee = new Employee();

        return new ModelAndView(view, model, employee);
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("newEmployee") Employee newEmployee, BindingResult bindingResult, Model dataModel){
        System.out.println("======== save employee ========");

        if(bindingResult.hasErrors()){
            System.out.println("!!! binding result has errors");
            List<FieldError> errors = bindingResult.getFieldErrors();
            for(FieldError err: errors){
                System.out.println(err);
            }
        }

        System.out.println("!!!!!!!!!!! " + newEmployee);

        // =================================
        // check for duplicate
        // =================================

        Employee duplicateEmployee = employeeService.duplicateEmployee(newEmployee);
        if(duplicateEmployee != null){

            System.out.println("!!!! dupli");

            // boolean duplicateEmployeeExists = true;
            dataModel.addAttribute("duplicateEmployeeExists", "true");
            dataModel.addAttribute("duplicateEmployee", duplicateEmployee);
        
            return "addEmployee";
            
        }
        else{

            employeeService.save(newEmployee);
            dataModel.addAttribute("employeeAdded", "true");
            return "addEmployee";
        }

    }

    @GetMapping("/searchEmployee")
    public ModelAndView searchEmployee(Model dataModel){
        System.out.println("========== search employee ==============");

        String model = "employeeToSearch";
        String view = "searchEmployee";
        Employee employee = new Employee();

        dataModel.addAttribute("employeeExist", "true");
        dataModel.addAttribute("errorMessage", "");
        return new ModelAndView(view, model, employee);
    }

    

    @PostMapping("/showEmployee")
    public String showEmployee(@ModelAttribute("employeeToSearch") Employee employeeToSearch, Model dataModel){
        System.out.println("=============show employee===============");
        String fName = employeeToSearch.getFirstName();
        String lName = employeeToSearch.getLastName();
        String identityProof = employeeToSearch.getIdentityProof();
        String email = employeeToSearch.getEmailId();

        System.out.println(fName + " - " + lName + " - " + identityProof + " - " + email);

        Employee employee = employeeService.getByDetails(fName, lName, identityProof, email);

        System.out.println("!!!!!!!!! employee -> " + employee);

        if(employee == null){
            dataModel.addAttribute("employeeExist", "false");
            dataModel.addAttribute("errorMessage", "Employee Does Not Exist!");
            return "searchEmployee";            
        }
        else{

            dataModel.addAttribute("employeeExist", true);
            dataModel.addAttribute("employee", employee);
            dataModel.addAttribute("errorMessage", "null");

            return "showEmployee";
        }
    }


}
