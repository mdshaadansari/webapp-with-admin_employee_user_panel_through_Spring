package com.example.project2_test.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages="com.example.project2_test")
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter{



	{System.out.println("MvcConfiguration");}

	@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		System.out.println("getViewResolver");		
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	 
	@Bean
	public DataSource dataSource() {
		BasicDataSource bds=new BasicDataSource(); 
		bds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		//bds.setDriverClassName("com.mysql.jdbc.Driver");
		bds.setUrl("jdbc:mysql://localhost:3306/project2_16_feb_2025");
		bds.setUsername("root");
		bds.setPassword("Shaad1234@");
		return bds;
	}
	
	@Bean
	public LocalSessionFactoryBean localSessionFactoryBean(DataSource dataSource) {
		LocalSessionFactoryBean sessionFactory=new LocalSessionFactoryBean();
		
		java.util.Properties p=new java.util.Properties();
		  p.setProperty("hibernate.hbm2ddl.auto", "update");
	        p.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
	        p.setProperty("hibernate.show_sql", "true");
	      //   p.setProperty("hibernate.current_session_context_class", "thread"); // Ensures proper session handling

		sessionFactory.setHibernateProperties(p);
		sessionFactory.setPackagesToScan("com.example.project2_test.model");
		sessionFactory.setDataSource(dataSource);
		return sessionFactory;
	}
	
	
	@Bean(name = "hibernateTemplate")
	public HibernateTemplate hibernateTemplate(SessionFactory localSessionFactoryBean) {
		HibernateTemplate hibernateTemplate = new HibernateTemplate(localSessionFactoryBean);  
		 hibernateTemplate.setCheckWriteOperations(false); // Allow write operations
		   // hibernateTemplate.getSessionFactory().getCurrentSession().setFlushMode(FlushMode.AUTO); // Ensures changes are flushed automatically
		   
        return hibernateTemplate;
	}
	
	@Bean
	public HibernateTransactionManager hibernateTransactionManager(SessionFactory localSessionFactoryBean) {
		
		return new HibernateTransactionManager(localSessionFactoryBean);
	}
	
	
	
	@Bean
	public JavaMailSenderImpl JavaMailSender() {
		JavaMailSenderImpl	 mailSender = new JavaMailSenderImpl();
	     mailSender.setHost("smtp.gmail.com");
	     mailSender.setPort(587);
	     mailSender.setUsername("mdshaad0000024@gmail.com");
	     mailSender.setPassword("waxd xcaa rzps gayn");

	     // Configure SMTP properties
	     Properties props = mailSender.getJavaMailProperties();
	     props.put("mail.transport.protocol", "smtp");
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.starttls.enable", "true");
	     
		return mailSender;
		
	}
	
	@Bean
	public SimpleMailMessage SimpleMailMessage() {
		return new SimpleMailMessage();
	}
	 
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	} 
 
	 
}
