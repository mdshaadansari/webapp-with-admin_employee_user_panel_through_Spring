package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.assign_Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.model.contactPerson;
 
@Controller
public class addContactPersonToClient_Controller {
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="addContactPersonToClientServlet_step3", method=RequestMethod.GET)
	public String addContactPersonToClient (HttpServletRequest request ,HttpSession session) {
		System.out.println("addContactPersonToClient handler method in addContactPersonToClient_Controller.java");
		
		String clientName = request.getParameter("clientName").trim();
		String clientId = request.getParameter("clientId").trim();
		String contactPersonName = request.getParameter("contactPersonName").trim();
		String contactPersonEmail = request.getParameter("contactPersonEmail").trim();
		String contactPersonPhone = request.getParameter("contactPersonPhone").trim();
		String contactPersonDesignation = request.getParameter("contactPersonDesignation").trim();

		
		contactPerson contactPerson =new contactPerson(contactPersonName, contactPersonEmail, contactPersonPhone, contactPersonDesignation, clientId) ;
		// adding incoming contactperson for client id in contact person DB

		 
			 
			int success=DAOImpl.insertIntoContactPerson2(contactPerson);
			if(success>0) {
				System.out.println("((((successful))) adding incoming contactperson for client id in contact person DB");	
				
				
				request.getSession().setAttribute("Contact Person added successfully", "Contact Person added successfully");
				return "redirect:/addingContactPersonToClient_step2?clientId="+clientId+"&clientName="+clientName;
				
				
				
			}else {
				System.out.println("((((UNSUCCESSFULL))) adding incoming contactperson for client id in contact person DB");
				request.getSession().setAttribute("fail adding Contact Person", "fail adding Contact Person");
				return "redirect:/addingContactPersonToClient_step2?clientId="+clientId+"&clientName="+clientName;
				
			}
			
			
			
			
		
	}
}
