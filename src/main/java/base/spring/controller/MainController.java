package base.spring.controller;

import base.model.Employee;
import base.model.Identity;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class MainController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/")
    public String home(){
        return "home";
    }

    // -------------------------- add employee -------------------------
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
            dataModel.addAttribute("duplicateEmployee", newEmployee);
        
            return "addEmployee";
            
        }
        else{

            employeeService.save(newEmployee);
            dataModel.addAttribute("employeeAdded", "true");
            return "addEmployee";
        }

    }

    // -------------------------- search employee -------------------------
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

    

    @PostMapping("/searchEmployee")
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

    // -------------------------- update employee -------------------------
    
    @GetMapping("/find")
    public String find(){
        return"find";
    }

    @PostMapping("/findEmployee")
    public String findEmployeeById(@RequestParam("action") String action, String identity, String identityProof, Model dataModel){
        System.out.println("====== find employee controller =====");
        System.out.println("type = " + identity + "\tid = " + identityProof);

        if(identity == "" || identityProof == ""){
            dataModel.addAttribute("employeeExists", "false");
            return "find";
        }
        else{

            Employee employee = employeeService.getById(Identity.valueOf(identity), identityProof);

            System.out.println("employee -> " + employee);

            // employee does not exist
            if(employee == null){
                dataModel.addAttribute("employeeExists", "false");
                return "find";
            }
            // employee exist
            else{
                String path = "";
                System.out.println("--> action = " + action);
                if(action.equals("update")){
                    System.out.println("======== update call =========");
                    path = "redirect:./updateEmployee?employeeid=" + employee.getEmployeeId();
                }
                else if(action.equals("delete")){
                    System.out.println("========= delete call ===============");
                    path = "redirect:./delete?employeeid=" + employee.getEmployeeId();
                }
                return path;
            }
        }

    }

    @GetMapping("/updateEmployee")
    public ModelAndView updateEmployee(@RequestParam("employeeid") int employeeid){
        System.out.println("========== update employee get call ==========");

        System.out.println(employeeid);

        String modelName = "employeeToUpdate";
        String viewName = "updateEmployee";
        Employee employeeToUpdate = employeeService.getByEmpId(employeeid);

        System.out.println("----> " + employeeToUpdate);

        return new ModelAndView(viewName, modelName, employeeToUpdate);
    }

    @PostMapping("/saveUpdatedEmployee")
    public String saveUpdatedEmployee(@ModelAttribute("employeeToUpdate") Employee employeeToUpdate, Model dataModel){
        System.out.println("============ save updated employee ================");
        System.out.println("!! " + employeeToUpdate);

        employeeService.update(employeeToUpdate);

        dataModel.addAttribute("action", "update");
        dataModel.addAttribute("employeeid", employeeToUpdate.getEmployeeId());
      
        
        return "redirect:./";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("employeeid") int id, Model dataModel){

        Employee employee = employeeService.getByEmpId(id);
        dataModel.addAttribute("employee", employee);
        
        return "delete";

    }

    @PostMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("employeeid") int id, Model dataModel){
        System.out.println("============ delete empl ===========");
        System.out.println(id);
        
        Employee employee = employeeService.getByEmpId(id);

        dataModel.addAttribute("action", "delete");
        dataModel.addAttribute("employeeid", employee.getEmployeeId());
    
        employeeService.delete(employee);

        return "redirect:./";
    }

    

}
