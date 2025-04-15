package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.assign_Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
 
@Controller
public class addingEmployeeToProject_step2_releaseButtonclick_Controller {
	/*

	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender; 
	@RequestMapping(path="addingEmployeeToProject_step2_releaseButtonClientServlet", method=RequestMethod.GET)
public String addingEmployeeToProject_step2_releaseButtonClient (HttpServletRequest request ,HttpSession session) {
		System.out.println("addingEmployeeToProject_step2_releaseButtonClient handler method in selectProjectToReleaseEmployee_Controller.java");
		
		String projectName = request.getParameter("projectName").trim();
		String projectId = request.getParameter("projectId").trim();
		String employeeId = request.getParameter("employeeId").trim();
		String employeeName = request.getParameter("employeeName").trim();

		// ==========releasing employee from project
	 
			int i = DAOImpl. releaseEmployeeFromProject(employeeId,projectId);
			if(i>0) {
				System.out.println("yes, employee released from project"); 
				return "redirect:/addingEmployeeToProject_step2.jsp?projectId="+projectId+"&projectName="+projectName+"&emplyeeReleasedSuccessfully=emplyeeReleasedSuccessfully";
				
				
				
			}else {
				System.out.println("no, employee not released from project");
				return "redirect:/addingEmployeeToProject_step2.jsp?projectId="+projectId+"&projectName="+projectName+"&emplyeeNotReleasedSuccessfully=emplyeeNotReleasedSuccessfully";
				
			}
	}
*/
}
