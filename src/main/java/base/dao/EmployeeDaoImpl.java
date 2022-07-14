package base.dao;

import base.model.Employee;
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
    public Employee getById(String id) {
        System.out.println("======= employee dao impl - get by id ========");
        Employee employee = sessionFactory.getCurrentSession().load(Employee.class, id);
        
        employee.getEmployeeId();
        employee.getTempAddress();

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
}
