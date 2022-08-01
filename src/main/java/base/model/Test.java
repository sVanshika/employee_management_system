package base.model;

public class Test {

    public static void main(String[] args) {
        LoanAgreement loan = new LoanAgreement();

        loan.setLoanAmountAsked(750000);
        loan.setTenure(7);
        loan.setRate(9.10);
        loan.setRepaymentFrequency(12);

        loan.calculateEMI();

        System.out.println("emi = " + loan.getEmiAmount());

        loan.generateRS(); 
    }
    
}
