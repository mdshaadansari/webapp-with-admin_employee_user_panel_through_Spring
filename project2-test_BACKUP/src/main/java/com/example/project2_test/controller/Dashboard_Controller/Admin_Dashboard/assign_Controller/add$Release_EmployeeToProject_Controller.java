package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.assign_Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
 
@Controller
public class add$Release_EmployeeToProject_Controller {

	
	@Autowired
	DAOInterface DAOImpl;
	
	
	@Autowired
	emailSender emailSender;

	
	
	@RequestMapping(path="/addEmployeeToProjectServlet_step3" ,method=RequestMethod.POST)
	public String addEmployeeToProjectServlet_step3(HttpServletRequest request, HttpSession session) {
	System.out.println( "addEmployeeToProjectServlet_step3 handeler method in add$Release_EmployeeToProject_Controller.java");
		int success=0;
		ResultSet rs=null;
		Connection connection=null;
		PreparedStatement ps2 =null;
		String projectName=(String) request.getParameter("projectName").trim();
		String projetId=(String) request.getParameter("projectId").trim();
		
		String employeeName=(String) request.getParameter("employeeName").trim();
		String employeeId=(String) request.getParameter("employeeId").trim();
		System.out.println(projectName);
		System.out.println(projetId);
		System.out.println(employeeName);
		System.out.println(employeeId);
		System.out.println("catching all request parameter coming from addingEmployeeToProject_step2.jsp");
		//==========================first check is that for particular empoyee any project is assigned already 
		//if yes then sending message that employee already is in project 
		//else assigning project
		
		//List to store employee already assigned to project
		String employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject=null;
		String employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject=null;
		String projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject=null; 
		List<String> checkEmployeeOnBenchOrNot=DAOImpl.checkEmployeeOnBenchOrNot(employeeId);
		
		if(checkEmployeeOnBenchOrNot!=null) {
			employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject=checkEmployeeOnBenchOrNot.get(0);
			employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject=checkEmployeeOnBenchOrNot.get(1);
			projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject=checkEmployeeOnBenchOrNot.get(2);
		
	System.out.println(" not assigning employee to new project and sendint back to addingEmployeeToProject_step2.jsp ");

				request.getSession().setAttribute("project not assigned to employee successfully", "project not assigned to employee successfully");
				request.getSession().setAttribute("employeeAlreadyAssignedtoSomeProject", "employeeAlreadyAssignedtoSomeProject");
				request.getSession().setAttribute("employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject", employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject);
				request.getSession().setAttribute("employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject", employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject);
				request.getSession().setAttribute("projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject", projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject);
				 
					return "redirect:/addingEmployeeToProject_step2?projectName="+projectName+"&projectId="+projetId;
			 
			
			}else { 
		//==============inserting projectId in employee table in projectIdInEmployee column when no project is assigned to employee
				System.out.println("employee is not assigned to any project so assigning employee to project");
		 
		success=DAOImpl.assiginProjectToEmployee(projetId, employeeId);
		
		//=========if project assigned successfully send message back 
			if(success>0) {
				 
					System.out.println("assigning employee to project successfully");
					request.getSession().setAttribute("project assigned to employee successfully", "project assigned to employee successfully");
					return "redirect:/addingEmployeeToProject_step2?projectName="+projectName+"&projectId="+projetId;
			 
				//=========if project not assigned successfully send message back
			}else {
				System.out.println("not assigning employee to project  ");
			 
					request.getSession().setAttribute("project not assigned to employee successfully", "project not assigned to employee successfully");
					return"redirect:/addingEmployeeToProject_step2?projectName="+projectName+"&projectId="+projetId;
				 
			}
			 
			}
	 
		
		
	}
	
	
	
	@RequestMapping(path="addingEmployeeToProject_step2_releaseButtonClientServlet", method=RequestMethod.GET)
	String addingEmployeeToProject_step2_releaseButtonClientServlet(HttpSession session,HttpServletRequest request) {
	System.out.println( "addingEmployeeToProject_step2_releaseButtonClientServlet handeler method in add$Release_EmployeeToProject_Controller.java");
	String projectName = request.getParameter("projectName").trim();
	String projectId = request.getParameter("projectId").trim();
	String employeeId = request.getParameter("employeeId").trim();
	String employeeName = request.getParameter("employeeName").trim();

	// ==========releasing employee from project
 
		int i = DAOImpl. releaseEmployeeFromProject(employeeId,projectId);
		if(i>0) {
			System.out.println("yes, employee released from project"); 
			return "redirect:/addingEmployeeToProject_step2?projectId="+projectId+"&projectName="+projectName+"&emplyeeReleasedSuccessfully=emplyeeReleasedSuccessfully";
			
			
			
		}else {
			System.out.println("no, employee not released from project");
			return "redirect:/addingEmployeeToProject_step2?projectId="+projectId+"&projectName="+projectName+"&emplyeeNotReleasedSuccessfully=emplyeeNotReleasedSuccessfully";
			
		}
	 

	}
	
}
