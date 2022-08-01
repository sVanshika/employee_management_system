package base.model;

import java.security.PublicKey;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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

    private double emiAmount;

    private static final DecimalFormat df = new DecimalFormat("0.00");


    @OneToOne(mappedBy = "loan")
    private Employee employee;

    @ElementCollection
    @CollectionTable(name = "emi", joinColumns = @JoinColumn(name = "loanid"))
    private List<EMI> repaymentSchedule = new ArrayList<>();

    public LoanAgreement() {
    }

    public double getEmiAmount() {
        return emiAmount;
    }

    public void calculateEMI(){
        double effectiveRate = rate/(100*repaymentFrequency);
        double num = tenure*repaymentFrequency;

        double numerator = loanAmountAsked * effectiveRate;
        double denominator = 1 - Math.pow( (1 + effectiveRate), (-num));

        double emi = numerator/denominator;

        emi = Double.parseDouble(df.format(emi));

        setEmiAmount(emi);
    }

    public void generateRS(){
        double effectiveRate = rate/(100*repaymentFrequency);
        double num = tenure*repaymentFrequency;

        // System.out.println("effective rate = " + effectiveRate);
        // System.out.println("num installments = " + num);

        double beginningAmount = loanAmountAsked;
        double installment = emiAmount;
        double interestPaid = 0;
        double principalPaid = 0;
        double endingAmount = loanAmountAsked;

        for(int month=1; month<=num; month++){
            // System.out.println("month = " + month);

            beginningAmount = endingAmount;
            interestPaid = beginningAmount * effectiveRate;
            principalPaid = installment - interestPaid;
            endingAmount = beginningAmount - principalPaid;

            beginningAmount = Double.parseDouble(df.format(beginningAmount));
            interestPaid = Double.parseDouble(df.format(interestPaid));
            principalPaid = Double.parseDouble(df.format(principalPaid));
            endingAmount = Double.parseDouble(df.format(endingAmount));

            EMI emi = new EMI();
            emi.setMonth(month);
            emi.setBeginningAmount(beginningAmount);
            emi.setInstallment(installment);
            emi.setInterestPaid(interestPaid);
            emi.setPrincipalPaid(principalPaid);

            if(month == num)
                emi.setEndingAmount(0);
            else
                emi.setEndingAmount(endingAmount);

            repaymentSchedule.add(emi);

            // System.out.println(emi);
        }
    }

    public List<EMI> getRepaymentSchedule() {
        return repaymentSchedule;
    }

    public void setRepaymentSchedule(List<EMI> repaymentSchedule) {
        this.repaymentSchedule = repaymentSchedule;
    }

    public void setEmiAmount(double emiAmount) {
        this.emiAmount = emiAmount;
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
