package base.service;

import base.dao.EmployeeDao;
import base.model.Employee;
import base.model.Identity;
import base.model.LoanAgreement;
import base.model.LoanAgreement2;

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
    public Employee getById(Identity idType, String id) {
        System.out.println("======= employee service impl - get by id ========");
        return employeeDao.getById(idType, id);
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

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void update(Employee employee){
        System.out.println("=========== employee service impl - update employee ==========");
        employeeDao.update(employee);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Employee getByEmpId(int id) {
        // TODO Auto-generated method stub
        System.out.println("========= employee service get by emp id ===========");
        return employeeDao.getByEmpId(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(Employee employee){
        System.out.println("=========== employee service delete =========");
        employeeDao.delete(employee);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void save(LoanAgreement loan) {
        // TODO Auto-generated method stub
        System.out.println("========== emp service save loan =============");
        employeeDao.save(loan);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void save(LoanAgreement2 loan) {
        // TODO Auto-generated method stub
        System.out.println("========== emp service save loan2 =============");
        employeeDao.save(loan);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public LoanAgreement2 getLoan2ById(int loanid){
        System.out.println("====== emp service get loan by id ======");
        return employeeDao.getLoan2ById(loanid);
    }
}
