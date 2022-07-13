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
    public String saveEmployee(@ModelAttribute("newEmployee") Employee newEmployee, BindingResult bindingResult){
        System.out.println("======== save employee ========");

        if(bindingResult.hasErrors()){
            System.out.println("!!! binding result has errors");
            List<FieldError> errors = bindingResult.getFieldErrors();
            for(FieldError err: errors){
                System.out.println(err);
            }
        }

        System.out.println("!!!!!!!!!!! " + newEmployee);

        employeeService.save(newEmployee);

        
        return "redirect:/ ";

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

    // @GetMapping("/showEmployee")
    // public void getShowEmployee(){
    //     searchEmployee();
    // }

    @PostMapping("/showEmployee")
    public String showEmployee(@ModelAttribute("employeeToSearch") Employee employeeToSearch, Model dataModel){
        String fName = employeeToSearch.getFirstName();
        String lName = employeeToSearch.getLastName();
        String identityProof = employeeToSearch.getIdentityProof();

        Employee employee = employeeService.getByDetails(fName, lName, identityProof);

        System.out.println("!!!!!!!!! employee" + employee);

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
