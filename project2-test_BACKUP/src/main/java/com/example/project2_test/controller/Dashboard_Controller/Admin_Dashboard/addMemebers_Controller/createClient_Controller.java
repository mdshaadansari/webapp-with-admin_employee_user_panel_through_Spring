package com.example.project2_test.controller.Dashboard_Controller.Admin_Dashboard.addMemebers_Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.Admin_Dashboard.addMemebers_Service.createClient_Service;
import com.example.project2_test.Service.emailSender.emailSender;
import com.example.project2_test.idCreator.clientIdGenerator;
import com.example.project2_test.model.client;
import com.example.project2_test.model.contactPerson;
import com.example.project2_test.model.matchingQuesrStringKeyANDmodelPropertyNames.clientExtra; 
@Controller

@RequestMapping(path="/addClient")
@SessionAttributes({"comingFromaddClientButtonClick","clientId"})
public class createClient_Controller {

	@Autowired
	createClient_Service createClient_Service;
	
	@Autowired
	DAOInterface DAOImpl;
	
 	@Autowired
	emailSender emailSender;
	
	
	@RequestMapping(value="/addClientButtonClick" ,method= RequestMethod.GET)
	String addClientButtonClick (Model model ){
		System.out.println("addClientButtonClick handler method in createClient_Controller.java");

		// ==getting last clientId from client DB and sending to adminDashboard.jsp==============
		String lastClientIdFromClientDB = DAOImpl.getLastClientIDFromDB();
				if(lastClientIdFromClientDB!=null) {
				System.out.println("last clientId from DB is " + lastClientIdFromClientDB);

				//======(start)===incrementing clientId which is coming from DB=======
				lastClientIdFromClientDB=clientIdGenerator.generateNextId(lastClientIdFromClientDB);
				//================================================================
				System.out.println("new clientId genrated " + lastClientIdFromClientDB); 
				

				//session.setAttribute("comingFromaddClientButtonClick","comingFromaddClientButtonClick");
				//session.setAttribute("clientId", lastClientIdFromClientDB); 
				model.addAttribute("comingFromaddClientButtonClick", "comingFromaddClientButtonClick");
				model.addAttribute("clientId",lastClientIdFromClientDB);
			return "adminDashboard";
				 

				// =======if no clientId is  not in DB then creating first clientId and sending to
				// adminDashboard.jsp========

			} else {
				String clientId = "client-001"; 
				
				System.out.println("no clientId in DB ,so creating new clientId "+clientId);
			//	session.setAttribute("comingFromaddClientButtonClick", "comingFromaddClientButtonClick");
				//session.setAttribute("clientId", clientId); 
				model.addAttribute("comingFromaddClientButtonClick", "comingFromaddClientButtonClick");
				model.addAttribute("clientId",clientId);
				return "adminDashboard";
			}

	 

		// =========================================================
 
	 
	}
	
	
	
