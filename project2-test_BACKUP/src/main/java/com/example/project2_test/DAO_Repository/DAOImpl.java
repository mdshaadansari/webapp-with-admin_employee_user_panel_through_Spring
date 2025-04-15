package com.example.project2_test.DAO_Repository;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
//import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;

import com.example.project2_test.model.client;
import com.example.project2_test.model.contactPerson;
import com.example.project2_test.model.employee;
import com.example.project2_test.model.project;
 
 @Repository 
 @Transactional(readOnly = false)	
public class DAOImpl implements DAOInterface{
	 
	 
	  
	
	 @Autowired
	 HibernateTemplate hibernateTemplate;
	//===================clientLogin.jsp and url fired from clientLogin.jsp for servlets==================================
		
		//
		//check if given email is available in client DB
		public List<String> checkClientEmail(String email){

			System.out.println("checkClientEmail method");
			List<String> clientDetails=new ArrayList<>();
			String sql = "select emailClient,ClientName,clientId from client where emailClient=?";
			List<Object[]>l=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, email).getResultList();
			
			for(Object []o:l) {
				for(int i=0;i<o.length;i++) {
					if(i==0) {
						clientDetails.add((String)o[i]);
					}else if(i==1) {
						clientDetails.add((String)o[i]);
					}else if(i==2) {
						clientDetails.add((String)o[i]);
					}
				}
			}
			
			return !clientDetails.isEmpty()?clientDetails:null;
			
			
		}
		 
		
		//=================================================================================================================
		//===================employeeLogin.jsp and url fired from employeeLogin.jsp for servlets==================================
		
		public List<String> checkEmployeeEmail(String email) {
			System.out.println("checkEmployeeEmail method");
			List<String> employeeDeatails=new ArrayList<>();


			String emailincontactPersonDB = null;
			String nameincontactPersonDB = null;
			String employeeId = null;

			String sql = "select employeeEmail,employeeName,employeeId from employee where employeeEmail=?";
List<Object[]>l=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, email).getResultList();
			
			for(Object []o:l) {
				for(int i=0;i<o.length;i++) {
					if(i==0) {
						employeeDeatails.add((String)o[i]);
					}else if(i==1) {
						employeeDeatails.add((String)o[i]);
					}else if(i==2) {
						employeeDeatails.add((String)o[i]);
					}
				}
			}
		
			return !employeeDeatails.isEmpty()?employeeDeatails:null;
		}
			 
			//=========================================
		//===================adminLogin.jsp and url fired from adminLogin.jsp for servlets==================================
		
		public List<String> checkAdminEmail(String email) {
			System.out.println("checkAdminEmail method");
			List<String> adminDeatails=new ArrayList<>();

			String emailincontactPersonDB = null;
			String nameincontactPersonDB = null;

			
			//===============================fetching email from DB====================
			String sql = "select adminEmail,adminName from admin where adminEmail=?";
			List<Object[]>l=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, email).getResultList();
						
						for(Object []o:l) {
							for(int i=0;i<o.length;i++) {
								if(i==0) {
									adminDeatails.add((String)o[i]);
								}else if(i==1) {
									adminDeatails.add((String)o[i]);
								 
							}
						}
						}
						return !adminDeatails.isEmpty()?adminDeatails:null;
						 
		}
			 
			//=========================================
		//===============method used in adminDashboard.jsp and in servlet fired from adminDashboard.jsp==============================================================
		
	  @Override
     public	boolean checkemployeeEmail(String email) {
		System.out.println("getemployeeEmail method"); 
		List<employee> l=	(List<employee>) hibernateTemplate.find("from employee where employeeEmail=?0", email);
		System.out.println("checking is that email is already in DB\t"+email );
		if( l.size()>0 && ! l.isEmpty()) {
			System.out.println("YES email is already in DB\t"+email );
			return true;
		}else {
			System.out.println("No email is already in DB\t"+email );
			return false;
		} 
	} 
	  
	  
	  
	@Override
	  public   String insertIntoEmployee(employee employee) { 
	System.out.println("insertIntoEmployee");
	System.out.println("start inserting new employee in DB");
 	 	Serializable id=hibernateTemplate.save(employee);    
 	 	System.out.println("end inserting new employee in DB");
 	 	if (id instanceof String) { // Ensure it's a String
 	        System.out.println("Employee inserted successfully with ID: " + id);
 	        return (String) id;
 	    }

 	    System.out.println("Failed to insert employee");
 	    return null;
 	}
	
	
	

	@Override
	public String getLastEmpoyeeIDFromDB() {
		System.out.println("getLastEmpoyeeIDFromDB method");
		//getting session
		   Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		   Query<String> query = session.createNativeQuery( "SELECT employeeId FROM employee ORDER BY CAST(SUBSTRING(employeeId, 5) AS UNSIGNED) DESC LIMIT 1");

			    List<String> e = query.getResultList();
			     
		if(e.size()>0 && !e.isEmpty()) {
		return e.get(0);
		}else {
				return null;
	}
	}
	

 
	
	
	@Override
	public String getLastProjectIDFromDB() {
		System.out.println("getLastProjectIDFromDB method");
 
			 
			//getting session
			   Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
			   Query<String> query = session.createNativeQuery( "SELECT projectId FROM project ORDER BY CAST(SUBSTRING(projectId, 9) AS UNSIGNED) DESC LIMIT 1");

				    List<String> e = query.getResultList();
				     
			if(e.size()>0 && !e.isEmpty()) {
			return e.get(0);
			}else {
					return null;
		}
	}
	
	

	@Override
	public String insertIntoProject(project project) { 
		System.out.println("insertIntoproject method");
		System.out.println("start inserting new project in DB");
 	 	Serializable id=hibernateTemplate.save(project);    
		System.out.println("end inserting new project in DB");
		if (id instanceof String) { // Ensure it's a String
	        System.out.println("project inserted successfully with ID: " + id);
	        return (String) id;
	    }

	    System.out.println("Failed to insert project");
	    return null;
	}
	
	

	@Override
	public String getLastClientIDFromDB() {
		System.out.println("getLastClientIDFromDB method");
		//getting session
		   Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		   Query<String> query = session.createNativeQuery( "SELECT clientId FROM client ORDER BY CAST(SUBSTRING(clientId, 8) AS UNSIGNED) DESC LIMIT 1");

			    List<String> e = query.getResultList();
			     
		
		return e.size()>0 &&  (!e.isEmpty())? e.get(0) : null;
		
	}

	
	
	@Override
	public String insertIntoClient(client  client) {
		System.out.println("insertIntoClient method");
		System.out.println("start inserting new client in DB");
 	 Serializable id=	hibernateTemplate.save(client);    
		System.out.println("end inserting new client in DB");
		if (id instanceof String) { // Ensure it's a String
	        System.out.println("client inserted successfully with ID: " + id);
	        return (String) id;
	    }

	    System.out.println("Failed to insert client");
	    return null;
	}
	
	
	
	@Override
	public int insertIntoContactPerson(contactPerson contactPerson) {
		System.out.println("insertIntoContactPerson method");
		System.out.println("start contactPerson new client in DB");
		Serializable i=	hibernateTemplate.save(contactPerson);    
		System.out.println("end contactPerson new client in DB");
		 int id=(int)i;
	 	 	if(id>0) {

		        System.out.println("contactPerson inserted successfully with ID: " + id);
	 	 		return id;
	 	 	}

		    System.out.println("Failed to insert contactPerson");
	 	 	return 0;
		}

	 
		 
		
		
		
		
		//============================================================================================
		/*
		public List<String> getAllProjectId2(){
			System.out.println("getAllProjectId method");
			//getting session
			   Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
			   Query<String> query = session.createNativeQuery( "select projectId from project");

				    List<String> e = query.getResultList();
				     
			return e.size()>0&&!e.isEmpty()?e:null;
			 
}
*/
		public List<String> getAllProjectId(){
			System.out.println("getAllProjectId2 method");
			//getting session

			List<String> l=	(List<String>) hibernateTemplate.find("select projectId from project");
 
			return l.size()>0&&!l.isEmpty()?l : null;
			 
}
		 
		
		public List<String> getAllProjectName(){

			System.out.println("getAllProjectName method");
			//getting session

			List<String> l=	(List<String>) hibernateTemplate.find("select projectName from project");
 
			return l.size()>0&&!l.isEmpty()?l : null;
			
			 
}
		
		
		
		
		public List<List> getAllEmployee(){
			System.out.println("getAllEmployee method"); 
			    List<String>  employeeId= (List<String>) hibernateTemplate.find( "select employeeId  from employee");
			    List<String> projectIdInEmployee = (List<String>) hibernateTemplate.find( "select projectIdInEmployee  from employee");
			    List<String> employeeName = (List<String>) hibernateTemplate.find( "select employeeName  from employee");
			    List<String> employeeDept = (List<String>) hibernateTemplate.find( "select employeeDept  from employee"); 
 
				List<List> getAllEmployee=new ArrayList();     
				getAllEmployee.add(employeeId);
				getAllEmployee.add(projectIdInEmployee);
				getAllEmployee.add(employeeName);
				getAllEmployee.add(employeeDept);
				
			return employeeId.size()>0&&!employeeId.isEmpty()?getAllEmployee:null; 
}
		
