package base.model;

// import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;


@Entity
// @Embeddable
public class FamilyMember {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="member_seq_gen")
    @SequenceGenerator(name="member_seq_gen", initialValue = 101, allocationSize = 1)
    private int memberId;
    private String firstName;
    private String lastName;
    private int age;
    private String relation;

    @ManyToOne
    // @JoinColumn(name="employeeId")
    private Employee employee;

    public FamilyMember() {
    }

    public FamilyMember(int memberId, String firstName, String lastName, int age, String relation) {
        this.memberId = memberId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.relation = relation;
    }

    @Override
    public String toString() {
        return "FamilyMember{" +
                "employeeId='" + memberId + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", age=" + age +
                ", relation='" + relation + '\'' +
                '}';
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
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

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }
}
