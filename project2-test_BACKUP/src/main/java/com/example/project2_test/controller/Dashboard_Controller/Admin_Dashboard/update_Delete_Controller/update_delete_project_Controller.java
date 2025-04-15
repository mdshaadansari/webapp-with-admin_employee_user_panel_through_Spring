package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.update_Delete_Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.model.project;
 
@Controller
public class update_delete_project_Controller {
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="/update_delete_project_step1_selectingProjectId",method=RequestMethod.GET)
	public String  selectingProjectId(HttpServletRequest request) {
		
		System.out.println("selectingProjectId handler method in update_delete_project_Controller.java");
		String projectId = request.getParameter("projectId").trim();
		System.out.println(projectId);
		String projectName = null;
		String projectDateOfStart = null;
		String projectDateOfEnd = null;
		String clientIdInProject = null;

		
		// getting employee details from db by employee Id
		List<String>getAllProjectByProjectId=DAOImpl.getAllProjectByProjectId(projectId);
if(getAllProjectByProjectId!=null) {		
	projectId = getAllProjectByProjectId.get(0);
	projectName = getAllProjectByProjectId.get(1);
	projectDateOfStart =getAllProjectByProjectId.get(2);
	projectDateOfEnd =getAllProjectByProjectId.get(3);
	clientIdInProject =getAllProjectByProjectId.get(4);
		 

				request.getSession().setAttribute("project for this projectId", "project for this projectId");

				request.getSession().setAttribute("projectId", projectId);
				request.getSession().setAttribute("projectName", projectName);
				request.getSession().setAttribute("projectDateOfStart", projectDateOfStart);
				request.getSession().setAttribute("projectDateOfEnd", projectDateOfEnd);
				request.getSession().setAttribute("clientIdInProject", clientIdInProject);

				return"redirect:/update_delete_project_step1";

			} else {
				System.out.println("NO, their is no project for projectid in employee table in DB");
				request.getSession().setAttribute("no project for this projectId", "no project for this projectId");
				return "redirect:/update_delete_project_step1";
			}
		 

	}
	
	

	@RequestMapping(path="/update_delete_project_step1_updateButtonClick",method=RequestMethod.GET)
	public String  updateButtonClick(HttpServletRequest request) {
		System.out.println("updateButtonClick handler method in update_delete_project_Controller.java");
		String projectId = request.getParameter("projectId").trim();
		String projectName = request.getParameter("projectName").trim();
		String projectDateOfStart = request.getParameter("projectDateOfStart").trim();
		String projectDateOfEnd = request.getParameter("projectDateOfEnd").trim();
		String clientIdInProject = request.getParameter("clientIdInProject").trim();

		project project = new project(projectId, projectName, projectDateOfStart, projectDateOfEnd, clientIdInProject);
		// updateing project
		int success =DAOImpl.updateProject(project, projectId);
		if (success > 0) {

			request.getSession().setAttribute("project for this projectId", "project for this projectId");
			request.getSession().setAttribute("projectId", projectId);
			request.getSession().setAttribute("projectName", projectName);
			request.getSession().setAttribute("projectDateOfStart", projectDateOfStart);
			request.getSession().setAttribute("projectDateOfEnd", projectDateOfEnd);
			request.getSession().setAttribute("clientIdInProject", clientIdInProject);

			request.getSession().setAttribute("project updated", "project updated");
			return"redirect:/update_delete_project_step1";

		} else {
			request.getSession().setAttribute("projectId2", projectId);
			request.getSession().setAttribute("project not updated", "project not updated");
			return"redirect:/update_delete_project_step1";
		}
	
	}
	
	@RequestMapping(path="/update_delete_project_step1_DeleteButtonClick",method=RequestMethod.GET)
	public String  DeleteButtonClick(HttpServletRequest request) {
		System.out.println("DeleteButtonClick handler method in update_delete_project_Controller.java");
		String projectId3 = request.getParameter("projectId").trim();

		// deleting employee
		int success =DAOImpl.deleteProjectByProjectId(projectId3);
		if (success == 0) {
			request.getSession().setAttribute("projectId3", projectId3);
			request.getSession().setAttribute("project not deleted", "project not deleted");
			return"redirect:/update_delete_project_step1";
			
		}else if (success == 1) {
			request.getSession().setAttribute("project deleted", "project deleted");
			request.getSession().setAttribute("projectId3", projectId3);
			return "redirect:/update_delete_project_step1";
		
			
		} else if (success == 2) {
			request.getSession().setAttribute("project deleted & employee working on project also released", "project deleted & employee working on project also released");
			request.getSession().setAttribute("projectId3", projectId3);
			return"redirect:/update_delete_project_step1";
		}
		return null;


	}
	
}