/*
 //same as above method but in different way because 
//1.When selecting one column, Hibernate returns a List<T>, where T is the column's data type (String in this case).
//2.When selecting multiple columns, Hibernate returns a List<Object[]> because each row contains multiple values.

		public List<List> getAllEmployee2(){
			System.out.println("getAllEmployee method"); 
			    List<Object[]>  l= (List<Object[]>) hibernateTemplate.find( "select employeeId,projectIdInEmployee,employeeName,employeeDept  from employee");
  
			    List<String> employeeId = new ArrayList();
			    List<String> projectIdInEmployee = new ArrayList();
			    List<String> employeeName = new ArrayList();
			    List<String> employeeDept = new ArrayList();
				List<List> getAllEmployee=new ArrayList();     
				
				for(Object o[]:l) {
					for(int i=0;i<o.length;i++) {
						if(i==0) {
							employeeId.add((String) o[i] );
						 
						}else if(i==1) {
							projectIdInEmployee.add((String) o[i] );
						}else if(i==2) {
							employeeName.add((String) o[i] );
						}else if(i==3) {
							employeeDept.add((String) o[i] );
						}
					}
				}
				
				getAllEmployee.add(employeeId);
				getAllEmployee.add(projectIdInEmployee);
				getAllEmployee.add(employeeName);
				getAllEmployee.add(employeeDept);
				
			return employeeId.size()>0&&!employeeId.isEmpty()?getAllEmployee:null; 
}
		
		*/
		

		public List<List> getAllEmployeeForProjectId(String projectId){
			System.out.println("getAllEmployeeForProjectId method");
			System.out.println(projectId);
			List <List> getAllEmployeeForProjectId=  new ArrayList();
			
			List<String>	existingprojectIdInemployeeforIncomingProjectId = new ArrayList();
			List<String> existingEmploeeIdforIncomingProjectId  = new ArrayList();
			List<String> existingEmployeeNameforIncomingProjectId  = new ArrayList();
			List<String> existingEmployeeDeptIncomingProjectId = new ArrayList();
			  Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
			
			  Query<Object[]> Query=(Query <Object[]> )  session.createNativeQuery( "select employeeId,projectIdInEmployee,employeeName,employeeDept  from employee inner join project on projectIdInEmployee=projectId where projectIdInEmployee=?");
			  Query.setParameter(1, projectId);
		    List<Object[]> l = Query.getResultList(); 
		    
			
			//List<Object[]> l=(List <Object[]> ) hibernateTemplate.find( "select employeeId,projectIdInEmployee,employeeName,employeeDept  from employee inner join project on projectIdInEmployee=projectId where projectIdInEmployee=?0",projectId);
			
			for(Object[] o:l) {
				for(int i=0;i<o.length;i++) {
					if(i==0) {
						existingEmploeeIdforIncomingProjectId.add((String) o[i]);
					}else if(i==1) {
						existingprojectIdInemployeeforIncomingProjectId.add((String) o[i]);
					}else if(i==2) {
						existingEmployeeNameforIncomingProjectId.add((String) o[i]);
					}else if(i==3) {
						existingEmployeeDeptIncomingProjectId.add((String) o[i]);
					}
					
				}
			} 
			getAllEmployeeForProjectId.add(existingEmploeeIdforIncomingProjectId);
			getAllEmployeeForProjectId.add(existingprojectIdInemployeeforIncomingProjectId);
			getAllEmployeeForProjectId.add(existingEmployeeNameforIncomingProjectId);
			getAllEmployeeForProjectId.add(existingEmployeeDeptIncomingProjectId);
			
			return existingEmploeeIdforIncomingProjectId.size()>0 && !getAllEmployeeForProjectId.isEmpty()?getAllEmployeeForProjectId:null;
		}
		
		
		
		

		public List<String> checkEmployeeOnBenchOrNot(String employeeId){
			System.out.println("checkEmployeeOnBenchOrNot method"); 
			List<String> checkEmployeeOnBenchOrNot= new ArrayList();
		
			String employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject=null;
			String employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject=null;
			String projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject=null;
			
		List<Object[]>l=	(List<Object[]>) hibernateTemplate.find("select employeeName,employeeId,projectIdInEmployee  from employee where employeeId=?0 and projectIdInEmployee is not null", employeeId);
			
		for(Object []o:l) {
			for(int i=0;i<o.length;i++) {
				if(i==0) {
					employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject=o[i].toString();
				}else if(i==1) {
					employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject=o[i].toString();
				}else if(i==2) {
					projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject=o[i].toString();
				}
			}
		}
		checkEmployeeOnBenchOrNot.add(employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject);
		checkEmployeeOnBenchOrNot.add(employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject);
		checkEmployeeOnBenchOrNot.add(projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject);
		return   employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject!=null ? checkEmployeeOnBenchOrNot:null;
		
		
		}
		
		
		
		
		

		/*
		 load() throws ObjectNotFoundException if the entity does not exist because it assumes the object must be there.
		 get() returns null instead of throwing an exception, allowing you to handle missing data.

		 */
		public int assiginProjectToEmployee(String projectIdInEmployee,String employeeId) {
			System.out.println("assiginProjectToEmployee method"); 
			 
			System.err.println(employeeId);
			System.err.println(projectIdInEmployee);
		int e=	hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery("update employee set projectIdInEmployee=? where employeeId=?").setParameter(1, projectIdInEmployee).setParameter(2, employeeId).executeUpdate();
//			employee e=hibernateTemplate.get(employee.class, employeeId);
System.out.println(e);
			if(e>0) {
				 
			 
		 	 
		 	return 1;			
			}else{
				return 0;
			}
		}
		
		
		
		

		public int		releaseEmployeeFromProject(String employeeId,String projectId) {
			System.out.println("releaseEmployeeFromProject method"); 
			
			
			
			employee e=hibernateTemplate.get(employee.class, employeeId);
			if(e!=null && e.getProjectIdInEmployee().equals(projectId)) {
			e.setProjectIdInEmployee(null);
		 	hibernateTemplate.update(e);
		 	return 1;			
			}else{
				return 0;
			}

			 
		}
		
		
		
		//============================================================================================
		
		
		

	
			 
			
			/*
			 ->below method
You're using table names instead of entity names.
Hibernate HQL works with entity names and field names (not table names).
Fix: Use Java entity class names instead of database table names.
You need to use entity field names, not column names.
Fix: Ensure the field names match the ones in your @Entity class.

here i can see that HQL is more entiry class and in property orinted clientID is property in enitity class but column in table is clientiD,
if i use clientid here then this code will not work

✔ Use Native Query (createNativeQuery) → When working with complex joins, raw SQL, or when you need performance optimization.
✅ Directly matches database table & column names
✅ Bypasses Hibernate’s entity mapping & field names
✅ Works like raw SQL in MySQL/PostgreSQL

✔ Use HQL (createQuery) → When working with Hibernate entity mappings, to keep the code more object-oriented.
			 */
		public List<String> getAllClientId(){
			System.out.println("getAllClientId method");
			List <String> listOfClientId = new ArrayList();
				
		listOfClientId= (List<String>) hibernateTemplate.find("select clientID from client");
			 if(!listOfClientId.isEmpty()) {
				 return listOfClientId;
			 }else {	
				 return null;
			 }
}
		
		

		/* 
		 NativeQuery
 ✅ Directly matches database table & column names
✅ Bypasses Hibernate’s entity mapping & field names
✅ Works like raw SQL in MySQL/PostgreSQL
		 */
		public List<String> getAllClientName(){

			System.out.println("getAllClientName method");
			List <String> listOfClientName = new ArrayList();
			
			Session session=hibernateTemplate.getSessionFactory().getCurrentSession();
			Query<String> q=session.createNativeQuery("select clientName from client");
			
			listOfClientName=	(List<String>)q.getResultList(); 
			 
						return  !listOfClientName.isEmpty()?listOfClientName:null;
}
		
		 
		
		 
		  
		
	 
				 

		public List<List> getAllProject(){
			System.out.println("getAllProject method");
			List <List> getAllProject=  new ArrayList();
			
			List<String> projectId = new ArrayList();
			List<String> clientIdInProject = new ArrayList();
			List<String> projectName = new ArrayList(); 

			Session session=hibernateTemplate.getSessionFactory().getCurrentSession();
			Query<Object[]> q=session.createNativeQuery("select projectId,clientIdInProject,projectName from project");
			
			List<Object[]>l=	(List<Object[]>)q.getResultList(); 
for(Object []o:l) {
	for(int i=0;i<o.length;i++) {
		if(i==0) {
			projectId.add((String)o[i]);
		}else if(i==1) {
			clientIdInProject.add((String)o[i]);
		}else if(i==2) {

			projectName.add((String)o[i]);
		}
	}
}			 
getAllProject.add(projectId);
getAllProject.add(clientIdInProject);
getAllProject.add(projectName);

			return  !projectId.isEmpty()?getAllProject:null;
			 
}
		
			 
				
				
				
		
		
		
		
		
		
		


		public List<List> getAllProjectForClientId(String clientId){
			System.out.println("getAllProjectForClientId method");
			List <List> getAllProjectForClientId=  new ArrayList();


				List<String> existingProjectIdforIncomingClientId  = new ArrayList();
				List<String>	existingClientIdInprojectforIncomingClientId = new ArrayList();
				List<String> existingProjectNameforIncomingClientId  = new ArrayList();
				Session session=hibernateTemplate.getSessionFactory().getCurrentSession();
				String sql=" select projectId,clientIdInProject,projectName  from project inner join client on clientIdInProject=clientID where clientIdInProject=?";
				Query<Object[]> q=session.createNativeQuery(sql);
				q.setParameter(1, clientId);
				List<Object[]>l=	(List<Object[]>)q.getResultList(); 
				
				 
				 
				for(Object[]o:l) {
					for(int i=0;i<o.length;i++) {
						if(i==0) {
							existingProjectIdforIncomingClientId.add((String)o[i]);
						}else if(i==1) {
							existingClientIdInprojectforIncomingClientId.add((String)o[i]);
						}else if(i==2) {
							existingProjectNameforIncomingClientId.add((String) o[i]);
						}
					}
				}
				getAllProjectForClientId.add(existingProjectIdforIncomingClientId);
				getAllProjectForClientId.add(existingClientIdInprojectforIncomingClientId);
				getAllProjectForClientId.add(existingProjectNameforIncomingClientId);
				
				
				return !existingProjectIdforIncomingClientId.isEmpty()?getAllProjectForClientId:null;
		 
}
		
		
		
		
		

		
		public List<String> checkProjectAssignedToClientOrNot(String projectId){
			System.out.println("checkProjectAssignedToClientOrNot method"); 
			List<String> checkProjectAssignedToClientOrNot= new ArrayList();


			String projectIdOfProjectWhichAlreadyHaveClient=null;
			String projectNameOfProjectWhichAlreadyHaveClient=null;
			String clientIdInProjectOfClientWhichAlreadyHaveProject=null;
			
			
			
			Session session=hibernateTemplate.getSessionFactory().getCurrentSession();
 
			String sql2="select projectId,projectName,clientIdInProject  from project where projectId=? and clientIdInProject is not null";
			Query<Object[]> q=session.createNativeQuery(sql2);
			q.setParameter(1, projectId);
			List<Object[]>l=	(List<Object[]>)q.getResultList(); 
			

			for(Object[]o:l) {
				for(int i=0;i<o.length;i++) {
					if(i==0) {
						projectIdOfProjectWhichAlreadyHaveClient=(String)o[i];
					}else if(i==1) {
						projectNameOfProjectWhichAlreadyHaveClient=(String)o[i];
					}else if(i==2) {
						clientIdInProjectOfClientWhichAlreadyHaveProject=(String) o[i];
					}
				}
			}

			checkProjectAssignedToClientOrNot.add(projectIdOfProjectWhichAlreadyHaveClient);
			checkProjectAssignedToClientOrNot.add(projectNameOfProjectWhichAlreadyHaveClient);
			checkProjectAssignedToClientOrNot.add(clientIdInProjectOfClientWhichAlreadyHaveProject);
			return projectIdOfProjectWhichAlreadyHaveClient!=null?checkProjectAssignedToClientOrNot:null;
			 
			
		}
		//================================================================================

		public int assiginProjectToClient(String clientId,String projectId) {
			System.out.println("assiginProjectToClient method"); 
			
			
			project p=hibernateTemplate.get(project.class, projectId);
			if(p!=null) {
				p.setClientIdInProject(clientId);
				return 1;
			}else {
				return 0;
			}
			 
		}
		
		
		
		
		

		public List<List> getAllContactPersonForClientId(String clientId){
			System.out.println("getAllContactPersonForClientId method");
			List <List> getAllContactPersonForClientId=  new ArrayList();

			List<String> existingclientIdInContactPersonforIncomingClientId = new ArrayList();
			List<String> existingcontactPersonNameforIncomingClientId = new ArrayList();
			List<String> existingemailforIncomingClientId = new ArrayList();
			List<String> existingphoneforIncomingClientId = new ArrayList(); 
			List<String> existingdesignationforIncomingClientId = new ArrayList(); 
  	

			String sql=" select clientIdInContactPerson,contactPersonName,email,phone,designation  from contactPerson inner join client on clientIdInContactPerson=clientId where clientIdInContactPerson=?";
			 
			List<Object []>l=(List<Object[]>)  hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, clientId).getResultList();
			
			for(Object []o:l) {
				
				for(int i=0;i<o.length;i++) {
				if(i==0) {
					existingclientIdInContactPersonforIncomingClientId.add((String)o[i]);
				}else if(i==1) {
					existingcontactPersonNameforIncomingClientId.add((String)o[i]);
				}else if(i==2) {
					existingemailforIncomingClientId.add((String)o[i]);
				}else if(i==3) {
					existingphoneforIncomingClientId.add((String)o[i]);
				}else if(i==4) {
					existingdesignationforIncomingClientId.add((String)o[i]);
				}
			}
			}
			getAllContactPersonForClientId.add(existingclientIdInContactPersonforIncomingClientId);
			getAllContactPersonForClientId.add(existingcontactPersonNameforIncomingClientId);
			getAllContactPersonForClientId.add(existingemailforIncomingClientId);
			getAllContactPersonForClientId.add(existingphoneforIncomingClientId);
			getAllContactPersonForClientId.add(existingdesignationforIncomingClientId);
			
			return !existingclientIdInContactPersonforIncomingClientId.isEmpty()?getAllContactPersonForClientId:null;
		}
		
		
		@Override
		public int insertIntoContactPerson2(contactPerson contactPerson) {
			System.out.println("insertIntoContactPerson2 method");
			   Serializable id =	hibernateTemplate.save(contactPerson);
			 
			
				if(id!=null ){
					return 1;
				}else {
					return 0;
				}
			
 
		}
		 
		
		
		
		
		
		//==========================================================================
		
		
		//==============method used in searchClient_step1.jsp and, in servlets for URI fired from searchClient_step1.jsp==========================================================

		public List<List> getAllClient(){
			System.out.println("getAllClient method");
			List <List> getAllClient=  new ArrayList();
			
			List<String> listOfclientId=new ArrayList();
			List<String> listOfclientName=new ArrayList();
			List<String> listOfemailClient=new ArrayList();
			List<String> listOfclientRelationshaipDate=new ArrayList(); 

			
			
		List<client>l=	hibernateTemplate.loadAll(client.class);
			
		for(client c:l) {
			listOfclientId.add( c.getClientID());
			listOfclientName.add( c.getClientName());
			listOfemailClient.add(c.getEmailClient());
			listOfclientRelationshaipDate.add(c.getClientRelationshaipDate() );
		}

		getAllClient.add(listOfclientId);
		getAllClient.add(listOfclientName);
		getAllClient.add(listOfemailClient);
		getAllClient.add(listOfclientRelationshaipDate);
		 
		return !listOfclientId.isEmpty()?getAllClient:null;
			 }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


		public List<List> getAllProjectForClientId2(String clientId){
			System.out.println("getAllProjectForClientId2 method");
			
			
			List <List> getAllProjectForClientId2=  new ArrayList();


			 List<String> listOfprojectId=new ArrayList();
			 List<String> listOfprojectName=new ArrayList();
			 List<String> listofprojectDateOfStart=new ArrayList();
			 List<String> listofprojectDateOfEnd=new ArrayList();
			 List<String> listclientIdInProject=new ArrayList(); 

			 
			 
			 String sql="select projectId,projectName,projectDateOfStart,projectDateOfEnd,clientIdInProject  from project inner join client on clientIdInProject=clientId where clientId=?";
			 List<Object []>  qq  = (List<Object[]>) hibernateTemplate.getSessionFactory().getCurrentSession()
					 .createNativeQuery(sql).setParameter(1, clientId).getResultList();
			 
			 for(Object[] o : qq) {
				 for(int i=0;i<o.length;i++) {
					 if(i==0) {
						 listOfprojectId.add((String)o[i]);
					 }else if(i==1) {
						 listOfprojectName.add((String)o[i]);
					 }else if(i==2) {
						 listofprojectDateOfStart.add((String)o[i]);
					 }else if(i==3) {
						 listofprojectDateOfEnd.add((String)o[i]);
					 }else if(i==4) {
						 listclientIdInProject.add((String)o[i]);
					  
				 }
			 }
			 }
					getAllProjectForClientId2.add(listOfprojectId);
					getAllProjectForClientId2.add(listOfprojectName);
					getAllProjectForClientId2.add(listofprojectDateOfStart);
					getAllProjectForClientId2.add(listofprojectDateOfEnd);
					getAllProjectForClientId2.add(listclientIdInProject);
					return !listOfprojectId.isEmpty()?getAllProjectForClientId2:null;
		  
}
		//======method used in searchProject_step1.jsp and, in servlets for URI fired from searchProject_step1.jsp======
		
		
		


		public List<List> getAllProjectEveryColumn(){ 
				System.out.println("getAllProjectEveryColumn method");
				List <List> getAllProjectEveryColumn=  new ArrayList();
				
				List<String> listOfprojectId=new ArrayList();
				List<String> listOfprojectName=new ArrayList();
				List<String> listofprojectDateOfStart=new ArrayList();
				List<String> listofprojectDateOfEnd=new ArrayList();
				List<String> listclientIdInProject=new ArrayList(); 

				
				List<project> p=hibernateTemplate.loadAll(project.class);
				
				for(project o:p) {
					listOfprojectId.add(o.getProjectId());
					listOfprojectName.add(o.getProjectName());
					listofprojectDateOfStart.add(o.getStartDate()); 

					listofprojectDateOfEnd.add(o.getEndDate());
					listclientIdInProject.add(o.getClientIdInProject()); 
					
				}
				getAllProjectEveryColumn.add(listOfprojectId);
				getAllProjectEveryColumn.add(listOfprojectName);
				getAllProjectEveryColumn.add(listofprojectDateOfStart);
				getAllProjectEveryColumn.add(listofprojectDateOfEnd); 
				getAllProjectEveryColumn.add(listclientIdInProject); 
				 
				
				return !listOfprojectId.isEmpty()?getAllProjectEveryColumn:null;
		}
			
			
		
		 
		 
		public List<List> getAllProjectEveryColumnByProjectId(String projectId){ 
				System.out.println("getAllProjectEveryColumnByProjectId method");
				List <List> getAllProjectEveryColumn=  new ArrayList();
				
				List<String> listOfprojectId=new ArrayList();
				List<String> listOfprojectName=new ArrayList();
				List<String> listofprojectDateOfStart=new ArrayList();
				List<String> listofprojectDateOfEnd=new ArrayList();
				List<String> listclientIdInProject=new ArrayList(); 
				String sql="select projectId,projectName,projectDateOfStart,projectDateOfEnd,clientIdInProject  from project where projectId=?";
			List<Object[]>l=(List<Object[]>)	hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, projectId).getResultList();
	  
			
			
				
				for(Object[] o:l) {
					for(int i=0;i<o.length;i++) {
						if(i==0) {

							listOfprojectId.add((String)o[i]);
						}else if(i==1) {

							listOfprojectName.add((String)o[i]);
						}else if(i==2) {
							listofprojectDateOfStart.add((String)o[i]);
						}else if(i==3){
							listofprojectDateOfEnd.add((String)o[i]);
						}else if(i==4) {
							listclientIdInProject.add((String)o[i]);
						} 
					} 
				}

				getAllProjectEveryColumn.add(listOfprojectId);
				getAllProjectEveryColumn.add(listOfprojectName);
				getAllProjectEveryColumn.add(listofprojectDateOfStart);
				getAllProjectEveryColumn.add(listofprojectDateOfEnd); 
				getAllProjectEveryColumn.add(listclientIdInProject); 
				 
				
				
				return !listOfprojectId.isEmpty()?getAllProjectEveryColumn:null;
				 
	}
		
		
		
		
		
		


		public List<List> getAllClientByProjectId(String projectId){
			System.out.println("getAllClientByProjectId method");
			List <List> getAllClientByProjectId=  new ArrayList();
			

			 List<String> listOfclientid=new ArrayList();
			 List<String> listOfclientName=new ArrayList();
			 List<String> listofemailClient=new ArrayList();
			 List<String> listofclientRelationshaipDate=new ArrayList();
			 

			String sql = "select clientid,clientName,emailClient,clientRelationshaipDate from client inner join project on clientId=clientIdInProject where projectId=?";

			
			List<Object[]>l=(List<Object[]>)	hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, projectId).getResultList();

			for(Object[] o:l) {
				for(int i=0;i<o.length;i++) {
					if(i==0) {
						listOfclientid.add((String)o[i]);
					}else if(i==1) {
						listOfclientName.add((String)o[i]);
					}else if(i==2) {
						listofemailClient.add((String)o[i]);
					}else if(i==3){
						listofclientRelationshaipDate.add((String)o[i]);
					}
			}
			 
			}
