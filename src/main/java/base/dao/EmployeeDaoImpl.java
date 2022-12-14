package base.dao;

import base.model.Employee;
import base.model.Identity;
import base.model.LoanAgreement;
import base.model.LoanAgreement2;

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
        System.out.println("======= employee dao impl - get by id and id proof ========");

        String hql = "FROM Employee E WHERE E.identity=:idType AND E.identityProof=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        query.setParameter("idType", idType);
        query.setParameter("id", id);

        List<Employee> employees = query.list();
        if(employees.size() == 0)
            return null;
            
        Employee employee = employees.get(0);

        employee.getEmployeeId();
        // employee.getTempAddress();
        // employee.getPermAddress();
        // employee.getLoan();

        // employee.getFamilyMembers();

        try {
            employee.getLoan2().get(0).getDbr();
            employee.getLoan2().get(0).getRepaymentSchedule().get(0).getEndingAmount();
        }
        catch (Exception e) {
            System.out.println("== emp dao impl - loan 2 repay sch = null ==");
            try {
                employee.getLoan2();
            } catch (Exception er) {
                //TODO: handle exception
                employee.getLoan2();
            }
       }

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
        
        employee.getEmployeeId();

       employee.getAge();
       employee.getFamilyMembers();

       try {
            employee.getLoan().getRepaymentSchedule().size();
       } catch (NullPointerException e) {
        //TODO: handle exception
            System.out.println("== emp dao impl - loan repay sch = null ==");
            try {
                employee.getLoan().getDbr();
            } catch (NullPointerException er) {
                //TODO: handle exception
                employee.getLoan();
            }
       }

        try{
            employee.getLoan2().get(0).getDbr();
        }
        catch(Exception e){
            employee.getLoan2();
        }
       
        
        return employee;
    }

    @Override
    public void delete(Employee employee) {
        // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().delete(employee);
        
    }

    @Override
    public void save(LoanAgreement loan) {
        // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().save(loan);
    }

    @Override
    public void save(LoanAgreement2 loan) {
        // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().save(loan);
    }

    @Override
    public LoanAgreement2 getLoan2ById(int loanid){
        System.out.println("==== emp dao get loan by id ====");
        LoanAgreement2 loan = sessionFactory.getCurrentSession().load(LoanAgreement2.class, loanid);

        loan.getDbr();

        System.out.println(loan);

        return loan;
    }
}