	@RequestMapping(value="/addClientInDB" ,method= RequestMethod.GET) 
	String addClientInDB (HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(name="clientId") String lastClientIdFromClientDB,
			@RequestParam(name="client-name") String client_name,
			@RequestParam(name="clientEmail") String clientEmail,
			@RequestParam(name="client date") String clientRelationshaipDate
			) {
		System.out.println(lastClientIdFromClientDB);
		System.out.println(client_name);
		System.out.println(clientEmail);
		System.out.println(clientRelationshaipDate); 
		/*	
		  String lastClientIdFromClientDB=request.getParameter("clientId").trim();
			String  client_name=request.getParameter("client-name").trim();
			String clientEmail=request.getParameter("clientEmail").trim();
			String clientRelationshaipDate=request.getParameter("client date").trim();
			*/
			String  contactPersonName=request.getParameter("contactPersonName").trim();
			String contactPersonEmail=request.getParameter("contactPersonEmail").trim();
			String contactPersonPhone=request.getParameter("contactPersonPhone").trim();
			String contactPersonDesignation=request.getParameter("contactPersonDesignation").trim();
			 
		System.out.println("addClientInDB handler method in createClient_Controller.java");
 
		contactPerson contactPerson =new contactPerson (contactPersonName.trim(),contactPersonEmail.trim(),contactPersonPhone.trim(),contactPersonDesignation.trim(),lastClientIdFromClientDB.trim()); 
		 client client=new client(lastClientIdFromClientDB.trim(),client_name.trim(),clientEmail.trim(),clientRelationshaipDate.trim() );
		 
		String result=createClient_Service.addClientInDB_Service(contactPerson,client);
		
		
		if(result.equals("client not added successfully,problem in DB")){
			 session.setAttribute("client not added successfully,problem in DB","client not added successfully,problem in DB"); 
								 return "redirect:/adminDashboard";
			
		}else if(result.equals("contactPerson not added successfully,problem in DB")){
			 session.setAttribute("contactPerson not added successfully,problem in DB","contactPerson not added successfully,problem in DB");
			 return "redirect:/adminDashboard";
		}else if(result.equals("client added successfully")){
			
		
 
				 
				
		 
					///sending login credentials to client email and contact person
				System.out.println("sending email");
					emailSender.sendEmail(clientEmail, client_name+" you have joined by admin", "Login with your email "+"http://localhost:8080/project1_1_february_2025/clientLogin.jsp");
					emailSender.sendEmail(contactPersonEmail, "welcome "+contactPersonName, client_name+" added you as contact person ");
					System.out.println("email sent");	
					
					//creating new clientId based on what is already availabe in DB and sending back to adminDashboard.jsp
				 
					 lastClientIdFromClientDB = DAOImpl . getLastClientIDFromDB(); 
					if (lastClientIdFromClientDB!=null) {
						  System.out.println(lastClientIdFromClientDB +" is last emailId present in db");
					}
					 
					//======(start)===incrimenting employeeId which is coming from DB=======
					lastClientIdFromClientDB=clientIdGenerator.generateNextId(lastClientIdFromClientDB);
					System.out.println("new clientID genrated " + lastClientIdFromClientDB); 
					//================================================================

					model.addAttribute("comingFromaddClientButtonClick","comingFromaddClientButtonClick");
					//as in 1st handler method we set clientId in session attribute use @SessionAttribute, control goes to .jsp
					//then controll moves to this handler method ,and if we try to update clientId using session.setTtributes 
					//in spring session will not get updated ,
					//session scope set using key made in @SessionAttributes by using model.addAttribute is only updated by model.addAttribute,
					//not session.setAttribute  
					//session.setAttribute("clientId", lastClientIdFromClientDB);
					model.addAttribute("clientId", lastClientIdFromClientDB); 

					//===client added successfully and login credentials send to client email ,email send to contactPerson , and sending message back to adminDashboard.jsp====
					session.setAttribute("client added successfully", "client added successfully");
					session.setAttribute("login credentials send to client email", "login credentials send to client email");
					session.setAttribute("welcome send to contact person email", "welcome send to contact person email");
					
						System.out.println("client added successfully"); 
						System.out.println(lastClientIdFromClientDB +" new generated sending to adminDahboard.jsp");
				 
				return "redirect:/adminDashboard";
					 
			 
		// =========================================================

		}
		
		
		 session.setAttribute("client not added successfully,problem in DB","client not added successfully,problem in DB"); 
		 return "redirect:/adminDashboard"; 
	}
		
	@ExceptionHandler(Exception.class)
	public String excep(HttpSession session,Model model,Exception e) {
		//if using model.addAttribute(@SessionAttribute to update or put  newly anything in session,in @ExceptionHandler method it will not work,
		//(if after doing model.addAttribute we use model.getAttribute then it will show but actually it will not get set in session scope),
		//use HttpSession object instead
		
		//in exception handeler method if we try to update that is set in session by model.addAttribute, by doing model.addAttribute, it will not update
		//use HttpSession object instead
		
		System.out.println("exception in createClient_Controller.java, sending back to admin dashboard");
		System.out.println(e.getMessage());
		 e.printStackTrace();
		 
		 
		 //not doing proper here, its kust testing, do validation first of data coming, then if validation fails then return to frontend with some message or,
		 //throw exception catch here and decide what mesage to give in frontend,
		 //else if validation is right the put data in DB
		System.out.println(session.getAttribute("clientId"));
		 session.setAttribute("comingFromaddClientButtonClick","comingFromaddClientButtonClick");
		// session.setAttribute("clientId","new client ID");
		System.out.println(session.getAttribute("clientId"));
		  return "adminDashboard";
		
	} 
}