getAllClientByProjectId.add(listOfclientid);
getAllClientByProjectId.add(listOfclientName);
getAllClientByProjectId.add(listofemailClient);
getAllClientByProjectId.add(listofclientRelationshaipDate);
 

		return !listOfclientid.isEmpty()? getAllClientByProjectId:null; 
		
			}
		
		
		
		
		
		
		
		
		
		

		public List<List> getAllEmployeeEveryColumnByProjectId(String projectId){
			System.out.println("getAllEmployeeEveryColumnByProjectId method");
			List <List> getAllEmployeeEveryColumnByProjectId=  new ArrayList();
			
			 List<String> listOfemployeeId=new ArrayList();
			 List<String> listOfemployeeName=new ArrayList();
			 List<String> listofemployeeDept=new ArrayList();
			 List<String> listofemployeeEmail=new ArrayList();
			 List<String> listofemployeePhone=new ArrayList();
			 List<String> listofemployeeDOJ=new ArrayList();
			 List<String> listofprojectIdInEmployee=new ArrayList();
			 
			 
			 
			 String sql="select employeeId,employeeName,employeeDept,employeeEmail,employeePhone,employeeDOJ,projectIdInEmployee from employee inner join project on projectIdInEmployee=projectId where projectId=?";
				List<Object[]>l=(List<Object[]>)	hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, projectId).getResultList();
		  

				for(Object[] o:l) {
					for(int i=0;i<o.length;i++) {
						if(i==0) {
							listOfemployeeId.add((String)o[i]);
						}else if(i==1) {
							listOfemployeeName.add((String)o[i]);
						}else if(i==2) {
							listofemployeeDept.add((String)o[i]);
						}else if(i==3){
							listofemployeeEmail.add((String)o[i]);
						}else if(i==4) {
							listofemployeePhone.add((String)o[i]);
						}else if(i==5) {
							listofemployeeDOJ.add((String)o[i]);
						}else if(i==6) {
							listofprojectIdInEmployee.add((String)o[i]);
						}
				}
				 
				}
				

				getAllEmployeeEveryColumnByProjectId.add(listOfemployeeId);
				getAllEmployeeEveryColumnByProjectId.add(listOfemployeeName);
				getAllEmployeeEveryColumnByProjectId.add(listofemployeeDept);
				getAllEmployeeEveryColumnByProjectId.add(listofemployeeEmail);
				getAllEmployeeEveryColumnByProjectId.add(listofemployeePhone);
				getAllEmployeeEveryColumnByProjectId.add(listofemployeeDOJ);
				getAllEmployeeEveryColumnByProjectId.add(listofprojectIdInEmployee);
				 
				return !listOfemployeeId.isEmpty()?getAllEmployeeEveryColumnByProjectId:null;
			 

		
		}
		//======method used in searchEmployee_step1.jsp and, in servlets for URI fired from searchEmployee_step1.jsp======
		
				
				
				
 
				
				 
					 
				
				
		
