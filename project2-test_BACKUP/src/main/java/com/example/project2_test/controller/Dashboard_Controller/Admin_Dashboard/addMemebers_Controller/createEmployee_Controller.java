package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.addMemebers_Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.Admin_Dashboard.addMemebers_Service.createEmployee_Service;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.idCreator.employeeIdGenerator;
import com.example.project2_test.model.employee;

 
@Controller
@RequestMapping(path="/addEmployee")
public class createEmployee_Controller {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	
	@Autowired createEmployee_Service createEmployee_Service;
	
	
	
	@RequestMapping(value="/addEmployeeButtonClick" ,method= RequestMethod.GET)
	String addEmployeeButtonClick (HttpSession session ){
		System.out.println("addEmployeeButtonClick handler method in createEmployee_Controller.java");
 

		// ==getting last employeeID from employee DB and sending to adminDashboard.jsp==============
			String lastEmployeeIdFromEmployeeDB = DAOImpl. getLastEmpoyeeIDFromDB();
			if (lastEmployeeIdFromEmployeeDB!=null) {
			System.out.println("last empolyeeID from DB is " + lastEmployeeIdFromEmployeeDB);

				//======(start)===incrimenting employeeId which is coming from DB=======
				lastEmployeeIdFromEmployeeDB=employeeIdGenerator.generateNextId(lastEmployeeIdFromEmployeeDB);
				//================================================================
				System.out.println("new empolyeeID genrated " + lastEmployeeIdFromEmployeeDB);
				java.time.LocalDate l=  java.time.LocalDate.now();
				String s=l.getDayOfMonth()+"-"+ l.getMonth() +"-"+ l.getYear();


				session.setAttribute("comingFromaddEmployeeButtonClick","comingFromaddEmployeeButtonClick"); 	
				session.setAttribute("employeeId", lastEmployeeIdFromEmployeeDB);
				session.setAttribute("employeeDOJ", s);
				 
					return "adminDashboard";
			 

				// =======if no employee is in DB then creating first employeeID and sending to
				// adminDashboard.jsp========
			} else {
				String employeeId = "JTC-001";
				java.time.LocalDate l=  java.time.LocalDate.now();
				String s=l.getDayOfMonth()+"-"+ l.getMonth() +"-"+ l.getYear();
				
				System.out.println("no employee in DB ,so creating new employeId "+employeeId);
				session.setAttribute("comingFromaddEmployeeButtonClick", "comingFromaddEmployeeButtonClick");
				session.setAttribute("employeeId", employeeId);
				session.setAttribute("employeeDOJ", s);
			 
					return "adminDashboard" ;
				 
			}
	}
	
	
	
	@RequestMapping(value="/addEmployeeInDB" ,method= RequestMethod.GET)
	String addEmployeeInDB (HttpSession session ,HttpServletRequest request,
			@RequestParam(name="employeeId") String lastEmployeeIdFromEmployeeDB,
			@RequestParam(name="employeeDOJ") String employeeDOJ,
			@RequestParam(name="employee-name") String name,
			@RequestParam(name="employee-phone") String phone,
			@RequestParam(name="employee-email") String email,
			@RequestParam(name="employee-dept") String dept 
			){
		

		System.out.println("addEmployeeInDB handler method in createEmployee_Controller.java");
		System.out.println(lastEmployeeIdFromEmployeeDB);
		System.out.println(employeeDOJ);
		System.out.println(name);
		System.out.println(phone);
		
		System.out.println(email);
		System.out.println(dept); 

/*

		String  name=request.getParameter("employee-name").trim();
		String phone=request.getParameter("employee-phone").trim();
		String email=request.getParameter("employee-email").trim();
		String dept=request.getParameter("employee-dept").trim(); 
		String lastEmployeeIdFromEmployeeDB=request.getParameter("employeeId").trim();
		String employeeDOJ=request.getParameter("employeeDOJ").trim();
		
*/
employee employee =new  employee(lastEmployeeIdFromEmployeeDB.trim(), employeeDOJ.trim(), name.trim(), dept.trim(), email.trim(), phone.trim()); 

String result=createEmployee_Service.addEmployeeInDB_Service(employee);

if(result.equals("email already exsist in DB")){ 
		// ==getting employeeEmail in DB and matching it with incoming email==============

	session.setAttribute("comingFromaddEmployeeButtonClick","comingFromaddEmployeeButtonClick");
	session.setAttribute("employeeId", lastEmployeeIdFromEmployeeDB);
	session.setAttribute("employeeDOJ", employeeDOJ);
	 
	//===== email  already exsist in DB so send back message that email is present=======
	session.setAttribute("employee with this email already exsist in DB", "employee with this email already exsist in DB");
	session.setAttribute("duplicateemployeeemail", email);
	
 
				 
					return "redirect:/adminDashboard";
}else if(result.equals("employee not added in DB")) {
					 request.getSession().setAttribute("employee not added successfully, problem in DB", "employee not added successfully, problem in DB");

					 return":/adminDashboard";
}else if(result.equals("employee added in DB") ){
					
					//creating new empoyeeID based on what is already availabe in DB, creating todays date sending back to adminDashboard.jsp
				  	lastEmployeeIdFromEmployeeDB=DAOImpl. getLastEmpoyeeIDFromDB();
					 System.out.println(lastEmployeeIdFromEmployeeDB +" is last emailId present in db");
					 

					//======(start)===incrimenting employeeId which is coming from DB=======
					lastEmployeeIdFromEmployeeDB=employeeIdGenerator.generateNextId(lastEmployeeIdFromEmployeeDB);
					//================================================================ 
						java.time.LocalDate l=  java.time.LocalDate.now();
						String s=l.getDayOfMonth()+"-"+ l.getMonth() +"-"+ l.getYear();
						System.out.println(lastEmployeeIdFromEmployeeDB +" new generated sending to adminDahboard.jsp");

						request.getSession().setAttribute("comingFromaddEmployeeButtonClick","comingFromaddEmployeeButtonClick");
						request.getSession().setAttribute("employeeId", lastEmployeeIdFromEmployeeDB.trim());
						request.getSession().setAttribute("employeeDOJ", s);

					//===employee added successfully and login credentials send to employee email message to adminDashboard.jsp====
						request.getSession().setAttribute("employee added successfully", "employee added successfully");
						request.getSession().setAttribute("login credentials send to employee email", "login credentials send to employee email");
					
						System.out.println("employee added successfully"); 
				 
					return"redirect:/adminDashboard";
				}
				// =======if incoming email is not matching with email in DB then storing incoming employee details in DB=====



request.getSession().setAttribute("employee not added successfully, problem in DB", "employee not added successfully, problem in DB"); 
return":/adminDashboard";
				 
 
 
	 
	}
	
	
 
	
}