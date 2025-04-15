package com.example.project2_test.Service.Admin_Dashboard.addMemebers_Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.idCreator.projectIdGenerator;
import com.example.project2_test.model.project;
 
 
@Service
public class createProject_Service {

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	 
	 
	 
	 
	public String addProjectInDB_Service (project project  ){
		System.out.println("addProjectInDB_Service   method in createProject_Service.java");
 
		// inserting data in project table
		String success=DAOImpl.insertIntoProject(project);
		if((success==null)) {
			System.out.println("Project not added successfully");
//			request.getSession().setAttribute("project not add, problem in DB", "project not add, problem in DB"); 
//		return"redirect:/adminDashboard.jsp";
			return "project not add, problem in DB";
		}

		// creating new projectId based on what is already availabe in DB, creating todays date sending back to adminDashboard.jsp 
//		lastProjectIdFromProjectDB = DAOImpl.getLastProjectIDFromDB();
//		if (lastProjectIdFromProjectDB != null) {
//			System.out.println(lastProjectIdFromProjectDB + " is last projectId present in db");
//		}
//
//		// ======(start)===incrimenting projectId which is coming from DB and send new projectId to admin.jsp=======
//		lastProjectIdFromProjectDB = projectIdGenerator.generateNextId(lastProjectIdFromProjectDB);
//		// ================================================================
//		 
//		java.time.LocalDate l = java.time.LocalDate.now();
//		String s = l.getDayOfMonth() + "-" + l.getMonth() + "-" + l.getYear();
//		System.out.println(lastProjectIdFromProjectDB + " new generated sending to adminDahboard.jsp");
//
//		session.setAttribute("comingFromaddProjectButtonClick", "comingFromaddProjectButtonClick");
//		session.setAttribute("projectId", lastProjectIdFromProjectDB);
//		session.setAttribute("projectDateOfStart", s);
//
//		// ===project added successfully in DB message to adminDashboard.jsp====
//		session.setAttribute("project added successfully in DB", "project added successfully in DB");
//		session.setAttribute("project_name", project_name);
//
//		System.out.println("Project added successfully");
// 
//		return "redirect:/adminDashboard.jsp";
		return "Project added successfully";
		 
		// =========================================================
	}
	
	
 
	
}