public List<List> getAllEmployeeEveryColumn( ){
				System.out.println("getAllEmployeeEveryColumn method");
				List <List> getAllEmployeeEveryColumn=  new ArrayList();
				
				 List<String> listOfemployeeId=new ArrayList();
				 List<String> listOfemployeeName=new ArrayList();
				 List<String> listofemployeeDept=new ArrayList();
				 List<String> listofemployeeEmail=new ArrayList();
				 List<String> listofemployeePhone=new ArrayList();
				 List<String> listofemployeeDOJ=new ArrayList();
				 List<String> listofprojectIdInEmployee=new ArrayList();
				 
				 
				 List<employee>l= hibernateTemplate.loadAll(employee.class);
				 
				 for(employee o:l) {
					 listOfemployeeId.add(o.getEmployeeId());
	 					listOfemployeeName.add(o.getEmployeeName());
	 					listofemployeeDept.add(o.getEmployeeDept());
	 					listofemployeeEmail.add(o.getEmployeeEmail());
	 					listofemployeePhone.add(o.getEmployeePhone());
	 					listofemployeeDOJ.add(o.getEmployeeDOJ());
	 					listofprojectIdInEmployee.add(o.getProjectIdInEmployee()); 
	 					
	 					
				 }
				 
					

					getAllEmployeeEveryColumn.add(listOfemployeeId);
					getAllEmployeeEveryColumn.add(listOfemployeeName);
					getAllEmployeeEveryColumn.add(listofemployeeDept);
					getAllEmployeeEveryColumn.add(listofemployeeEmail);
					getAllEmployeeEveryColumn.add(listofemployeePhone);
					getAllEmployeeEveryColumn.add(listofemployeeDOJ);
					getAllEmployeeEveryColumn.add(listofprojectIdInEmployee);
					 
					
							return !listOfemployeeId.isEmpty()?getAllEmployeeEveryColumn:null;
							 
	}

			
				
				
				
				 
				
				
				
				


