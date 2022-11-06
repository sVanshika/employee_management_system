package base.model;

import javax.persistence.Embeddable;

@Embeddable
public class EMI2{
    private int month;
    private double beginningAmount;
    private double installment;
    private double interestPaid;
    private double principalPaid;
    private double endingAmount;

    public EMI2(){}

    @Override
    public String toString() {
        return "EMI2{" +
                "beginningAmount=" + beginningAmount +
                ", installment=" + installment +
                ", interestPaid=" + interestPaid +
                ", principalPaid=" + principalPaid +
                ", endingAmount=" + endingAmount +
                '}';
    }

    public void setMonth(int month){
        this.month = month;
    }

    public int getMonth(){
        return month;
    }

    public double getBeginningAmount() {
        return beginningAmount;
    }

    public void setBeginningAmount(double beginningAmount) {
        this.beginningAmount = beginningAmount;
    }

    public double getInstallment() {
        return installment;
    }

    public void setInstallment(double installment) {
        this.installment = installment;
    }

    public double getInterestPaid() {
        return interestPaid;
    }

    public void setInterestPaid(double interestPaid) {
        this.interestPaid = interestPaid;
    }

    public double getPrincipalPaid() {
        return principalPaid;
    }

    public void setPrincipalPaid(double principalPaid) {
        this.principalPaid = principalPaid;
    }

    public double getEndingAmount() {
        return endingAmount;
    }

    public void setEndingAmount(double endingAmount) {
        this.endingAmount = endingAmount;
    }
}