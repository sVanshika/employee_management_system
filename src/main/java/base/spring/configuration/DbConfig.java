package base.spring.configuration;

import base.model.Address;
import base.model.Employee;
import base.model.FamilyMember;
import base.model.LoanAgreement;

import org.hibernate.SessionFactory;
// import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
// import org.springframework.context.annotation.PropertySource;
// import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
public class DbConfig {


    @Bean
    public DataSource getDataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

         dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
        dataSource.setUsername("vanshika_o11");
        dataSource.setPassword("vanshika_o11");
        return dataSource;
    }

    private Properties getProperties(){
        Properties props = new Properties();
        // all these properties were configured in hibernate.cfg.xml in the hibernate project
        props.put("hibernate.dialect", "org.hibernate.dialect.Oracle10gDialect");
        props.put("hibernate.show_sql", "true");
        props.put("hibernate.hbm2ddl.auto", "update");
        return props;
    }

    @Bean
    public LocalSessionFactoryBean getSessionFactory(){
        LocalSessionFactoryBean bean = new LocalSessionFactoryBean();
       
        bean.setDataSource(getDataSource());
        bean.setHibernateProperties(getProperties());

        bean.setAnnotatedClasses(
            Employee.class,
            Address.class,
            FamilyMember.class,
            LoanAgreement.class
        );

        try {
            bean.afterPropertiesSet();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return bean;
    }

   @Bean(name="transactionManager") // according to spring conventions, this transaction manager should be registered with the name "transactionManager" camel case
    public HibernateTransactionManager getTransactionManager(){
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();

        SessionFactory sessionFactory = getSessionFactory().getObject(); //it will give the reference of type sessionfactory
        DataSource dataSource = getDataSource();

        transactionManager.setSessionFactory(sessionFactory);
        transactionManager.setDataSource(dataSource);

        return transactionManager;
    }
}