public List<String> getAllEmployeeByEmployeeId(String employeeId1){
	System.out.println("getAllEmployeeByEmployeeId method");
	List <String> getAllEmployeeByEmployeeId=  new ArrayList();
/*
	String employeeId=null;
	String employeeName=null;
	String employeeDept=null;
	String employeeEmail=null;
	String employeePhone=null;
	String employeeDOJ=null;
	String projectIdInEmployee=null;
*/
	
	employee e=hibernateTemplate.get(employee.class, employeeId1);
if(e!=null) {
	getAllEmployeeByEmployeeId.add(e.getEmployeeId());
	getAllEmployeeByEmployeeId.add(e.getEmployeeName());
	getAllEmployeeByEmployeeId.add(e.getEmployeeDept());
	getAllEmployeeByEmployeeId.add(e.getEmployeeEmail());
	getAllEmployeeByEmployeeId.add(e.getEmployeePhone());
	getAllEmployeeByEmployeeId.add(e.getEmployeeDOJ());
	getAllEmployeeByEmployeeId.add(e.getProjectIdInEmployee());
}
	return e!=null?getAllEmployeeByEmployeeId:null;
	
	 
}
			
				
				
				 









public List<String> getEmployeeAndProjectByEmployeeId(String employeeId){
	System.out.println("getEmployeeAndProjectByEmployeeId  method");
	List <String> getEmployeeAndProjectByEmployeeId=new ArrayList();
	

	 String employeeEmail=null;
	 String employeePhone=null;
	 
	 String projectId=null;
	 String projectName=null;
	 String projectDateOfStart=null;
	 String projectDateOfEnd=null; 
	 
	  
	 String sql="select  employeeEmail,employeePhone,projectId,projectName,projectDateOfStart,projectDateOfEnd from employee inner join project on projectIdInEmployee=projectId where employeeId=?";
	 List<Object[]>l=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, employeeId).getResultList();
	 
	 
	 for(Object[] o:l) {
		 for(int i=0;i<o.length;i++) {
			 if(i==0) {
				 employeeEmail=(String)o[i];
			 }else if(i==1) {
				 employeePhone=(String)o[i];
			 }else if(i==2) {
				 projectId=(String)o[i];
			 }else if(i==3) {
				 projectName=(String)o[i];
			 }else if(i==4) {
				 projectDateOfStart=(String)o[i];
			 }else if(i==5) {
				 projectDateOfEnd=(String)o[i];
			 }
		 }
	 }
		
		getEmployeeAndProjectByEmployeeId.add(employeeEmail);
		getEmployeeAndProjectByEmployeeId.add(employeePhone);
		getEmployeeAndProjectByEmployeeId.add(projectId);
		
		getEmployeeAndProjectByEmployeeId.add(projectName);
		getEmployeeAndProjectByEmployeeId.add(projectDateOfStart);
		getEmployeeAndProjectByEmployeeId.add(projectDateOfEnd);
		return employeeEmail!=null?getEmployeeAndProjectByEmployeeId:null;
	 
}










