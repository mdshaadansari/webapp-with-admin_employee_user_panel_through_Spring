package com.example.project2_test.controller.mainController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mainController {


	
	
	@RequestMapping(path="/Controller", method = RequestMethod.GET)
	public String mainController(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException {
		
	System.out.println("in mainController.java in controller.mainController folder");

		
		//=======================title bar==========================
		
		//URi->addEmployeeButtonClick
		String addEmployeeButtonClick=request.getParameter("addEmployeeButtonClick");
		if(addEmployeeButtonClick!=null && addEmployeeButtonClick.toString().equals("addEmployeeButtonClick")) {
			return "forward:/addEmployeeButtonClick";
		}
		//(END))URi->addEmployeeButtonClick
		
		//URi->addProjectButtonClick
				String addProjectButtonClick=request.getParameter("addProjectButtonClick");
				if(addProjectButtonClick!=null && addProjectButtonClick.toString().equals("addProjectButtonClick")) {
					return "forward:/addProjectButtonClick";
				}
				//(END))URi->addProjectButtonClick
				
				//URi->addClientButtonClick
				String addClientButtonClick=request.getParameter("addClientButtonClick");
				if(addClientButtonClick!=null && addClientButtonClick.toString().equals("addClientButtonClick")) {
					return "forward:/addClientButtonClick";
				}
				//(END))URi->addClientButtonClick
		//====((((END))))=======title bar==========================
		// from adminLogin.jsp
		String adminLogin = request.getParameter("adminLogin");
		if (adminLogin != null && adminLogin.toString().equals("adminLogin")) {

			return "forward:/adminLogin?" + request.getParameter("email");
		}

		// ((((((END))))))from adminLogin.jsp

		// from clientLogin.jsp
		String clientLogin = request.getParameter("clientLogin");
		if (clientLogin != null && clientLogin.toString().equals("clientLogin")) {

			return "forward:/clientLogin?" + request.getParameter("email");
		}
		// (((END))))))from clientLogin.jsp

		// from employeeLogin.jsp
		String employeeLogin = request.getParameter("employeeLogin");
		if (employeeLogin != null && employeeLogin.toString().equals("employeeLogin")) {

			return "forward:/employeeLogin?" + request.getParameter("email");
		}
		// (((END))))))from employeeLogin.jsp

		// =========================clientDashboard_step1.jsp==================================
		// from clientDashboard_step1.jsp
		String a1 = request.getParameter("a1");
		if (a1 != null && a1.toString().equals("clientDashBoard_step1_clientDashboard_MyProfileButtonClick_step2")) {

			return "forward:/clientDashBoard_step1_clientDashboard_MyProfileButtonClick_step2";
		}
		// (((END))))))from clientDashboard_step1.jsp

		// from clientDashboard_step1.jsp
		String a2 = request.getParameter("a2");
		if (a2 != null && a2.toString().equals("clientDashBoard_step1_clientDashboard_MyProjectButtonClick_step2")) {

			return "forward:/clientDashBoard_step1_clientDashboard_MyProjectButtonClick_step2";
		}
		// (((END))))))from clientDashboard_step1.jsp

		// from clientDashboard_step1.jsp
		String a3 = request.getParameter("a3");
		if (a3 != null
				&& a3.toString().equals("clientDashBoard_step1_clientDashboard_EmployeeOnMYProjectButtonClick_step2")) {

			return "forward:/clientDashBoard_step1_clientDashboard_EmployeeOnMYProjectButtonClick_step2";
		}
		// (((END))))))from clientDashboard_step1.jsp

		// from clientDashboard_step1.jsp
		String clientLogOutButtonServlet = request.getParameter("clientLogOutButtonServlet");
		if (clientLogOutButtonServlet != null
				&& clientLogOutButtonServlet.toString().equals("clientLogOutButtonServlet")) {

			return "forward:/clientLogOutButtonServlet";
		}
		// (((END))))))from clientDashboard_step1.jsp

		// ===============(END)==========clientDashboard_step1.jsp==================================

		// =======================employeeDashboard_step1.jsp==================================
		// from employeeDashboard_step1.jsp
		String a4 = request.getParameter("a4");
		if (a4 != null
				&& a4.toString().equals("employeeDashBoard_step1_employeeDashboard_MyProfileButtonClick_step2")) {

			return "forward:/employeeDashBoard_step1_employeeDashboard_MyProfileButtonClick_step2";
		}
		// (((END))))))from employeeDashboard_step1.jsp

		// from employeeDashboard_step1.jsp
		String a5 = request.getParameter("a5");
		if (a5 != null && a5.toString()
				.equals("employeeDashBoard_step1_employeeDashboard_AssignedOnProjectButtonClick_step2")) {

			return "forward:/employeeDashBoard_step1_employeeDashboard_AssignedOnProjectButtonClick_step2";
		}
		// (((END))))))from employeeDashboard_step1.jsp

		// from employeeDashboard_step1.jsp
		String a6 = request.getParameter("a6");
		if (a6 != null && a6.toString().equals("employeeLogOutButtonServlet")) {

			return "forward:/employeeLogOutButtonServlet";
		}
		// (((END))))))from employeeDashboard_step1.jsp

		// =========((((END)))==============employeeDashboard_step1.jsp==================================

		// ========================================adminDashboard.jsp============================
		// URI-> adminLogOutButtonServlet
		String adminLogOutButtonServlet = request.getParameter("adminLogOutButtonServlet");
		if (adminLogOutButtonServlet != null
				&& adminLogOutButtonServlet.toString().equals("adminLogOutButtonServlet")) {
			return "forward:/adminLogOutButtonServlet";
		}
		// (((END))))))URi-> adminLogOutButtonServlet
 

		// URI-> addEmployeeInDB
		String addEmployeeInDB = request.getParameter("addEmployeeInDB");
		if (addEmployeeInDB != null && addEmployeeInDB.toString().equals("addEmployeeInDB")) {

			return "forward:/addEmployeeInDB?employeeId=" + request.getParameter("employeeId")
					+ "&employeeDOJ=" + request.getParameter("employeeDOJ") + "&employee-name="
					+ request.getParameter("employee-name") + "&employee-phone="
					+ request.getParameter("employee-phone") + "&employee-email="
					+ request.getParameter("employee-email") + "&employee-dept="
					+ request.getParameter("employee-dept");
		}
		// (((END))))))URi-> addEmployeeInDB
 
		// URI-> addProjectInDB
		String addProjectInDB = request.getParameter("addProjectInDB");
		if (addProjectInDB != null && addProjectInDB.toString().equals("addProjectInDB")) {

			return "forward:/addProjectInDB?projectId=" + request.getParameter("projectId")
			+ "&Starting Date=" + request.getParameter("Starting Date")
			+"&project-name="+request.getParameter("project-name")
			+"&Ending date="+request.getParameter("Ending date");
		}
		// (((END))))))URi-> addProjectInDB
		
		 
		// URI-> addClientInDB
		String addClientInDB = request.getParameter("addClientInDB");
		if (addClientInDB != null && addClientInDB.toString().equals("addClientInDB")) {

			return "forward:/addClientInDB?clientId=" + request.getParameter("clientId")
			+ "&client-name=" + request.getParameter("client-name")
			+"&clientEmail="+request.getParameter("clientEmail")
			+"&client date="+request.getParameter("client date")
			+"&clientEmail="+request.getParameter("clientEmail")
			+"&contactPersonName="+request.getParameter("contactPersonName")
			+"&contactPersonEmail="+request.getParameter("contactPersonEmail")
			+"&contactPersonPhone="+request.getParameter("contactPersonPhone")
			+"&contactPersonDesignation="+request.getParameter("contactPersonDesignation");
		}
		// (((END))))))URi-> addClientInDB
		// ================(((((((END))))))==========adminDashboard.jsp============================
		
		//==================================addEmployeeToProjectServlet_step2.jsp===============
		
		// URI-> addEmployeeToProjectServlet_step3
		String addEmployeeToProjectServlet_step3 = request.getParameter("addEmployeeToProjectServlet_step3");
		if (addEmployeeToProjectServlet_step3 != null && addEmployeeToProjectServlet_step3.toString().equals("addEmployeeToProjectServlet_step3")) {

			return "forward:/addEmployeeToProjectServlet_step3?projectName=" + request.getParameter("projectName")
			+ "&projectId=" + request.getParameter("projectId")
			+"&employeeName="+request.getParameter("employeeName")
			+"&employeeId="+request.getParameter("employeeId");
		}
		// (((END))))))URi-> addEmployeeToProjectServlet_step3
		
		
		// URI-> addingEmployeeToProject_step2_releaseButtonClientServlet                      
		String addingEmployeeToProject_step2_releaseButtonClientServlet = request.getParameter("addingEmployeeToProject_step2_releaseButtonClientServlet");
		if (addingEmployeeToProject_step2_releaseButtonClientServlet != null && addingEmployeeToProject_step2_releaseButtonClientServlet.toString().equals("addingEmployeeToProject_step2_releaseButtonClientServlet")) {
			System.err.println("-------------------------------------");
			return "forward:/addingEmployeeToProject_step2_releaseButtonClientServlet?projectName=" + request.getParameter("projectName")
			+ "&projectId=" + request.getParameter("projectId")
			+"&employeeName="+request.getParameter("employeeName")
			+"&employeeId="+request.getParameter("employeeId") ;
		}
		// (((END))))))URi-> addingEmployeeToProject_step2_releaseButtonClientServlet
		
		
		 
		//==================================addProjectToClient_step2.jsp===============
		
		// URI-> addProjectToClientServlet_step3
		String addProjectToClientServlet_step3 = request.getParameter("addProjectToClientServlet_step3");
		if (addProjectToClientServlet_step3 != null && addProjectToClientServlet_step3.toString().equals("addProjectToClientServlet_step3")) {

			return "forward:/addProjectToClientServlet_step3?clientName=" + request.getParameter("clientName")
			+ "&clientId=" + request.getParameter("clientId")
			+"&projectName="+request.getParameter("projectName")
			+"&projectId="+request.getParameter("projectId") ;
		}
		// (((END))))))URi-> addProjectToClientServlet_step3
		
		
		//========(((((END))=================addProjectToClient_step2.jsp===============
		
		//====================addingContactPersonToClient_step2.jsp===============
		
		// URI-> addContactPersonToClientServlet_step3 
		String addContactPersonToClientServlet_step3 = request.getParameter("addContactPersonToClientServlet_step3");
		if (addContactPersonToClientServlet_step3 != null && addContactPersonToClientServlet_step3.toString().equals("addContactPersonToClientServlet_step3")) {

			return "forward:/addContactPersonToClientServlet_step3?clientName=" + request.getParameter("clientName")
			+ "&clientId=" + request.getParameter("clientId")
			+"&contactPersonName="+request.getParameter("contactPersonName")
			+"&contactPersonName="+request.getParameter("contactPersonName")
			+"&contactPersonPhone="+request.getParameter("contactPersonPhone")
			+"&contactPersonDesignation="+request.getParameter("contactPersonDesignation") ;
		}
		// (((END))))))URi-> selectClientToAddContactPerson_setp1.jsp
		
		
		
		//========(((((END))====================addingContactPersonToClient_step2.jsp===============
		
		
		//===========================selectProjectToReleaseEmployee_step1_releasingEmployeeFromProject_step2.jsp
	/*	 
	 // already created 
		// URI-> addingEmployeeToProject_step2_releaseButtonClientServlet 
		String addingEmployeeToProject_step2_releaseButtonClientServlet1 = request.getParameter("addingEmployeeToProject_step2_releaseButtonClientServlet");
		if (addingEmployeeToProject_step2_releaseButtonClientServlet1 != null && addingEmployeeToProject_step2_releaseButtonClientServlet1.toString().equals("addingEmployeeToProject_step2_releaseButtonClientServlet")) {
System.err.println("++++++++++++++++++++++++++++++++++++++++++");
			request.getRequestDispatcher("addingEmployeeToProject_step2_releaseButtonClientServlet?projectName=" + request.getParameter("projectName")
			+ "&projectId=" + request.getParameter("projectId")
			+"&employeeName="+request.getParameter("employeeName")
			+"&employeeId="+request.getParameter("employeeId") ).forward(request, response);
		}
		// (((END))))))URi-> addingEmployeeToProject_step2_releaseButtonClientServlet.jsp
		*/
		//(((((END)))================selectProjectToReleaseEmployee_step1_releasingEmployeeFromProject_step2.jsp
		
		//======================searchClient_step1.jsp===============
		
		
		// URI-> searchClient_step1_getAllClientButtonClienk_step2 
				String searchClient_step1_getAllClientButtonClienk_step2 = request.getParameter("searchClient_step1_getAllClientButtonClienk_step2");
				if (searchClient_step1_getAllClientButtonClienk_step2 != null && searchClient_step1_getAllClientButtonClienk_step2.toString().equals("searchClient_step1_getAllClientButtonClienk_step2")) {
	 
					return "forward:/searchClient_step1_getAllClientButtonClienk_step2";
				}
				// (((END))))))URi-> searchClient_step1_getAllClientButtonClienk_step2.jsp
				
				
				// URI-> addingEmployeeToProject_step2_releaseButtonClientServlet 
				String searchClient_step1_getAllProjectByClientIdButtonClienk_step3  = request.getParameter("searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java");
				if (searchClient_step1_getAllProjectByClientIdButtonClienk_step3  != null && searchClient_step1_getAllProjectByClientIdButtonClienk_step3.toString().equals("searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java")) {
	 
					return "forward:/searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java?clientId=" + request.getParameter("clientId")
					+ "&clientName=" + request.getParameter("clientName")  ;
				}
				// (((END))))))URi-> addingEmployeeToProject_step2_releaseButtonClientServlet.jsp
				
		//====(((((END))))===========searchClient_step1.jsp===============
		
				
				//==============================searchProject_step1.jsp
				

				// URI-> searchProject_step1_getAllProjectButtonClienk_step2 
						String searchProject_step1_getAllProjectButtonClienk_step2 = request.getParameter("searchProject_step1_getAllProjectButtonClienk_step2");
						if (searchProject_step1_getAllProjectButtonClienk_step2 != null && searchProject_step1_getAllProjectButtonClienk_step2.toString().equals("searchProject_step1_getAllProjectButtonClienk_step2")) {
			 
							return "forward:/searchProject_step1_getAllProjectButtonClienk_step2" ;
						}
						// (((END))))))URi-> searchClient_step1_getAllClientButtonClienk_step2.jsp
					
						
						
						
						
						
						// URI-> searchProject_step1_getAllProjectByProjectIdButtonClienk_step2 
						String searchProject_step1_getAllProjectByProjectIdButtonClienk_step2  = request.getParameter("searchProject_step1_getAllProjectByProjectIdButtonClienk_step2");
						if (searchProject_step1_getAllProjectByProjectIdButtonClienk_step2  != null && searchProject_step1_getAllProjectByProjectIdButtonClienk_step2.toString().equals("searchProject_step1_getAllProjectByProjectIdButtonClienk_step2")) {
			 
							return "forward:/searchProject_step1_getAllProjectByProjectIdButtonClienk_step2?projectId=" + request.getParameter("projectId")
							+ "&projectName=" + request.getParameter("projectName")  ;
						}
						// (((END))))))URi-> searchProject_step1_getAllProjectByProjectIdButtonClienk_step2 
						
						
						
						// URI-> searchProject_step1_getAllClientByProjectIdButtonClick_step2 
						String searchProject_step1_getAllClientByProjectIdButtonClick_step2  = request.getParameter("searchProject_step1_getAllClientByProjectIdButtonClick_step2");
						if (searchProject_step1_getAllClientByProjectIdButtonClick_step2  != null && searchProject_step1_getAllClientByProjectIdButtonClick_step2.toString().equals("searchProject_step1_getAllClientByProjectIdButtonClick_step2")) {
			 
							return "forward:/searchProject_step1_getAllClientByProjectIdButtonClick_step2?projectId=" + request.getParameter("projectId")
							+ "&projectName=" + request.getParameter("projectName")  ;
						}
						// (((END))))))URi-> searchProject_step1_getAllClientByProjectIdButtonClick_step2 
						
						// URI-> searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2 
						String searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2  = request.getParameter("searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2");
						if (searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2  != null && searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2.toString().equals("searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2")) {
			 
							return "forward:/searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2?projectId=" + request.getParameter("projectId")
							+ "&projectName=" + request.getParameter("projectName") ;
						}
						// (((END))))))URi-> searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2
				//=(((END))))=============================searchProject_step1.jsp
				
						
//======================searchEmployee_step1.jsp
						
						// URI-> searchEmployee_step1_getAllEmployeeButtonClienk_step2 
						String searchEmployee_step1_getAllEmployeeButtonClienk_step2 = request.getParameter("searchEmployee_step1_getAllEmployeeButtonClienk_step2");
						if (searchEmployee_step1_getAllEmployeeButtonClienk_step2 != null && searchEmployee_step1_getAllEmployeeButtonClienk_step2.toString().equals("searchEmployee_step1_getAllEmployeeButtonClienk_step2")) {
			 
							return "forward:/searchEmployee_step1_getAllEmployeeButtonClienk_step2" ;
						}
						// (((END))))))URi-> searchEmployee_step1_getAllEmployeeButtonClienk_step2 
					
						
						
						// URI->  searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2
 
						String searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2  = request.getParameter("searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2");
						if (searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2  != null && searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2.toString().equals("searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2")) {
			 
							return "forward:/searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2?employeeEmail=" + request.getParameter("employeeEmail")
							+ "&employeeId=" + request.getParameter("employeeId")  ;
						}
						// (((END))))))URi-> searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2
						
						
						
						
						
						// URI->  searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#
						 
						String searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2  = request.getParameter("searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#");
						if (searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2 != null && searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2.toString().equals("searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#")) {
			 
							return "forward:/searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#?employeeEmail=" + request.getParameter("employeeEmail")
							+ "&employeeId=" + request.getParameter("employeeId")  ;
						}
						// (((END))))))URi-> searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#
						
						
						
						
						
						
						
						// URI->  searchEmployee_step1_getPrjectAssignedToEmployee_step2
						 
						String searchEmployee_step1_getPrjectAssignedToEmployee_step2  = request.getParameter("searchEmployee_step1_getPrjectAssignedToEmployee_step2");
						if (searchEmployee_step1_getPrjectAssignedToEmployee_step2 != null && searchEmployee_step1_getPrjectAssignedToEmployee_step2.toString().equals("searchEmployee_step1_getPrjectAssignedToEmployee_step2")) {
			 
							return "forward:/searchEmployee_step1_getPrjectAssignedToEmployee_step2?employeeEmail=" + request.getParameter("employeeEmail")
							+ "&employeeId=" + request.getParameter("employeeId")  ;
						}
						// (((END))))))URi-> searchEmployee_step1_getPrjectAssignedToEmployee_step2
						
						
						
						
						// URI->  searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java
						 
						String searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2  = request.getParameter("searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java");
						if (searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2 != null && searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.toString().equals("searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java")) {
			 
							return "forward:/searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java" ;
						}
						// (((END))))))URi-> searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java
						
//==((((END)))===============searchEmployee_step1.jsp
						
						
						
		 //==================================update_delete_client_step1.jsp
						
						// URI->  update_delete_client_step1_selectingClientId
						 
						String update_delete_client_step1_selectingClientId  = request.getParameter("update_delete_client_step1_selectingClientId");
						if (update_delete_client_step1_selectingClientId != null && update_delete_client_step1_selectingClientId.toString().equals("update_delete_client_step1_selectingClientId")) {
			 
							return "forward:/update_delete_client_step1_selectingClientId?clientId=" + request.getParameter("clientId")
							+ "&clientName=" + request.getParameter("clientName")  ;
						}
						// (((END))))))URi-> update_delete_client_step1_selectingClientId
						
						
						
						
						// URI->  update_delete_client_step1_updateButtonClick
						 
						String update_delete_client_step1_updateButtonClick  = request.getParameter("update_delete_client_step1_updateButtonClick");
						if (update_delete_client_step1_updateButtonClick != null && update_delete_client_step1_updateButtonClick.toString().equals("update_delete_client_step1_updateButtonClick")) {
			 
							return "forward:/update_delete_client_step1_updateButtonClick?clientId2=" + request.getParameter("clientId2")
							+ "&clientName=" + request.getParameter("clientName")  
							+ "&emailClient=" + request.getParameter("emailClient")
							+ "&clientRelationshaipDate=" + request.getParameter("clientRelationshaipDate") ; 
						}
						// (((END))))))URi-> update_delete_client_step1_updateButtonClick
						
						// URI->  update_delete_client_step1_DeleteButtonClick
						 
						String update_delete_client_step1_DeleteButtonClick  = request.getParameter("update_delete_client_step1_DeleteButtonClick");
						if (update_delete_client_step1_DeleteButtonClick != null && update_delete_client_step1_DeleteButtonClick.toString().equals("update_delete_client_step1_DeleteButtonClick")) {
			 
							return "forward:/update_delete_client_step1_DeleteButtonClick?clientId2=" + request.getParameter("clientId2") ;
						}
						// (((END))))))URi-> update_delete_client_step1_DeleteButtonClick
			//=((END))======================update_delete_client_step1.jsp
						//========================================update_delete_employee_step1.jsp
						
						// URI->  update_delete_employee_step1_selectingEmployeeId
						 
						String update_delete_employee_step1_selectingEmployeeId  = request.getParameter("update_delete_employee_step1_selectingEmployeeId");
						if (update_delete_employee_step1_selectingEmployeeId != null && update_delete_employee_step1_selectingEmployeeId.toString().equals("update_delete_employee_step1_selectingEmployeeId")) {
			 
							return "forward:/update_delete_employee_step1_selectingEmployeeId?employeeId=" + request.getParameter("employeeId")
							+ "&employeeEmail=" + request.getParameter("employeeEmail");    
						}
						// (((END))))))URi-> update_delete_employee_step1_selectingEmployeeId
						
						
						
						
						
						// URI->  update_delete_employee_step1_updateButtonClick
						 
						String update_delete_employee_step1_updateButtonClick  = request.getParameter("update_delete_employee_step1_updateButtonClick");
						if (update_delete_employee_step1_updateButtonClick != null && update_delete_employee_step1_updateButtonClick.toString().equals("update_delete_employee_step1_updateButtonClick")) {
			 
							return "forward:/update_delete_employee_step1_updateButtonClick?employeeId=" + request.getParameter("employeeId")
							+ "&employeeName=" + request.getParameter("employeeName")  
							+ "&employeeDept=" + request.getParameter("employeeDept")
							+ "&employeeEmail=" + request.getParameter("employeeEmail")
							+ "&employeePhone=" + request.getParameter("employeePhone") 
							+ "&employeeDOJ=" + request.getParameter("employeeDOJ") 
							+ "&projectIdInEmployee=" + request.getParameter("projectIdInEmployee") ;
						}
						// (((END))))))URi-> update_delete_employee_step1_updateButtonClick
						
						
						
						// URI->  update_delete_employee_step1_DeleteButtonClick
						 
						String update_delete_employee_step1_DeleteButtonClick  = request.getParameter("update_delete_employee_step1_DeleteButtonClick");
						if (update_delete_employee_step1_DeleteButtonClick != null && update_delete_employee_step1_DeleteButtonClick.toString().equals("update_delete_employee_step1_DeleteButtonClick")) {
			 
							return "forward:/update_delete_employee_step1_DeleteButtonClick?employeeId=" + request.getParameter("employeeId");
						}
						// (((END))))))URi-> update_delete_employee_step1_DeleteButtonClick
						
						//========================================update_delete_employee_step1.jsp
	
	
	//========================update_delete_project_step1.jsp
						
						// URI->  update_delete_project_step1_selectingProjectId
						 
						String update_delete_project_step1_selectingProjectId  = request.getParameter("update_delete_project_step1_selectingProjectId");
						if (update_delete_project_step1_selectingProjectId != null && update_delete_project_step1_selectingProjectId.toString().equals("update_delete_project_step1_selectingProjectId")) {
			 
							return "forward:/update_delete_project_step1_selectingProjectId?projectId=" + request.getParameter("projectId")
							+"&projectName="+request.getParameter("projectName");
						}
						// (((END))))))URi-> update_delete_project_step1_selectingProjectId
						
						
						
						// URI->  update_delete_project_step1_updateButtonClick
						 
						String update_delete_project_step1_updateButtonClick  = request.getParameter("update_delete_project_step1_updateButtonClick");
						if (update_delete_project_step1_updateButtonClick != null && update_delete_project_step1_updateButtonClick.toString().equals("update_delete_project_step1_updateButtonClick")) {
			 System.out.println("/////////////////////////////////");
			 return "forward:/update_delete_project_step1_updateButtonClick?projectId=" + request.getParameter("projectId")
							+"&projectName="+request.getParameter("projectName")
							+"&projectDateOfStart="+request.getParameter("projectDateOfStart")
							+"&projectDateOfEnd="+request.getParameter("projectDateOfEnd")
							+"&clientIdInProject="+request.getParameter("clientIdInProject");
						}
						// (((END))))))URi-> update_delete_project_step1_updateButtonClick
						
						
						// URI->  update_delete_project_step1_DeleteButtonClick
						 
						String update_delete_project_step1_DeleteButtonClick  = request.getParameter("update_delete_project_step1_DeleteButtonClick");
						if (update_delete_project_step1_DeleteButtonClick != null && update_delete_project_step1_DeleteButtonClick.toString().equals("update_delete_project_step1_DeleteButtonClick")) {
			 
							return "forward:/update_delete_project_step1_DeleteButtonClick?projectId=" + request.getParameter("projectId");
						}
						// (((END))))))URi-> update_delete_project_step1_DeleteButtonClick
									
						
//===((((END)))=============update_delete_project_step1.jsp
		
		
		return "Login";
	}
	
}
