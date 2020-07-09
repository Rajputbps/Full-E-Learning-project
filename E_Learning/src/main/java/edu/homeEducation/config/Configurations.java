package edu.homeEducation.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ComponentScan("edu.homeEducation")
@Configuration
@EnableTransactionManagement
public class Configurations {

	@Bean(name="dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost/HomeEducation");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		System.out.println("Connected");
		return dataSource;
	}
	public Properties getProperties() {
		Properties properties = new Properties();
//		properties.setProperty("hibernate.connection.useUnicode", "true");
//		properties.setProperty("hibernate.connection.characterEncoding", "UTF-8");
//		properties.setProperty("hibernate.connection.charSet", "UTF-8");
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        properties.setProperty("hibernate.show_sql", "true");
        properties.setProperty("hibernate.format_sql", "true");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        System.out.println("Table Ceate");
        return properties;
	}
	@Bean(name="sessionFactory")
	@Autowired
	public LocalSessionFactoryBean sessionFactory(DataSource dataSource) {
		LocalSessionFactoryBean sessionFactory=new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setHibernateProperties(getProperties());
		sessionFactory.setPackagesToScan("edu.homeEducation");
		return sessionFactory;
	}
    @Bean(name="transactionManager")
	@Autowired
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager= new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory);
		return transactionManager;
	}
}
