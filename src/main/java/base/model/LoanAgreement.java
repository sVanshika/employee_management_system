package base.model;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.ManyToAny;

@Entity
// @Embeddable
public class LoanAgreement {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="loan_seq_gen")
    @SequenceGenerator(name="loan_seq_gen", initialValue = 101, allocationSize = 1)
    private int loanid;


    // @ManyToOne
    // @JoinColumn(name = "employeeid")
    // private int employeeid;

    // employee financial details
    private double loanAmountAsked;
    private double monthlyIncome;
    private double totalMonthlyExpense;
    private double maxEligibleEmi;
    private double maxEligibleLoanAmount;
    private double dbr;

    // loan details
    private double rate;
    private double tenure;
    private double repaymentFrequency;

    private boolean approved;
    private String reason; 

    @OneToOne(mappedBy = "loan")
    private Employee employee;

    public LoanAgreement() {
    }

   public int getLoanid() {
       return loanid;
   }

   public void setLoanid(int loanid) {
       this.loanid = loanid;
   }

    public double getLoanAmountAsked() {
        return loanAmountAsked;
    }

    public void setLoanAmountAsked(double loanAmountAsked) {
        this.loanAmountAsked = loanAmountAsked;
    }

    public double getMonthlyIncome() {
        return monthlyIncome;
    }

    public void setMonthlyIncome(double monthlyIncome) {
        this.monthlyIncome = monthlyIncome;
    }

    public double getTotalMonthlyExpense() {
        return totalMonthlyExpense;
    }

    public void setTotalMonthlyExpense(double totalMonthlyExpense) {
        this.totalMonthlyExpense = totalMonthlyExpense;
    }

    public double getMaxEligibleEmi() {
        return maxEligibleEmi;
    }

    public void setMaxEligibleEmi(double maxEligibleEmi) {
        this.maxEligibleEmi = maxEligibleEmi;
    }

    public double getMaxEligibleLoanAmount() {
        return maxEligibleLoanAmount;
    }

    public void setMaxEligibleLoanAmount(double maxEligibleLoanAmount) {
        this.maxEligibleLoanAmount = maxEligibleLoanAmount;
    }

    public double getDbr() {
        return dbr;
    }

    public void setDbr(double dbr) {
        this.dbr = dbr;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getTenure() {
        return tenure;
    }

    public void setTenure(double tenure) {
        this.tenure = tenure;
    }

    public double getRepaymentFrequency() {
        return repaymentFrequency;
    }

    public void setRepaymentFrequency(double repaymentFrequency) {
        this.repaymentFrequency = repaymentFrequency;
    }

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

//    public int getEmployeeid() {
//        return employeeid;
//    }
//
//    public void setEmployeeid(int employeeid) {
//        this.employeeid = employeeid;
//    }


    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String  toString() {
        return "LoanAgreement{" +
                "loanid=" + loanid +
                ", empoyeeid=" + "employeeid" +
                ", loanAmountAsked=" + loanAmountAsked +
                ", monthlyIncome=" + monthlyIncome +
                ", totalMonthlyExpense=" + totalMonthlyExpense +
                ", maxEligibleEmi=" + maxEligibleEmi +
                ", maxEligibleLoanAmount=" + maxEligibleLoanAmount +
                ", dbr=" + dbr +
                ", rate=" + rate +
                ", tenure=" + tenure +
                ", repaymentFrequency=" + repaymentFrequency +
                ", approved=" + approved +
                ", reason='" + reason + '\'' +
                '}';
    }
}
