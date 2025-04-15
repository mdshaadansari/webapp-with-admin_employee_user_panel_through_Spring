package com.example.project2_test.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class  HomeController{
	 /*
	@Autowired
	HibernateTemplate hibernateTemplate;
	*/
	
	{
	System.out.println("HomeController");
	}
	@GetMapping(value={"/","Login"})
	public String loginPage() {
		System.out.println("loginPagemethod in mainController.java in controller.mainController folder");

		return "Login";
	}
	
	@GetMapping(value={ "adminDashboard"})
	public String adminDashboard() { 
		return "adminDashboard";
	}
	@GetMapping(value={ "selectProject_step1"})
	public String selectProject_step1() { 
		return "selectProject_step1";
	}
	@GetMapping(value={ "selectClient_step1"})
	public String selectClient_step1() { 
		return "selectClient_step1";
	}
	@GetMapping(value={ "selectClientToAddContactPerson_setp1"})
	public String selectClientToAddContactPerson_setp1() { 
		return "selectClientToAddContactPerson_setp1";
	}  
	@GetMapping(value={ "selectProjectToReleaseEmployee_step1"})
	public String selectProjectToReleaseEmployee_step1() { 
		return "selectProjectToReleaseEmployee_step1";
	} 
	@GetMapping(value={ "searchClient_step1"})
	public String searchClient_step1() { 
		return "searchClient_step1";
	}  
	@GetMapping(value={ "searchProject_step1"})
	public String searchProject_step1() { 
		return "searchProject_step1";
	}   
	@GetMapping(value={ "searchEmployee_step1"})
	public String searchEmployee_step1() { 
		return "searchEmployee_step1";
	}  
	@GetMapping(value={ "update_delete_client_step1"})
	public String update_delete_client_step1() { 
		return "update_delete_client_step1";
	}   
	@GetMapping(value={ "update_delete_project_step1"})
	public String update_delete_project_step1() { 
		return "update_delete_project_step1";
	}  
	@GetMapping(value={ "update_delete_employee_step1"})
	public String update_delete_employee_step1() { 
		return "update_delete_employee_step1";
	} 
	/*
	@GetMapping(value={ "clientLogin"})
	public String clientLogin() { 
		return "clientLogin";
	} 
	@GetMapping(value={ "employeeLogin"})
	public String employeeLogin() { 
		return "employeeLogin";
	} 
	
	 */
	@GetMapping(value={ "adminLoginView"})
	public String adminLoginView() { 
		return "adminLogin";
	} 

	@GetMapping(value={ "adminprovidingOTP"})
	public String adminprovidingOTP() { 
		return "adminprovidingOTP";
	} 

	
	@GetMapping(value={ "clientLoginView"})
	public String clientLoginView() { 
		return "clientLogin";
	} 
	@GetMapping(value={ "employeeLoginView"})
	public String employeeLoginView() { 
		return "employeeLogin";
	} 

	
	@GetMapping(value={ "addingEmployeeToProject_step2"})
	public String addingEmployeeToProject_step2() { 
		return "addingEmployeeToProject_step2";
	}  
	
	 
	@GetMapping(value={ "addingProjectToClient_step2"})
	public String addingProjectToClient_step2() { 
		return "addingProjectToClient_step2";
	} 

	@GetMapping(value={ "addingContactPersonToClient_step2"})
	public String addingContactPersonToClient_step2() { 
		return "addingContactPersonToClient_step2";
	} 

	
	@GetMapping(value={ "selectProjectToReleaseEmployee_step1_releasingEmployeeFromProject_step2"})
	public String selectProjectToReleaseEmployee_step1_releasingEmployeeFromProject_step2() { 
		return "selectProjectToReleaseEmployee_step1_releasingEmployeeFromProject_step2";
	} 
	
	  
	

	@GetMapping(value={ "clientDashboard_step1"})
	public String clientDashboard_step1() { 
		return "clientDashboard_step1";
	} 
	

	@GetMapping(value={ "employeeDashboard_step1"})
	public String employeeDashboard_step1() { 
		return "employeeDashboard_step1";
	} 
	

}