public List<List> getEmployeeOnBench(){
	System.out.println("getEmployeeOnBench method");
	List <List> getEmployeeOnBench=  new ArrayList();
	
	 List<String> listOfemployeeId=new ArrayList();
	 List<String> listOfemployeeName=new ArrayList();
	 List<String> listOfemployeeDept=new ArrayList();
	 List<String> listOfemployeeEmail=new ArrayList();
	 List<String> listOfemployeePhone=new ArrayList();
	 List<String> listOfemployeeDOJ=new ArrayList();
	 List<String> listOfprojectIdInEmployee=new ArrayList();
	 
	 
	 
	  
 
		 String sql="select employeeId,employeeName,employeeDept,employeeEmail,employeePhone,employeeDOJ,projectIdInEmployee from employee where projectIdInEmployee is null";
		 List<Object[]>l=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).getResultList();
		 
		 for(Object[] o:l) {
			 for(int i=0;i<o.length;i++) {
				 if(i==0) {
					 listOfemployeeId.add((String)o[i]);
				 }else if(i==1) {
						listOfemployeeName.add((String)o[i]);
				 }else if(i==2) {
					 listOfemployeeDept.add((String)o[i]);
				 }else if(i==3) {
					 listOfemployeeEmail.add((String)o[i]);
				 }else if(i==4) {
						listOfemployeePhone.add((String)o[i]);
				 }else if(i==5) {
						listOfemployeeDOJ.add((String)o[i]);
				 }else if(i==6) {
					 listOfprojectIdInEmployee.add((String)o[i]);
				 }
			 }
		 }
			


			getEmployeeOnBench.add(listOfemployeeId);
			getEmployeeOnBench.add(listOfemployeeName);
			getEmployeeOnBench.add(listOfemployeeDept);
			getEmployeeOnBench.add(listOfemployeeEmail);
			getEmployeeOnBench.add(listOfemployeePhone);
			getEmployeeOnBench.add(listOfemployeeDOJ);
			getEmployeeOnBench.add(listOfprojectIdInEmployee);
			 
			
					return !listOfemployeeId.isEmpty()? getEmployeeOnBench:null;
		 
		  
}



















public List<List> getAllEmployeeByEmployeeEmail(String employeeEmail){
	System.out.println("getAllEmployeeByEmployeeEmail method");
	List <List> getAllEmployeeByEmployeeEmail=  new ArrayList();
	
	 List<String> listOfemployeeId=new ArrayList();
	 List<String> listOfemployeeName=new ArrayList();
	 List<String> listofemployeeDept=new ArrayList();
	 List<String> listofemployeeEmail=new ArrayList();
	 List<String> listofemployeePhone=new ArrayList();
	 List<String> listofemployeeDOJ=new ArrayList();
	 List<String> listofprojectIdInEmployee=new ArrayList();
	 
	 
	 

	 
	 String sql="select employeeId,employeeName,employeeDept,employeeEmail,employeePhone,employeeDOJ,projectIdInEmployee from employee where employeeEmail=?";
		 List<Object[]>l=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, employeeEmail) .getResultList();
	 
	 for(Object[] o:l) {
		 for(int i=0;i<o.length;i++) {
			 if(i==0) {
				 listOfemployeeId.add((String)o[i]);
			 }else if(i==1) {
					listOfemployeeName.add((String)o[i]);
			 }else if(i==2) {
				 listofemployeeDept.add((String)o[i]);
			 }else if(i==3) {
				 listofemployeeEmail.add((String)o[i]);
			 }else if(i==4) {
				 listofemployeePhone.add((String)o[i]);
			 }else if(i==5) {
				 listofemployeeDOJ.add((String)o[i]);
			 }else if(i==6) {
				 listofprojectIdInEmployee.add((String)o[i]);
			 }
		 }
	 }
		


		getAllEmployeeByEmployeeEmail.add(listOfemployeeId);
		getAllEmployeeByEmployeeEmail.add(listOfemployeeName);
		getAllEmployeeByEmployeeEmail.add(listofemployeeDept);
		getAllEmployeeByEmployeeEmail.add(listofemployeeEmail);
		getAllEmployeeByEmployeeEmail.add(listofemployeePhone);
		getAllEmployeeByEmployeeEmail.add(listofemployeeDOJ);
		getAllEmployeeByEmployeeEmail.add(listofprojectIdInEmployee);
		 
		
				return !listOfemployeeId.isEmpty()? getAllEmployeeByEmployeeEmail:null;
	 
	 
	  
}
		
				 
	
	
	
	
	
	 
	
	//======method used in update_delete_client_step1.jsp and, in servlets for URI fired from update_delete_client_step1.jsp======						

