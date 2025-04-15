package com.example.project2_test.controller.Dashboard_Controller.employee_Dashboard;

import java.io.IOException;
import java.time.LocalTime;
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
public class Employee_Dashboard_controller {
	 
	
	@RequestMapping(value="/employeeDashBoard_step1_employeeDashboard_MyProfileButtonClick_step2" ,method= RequestMethod.GET)
	String MyProfileButtonClickinEmployeeDashboard (HttpSession session ){
		System.out.println("MyProfileButtonClickinEmployeeDashboard handler method in Employee_Dashboard_controller.java");
		session.setAttribute("show my details","show my details");
		return "employeeDashboard_step1";
 
	 
	}
	
	
	
	@RequestMapping(value="/employeeDashBoard_step1_employeeDashboard_AssignedOnProjectButtonClick_step2" ,method= RequestMethod.GET)
	String assignedOnProjectButtonClick (HttpSession session ){
		System.out.println("assignedOnProjectButtonClick handler method in Employee_Dashboard_controller.java");

		 session.setAttribute("show my Project","show my Project");
		return "employeeDashboard_step1" ;
 
	 
	}
	
	

	 
	
}