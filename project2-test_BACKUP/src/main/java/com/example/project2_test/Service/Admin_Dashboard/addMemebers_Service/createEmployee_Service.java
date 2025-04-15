package com.example.project2_test.Service.Admin_Dashboard.addMemebers_Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.idCreator.employeeIdGenerator;
import com.example.project2_test.model.employee;

 
@Service
public class createEmployee_Service {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	 
	
	 
	public String addEmployeeInDB_Service ( employee employee){
		System.out.println("addEmployeeInDB_Service   method in createEmployee_Service.java");

 
		
		// ==getting employeeEmail in DB and matching it with incoming email==============
 				
				System.out.println("checking is that email is already in DB\t"+employee.getEmployeeEmail());
				boolean emailexsist=DAOImpl.checkemployeeEmail(employee.getEmployeeEmail());
				if (emailexsist==true) {
				System.out.println(employee.getEmployeeEmail()+"\talready exsist in DB");
				
				
				
//				session.setAttribute("comingFromaddEmployeeButtonClick","comingFromaddEmployeeButtonClick");
//				session.setAttribute("employeeId", lastEmployeeIdFromEmployeeDB);
//				session.setAttribute("employeeDOJ", employeeDOJ);
//				
//				
//				
//				
//				//===== email  already exsist in DB so send back message that email is present=======
//				session.setAttribute("employee with this email already exsist in DB", "employee with this email already exsist in DB");
//				session.setAttribute("duplicateemployeeemail", email);
				
			
				 
//					return "redirect:/adminDashboard.jsp";
				
				return "email already exsist in DB";
				 
				  
			} else { 
				// =======if incoming email is not matching with email in DB then storing incoming employee details in DB=====
				String success=DAOImpl.insertIntoEmployee(employee);
				System.out.println("end inserting new employee in DB");
				if( (success==null)) {
					//request.getSession().setAttribute("employee not added successfully, problem in DB", "employee not added successfully, problem in DB");

					//return":/adminDashboard.jsp";
					return "employee not added in DB";
				}
				System.out.println(employee.getEmployeeId() +" is inserted in db");
				  
			 
					///sending login credentials to employee email
					emailSender.sendEmail(employee.getEmployeeEmail(), "you have joined by admin", "Login with your email "+"http://localhost:8080/project1_1_february_2025/employeeLogin.jsp");

					System.out.println("login credentials send to employee email");
					//creating new empoyeeID based on what is already availabe in DB, creating todays date sending back to adminDashboard.jsp
				 

//					 	lastEmployeeIdFromEmployeeDB=DAOImpl. getLastEmpoyeeIDFromDB();
//						System.out.println(lastEmployeeIdFromEmployeeDB +" is last emailId present in db");
//					 
//
//					//======(start)===incrimenting employeeId which is coming from DB=======
//					lastEmployeeIdFromEmployeeDB=employeeIdGenerator.generateNextId(lastEmployeeIdFromEmployeeDB);
//					//================================================================
//						System.out.println("new empolyeeID genrated " + lastEmployeeIdFromEmployeeDB);
//						java.time.LocalDate l=  java.time.LocalDate.now();
//						String s=l.getDayOfMonth()+"-"+ l.getMonth() +"-"+ l.getYear();
//						System.out.println(lastEmployeeIdFromEmployeeDB +" new generated sending to adminDahboard.jsp");
//
//						request.getSession().setAttribute("comingFromaddEmployeeButtonClick","comingFromaddEmployeeButtonClick");
//						request.getSession().setAttribute("employeeId", lastEmployeeIdFromEmployeeDB.trim());
//						request.getSession().setAttribute("employeeDOJ", s);
//
//					//===employee added successfully and login credentials send to employee email message to adminDashboard.jsp====
//						request.getSession().setAttribute("employee added successfully", "employee added successfully");
//						request.getSession().setAttribute("login credentials send to employee email", "login credentials send to employee email");
//					
//						System.out.println("employee added successfully");
//				 
//					return"redirect:/adminDashboard.jsp";
					
					return "employee added in DB";
				 
			}

 
	 
	}
	
	
 
	
}