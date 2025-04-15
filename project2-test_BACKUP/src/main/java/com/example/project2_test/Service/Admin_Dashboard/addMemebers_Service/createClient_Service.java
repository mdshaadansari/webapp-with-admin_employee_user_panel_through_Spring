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
import com.example.project2_test.idCreator.clientIdGenerator;
import com.example.project2_test.model.client;
import com.example.project2_test.model.contactPerson;
 
@Service
public class createClient_Service {

	@Autowired
	DAOInterface DAOImpl;
	 
	 

		// =========================================================
 
	  
	
	
	public String addClientInDB_Service (contactPerson contactPerson ,client client){  
System.err.println("addClientInDB_Service method in  createClient_Service.java"); 
System.err.println(client.getClientID());
		 

				// =======  storing incoming client details and contactPerson in DB=====

			String success=	DAOImpl.insertIntoClient(client);
			
			int success2=	DAOImpl.insertIntoContactPerson(contactPerson);
				 if((success==null )) {
//					 session.setAttribute("client not added successfully,problem in DB","client not added successfully,problem in DB"); 
 //				 return "redirect:/adminDashboard.jsp";
					 return "client not added successfully,problem in DB";
						
				 }
				 if(!(success2>0 )) {
					 //session.setAttribute("contactPerson not added successfully,problem in DB","contactPerson not added successfully,problem in DB");
					// return "redirect:/adminDashboard.jsp";
					 return "contactPerson not added successfully,problem in DB";

						
				 }
				 
				
		 
					///sending login credentials to client email and contact person
//				 System.out.println("client and contactperson added successfully");
//				System.out.println("sending email");
//					emailSender.sendEmail(client.getEmailClient(), client.getClientName()+" you have joined by admin", "Login with your email "+"http://localhost:8080/project1_1_february_2025/clientLogin.jsp");
//					emailSender.sendEmail(contactPerson.getContactPersonEmail(), "welcome "+contactPerson.getContactPersonName(), client.getClientName()+" added you as contact person ");
//					System.out.println("email sent");	
					
					//creating new clientId based on what is already availabe in DB and sending back to adminDashboard.jsp
				 
//					String lastClientIdFromClientDB=null; 
//					lastClientIdFromClientDB = DAOImpl . getLastClientIDFromDB(); 
//					if (lastClientIdFromClientDB!=null) {
//						  System.out.println(lastClientIdFromClientDB +" is last emailId present in db");
//					}
					 
					//======(start)===incrimenting employeeId which is coming from DB=======
//					lastClientIdFromClientDB=clientIdGenerator.generateNextId(lastClientIdFromClientDB);
//					System.out.println("new clientID genrated " + lastClientIdFromClientDB); 
					//================================================================

//					session.setAttribute("comingFromaddClientButtonClick","comingFromaddClientButtonClick");
//					session.setAttribute("clientId", lastClientIdFromClientDB); 
//
//					//===client added successfully and login credentials send to client email ,email send to contactPerson , and sending message back to adminDashboard.jsp====
//					session.setAttribute("client added successfully", "client added successfully");
//					session.setAttribute("login credentials send to client email", "login credentials send to client email");
//					session.setAttribute("welcome send to contact person email", "welcome send to contact person email");
					
//						System.out.println("client added successfully"); 
//						System.out.println(lastClientIdFromClientDB +" new generated sending to adminDahboard.jsp");
				 
//				return "redirect:/adminDashboard.jsp";
						return "client added successfully";
					 
			 
		// =========================================================


 
	 
	}
	
	
 
	
}