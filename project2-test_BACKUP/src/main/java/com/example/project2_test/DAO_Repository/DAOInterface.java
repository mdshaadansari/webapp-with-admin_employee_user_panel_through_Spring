package com.example.project2_test.DAO_Repository;

import java.util.List;

import com.example.project2_test.model.client;
import com.example.project2_test.model.contactPerson;
import com.example.project2_test.model.employee;
import com.example.project2_test.model.project;

 
public interface DAOInterface {
	
	//===================clientLogin.jsp and url fired from clientLogin.jsp for servlets==================================
	
		//
		//check if given email is available in client DB
		List<String> checkClientEmail(String email);
		
		
		//=================================================================================================================
		//===================employeeLogin.jsp and url fired from employeeLogin.jsp for servlets==================================
		
		public List<String> checkEmployeeEmail(String email) ;
			//=========================================
		//===================adminLogin.jsp and url fired from adminLogin.jsp for servlets==================================
		
		public List<String> checkAdminEmail(String email) ;
			//=========================================
	//===============method used in adminDashboard.jsp and in servlet fired from adminDashboard.jsp==============================================================
	
	//check if given email is available in employee DB
		boolean checkemployeeEmail(String email);
		
		//inserting data in employee Table
		String insertIntoEmployee(employee employee);
		//return last employee Id available in employee Table
		String getLastEmpoyeeIDFromDB();

	
		//return last project Id available in project Table
		public String getLastProjectIDFromDB();
		
		//inserting data in project Table
		public String insertIntoProject(project project);
	
		
		//return last client Id available in client Table
		public String getLastClientIDFromDB();
		

		//inserting data in client Table
		public String insertIntoClient(client client) ;
		
		
		//inserting data in contactPerson Table
		int insertIntoContactPerson(contactPerson contactPerson);
		 
	//=============================================================================
		
		//get All Project Id from Db
		List<String> getAllProjectId();
		//public List<String> getAllProjectId2();

		
		//get All Project Name from Db
			List<String> getAllProjectName();
		
			
			// return list,where elements are themself a list of different coloumn of employee table(not all column)
			public List<List> getAllEmployee();
			//public List<List> getAllEmployee2();

			// return list,where elements are themself a list of different coloumn(not all column) of employee table based on matching ProjectId
			public List<List> getAllEmployeeForProjectId(String projectId);
			//return employee already assigned to some project or return emlpoyee not on bench
			List<String> checkEmployeeOnBenchOrNot(String employeeId);
			
			
			//assigning project to emolyee, return numerical value greater than 0 if successfull else return 0
			int assiginProjectToEmployee(String projectIdInEmployee, String employeeId);
			
			
			//releasing employee from project,return numerical value greater than 0 if successfull else return 0
	int		releaseEmployeeFromProject(String projectIdInEmployee,String employeeId);




	//================================================================
	//get All Client Id from Db
	List<String> getAllClientId();


	//get All Client Name from Db
		List<String> getAllClientName();
		
		
		
		//return list,where elements are themself a list of different coloumn(not all column) of project table
		  List<List> getAllProject();
		  
		
		  
			// return list,where elements are themself a list of different coloumn of project table(not all column) based on matching clientId
		  public List<List> getAllProjectForClientId(String clientId);	  
		   
		 
		  //return project info acording to projectId if client is already assigned to project
		  public List<String> checkProjectAssignedToClientOrNot(String projectId);
		 
		  //================================================================================
		  public int assiginProjectToClient(String clientId,String projectId) ;
		  
		// return list,where elements are themself a list of different coloumn of ContacPerssoon table based on matching clientId
		  public List<List> getAllContactPersonForClientId(String clientId);
		  
			//inserting data in contactPerson Table
		int insertIntoContactPerson2(contactPerson contactPerson);	  
		   //====================================================================================
		
		
		
		
		//==============method used in searchClient_step1.jsp and, in servlets for URI fired from searchClient_step1.jsp==========================================================

		// return list,where elements are themself a list of different coloumn of cliet table
				public List<List> getAllClient();

				
					
				// return list,where elements are themself a list of different coloumn of project table(all column) based on matching clientId
		public List<List> getAllProjectForClientId2(String clientId);

		
		
		
		
		
	//======method used in searchProject_step1.jsp and, in servlets for URI fired from searchProject_step1.jsp======

		//return list,where elements are themself a list of different coloumn(all column) of project table
		public List<List> getAllProjectEveryColumn();
		
		//return list,where elements are themself a list of different coloumn(all column) of project table based on matching projectId
		public List<List> getAllProjectEveryColumnByProjectId(String projectId);
		// return list,where elements are themself a list of different coloumn of cliet table(all column) based on projectId
		public List<List> getAllClientByProjectId(String projectId);
		


		// return list,where elements are themself a list of different coloumn( all column) of employee table based on matching ProjectId
				public List<List> getAllEmployeeEveryColumnByProjectId(String projectId);


				
				
				
	//======method used in searchEmployee_step1.jsp and, in servlets for URI fired from searchEmployee_step1.jsp======

				// return list,where elements are themself a list of different coloumn of employee table( all column)
				public List<List> getAllEmployeeEveryColumn();
				
				
				// return list,where elements are themself a list of different coloumn( all column) of employee table based on matching employeeId
				public List<String> getAllEmployeeByEmployeeId(String employeeId);


				
				// return list having employee and project details based on matching employeeId
							public List<String> getEmployeeAndProjectByEmployeeId(String employeeId);

							
							
							// return list,where elements are themself a list of different coloumn of employee  table based on employee on bench( all column)
							public List<List> getEmployeeOnBench();

							
							public List<List> getAllEmployeeByEmployeeEmail(String employeeEmail);
							

							
							
							
							
							
							
							
	//======method used in update_delete_client_step1.jsp and, in servlets for URI fired from update_delete_client_step1.jsp======						
							// return list,where elements are themself a list of different coloumn of cliet table(all column) based on clientId
							public List<String> getAllClientByClientId(String clientId);
							
							//update client
							public int updateClient(client client,String clientId) ;
							
							//delete client by clientId
							public int deleteClientByClientId(String clientId);

							

							
							
							
							
	//======method used in update_delete_project_step1.jsp and, in servlets for URI fired from update_delete_project_step1.jsp======						
	// return list,where elements are themself a list of different coloumn of Project table(all column) based on ProjectId
	public List<String> getAllProjectByProjectId(String ProjectId);
	
	
	//update project
	public int updateProject(project project,String projectId) ;
	//delete project by projectId
	public int deleteProjectByProjectId(String projectId);

	//======method used in update_delete_employee_step1.jsp and, in servlets for URI fired from update_delete_employee_step1.jsp======
	
	 
	//update employee
	public int updateEmployee(employee employee,String employeeId) ;
	//delete employee by employeeId
	public int deleteEmployeeByEmployeeId(String employeeId);


	//======method used in clientDashboard_step1.jsp and, in servlets for URI fired from clientDashboard_step1.jsp========


	//return list where elements are also list of every column of project table based on clientId
	public List<List> getAllProjectEveryColumnByClientId(String clientId) ;
		
	


	//fetching employee details based on clientId  who is working for this client
	public List<List> getAllEmployeeEveryColumnByClientId(String clientId) ;



	//======method used in empoyeeDashboard_step1.jsp and, in servlets for URI fired from empoyeeDashboard_step1.jsp========


	//return list,where elements are themself a list of different coloumn(all column) of project table based on matching projectId
		public List<List> getAllProjectEveryColumnByemployeeId(String employeeId);
		
		/*
		
		*/
	}