public List<String> getAllClientByClientId(String clientId){
	System.out.println("getAllClientByClientId method");
	List <String> getAllClientByClientId=  new ArrayList();
	
/*
	String clientId2=null;
	String clientName=null;
	String emailClient=null;
	String clientRelationshaipDate=null; 
*/
	
	client c=hibernateTemplate.get(client.class, clientId);
	
if(c!=null){
	getAllClientByClientId.add(c.getClientID());
	getAllClientByClientId.add(c.getClientName());
	getAllClientByClientId.add(c.getEmailClient());
	getAllClientByClientId.add(c.getClientRelationshaipDate());
}
return c!=null?getAllClientByClientId:null;	
	
	 
}
	











@Override
public int updateClient(client client,String clientId) {
	System.out.println("updateClient method");

client c=hibernateTemplate.get(client.class, clientId);
if(c!=null) {
//c.setClientID(clientId);
c.setClientName(client.getClientName());
c.setEmailClient(client.getEmailClient());
c.setClientRelationshaipDate(client.getClientRelationshaipDate());
hibernateTemplate.update(c);
return 1;
}
return 0;
	
	 
}









 


public int deleteClientByClientId(String clientId2) {
	System.out.println("deleteClientByClientId method");
 
	client c=hibernateTemplate.get(client.class, clientId2);
	 
	if(c!=null) {
	hibernateTemplate.delete(c);
	int i=1;
	
	
	// also making clientIdInContactPerson column in contactPerson Table null
	String sql = "update contactPerson set clientIdInContactPerson=null where clientIdInContactPerson=?"; 
	 Query q= hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, clientId2);
	  i+=q.executeUpdate();if(i>1) {i=2;};
	if(i>1) {

	// also making clientIdInProject column in project Table null
	String sql2 = "update project set clientIdInProject=null where clientIdInProject=?";
	 Query q2= hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql2).setParameter(1, clientId2);
		i+=q2.executeUpdate();if(i>2) {i=3;};
		
		if(i>2) {
			System.err.println("client deleted");
			System.err.println("clientIdInProject column in project Table become null(client released from project)");
			System.err.println("clientIdInContactPerson column in contactPerson Table become null(client released from contactperson)");
			//"returning i=3 if clent dleted,client released from contactperson, client released from project"
			return 3;
		}else {
			//"returning i=2 if clent dleted, client released from contactperson,but client not released from project,"
			System.err.println("clientIdInProject column in project Table not become null");
			return 2;
		}
	}else {
		//"returning i=1 if clent dleted,but client not released from contactperson,but client not released from project,"
		System.err.println("clientIdInContactPerson column in contactPerson Table not null");
		return 1;
	}
} else {
//	"returning i=0 if clent not dleted,but client not released from contactperson,but client not released from project,"
	System.err.println("client  not deleted");
	return 0;
}
	 /*
	String sql = "delete from client  where clientId=?";
	try {
		Connection connection = jdbcConnection.getMysqlConnection();
		PreparedStatement ps1 = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		ps1.setString(1, clientId2);
		ps1.execute();
		int rs = ps1.getUpdateCount();
		System.out.println("checking if client is deleted or not ");
		if (rs > 0) {
			System.out.println("YES, client is deleted  ");
			rs=0;
			// also making clientIdInContactPerson column in contactPerson Table null
			sql = "update contactPerson set clientIdInContactPerson=null where clientIdInContactPerson=?";
			ps1 = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ps1.setString(1, clientId2);
			ps1.execute();
			rs = ps1.getUpdateCount();
			if(rs>0) {
				rs=0;
				// also making clientIdInProject column in project Table null
				sql = "update project set clientIdInProject=null where clientIdInProject=?";
				ps1 = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ps1.setString(1, clientId2);
				ps1.execute();
				rs = ps1.getUpdateCount();
				if(rs>0) {
				return rs;
				}else {
					return 0;
				}
			}else {
				return 0;
			}
		} else {
			return 0;
		}
	}catch(Exception ex) {
		System.out.println("exception in DAOImplementationClass.java ,in deleteClientByClientId(method)");
		System.out.println(ex.getMessage());
		ex.printStackTrace();
	}	
			
	return 0;
	*/
}

//======method used in update_delete_project_step1.jsp and, in servlets for URI fired from update_delete_project_step1.jsp======










public List<String> getAllProjectByProjectId(String projectId2){ 
		System.out.println("getAllProjectByProjectId method");
		List <String> getAllProjectByProjectId=  new ArrayList();
		
	 
		String projectId=null;
		String projectName = null;
		String projectDateOfStart = null;
		String projectDateOfEnd = null;
		String clientIdInProject = null;
		// getting employee details from db by employee Id

		
		project p=hibernateTemplate.get(project.class, projectId2);
		if(p!=null){
		projectId = p.getProjectId();
		projectName = p.getProjectName();
		projectDateOfStart = p.getStartDate();
		projectDateOfEnd = p.getEndDate();
		clientIdInProject = p.getClientIdInProject();
		}

		getAllProjectByProjectId.add(projectId);
		getAllProjectByProjectId.add(projectName);
		getAllProjectByProjectId.add(projectDateOfStart);
		getAllProjectByProjectId.add(projectDateOfEnd); 
		getAllProjectByProjectId.add(clientIdInProject); 
		 
		return p!=null?getAllProjectByProjectId:null;
		 
}








public int updateProject(project project,String projectId) {
	System.out.println("updateProject method");

	
	
	
	
	//String sql = "update project set  projectId=? ,projectName=? ,projectDateOfStart=?,projectDateOfEnd=?,clientIdInProject=?   where projectId=?";
	
	project p=hibernateTemplate.get(project.class, projectId);
	if(p!=null) {
		p.setProjectId(project.getProjectId());
	p.setProjectName(project.getProjectName());
	p.setStartDate(project.getStartDate());
	p.setEndDate(project.getEndDate());
	p.setClientIdInProject(project.getClientIdInProject());
	hibernateTemplate.update(p);
	
	return 1;
	}
	
	return 0;
	
	
}



public int deleteProjectByProjectId(String projectId) {
System.out.println("deleteProjectByProjectId method");
	String sql = "delete from project  where projectId=?";
	
	project p=hibernateTemplate.get(project.class, projectId);
	if(p!=null) {
	hibernateTemplate.delete(p);
	int i=1;
	System.out.println("YES, project is deleted  ");
	 //also making projectIdInEmployee column, in employee table null
	   sql = "update employee set projectIdInEmployee=null where projectIdInEmployee=?";
	 
	 i+=hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql).setParameter(1, projectId).executeUpdate();
	 if(i>1) {
		 System.err.println("returning rs==2 if project got deleted and also employee working on project got released");
		 //return 2 if ,project deleted and employee working on project relesed
		 return 2;
	 }else {
		 System.err.println("returning rs=1 if project only got removed ,but  employee not relesed");
		 //return 1 if ,project deleted, but employee working on project not relesed
		 	return 1;
	 }
	 
} else {
	System.err.println("returning rs=0 if project didnt got removed ,not even employee got relesed");
	 //return 0 if ,project not deleted,and employee working on project not relesed
	return 0;
}
	 
	   
}

//======method used in update_delete_employee_step1.jsp and, in servlets for URI fired from update_delete_employee_step1.jsp======
	
	
	
	 
	
	
	 
	
	
	
	
	


