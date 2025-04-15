package com.example.project2_test.controller.Dashboard_Controller.client_Dashboard;

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
public class Client_Dashboard_controller {
	 
	
	@RequestMapping(value="/clientDashBoard_step1_clientDashboard_MyProfileButtonClick_step2" ,method= RequestMethod.GET)
	String MyProfileButtonClick (HttpSession session ){
		System.out.println("MyProfileButtonClick handler method in Client_Dashboard_controller.java");
 
		session.setAttribute("show my details","show my details");
		return "clientDashboard_step1" ;
  
 
	 
	}
	
	
	
	@RequestMapping(value="/clientDashBoard_step1_clientDashboard_MyProjectButtonClick_step2" ,method= RequestMethod.GET)
	String MyProjectButtonClick (HttpSession session ){
		System.out.println("MyProjectButtonClick handler method in Client_Dashboard_controller.java");

		 session.setAttribute("show my Project","show my Project");
		return "clientDashboard_step1" ;
 
	 
	}
	
	

	@RequestMapping(value="/clientDashBoard_step1_clientDashboard_EmployeeOnMYProjectButtonClick_step2" ,method= RequestMethod.GET)
	String EmployeeOnMYProjectButtonClick (HttpSession session ){
		System.out.println("EmployeeOnMYProjectButtonClick handler method in Client_Dashboard_controller.java");
		session.setAttribute("show employee on my Project","show employee on my Project");
		return "clientDashboard_step1" ;
	 
	}
	
}