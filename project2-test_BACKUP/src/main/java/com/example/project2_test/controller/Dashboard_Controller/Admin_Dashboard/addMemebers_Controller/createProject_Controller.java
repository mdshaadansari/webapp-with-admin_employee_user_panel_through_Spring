package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.addMemebers_Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.Admin_Dashboard.addMemebers_Service.createProject_Service;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.idCreator.projectIdGenerator;
import com.example.project2_test.model.project;
 
 
@Controller

@RequestMapping(path="/addProject")
public class createProject_Controller {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	
	@Autowired
	createProject_Service createProject_Service;
	
	@RequestMapping(value="/addProjectButtonClick" ,method= RequestMethod.GET)
	String addProjectButtonClick (HttpSession session ){
		System.out.println("addProjectButtonClick handler method in createProject_Controller.java");
 
		// ==getting last projectId from project DB and sending to adminDashboard.jsp==============
		String lastProjectIdFromProjectDB =DAOImpl. getLastProjectIDFromDB();
		if(lastProjectIdFromProjectDB!=null) {
		System.out.println("last project from DB is " + lastProjectIdFromProjectDB);

		//======(start)===incrimenting projectId which is coming from DB=======
		lastProjectIdFromProjectDB=projectIdGenerator.generateNextId(lastProjectIdFromProjectDB);
		//================================================================
		System.out.println("new project genrated " + lastProjectIdFromProjectDB);
		java.time.LocalDate l=  java.time.LocalDate.now();
		String s=l.getDayOfMonth()+"-"+ l.getMonth() +"-"+ l.getYear();
		

		session.setAttribute("comingFromaddProjectButtonClick","comingFromaddProjectButtonClick");
		session.setAttribute("projectId", lastProjectIdFromProjectDB);
		session.setAttribute("projectDateOfStart", s);
		 
		return "adminDashboard";
		 

		// =======if no project is not in DB then creating first projectId and sending to
		// adminDashboard.jsp========

	} else {
		String projectId = "project-001";
		java.time.LocalDate l=  java.time.LocalDate.now();
		String s=l.getDayOfMonth()+"-"+ l.getMonth() +"-"+ l.getYear();
		
		System.out.println("no project in DB ,so creating new projectId "+projectId);
		session.setAttribute("comingFromaddProjectButtonClick", "comingFromaddProjectButtonClick");
		session.setAttribute("projectId", projectId);
		session.setAttribute("projectDateOfStart", s);
		 
			return "adminDashboard" ;
	 
	}

 
// =========================================================
 
	 
	}
	
	
	
	@RequestMapping(value="/addProjectInDB" ,method= RequestMethod.GET)
	String addProjectInDB (HttpSession session ,HttpServletRequest request ,
		@RequestParam(name="projectId") String lastProjectIdFromProjectDB,
		@RequestParam(name="project-name") String project_name,
		@RequestParam(name="Starting Date") String Starting_Date,
		@RequestParam(name="Ending date") String Ending_date 
		){

			System.out.println("addProjectInDB handler method in createProject_Controller.java");
		 
	System.out.println(lastProjectIdFromProjectDB);
	System.out.println(project_name);
	System.out.println(Starting_Date);
	System.out.println(Ending_date);
	 
		
		/*
		String lastProjectIdFromProjectDB = request.getParameter("projectId").trim();
		String project_name = request.getParameter("project-name").trim();
		String Starting_Date = request.getParameter("Starting Date").trim();
		String Ending_date = request.getParameter("Ending date").trim();
*/
		project project = new project(lastProjectIdFromProjectDB.trim(), project_name.trim(), Starting_Date.trim(), Ending_date.trim());

		// inserting data in project table
		String result=createProject_Service.addProjectInDB_Service(project);
		
		if(result.equals("project not add, problem in DB")) {
			System.out.println("Project not added successfully");
			request.getSession().setAttribute("project not add, problem in DB", "project not add, problem in DB"); 
		return"redirect:/adminDashboard";
		}else if(result.equals("Project added successfully")){
			
		
		 

		// creating new projectId based on what is already availabe in DB, creating todays date sending back to adminDashboard.jsp 
		lastProjectIdFromProjectDB = DAOImpl.getLastProjectIDFromDB();
		if (lastProjectIdFromProjectDB != null) {
			System.out.println(lastProjectIdFromProjectDB + " is last projectId present in db");
		}

		// ======(start)===incrimenting projectId which is coming from DB and send new projectId to admin.jsp=======
		lastProjectIdFromProjectDB = projectIdGenerator.generateNextId(lastProjectIdFromProjectDB);
		// ================================================================
		 
		java.time.LocalDate l = java.time.LocalDate.now();
		String s = l.getDayOfMonth() + "-" + l.getMonth() + "-" + l.getYear();
		System.out.println(lastProjectIdFromProjectDB + " new generated sending to adminDahboard.jsp");

		session.setAttribute("comingFromaddProjectButtonClick", "comingFromaddProjectButtonClick");
		session.setAttribute("projectId", lastProjectIdFromProjectDB);
		session.setAttribute("projectDateOfStart", s);

		// ===project added successfully in DB message to adminDashboard.jsp====
		session.setAttribute("project added successfully in DB", "project added successfully in DB");
		session.setAttribute("project_name", project_name);

		System.out.println("Project added successfully");
 
		return "redirect:/adminDashboard";
		}
		request.getSession().setAttribute("project not add, problem in DB", "project not add, problem in DB"); 
		return"redirect:/adminDashboard";
		// =========================================================
	}
	
	
 
	
}