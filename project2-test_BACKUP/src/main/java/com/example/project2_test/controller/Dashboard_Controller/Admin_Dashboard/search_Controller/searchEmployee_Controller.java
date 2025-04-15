package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.search_Controller;

import java.util.ArrayList;
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
public class searchEmployee_Controller {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="searchEmployee_step1_getAllEmployeeButtonClienk_step2",method=RequestMethod.GET)
	public String  getAllEmployeeButtonClienk  (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllEmployeeButtonClienk handler method in searchEmployee_Controller.java");
			
		List<String> listOfemployeeId=new ArrayList();
		List<String> listOfemployeeName=new ArrayList();
		List<String> listOfemployeeDept=new ArrayList();
		List<String> listOfemployeeEmail=new ArrayList();
		List<String> listOfemployeePhone=new ArrayList();
		List<String> listOfemployeeDOJ=new ArrayList();
		List<String> listOfprojectIdInEmployee=new ArrayList();


List<List>getAllEmployeeEveryColumn=DAOImpl.getAllEmployeeEveryColumn();
if(getAllEmployeeEveryColumn!=null){
	listOfemployeeId=getAllEmployeeEveryColumn.get(0);
	listOfemployeeName=getAllEmployeeEveryColumn.get(1);
	listOfemployeeDept=getAllEmployeeEveryColumn.get(2);
	
	listOfemployeeEmail=getAllEmployeeEveryColumn.get(3);
	listOfemployeePhone=getAllEmployeeEveryColumn.get(4);
	
	listOfemployeeDOJ=getAllEmployeeEveryColumn.get(5);
	listOfprojectIdInEmployee=getAllEmployeeEveryColumn.get(6);

 						
						request.getSession().setAttribute("all info of employee","all info of employee");
						request.getSession().setAttribute("listOfemployeeId",listOfemployeeId);
						request.getSession().setAttribute("listOfemployeeName",listOfemployeeName);
						request.getSession().setAttribute("listOfemployeeDept",listOfemployeeDept);
						request.getSession().setAttribute("listOfemployeeEmail",listOfemployeeEmail);
						request.getSession().setAttribute("listOfemployeePhone",listOfemployeePhone);
						request.getSession().setAttribute("listOfemployeeDOJ",listOfemployeeDOJ); 
						request.getSession().setAttribute("listOfprojectIdInEmployee",listOfprojectIdInEmployee);
						
						return"redirect:/searchEmployee_step1";
					}else{
						
						
						request.getSession().setAttribute("employee not available in DB","employee not available in DB");
						return"redirect:/searchEmployee_step1";
					}
	}
	
	@RequestMapping(path="searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2",method=RequestMethod.GET)
	public String  getAllEmployeeByEmailButtonClienk   (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllEmployeeByEmailButtonClienk handler method in searchEmployee_Controller.java");

		 
		 String employeeEmail=request.getParameter("employeeEmail");
		 
		 
		 
			
			List<String> listOfemployeeId=new ArrayList();
			List<String> listOfemployeeName=new ArrayList();
			List<String> listOfemployeeDept=new ArrayList();
			List<String> listOfemployeeEmail=new ArrayList();
			List<String> listOfemployeePhone=new ArrayList();
			List<String> listOfemployeeDOJ=new ArrayList();
			List<String> listOfprojectIdInEmployee=new ArrayList();

			List <List>getAllEmployeeByEmployeeEmail=DAOImpl.getAllEmployeeByEmployeeEmail(employeeEmail);
			if(getAllEmployeeByEmployeeEmail!=null) {
				listOfemployeeId=	getAllEmployeeByEmployeeEmail.get(0);
				listOfemployeeName=	getAllEmployeeByEmployeeEmail.get(1);
				listOfemployeeDept=	getAllEmployeeByEmployeeEmail.get(2);
				listOfemployeeEmail=	getAllEmployeeByEmployeeEmail.get(3);
				
				listOfemployeePhone=	getAllEmployeeByEmployeeEmail.get(4);
				listOfemployeeDOJ=	getAllEmployeeByEmployeeEmail.get(5);
				listOfprojectIdInEmployee=	getAllEmployeeByEmployeeEmail.get(6);
				 
							
							
							request.getSession().setAttribute("employee with particular employeeEmail","employee with particular employeeEmail");
							request.getSession().setAttribute("listOfemployeeId",listOfemployeeId);
							request.getSession().setAttribute("listOfemployeeName",listOfemployeeName);
							request.getSession().setAttribute("listOfemployeeDept",listOfemployeeDept);
							request.getSession().setAttribute("listOfemployeeEmail",listOfemployeeEmail);
							request.getSession().setAttribute("listOfemployeePhone",listOfemployeePhone);
							request.getSession().setAttribute("listOfemployeeDOJ",listOfemployeeDOJ); 
							request.getSession().setAttribute("listOfprojectIdInEmployee",listOfprojectIdInEmployee);
							
							return"redirect:/searchEmployee_step1";
						}else{
							
							
							request.getSession().setAttribute("on employee with particular employeeEmail","on employee with particular employeeEmail");
							return"redirect:/searchEmployee_step1";
						}
		 
				
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(path="searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2",method=RequestMethod.GET)
	public String  getAllEmployeeByEmployeeIdButtonClienk (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllEmployeeByEmployeeIdButtonClienk handler method in searchEmployee_Controller.java");
		 

		 
		 String employeeId1=request.getParameter("employeeId");
		 
		 
		 
			
			List<String>  listOfemployeeId=new ArrayList();
			List<String>  listOfemployeeName=new ArrayList();
			List<String> listOfemployeeDept=new ArrayList();
			List<String>  listOfemployeeEmail=new ArrayList();
			List<String>  listOfemployeePhone=new ArrayList();
			List<String>  listOfemployeeDOJ=new ArrayList();
			List<String>  listOfprojectIdInEmployee=new ArrayList();

			
			List<String>getAllEmployeeByEmployeeId=DAOImpl.getAllEmployeeByEmployeeId(employeeId1);
			if(getAllEmployeeByEmployeeId!=null) {
				listOfemployeeId.add(getAllEmployeeByEmployeeId.get(0));
				listOfemployeeName.add(	getAllEmployeeByEmployeeId.get(1));
				listOfemployeeDept.add(	getAllEmployeeByEmployeeId.get(2));
				listOfemployeeEmail.add(	getAllEmployeeByEmployeeId.get(3));
				listOfemployeePhone.add(	getAllEmployeeByEmployeeId.get(4));
				listOfemployeeDOJ.add(	getAllEmployeeByEmployeeId.get(5));
				listOfprojectIdInEmployee.add(	getAllEmployeeByEmployeeId.get(6));
				
				
		 
							
							request.getSession().setAttribute("employee with particular employeeId","employee with particular employeeId");
							request.getSession().setAttribute("listOfemployeeId",listOfemployeeId);
							request.getSession().setAttribute("listOfemployeeName",listOfemployeeName);
							request.getSession().setAttribute("listOfemployeeDept",listOfemployeeDept);
							request.getSession().setAttribute("listOfemployeeEmail",listOfemployeeEmail);
							request.getSession().setAttribute("listOfemployeePhone",listOfemployeePhone);
							request.getSession().setAttribute("listOfemployeeDOJ",listOfemployeeDOJ); 
							request.getSession().setAttribute("listOfprojectIdInEmployee",listOfprojectIdInEmployee);
							
							return"redirect:/searchEmployee_step1";
						}else{
							
							
							request.getSession().setAttribute("on employee with particular employeeId","on employee with particular employeeId");
							return"redirect:/searchEmployee_step1";
						}
	}
	
	
	
	
	
	@RequestMapping(path="searchEmployee_step1_getPrjectAssignedToEmployee_step2",method=RequestMethod.GET)
	public String   getPrjectAssignedToEmployee  (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getPrjectAssignedToEmployee handler method in searchEmployee_Controller.java");

		 
			String employeeId= request.getParameter("employeeId");
			String employeeName= request.getParameter("employeeName");
			System.out.println(employeeId);
			 
			 
			 String employeeEmail=null;
			 String employeePhone=null;
			 
			 String projectId=null;
			 String projectName=null;
			 String projectDateOfStart=null;
			 String projectDateOfEnd=null; 
			 
			  List<String> getEmployeeAndProjectByEmployeeId=DAOImpl.getEmployeeAndProjectByEmployeeId(employeeId);
			  if(getEmployeeAndProjectByEmployeeId!=null) {
				  employeeEmail=  getEmployeeAndProjectByEmployeeId.get(0);
				  employeePhone=  getEmployeeAndProjectByEmployeeId.get(1);
				  projectId=  getEmployeeAndProjectByEmployeeId.get(2);
				  projectName=  getEmployeeAndProjectByEmployeeId.get(3);
				  projectDateOfStart=  getEmployeeAndProjectByEmployeeId.get(4);
				  projectDateOfEnd=  getEmployeeAndProjectByEmployeeId.get(5);
		 
			 				
			 			
								
								
								request.getSession().setAttribute("project on the basis of employee","project on the basis of employee");
								request.getSession().setAttribute("employeeId",employeeId);
								request.getSession().setAttribute("employeeName",employeeName);
								request.getSession().setAttribute("employeeEmail",employeeEmail);
								request.getSession().setAttribute("employeePhone",employeePhone);
								request.getSession().setAttribute("projectId",projectId);
								request.getSession().setAttribute("projectName",projectName); 
								request.getSession().setAttribute("projectDateOfStart",projectDateOfStart);
								request.getSession().setAttribute("projectDateOfEnd",projectDateOfEnd); 
								
								return"redirect:/searchEmployee_step1";
							 }else{
								 System.err.println("when their is no project assigned to employee");
								request.getSession().setAttribute("no project assigned to employee","no project assigned to employee");
								return"redirect:/searchEmployee_step1";
				 			}
				 
				 
	}
	
	
	
	
	

	@RequestMapping(path="searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java",method=RequestMethod.GET)
	public String    getAllEmployeeOnBenchButtonClienk   (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllEmployeeOnBenchButtonClienk handler method in searchEmployee_Controller.java");
	
			
			List<String> listOfemployeeId=new ArrayList();
			List<String> listOfemployeeName=new ArrayList();
			List<String> listOfemployeeDept=new ArrayList();
			List<String> listOfemployeeEmail=new ArrayList();
			List<String> listOfemployeePhone=new ArrayList();
			List<String> listOfemployeeDOJ=new ArrayList();
			List<String> listOfprojectIdInEmployee=new ArrayList();

			
			
			List<List>getEmployeeOnBench=DAOImpl.getEmployeeOnBench();
			if(getEmployeeOnBench!=null) {
				listOfemployeeId.addAll	(getEmployeeOnBench.get(0));
				listOfemployeeName.addAll	(getEmployeeOnBench.get(1));
				listOfemployeeDept=	getEmployeeOnBench.get(2);
				listOfemployeeEmail=	getEmployeeOnBench.get(3);
				listOfemployeePhone=	getEmployeeOnBench.get(4);
				listOfemployeeDOJ=	getEmployeeOnBench.get(5);
				listOfprojectIdInEmployee=	getEmployeeOnBench.get(6);


							
							request.getSession().setAttribute("employee on bench are","employee on bench are");
							request.getSession().setAttribute("listOfemployeeId",listOfemployeeId);
							request.getSession().setAttribute("listOfemployeeName",listOfemployeeName);
							request.getSession().setAttribute("listOfemployeeDept",listOfemployeeDept);
							request.getSession().setAttribute("listOfemployeeEmail",listOfemployeeEmail);
							request.getSession().setAttribute("listOfemployeePhone",listOfemployeePhone);
							request.getSession().setAttribute("listOfemployeeDOJ",listOfemployeeDOJ); 
							request.getSession().setAttribute("listOfprojectIdInEmployee",listOfprojectIdInEmployee);
							
							return"redirect:/searchEmployee_step1";
						}else{
							
							
							request.getSession().setAttribute("no employee on bench","no employee on bench");
							return"redirect:/searchEmployee_step1";
						}
		 
	}

}
