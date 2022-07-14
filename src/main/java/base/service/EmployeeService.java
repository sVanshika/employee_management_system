package base.service;

import base.model.Employee;

import java.util.List;

public interface EmployeeService {
    Employee getById(String id);
    void save(Employee employee);
    List<Employee> getAll();
    Employee getByDetails(String firstName, String lastName, String identityProof, String email);

}
