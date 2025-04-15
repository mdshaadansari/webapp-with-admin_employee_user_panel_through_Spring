package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.update_Delete_Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.model.client;
 
@Controller
public class update_delete_client_Controller {
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;

	@RequestMapping(path="/update_delete_client_step1_selectingClientId",method=RequestMethod.GET)
	public String selectingClientId(HttpServletRequest request) {
		System.out.println("selectingClientId handler method in update_delete_client_Controller.java");
		String clientId=request.getParameter("clientId").trim();

		String clientId2=null;
		String clientName=null;
		String emailClient=null;
		String clientRelationshaipDate=null; 
		
		// getting client details from db by client Id
List<String>getAllClientByClientId=DAOImpl.getAllClientByClientId(clientId);
if(getAllClientByClientId!=null) {
	clientId2=getAllClientByClientId.get(0);
	clientName=getAllClientByClientId.get(1);
	emailClient=getAllClientByClientId.get(2);
	clientRelationshaipDate=getAllClientByClientId.get(3);
	 
				
				request.getSession().setAttribute("client for this clientId", "client for this clientId");
				request.getSession().setAttribute("clientId2", clientId2);
				request.getSession().setAttribute("clientName", clientName);
				request.getSession().setAttribute("emailClient", emailClient);
				request.getSession().setAttribute("clientRelationshaipDate", clientRelationshaipDate);
				
				return "redirect:/update_delete_client_step1";

			} else {
				request.getSession().setAttribute("no client for this clientId", "no client for this clientId");
				return "redirect:/update_delete_client_step1";
			}
		 

	}
	
	

	@RequestMapping(path="/update_delete_client_step1_updateButtonClick",method=RequestMethod.GET)
	public String  updateButtonClick(HttpServletRequest request) {
		System.out.println("updateButtonClick handler method in update_delete_client_Controller.java");
	
		String clientId2=request.getParameter("clientId2").trim();
		String clientName=request.getParameter("clientName").trim();
		String emailClient=request.getParameter("emailClient").trim();
		String clientRelationshaipDate=request.getParameter("clientRelationshaipDate").trim();
		
 client client =new client (clientId2, clientName, emailClient, clientRelationshaipDate);
		
		// updateing client 
 int success= DAOImpl.updateClient(client, clientId2);
if(success>0) {
		
	 
			 
				
				request.getSession().setAttribute("client for this clientId", "client for this clientId");
				request.getSession().setAttribute("clientId2", clientId2);
				request.getSession().setAttribute("clientName", clientName);
				request.getSession().setAttribute("emailClient", emailClient);
				request.getSession().setAttribute("clientRelationshaipDate", clientRelationshaipDate);
				
				
				request.getSession().setAttribute("client updated", "client updated");
				return"redirect:/update_delete_client_step1";

			} else {
				request.getSession().setAttribute("client not updated", "client not updated");
				return"redirect:/update_delete_client_step1";
			}
	 
	
	}
	
	@RequestMapping(path="/update_delete_client_step1_DeleteButtonClick",method=RequestMethod.GET)
	public String  DeleteButtonClick(HttpServletRequest request) {
		System.out.println("DeleteButtonClick handler method in update_delete_client_Controller.java");
		String clientId2 = request.getParameter("clientId2").trim();

		// deleting client
		int success =DAOImpl.deleteClientByClientId(clientId2);
		if (success == 0) {
			System.out.println(success);
			request.getSession().setAttribute("client not deleted", "client not deleted");
			return"redirect:/update_delete_client_step1";
			
		} else if(success==1) {
			System.out.println(success);
			request.getSession().setAttribute("client deleted", "client deleted");
			request.getSession().setAttribute("clientId2", clientId2);

			return"redirect:/update_delete_client_step1";

		}else if(success==2) {
//			client dleted, contactperson released
			System.out.println(success);
			request.getSession().setAttribute("client deleted, contactperson released", "client deleted, contactperson released");
			return"redirect:/update_delete_client_step1";
			
			
		}else if(success==3) {
//			client dleted, contactperson released
			System.out.println(success);
			request.getSession().setAttribute("client deleted, contactperson released, project released", "client deleted, contactperson released, project released");
			return"redirect:/update_delete_client_step1";
	
		}
		return null;

	}
	
}
