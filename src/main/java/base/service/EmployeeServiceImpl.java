package base.service;

import base.dao.EmployeeDao;
import base.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class EmployeeServiceImpl implements EmployeeService{
    @Autowired
    private EmployeeDao employeeDao;

    @Override
    @Transactional(propagation =  Propagation.REQUIRED)
    public Employee getById(String id) {
        System.out.println("======= employee service impl - get by id ========");
        return employeeDao.getById(id);
    }

    @Override
    @Transactional(propagation =  Propagation.REQUIRED)
    public void save(Employee employee) {
        System.out.println("======= employee service impl - save ========");
        employeeDao.save(employee);
    }

    @Override
    @Transactional(propagation =  Propagation.REQUIRED)
    public List<Employee> getAll() {
        System.out.println("======= employee service impl - get all ========");
        return employeeDao.getAll();
    }

    @Override
    @Transactional(propagation =  Propagation.REQUIRED)
    public Employee getByDetails(String firstName, String lastName, String identityProof, String email)
    {
        System.out.println("======= employee service impl - get by details ========");
        return employeeDao.getByDetails(firstName, lastName, identityProof, email);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Employee duplicateEmployee(Employee employee) {
        // TODO Auto-generated method stub
        System.out.println("========== employee service impl - duplicate employe ========");
        return employeeDao.duplicateEmployee(employee);
    }
}
