package base.service;

import base.model.Employee;
import base.model.Identity;
import base.model.LoanAgreement;
import base.model.LoanAgreement2;

import java.util.List;

public interface EmployeeService {
    Employee getByEmpId(int id);
    Employee getById(Identity idType, String id);
    void save(Employee employee);
    List<Employee> getAll();
    Employee getByDetails(String firstName, String lastName, String identityProof, String email);
    Employee duplicateEmployee(Employee employee);
    void update(Employee employee);
    void delete(Employee employee);

    void save(LoanAgreement loan);
    void save(LoanAgreement2 loan);


    LoanAgreement2 getLoan2ById(int loanid);
}
