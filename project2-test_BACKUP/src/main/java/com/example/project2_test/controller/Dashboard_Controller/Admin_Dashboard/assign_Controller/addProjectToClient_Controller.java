package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.assign_Controller;

import java.io.IOException;
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
public class addProjectToClient_Controller {
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	
	@RequestMapping(path="/addProjectToClientServlet_step3" ,method=RequestMethod.GET)
	public String addProjectToClientServlet_step3(HttpServletRequest request, HttpSession session) {
		System.out.println("addProjectToClientServlet_step3 handeler method in addProjectToClient_Controller.java");
		 
		int success=0;
		String clientName=(String) request.getParameter("clientName").trim();
		String clientId=(String) request.getParameter("clientId").trim();
		
		String projectName=(String) request.getParameter("projectName").trim();
		String projectId=(String) request.getParameter("projectId").trim();
		System.out.println(clientName);
		System.out.println(clientId);
		System.out.println(projectName);
		System.out.println(projectId);
		System.out.println("catching all request parameter coming from addingProjectToClient_step2.jsp");
		//==========================first check is that for particular project any client is their already 
		//if yes then sending message that project has client 
		//else assigning client to project
		
		//List to store project having client
		String projectIdOfProjectWhichAlreadyHaveClient=null;
		String projectNameOfProjectWhichAlreadyHaveClient=null;
		String clientIdInProjectOfClientWhichAlreadyHaveProject=null;
		
		 
		List<String> checkProjectAssignedToClientOrNot=DAOImpl.checkProjectAssignedToClientOrNot(projectId);
		if(checkProjectAssignedToClientOrNot!=null) {
			projectIdOfProjectWhichAlreadyHaveClient=checkProjectAssignedToClientOrNot.get(0);
			projectNameOfProjectWhichAlreadyHaveClient=checkProjectAssignedToClientOrNot.get(1);
			clientIdInProjectOfClientWhichAlreadyHaveProject=checkProjectAssignedToClientOrNot.get(2);
		
		 	
	System.out.println(" not project assigning  to client and sending back to addingProjectToClient.jsp ");

				request.getSession().setAttribute("client not assigned to project successfully", "client not assigned to project successfully");
				request.getSession().setAttribute("projectBelongsToSomeClient", "projectBelongsToSomeClient");
				request.getSession().setAttribute("projectIdOfProjectWhichAlreadyHaveClient", projectIdOfProjectWhichAlreadyHaveClient);
				request.getSession().setAttribute("projectNameOfProjectWhichAlreadyHaveClient", projectNameOfProjectWhichAlreadyHaveClient);
				request.getSession().setAttribute("clientIdInProjectOfClientWhichAlreadyHaveProject", clientIdInProjectOfClientWhichAlreadyHaveProject);
				 
					return "redirect:/addingProjectToClient_step2?clientName="+clientName+"&clientId="+clientId;
				 
			}else { 
		//==============inserting clientId in project table in clientIdInProject column
				//when client has no project
				System.out.println("client has no project so assigning");
				
				
				success=DAOImpl.assiginProjectToClient(clientId, projectId);
		 
		
		
		//=========if client assigned successfully send message back 
			if(success>0) { 
					System.out.println("assigning project to client successfully");
					request.getSession().setAttribute("client assigned to project successfully", "client assigned to project successfully");
					return "redirect:/addingProjectToClient_step2?clientName="+clientName+"&clientId="+clientId;
				 
				
				//=========if client not assigned successfully send message back
			}else {
				System.out.println("not assignign project to client ");
				 
					request.getSession().setAttribute("client not assigned to project successfully", "client not assigned to project successfully");
					return "redirect:/addingEmployeeToProject_step2" ;
			 
			}
			 
			} 
	}
}
