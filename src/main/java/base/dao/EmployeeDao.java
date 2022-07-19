package base.dao;

import base.model.Employee;
import java.util.List;

public interface EmployeeDao {
    Employee getById(String id);
    void save(Employee employee);
    List<Employee> getAll();
    Employee getByDetails(String firstName, String lastName, String identityProof, String email);
    Employee duplicateEmployee(Employee employee);
}
