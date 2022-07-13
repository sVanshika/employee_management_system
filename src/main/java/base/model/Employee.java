package base.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

import org.hibernate.criterion.EmptyExpression;
import java.util.List;

@Entity
@Table(name = "nucleus_employee")
public class Employee {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="emp_seq_gen")
    @SequenceGenerator(name="emp_seq_gen", initialValue = 101, allocationSize = 1)
    private int employeeId;

    @NotEmpty(message = "First name can not be empty")
    private String firstName;
    @NotEmpty(message = "First name can not be empty")
    private String lastName;
    private int age;
    private String sex;
    private String religion;
    private Identity identity;
    @NotEmpty(message = "First name can not be empty")
    private String identityProof;

    
    
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "plotNo", column = @Column(name = "temp_plotNo")),
        @AttributeOverride(name = "locality", column = @Column(name = "temp_locality")),
        @AttributeOverride(name = "city", column = @Column(name = "temp_city")),
        @AttributeOverride(name = "state", column = @Column(name = "temp_state")),
        @AttributeOverride(name = "country", column = @Column(name = "temp_country")),
        @AttributeOverride(name = "pincode", column = @Column(name = "temp_pincode"))
    })
    private Address tempAddress;

    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "plotNo", column = @Column(name = "perm_plotNo")),
        @AttributeOverride(name = "locality", column = @Column(name = "perm_locality")),
        @AttributeOverride(name = "city", column = @Column(name = "perm_city")),
        @AttributeOverride(name = "state", column = @Column(name = "perm_state")),
        @AttributeOverride(name = "country", column = @Column(name = "perm_country")),
        @AttributeOverride(name = "pincode", column = @Column(name = "perm_pincode"))
    })
    private Address permAddress;

    private String emailId;
    private long mobileNumber;

    // @OneToMany(mappedBy = "employee", cascade=CascadeType.ALL, orphanRemoval = true)
    // private List<FamilyMember> familyMembers;

    public Employee() {
    }

    public Employee(int employeeId, String firstName, String lastName, int age, String sex, String religion, Identity identity, String identityProof, Address tempAddress, Address permAddress, String emailId, long mobileNumber) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.sex = sex;
        this.religion = religion;
        this.identity = identity;
        this.identityProof = identityProof;
        this.tempAddress = tempAddress;
        this.permAddress = permAddress;
        this.emailId = emailId;
        this.mobileNumber = mobileNumber;
    }

    // public Employee(int employeeId, String firstName, String lastName, int age, String sex, String religion, Identity identity, String identityProof, Address tempAddress, Address permAddress, String emailId, long mobileNumber, List<FamilyMember> familyMembers) {
    //     this.employeeId = employeeId;
    //     this.firstName = firstName;
    //     this.lastName = lastName;
    //     this.age = age;
    //     this.sex = sex;
    //     this.religion = religion;
    //     this.identity = identity;
    //     this.identityProof = identityProof;
    //     this.tempAddress = tempAddress;
    //     this.permAddress = permAddress;
    //     this.emailId = emailId;
    //     this.mobileNumber = mobileNumber;
    //     this.familyMembers = familyMembers;
    // }

    // public List<FamilyMember> getFamilyMembers() {
    //     return familyMembers;
    // }

    // public void setFamilyMembers(List<FamilyMember> familyMembers) {
    //     this.familyMembers = familyMembers;
    // }

    public String getEmailId(){
        return emailId;
    }

    public void setEmailId(String e){
        this.emailId = e;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public long getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(long mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public Identity getIdentity() {
        return identity;
    }

    public void setIdentity(Identity identity) {
        this.identity = identity;
    }

    public String getIdentityProof() {
        return identityProof;
    }

    public void setIdentityProof(String identityProof) {
        this.identityProof = identityProof;
    }

    public Address getTempAddress() {
        return tempAddress;
    }

    public void setTempAddress(Address address) {
        this.tempAddress = address;
    }

    public Address getPermAddress() {
        return permAddress;
    }

    public void setPermAddress(Address address) {
        this.permAddress = address;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employeeId=" + employeeId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", religion='" + religion + '\'' +
                ", identity=" + identity +
                ", identityProof='" + identityProof + '\'' +
                ", tempAddress=" + tempAddress +
                ", permAddress=" + permAddress +
                ", emailId='" + emailId + '\'' +
                ", mobileNumber=" + mobileNumber +
                '}';
    }

    // @Override
    // public String toString() {
    //     return "Employee{" +
    //             "employeeId=" + employeeId +
    //             ", firstName='" + firstName + '\'' +
    //             ", lastName='" + lastName + '\'' +
    //             ", age=" + age +
    //             ", sex='" + sex + '\'' +
    //             ", religion='" + religion + '\'' +
    //             ", identity=" + identity +
    //             ", identityProof='" + identityProof + '\'' +
    //             ", tempAddress=" + tempAddress +
    //             ", permAddress=" + permAddress +
    //             ", emailId='" + emailId + '\'' +
    //             ", mobileNumber=" + mobileNumber +
    //             ", familyMembers=" + familyMembers +
    //             '}';
    // }
}
