package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.update_Delete_Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.model.employee;
 
@Controller
public class update_delete_employee_Controller {
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="/update_delete_employee_step1_selectingEmployeeId",method=RequestMethod.GET)
	public String   selectingEmployeeId(HttpServletRequest request) {
		System.out.println("selectingEmployeeId handler method in update_delete_employee_Controller.java");
		String employeeId = request.getParameter("employeeId").trim();

		String employeeName = null;
		String employeeDept = null;
		String employeeEmail = null;
		String employeePhone = null;
		String employeeDOJ = null;
		String projectIdInEmployee = null;

		// getting employee details from db by employee Id
List<String>getAllEmployeeByEmployeeId=DAOImpl.getAllEmployeeByEmployeeId(employeeId);
if(getAllEmployeeByEmployeeId!=null) {
	employeeId=getAllEmployeeByEmployeeId.get(0);
	employeeName=getAllEmployeeByEmployeeId.get(1);
	employeeDept=getAllEmployeeByEmployeeId.get(2);
	employeeEmail=getAllEmployeeByEmployeeId.get(3);
	employeePhone=getAllEmployeeByEmployeeId.get(4);
	employeeDOJ=getAllEmployeeByEmployeeId.get(5);
	projectIdInEmployee=getAllEmployeeByEmployeeId.get(6);
 

				request.getSession().setAttribute("employee for this employeeId", "employee for this employeeId");
				request.getSession().setAttribute("employeeId", employeeId);
				request.getSession().setAttribute("employeeName", employeeName);
				request.getSession().setAttribute("employeeDept", employeeDept);
				request.getSession().setAttribute("employeeEmail", employeeEmail);
				request.getSession().setAttribute("employeePhone", employeePhone);
				request.getSession().setAttribute("employeeDOJ", employeeDOJ);
				request.getSession().setAttribute("projectIdInEmployee", projectIdInEmployee);

				return "redirect:/update_delete_employee_step1";

			} else {
				request.getSession().setAttribute("no employee for this employeeId", "no employee for this employeeId");
				return "redirect:/update_delete_employee_step1" ;
			}
		 
		 

	}
	
	

	@RequestMapping(path="/update_delete_employee_step1_updateButtonClick",method=RequestMethod.GET)
	public String  updateButtonClick(HttpServletRequest request) {
		System.out.println("updateButtonClick handler method in update_delete_employee_Controller.java");
		String employeeId=request.getParameter("employeeId").trim();
		String employeeName=request.getParameter("employeeName").trim();
		String employeeDept=request.getParameter("employeeDept").trim();
		String employeeEmail=request.getParameter("employeeEmail").trim();
		String employeePhone=request.getParameter("employeePhone").trim();
		String employeeDOJ=request.getParameter("employeeDOJ").trim();
		String projectIdInEmployee=request.getParameter("projectIdInEmployee").trim();
		
 employee employee =new  employee(employeeId, employeeDOJ, employeeName, employeeDept, employeeEmail, employeePhone,projectIdInEmployee);
		// updateing employee 
int success=DAOImpl.updateEmployee(employee, employeeId);
		if(success>0) {
			 
				
				request.getSession().setAttribute("employee for this employeeId", "employee for this employeeId");
				request.getSession().setAttribute("employeeId", employeeId);
				request.getSession().setAttribute("employeeName", employeeName);
				request.getSession().setAttribute("employeeDept", employeeDept);
				request.getSession().setAttribute("employeeEmail", employeeEmail);
				request.getSession().setAttribute("employeePhone", employeePhone);
				request.getSession().setAttribute("employeeDOJ", employeeDOJ);
				request.getSession().setAttribute("projectIdInEmployee", projectIdInEmployee);


				
				request.getSession().setAttribute("employee updated", "employee updated");
			return"redirect:/update_delete_employee_step1";


			} else {
				request.getSession().setAttribute("employeeId2", employeeId);
				request.getSession().setAttribute("employee not updated", "employee not updated");
				return"redirect:/update_delete_employee_step1";
			}
	}
	
	@RequestMapping(path="/update_delete_employee_step1_DeleteButtonClick",method=RequestMethod.GET)
	public String  DeleteButtonClick(HttpServletRequest request) {
		System.out.println("DeleteButtonClick handler method in update_delete_employee_Controller.java");
		String employeeId2=request.getParameter("employeeId").trim();
		 
		// deleting employee 
int success=DAOImpl.deleteEmployeeByEmployeeId(employeeId2);
if(success>0) {
		 
			 
				
				request.getSession().setAttribute("employee deleted", "employee deleted");
				 request.getSession().setAttribute("employeeId2", employeeId2);
				  
				
				 return"redirect:/update_delete_employee_step1" ;

			} else {
				request.getSession().setAttribute("employeeId2", employeeId2);
				request.getSession().setAttribute("employee not deleted", "employee not deleted");
				return"redirect:/update_delete_employee_step1" ;
			}

	}
	
}