public int updateEmployee(employee employee,String employeeId) { 
System.out.println("updateEmployee method");


employee e=hibernateTemplate.get(employee.class, employeeId);
if(e!=null) {
	
	e.setEmployeeId(employee.getEmployeeId());
	e.setEmployeeName(employee.getEmployeeName());
	e.setEmployeeEmail(employee.getEmployeeEmail());
	e.setEmployeeDept(employee.getEmployeeDept());
	e.setEmployeePhone(employee.getEmployeePhone());
	e.setEmployeeDOJ(employee.getEmployeeDOJ());
	e.setProjectIdInEmployee(employee.getProjectIdInEmployee());
	hibernateTemplate.update(e);
	return 1;
	
}
return 0;
 
}


	


public int deleteEmployeeByEmployeeId(String employeeId) {
	System.out.println("deleteEmployeeByEmployeeId method");

	employee e=hibernateTemplate.get(employee.class, employeeId);
	if(e!=null) {
		hibernateTemplate.delete(e);
		return 1;
	}
	return 0;
	
	}


//======method used in clientDashboard_step1.jsp and, in servlets for URI fired from clientDashboard_step1.jsp========






public List<List> getAllProjectEveryColumnByClientId(String clientId){ 
		System.out.println("getAllProjectEveryColumnByClientId method");
		List <List> getAllProjectEveryColumnByClientId=  new ArrayList();
		
		List<String> listOfprojectId=new ArrayList(); 
		List<String> listOfprojectName=new ArrayList(); 
		List<String> listOfprojectDateOfStart=new ArrayList(); 
		List<String> listOfprojectDateOfEnd=new ArrayList();
		List<String> listOfclientIdinProject=new ArrayList();
		

String sql1=" select projectId, projectName,projectDateOfStart,projectDateOfEnd,clientIdInProject from project p inner join client c on p.clientIdInProject=c.clientId where c.clientId=?";
List<Object[]>l= hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql1).setParameter(1, clientId).getResultList();


for(Object[]o:l){
	System.out.println(o.length);
	
	for(int i=0;i<o.length;i++) {
		
	if(i==0) {
		listOfprojectId.add( (String)o[i] );
	}else if(i==1) {
		listOfprojectName.add( (String)o[i] );
	}else if(i==2) {
		listOfprojectDateOfStart.add( (String)o[i] );
	}else if(i==3) {
		listOfprojectDateOfEnd.add( (String)o[i] );
	}else if(i==4) {
	listOfclientIdinProject.add( (String)o[i] );
	}
	}
	 
	
}

	getAllProjectEveryColumnByClientId.add(listOfprojectId);
	getAllProjectEveryColumnByClientId.add(listOfprojectName);
	getAllProjectEveryColumnByClientId.add(listOfprojectDateOfStart);
	getAllProjectEveryColumnByClientId.add(listOfprojectDateOfEnd); 
	getAllProjectEveryColumnByClientId.add(listOfclientIdinProject); 
	 
	
			return !listOfprojectId.isEmpty()? getAllProjectEveryColumnByClientId:null;
}
  













public List<List> getAllEmployeeEveryColumnByClientId(String clientId) {

	System.out.println("getAllEmployeeEveryColumnByClientId method");

	List <List> getAllEmployeeEveryColumnByClientId=  new ArrayList();
	List<String> listOfemployeeId=new ArrayList(); 
	List<String> listOfemployeeName=new ArrayList(); 
	List<String> listOfemployeeDept=new ArrayList(); 
	List<String> listOfemployeeEmail=new ArrayList();
	List<String> listOfemployeePhone=new ArrayList();
	List<String> listOfemployeeDOJ=new ArrayList();
	List<String> listOfprojectIdInEmployee=new ArrayList();



 
String sql2=" SELECT  employeeId,employeeName,employeeDept,employeeEmail,employeePhone,employeeDOJ,projectIdInEmployee   FROM client  INNER JOIN project ON client.clientId = project.clientIdInProject  INNER JOIN employee ON project.projectId = employee.projectIdInEmployee  WHERE client.clientId = ?"; 
List<Object[]>l= hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql2).setParameter(1, clientId).getResultList();
System.out.println(l.size()+"size()");
for(Object[]o:l){
	System.out.println(o.length);
	
	for(int i=0;i<o.length;i++) {
		
	if(i==0) {
		listOfemployeeId.add( (String)o[i] );
	}else if(i==1) {
		listOfemployeeName.add( (String)o[i] );
	}else if(i==2) {
		listOfemployeeDept.add( (String)o[i] );
	}else if(i==3) {
		listOfemployeeEmail.add( (String)o[i] );
	}else if(i==4) {
		listOfemployeePhone.add( (String)o[i] );
	}else if(i==5) {
		listOfemployeeDOJ.add( (String)o[i] );
	}else if(i==6) {
		listOfprojectIdInEmployee.add( (String)o[i] );
	}
	}
}
	getAllEmployeeEveryColumnByClientId.add(listOfemployeeId);
	getAllEmployeeEveryColumnByClientId.add(listOfemployeeName);
	getAllEmployeeEveryColumnByClientId.add(listOfemployeeDept);
	getAllEmployeeEveryColumnByClientId.add(listOfemployeeEmail);
	getAllEmployeeEveryColumnByClientId.add(listOfemployeePhone);
	
	getAllEmployeeEveryColumnByClientId.add(listOfemployeeDOJ);
	getAllEmployeeEveryColumnByClientId.add(listOfprojectIdInEmployee); 
	return !listOfemployeeId.isEmpty()? getAllEmployeeEveryColumnByClientId : null;
	 
}
    
  
	
	 
	
	
	//======method used in empoyeeDashboard_step1.jsp and, in servlets for URI fired from empoyeeDashboard_step1.jsp========


 	public List<List> getAllProjectEveryColumnByemployeeId(String employeeId){
 		System.out.println("getAllProjectEveryColumnByemployeeId method");

		List <List> getAllProjectEveryColumnByemployeeId=  new ArrayList();

		  
List<String> listOfprojectId=new ArrayList(); 
List<String> listOfprojectName=new ArrayList(); 
List<String> listOfprojectDateOfStart=new ArrayList(); 
List<String> listOfprojectDateOfEnd=new ArrayList();
List<String> listOfclientIdinProject=new ArrayList();





String sql1="select projectId, projectName,projectDateOfStart,projectDateOfEnd,clientIdInProject from project p inner join employee e on p.projectId=e.projectIdInEmployee where e.employeeId=?";
List<Object[]>l= hibernateTemplate.getSessionFactory().getCurrentSession().createNativeQuery(sql1).setParameter(1, employeeId).getResultList();



for(Object[]o:l){
	System.out.println(o.length);
	
	for(int i=0;i<o.length;i++) {
		
	if(i==0) {
		listOfprojectId.add( (String)o[i] );
	}else if(i==1) {
		listOfprojectName.add( (String)o[i] );
	}else if(i==2) {
		listOfprojectDateOfStart.add( (String)o[i] );
	}else if(i==3) {
		listOfprojectDateOfEnd.add( (String)o[i] );
	}else if(i==4) {
	listOfclientIdinProject.add( (String)o[i] );
	}
	}
	 
	
}

getAllProjectEveryColumnByemployeeId.add(listOfprojectId);
getAllProjectEveryColumnByemployeeId.add(listOfprojectName);
getAllProjectEveryColumnByemployeeId.add(listOfprojectDateOfStart);
getAllProjectEveryColumnByemployeeId.add(listOfprojectDateOfEnd);
getAllProjectEveryColumnByemployeeId.add(listOfclientIdinProject); 



return !listOfprojectId.isEmpty()?	getAllProjectEveryColumnByemployeeId:null;
 
 	}
	/*
	*/
}
