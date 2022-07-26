package base.dao;

import base.model.Employee;
import base.model.Identity;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Employee getById(Identity idType, String id) {
        System.out.println("======= employee dao impl - get by id ========");

        String hql = "FROM Employee E WHERE E.identity=:idType AND E.identityProof=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        query.setParameter("idType", idType);
        query.setParameter("id", id);

        List<Employee> employees = query.list();
        if(employees.size() == 0)
            return null;
            
        Employee employee = employees.get(0);

        employee.getEmployeeId();
        employee.getTempAddress();
        employee.getPermAddress();
        // employee.getFamilyMembers();

        return employee;
    }

    @Override
    public void save(Employee employee) {
        System.out.println("======= employee dao impl - save ========");
        sessionFactory.getCurrentSession().save(employee);
    }

    @Override
    public List<Employee> getAll() {
        System.out.println("======= employee dao impl - get all ========");
        String hql = "FROM Employee";
        List<Employee> employees = sessionFactory.getCurrentSession().createQuery(hql).list();
        return employees;
    }

    @Override
    public Employee getByDetails(String firstName, String lastName, String identityProof, String email){
        System.out.println("======= employee dao impl - get by details ========");
        
        String hql = "FROM Employee E WHERE UPPER(E.firstName)=:FNAME AND UPPER(E.lastName)=:LNAME AND (E.identityProof=:ID OR E.emailId=:EMAIL)";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        
        query.setParameter("FNAME", firstName.toUpperCase());
        query.setParameter("LNAME", lastName.toUpperCase());
        query.setParameter("ID", identityProof);
        query.setParameter("EMAIL", email);

        List<Employee> employees = query.list();

        if(employees.size() == 0)
            return null;

        Employee emp = employees.get(0);

        emp.getTempAddress();
        emp.getPermAddress();
        emp.getFamilyMembers();

        System.out.println("-------------" + emp);

        return emp;
    }

    @Override
    public Employee duplicateEmployee(Employee employee) {
        // TODO Auto-generated method stub

        String hql = "FROM Employee E WHERE E.identity=:IDNAME AND E.identityProof=:ID";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        
        query.setParameter("IDNAME", employee.getIdentity());
        query.setParameter("ID", employee.getIdentityProof());

        List<Employee> duplicateEmployees = query.list();

        System.out.println("!duplicate => " + duplicateEmployees);
        if(duplicateEmployees.size() == 0){
            return null;
        }

        Employee emp = duplicateEmployees.get(0);
        
        return emp;
    }

    @Override
    public void update(Employee employee) {
        // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().update(employee);
        
    }

    @Override
    public Employee getByEmpId(int id) {
        // TODO Auto-generated method stub
        System.out.println("=========== dao get by emp id =========");
        Employee employee = sessionFactory.getCurrentSession().load(Employee.class, id);
        employee.getAge();
        return employee;
    }

    @Override
    public void delete(Employee employee) {
        // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().delete(employee);
        
    }
}
