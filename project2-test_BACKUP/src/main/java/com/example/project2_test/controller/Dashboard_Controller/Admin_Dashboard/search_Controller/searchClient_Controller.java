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
public class searchClient_Controller {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="searchClient_step1_getAllClientButtonClienk_step2",method=RequestMethod.GET)
	public String getAllClientButtonClick (HttpServletRequest request ,HttpSession session) {
		
		 System.out.println("getAllClientButtonClick handler method in searchClient_Controller.java");
		 List<String> listOfclientId=new ArrayList();
		 List<String> listOfclientName=new ArrayList();
		 List<String> listOfemailClient=new ArrayList();
		 List<String> listOfclientRelationshaipDate=new ArrayList(); 
		 //getting all info. of client from client table 
		 List<List>getAllClient=DAOImpl.getAllClient();
		 
		 if(getAllClient!=null) {
			 listOfclientId= getAllClient.get(0);
			 listOfclientName= getAllClient.get(1);
			 listOfemailClient= getAllClient.get(2);
			 listOfclientRelationshaipDate= getAllClient.get(3);
	 
		 				
		 				
							
							
							request.getSession().setAttribute("all info of client","all info of client");
							request.getSession().setAttribute("listOfclientId",listOfclientId);
							request.getSession().setAttribute("listOfclientName",listOfclientName);
							request.getSession().setAttribute("listOfemailClient",listOfemailClient);
							request.getSession().setAttribute("listOfclientRelationshaipDate",listOfclientRelationshaipDate); 
							
							return "redirect:/searchClient_step1";
					 
						}else{
							request.getSession().setAttribute("client not available in DB","client not available in DB");
							return "redirect:/searchClient_step1";
						}
		 

			
		
		
	}
	
	@RequestMapping(path="searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java",method=RequestMethod.GET)
	public String getAllProjectByClientIdButtonClienk  (HttpServletRequest request ,HttpSession session) {
		 System.out.println("getAllProjectByClientIdButtonClienk handler method in searchClient_Controller.java");
		 
		 
		 
			String clientId= request.getParameter("clientId");
			 System.out.println(clientId);
			 List<String> listOfprojectId=new ArrayList();
			 List<String> listOfprojectName=new ArrayList();
			 List<String> listofprojectDateOfStart=new ArrayList();
			 List<String> listofprojectDateOfEnd=new ArrayList();
			 List<String> listclientIdInProject=new ArrayList(); 

			 //getting all project for particular clientId
			  List<List>getAllProjectForClientId2=DAOImpl.getAllProjectForClientId2(clientId);
			 
			 if(getAllProjectForClientId2!=null) {
			 
				 listOfprojectId.addAll(getAllProjectForClientId2.get(0));
				 listOfprojectName .addAll( getAllProjectForClientId2.get(1));
				 listofprojectDateOfStart=getAllProjectForClientId2.get(2);
				 listofprojectDateOfEnd=getAllProjectForClientId2.get(3);
				 listclientIdInProject=getAllProjectForClientId2.get(4);
			 			
								
								
								request.getSession().setAttribute("project is assigned for this clientId","project is assigned for this clientId");
								request.getSession().setAttribute("listOfprojectId",listOfprojectId);
								request.getSession().setAttribute("listOfprojectName",listOfprojectName);
								request.getSession().setAttribute("listofprojectDateOfStart",listofprojectDateOfStart);
								request.getSession().setAttribute("listofprojectDateOfEnd",listofprojectDateOfEnd);
								request.getSession().setAttribute("listclientIdInProject",listclientIdInProject); 
								
								return "redirect:/searchClient_step1";
							 }else{
								request.getSession().setAttribute("no project is assigned for this clientId","no project is assigned for this clientId");
								return "redirect:/searchClient_step1";
				 			}
				 
		 
		 
		 
			
	}
}
