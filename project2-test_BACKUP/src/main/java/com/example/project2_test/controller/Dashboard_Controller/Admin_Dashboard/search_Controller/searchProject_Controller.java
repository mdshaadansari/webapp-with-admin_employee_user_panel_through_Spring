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
public class searchProject_Controller {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="searchProject_step1_getAllProjectButtonClienk_step2",method=RequestMethod.GET)
	public String getAllProjectButtonClienk (HttpServletRequest request ,HttpSession session) {
		

		 List<String> listOfprojectId=new ArrayList();
		 List<String> listOfprojectName=new ArrayList();
		 List<String> listofprojectDateOfStart=new ArrayList();
		 List<String> listofprojectDateOfEnd=new ArrayList();
		 List<String> listclientIdInProject=new ArrayList(); 

		 
		 //fetchingg all project column from db 
		 List<List>getAllProjectEveryColumn=DAOImpl.getAllProjectEveryColumn();
		 
		 if(getAllProjectEveryColumn!=null) {
			 listOfprojectId= getAllProjectEveryColumn.get(0);
			 listOfprojectName= getAllProjectEveryColumn.get(1);
			 listofprojectDateOfStart= getAllProjectEveryColumn.get(2);
			 listofprojectDateOfEnd= getAllProjectEveryColumn.get(3);
			 listclientIdInProject= getAllProjectEveryColumn.get(4);
			 
			  
		 				
		 			
							
							
							request.getSession().setAttribute("all info of project","all info of project");
							request.getSession().setAttribute("listOfprojectId",listOfprojectId);
							request.getSession().setAttribute("listOfprojectName",listOfprojectName);
							request.getSession().setAttribute("listofprojectDateOfStart",listofprojectDateOfStart);
							request.getSession().setAttribute("listofprojectDateOfEnd",listofprojectDateOfEnd);
							request.getSession().setAttribute("listclientIdInProject",listclientIdInProject); 
							
							return"redirect:/searchProject_step1";
						 }else{
							request.getSession().setAttribute("Project not available in DB","Project not available in DB");
							return"redirect:/searchProject_step1";
			 			}

			
		
		
	}
	
	@RequestMapping(path="searchProject_step1_getAllProjectByProjectIdButtonClienk_step2",method=RequestMethod.GET)
	public String getAllProjectByProjectIdButtonClienk  (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllProjectByProjectIdButtonClienk handler method in searchProject_Controller.java");
		 
			String projectId= request.getParameter("projectId");
			 
			 List<String> listOfprojectId=new ArrayList();
			 List<String> listOfprojectName=new ArrayList();
			 List<String> listofprojectDateOfStart=new ArrayList();
			 List<String> listofprojectDateOfEnd=new ArrayList();
			 List<String> listclientIdInProject=new ArrayList(); 

			 
			 //fetchingg all project column from db 
			 List<List>getAllProjectEveryColumnByProjectId=DAOImpl.getAllProjectEveryColumnByProjectId(projectId);

			 if(getAllProjectEveryColumnByProjectId!=null) {
				 listOfprojectId= getAllProjectEveryColumnByProjectId.get(0);
				 listOfprojectName= getAllProjectEveryColumnByProjectId.get(1);
				 listofprojectDateOfStart= getAllProjectEveryColumnByProjectId.get(2);
				 listofprojectDateOfEnd= getAllProjectEveryColumnByProjectId.get(3);
				 listclientIdInProject= getAllProjectEveryColumnByProjectId.get(4);
				 
			 
			 
			  
			 				
			 				
			 			
								
								
								request.getSession().setAttribute("project on the basis of projectId","project on the basis of projectId");
								request.getSession().setAttribute("listOfprojectId",listOfprojectId);
								request.getSession().setAttribute("listOfprojectName",listOfprojectName);
								request.getSession().setAttribute("listofprojectDateOfStart",listofprojectDateOfStart);
								request.getSession().setAttribute("listofprojectDateOfEnd",listofprojectDateOfEnd);
								request.getSession().setAttribute("listclientIdInProject",listclientIdInProject); 
								
								return "redirect:/searchProject_step1";
							 }else{
								request.getSession().setAttribute("project not available on the basis of projectId","project not available on the basis of projectId");
								return "redirect:/searchProject_step1";
				 			}
				 
				
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(path="searchProject_step1_getAllClientByProjectIdButtonClick_step2",method=RequestMethod.GET)
	public String getAllClientByProjectIdButtonClick (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllClientByProjectIdButtonClick handler method in searchProject_Controller.java");
		 
			String projectId= request.getParameter("projectId");
			System.out.println(projectId);
			 
			
			
			 List<String> listOfclientid=new ArrayList();
			 List<String> listOfclientName=new ArrayList();
			 List<String> listofemailClient=new ArrayList();
			 List<String> listofclientRelationshaipDate=new ArrayList();
			 
			 
			 //getting all client details from DB based on projectId 
			 List<List> getAllClientByProjectId=DAOImpl.getAllClientByProjectId(projectId);
			 if(getAllClientByProjectId!=null) {
			 					listOfclientid=getAllClientByProjectId.get(0);
			 					listOfclientName=getAllClientByProjectId.get(1);
			 					listofemailClient=getAllClientByProjectId.get(2);
			 					listofclientRelationshaipDate=getAllClientByProjectId.get(3); 
			 					 
			 				 
			 			
								
								
								request.getSession().setAttribute("client on the basis of projectId","client on the basis of projectId");
								request.getSession().setAttribute("listOfclientid",listOfclientid);
								request.getSession().setAttribute("listOfclientName",listOfclientName);
								request.getSession().setAttribute("listofemailClient",listofemailClient);
								request.getSession().setAttribute("listofclientRelationshaipDate",listofclientRelationshaipDate); 
								
								return "redirect:/searchProject_step1";
							 }else{
								 System.err.println("when their is on client on basis of projectId in client tatble in DB");
								request.getSession().setAttribute("no client is their for this projectId","no client is their for this projectId");
								return "redirect:/searchProject_step1";
				 			}
			 	
	}
	
	
	
	
	
	@RequestMapping(path="searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2",method=RequestMethod.GET)
	public String  getAllEmployeeByProjectIdButtonClick (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllEmployeeByProjectIdButtonClick handler method in searchProject_Controller.java");

			String projectId= request.getParameter("projectId");
			System.out.println(projectId);
			 
			 List<String> listOfemployeeId=new ArrayList();
			 List<String> listOfemployeeName=new ArrayList();
			 List<String> listofemployeeDept=new ArrayList();
			 List<String> listofemployeeEmail=new ArrayList();
			 List<String> listofemployeePhone=new ArrayList();
			 List<String> listofemployeeDOJ=new ArrayList();
			 List<String> listofprojectIdInEmployee=new ArrayList();
			 
			 
			 List<List>getAllEmployeeEveryColumnByProjectId=DAOImpl.getAllEmployeeEveryColumnByProjectId(projectId);
			 if(getAllEmployeeEveryColumnByProjectId!=null) {
				 listOfemployeeId= getAllEmployeeEveryColumnByProjectId.get(0);
				 listOfemployeeName= getAllEmployeeEveryColumnByProjectId.get(1);
				 listofemployeeDept= getAllEmployeeEveryColumnByProjectId.get(2);
				 listofemployeeEmail= getAllEmployeeEveryColumnByProjectId.get(3);
				 listofemployeePhone= getAllEmployeeEveryColumnByProjectId.get(4);
				 listofemployeeDOJ= getAllEmployeeEveryColumnByProjectId.get(5);
				 listofprojectIdInEmployee= getAllEmployeeEveryColumnByProjectId.get(6); 
				  
			 				
			 				
			 			
								
								
								request.getSession().setAttribute("employee on the basis of projectId","employee on the basis of projectId");
								request.getSession().setAttribute("listOfemployeeId",listOfemployeeId);
								request.getSession().setAttribute("listOfemployeeName",listOfemployeeName);
								request.getSession().setAttribute("listofemployeeEmail",listofemployeeEmail);
								request.getSession().setAttribute("listofemployeeDept",listofemployeeDept);
								request.getSession().setAttribute("listofemployeePhone",listofemployeePhone);
								request.getSession().setAttribute("listofemployeeDOJ",listofemployeeDOJ); 
								request.getSession().setAttribute("listofprojectIdInEmployee",listofprojectIdInEmployee); 
								
							return "redirect:/searchProject_step1";
							 }else{
								 System.err.println("when their is on employee on the basis of projectId");
								request.getSession().setAttribute("no employee on the basis of projectId","no employee on the basis of projectId");
								return "redirect:/searchProject_step1";
				 			}
				 
	}
}
