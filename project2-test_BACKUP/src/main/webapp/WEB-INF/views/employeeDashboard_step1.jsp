  <%@page import="com.example.project2_test.DAO_Repository.DAOInterface"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%> 
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="c2" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html style="height:95vh" >
<head>
 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<!-- title bar css -->
<style>
       
        body {
            font-family: Arial, sans-serif;
        }
        .title-bar { 
            background-color: rgba(0,0,0,0.5) ; 
            height:5%;  display:flex; border-bottom:2px solid rgba(0,0,0,1); 
        }
        .title-bar .menu-item {
            position: relative;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
        }
        .menu-item:hover {
            background-color: #555;
        }
        .dropdown {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: white;
            border-radius:4px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            min-width: 240px;
        }
        .dropdown a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: black;
        }
        .dropdown a:hover {
            background-color: #ddd;
        }
        .menu-item:hover .dropdown {
            display: block;
        }
    </style>
<!--(ends) title bar css -->
<style>

 input:not([type="submit"]):not([type="reset"]), 
input[type="search"] {
    width: 85%;                
    height: 7px;               
    padding: 10px;
    font-size: 16px;
    border: 2px solid #ddd;
    border-radius: 8px;
    outline: none;
    transition: all 0.3s ease-in-out;
    display: inline;           
    box-sizing: border-box;    
    margin: 3px;                
}
 
    input[type="submit"]:hover {
        transform: scale(1.05);
        box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.15);
          
    }
      a:hover {
        /*background: linear-gradient(to right, #218838, #1e7e34);*/
        transform: scale(1.05);
    }
    .a{
    display: block; 
          height: 10px; 
          width: 150px; 
          background: linear-gradient(to right, #28a745, #218838); 
          color: white; 
          text-align: center; 
          /*line-height: 40px;*/ 
          text-decoration: none; 
          font-size: 16px; 
          font-weight: bold; 
          border-radius: 8px; 
          transition: all 0.3s ease;
    }
</style>
<!-- suggestion css-->
<style>
        body { font-family: Arial, sans-serif; }
        .autocomplete-suggestions {
            border: 1px solid #ccc;
            max-width: 300px;
            position: absolute;
            background: white;
            z-index: 1000;
            display: none;
        }
        .suggestion {
            padding: 8px;
            cursor: pointer;
        }
        
        .suggestion:hover {
            background: #f0f0f0;
        }
        .error-message {
            color: red;
            display: none;
            margin-top: 5px;
        }
        
         .autocomplete-suggestions2 {
            border: 1px solid #ccc;
            max-width: 300px;
            position: absolute;
            background: white;
            z-index: 1000;
            display: none;
        }
        .suggestion2 {
            padding: 8px;
            cursor: pointer;
        }
        
        .suggestion2:hover {
            background: #f0f0f0;
        }
        .error-message2 {
            color: red;
            display: none;
            margin-top: 5px;
        }
    </style>
       <%--style for table element --%>
    <style> 
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
    </style>
    
      <%--((((ENDS)))))style for table element --%>
<title></title>
</head>
<body style="   height:100%">
<header>
<nav></nav>
</header>
<main>
<section >



<%--*************main outher element*(outer flex container)***************** --%>
<div style="height:95vh;margin:50px 30px 0px 30px;  display:flex; border:5px solid rgba(0,150,200,0.5); flex-direction:column;border-bottom-width:0px;border-radius: 30px 30px 0px 0px ;box-shadow: 0px 20px 40px 15px black "><!-- flex container starts -->
 
<%--************title bar flex item 1 in outer flex container***************** --%>
<!-- 
  <div class="title-bar" style="border-radius: 25px 25px 0px 0px;color:black">
 
        <div class="menu-item">add member
            <div class="dropdown">
                <a href="addEmployeeButtonClick">addEmployee</a>
                <a href="addProjectButtonClick">addProject</a>
                <a href="addClientButtonClick">addClient</a>
            </div>
        </div>
     <div class="menu-item">assign/release
            <div class="dropdown">
                <a href="selectProject_step1.jsp">assign project to employee</a>
                <a href="selectClient_step1.jsp">assign client to project</a>
                <a href="selectClientToAddContactPerson_setp1.jsp">assign contact person to client</a>
                <a href="selectProjectToReleaseEmployee_step1.jsp">release Employee from Project</a> 
            </div>
        </div>
        <div class="menu-item">search
            <div class="dropdown">
                <a href="searchClient_step1.jsp">search in client</a>
                <a href="searchProject_step1.jsp">search in project</a>
                <a href="searchEmployee_step1.jsp">search in employee</a>
            </div>
        </div>
        <div class="menu-item">delete/update
            <div class="dropdown">
                     <a href="update_delete_client_step1.jsp">update/delete client</a>
                <a href="update_delete_project_step1.jsp">update/delete project</a>
                <a href="update_delete_employee_step1.jsp">update/delete employee</a>
            </div>
        </div> 
        <div class="menu-item">login as
            <div class="dropdown">
               <a href="clientLogin.jsp">login as client</a>
                <a href="employeeLogin.jsp">login as employee</a>
            </div>
        </div> 
          <div style="height:100%;width:25%%;border:0px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
  		<a href="adminLogOutButtonServlet">
    	<img src="staticResource/turn-off.png" alt="log out" width="30" height="30">
		</a>
		</div> 
 </div>
   -->
<%--***********((END))**title bar flex item 1 in outer flex container***************** --%> 

<!-- flex item 2  start(app body)-->
<div style="height:100%;display:flex;flex-direction:column; justify-content:flex-start      ;border-bottom-width:0px;">
 
 <%---only if OTP was right and loggedin successfully ,else returning back to clientLogin.jsp--%> 
 
 
<%
DAOInterface DAOImpl=null;
if(session.getAttribute("going to employeeVerificationOPTServlet")!=null){
System.out.println("welcome\t"+session.getAttribute("email").toString());


//dont delete till log out because in .jsp we cant do dependency injection,
	//so in order to intract with DB in .jsp use this 
  DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}
	
/*
out.println("welcome\t"+session.getAttribute("email").toString());
out.println("welcome\t"+session.getAttribute("employeeId").toString());
out.println("this is employee DASHBOARD"); 
*/
%>
 
<%




}else{
	 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     response.setHeader("Pragma", "no-cache");
     response.setDateHeader("Expires", 0);
	response.sendRedirect("employeeLoginView");
	return;
}

%>

 <%---(((((else)))))))only if OTP was right and loggedin successfully ,else returning back to clientLogin.jsp--%>
 
 
 <%-- fetching employee details based on employeeId and putting it to java.util.List--%>
<%
Object employeeId2=session.getAttribute("employeeId");
String employeeId=employeeId2.toString();

 

String employeeId3=null;
String employeeName=null;
String employeeDept=null;
String employeeEmail=null;
String employeePhone=null;
String employeeDOJ=null;
String projectIdInEmployee=null;

List<String>getAllEmployeeByEmployeeId=DAOImpl. getAllEmployeeByEmployeeId(employeeId);
if(getAllEmployeeByEmployeeId!=null){
	employeeId3=getAllEmployeeByEmployeeId.get(0);
	employeeName=getAllEmployeeByEmployeeId.get(1);
	employeeDept=getAllEmployeeByEmployeeId.get(2);
	employeeEmail=getAllEmployeeByEmployeeId.get(3);
	employeePhone=getAllEmployeeByEmployeeId.get(4);
	
	employeeDOJ=getAllEmployeeByEmployeeId.get(5);
	projectIdInEmployee=getAllEmployeeByEmployeeId.get(6); 
	
 
				
			}else{
				session.setAttribute("no employee available in DB", "no employee available in DB");
			}
 

%>

 
 
 <%--(((end)) fetching employee details based on employeeId and putting it to java.util.List--%>
 
 
 <%-- fetching project details based on employeeId and putting it to java.util.List--%>
<%
  
List<String> listOfprojectId=new ArrayList(); 
List<String> listOfprojectName=new ArrayList(); 
List<String> listOfprojectDateOfStart=new ArrayList(); 
List<String> listOfprojectDateOfEnd=new ArrayList();
List<String> listOfclientIdinProject=new ArrayList();
List<List>getAllProjectEveryColumnByemployeeId=DAOImpl.getAllProjectEveryColumnByemployeeId(employeeId);
if(getAllProjectEveryColumnByemployeeId!=null){

	listOfprojectId=	getAllProjectEveryColumnByemployeeId.get(0);
	listOfprojectName=	getAllProjectEveryColumnByemployeeId.get(1);
	listOfprojectDateOfStart=	getAllProjectEveryColumnByemployeeId.get(2);
	listOfprojectDateOfEnd=	getAllProjectEveryColumnByemployeeId.get(3);
	listOfclientIdinProject=	getAllProjectEveryColumnByemployeeId.get(4); 
	 
				
			}else{
				session.setAttribute("no project is assigned for this employee", "no project is assigned for this employee");
			 	}
 

%>

 
 
 <%-- (((end))fetching project details based on employeeId and putting it to java.util.List--%>
  
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:8%;;width:100%;display:flex ;align-items:center;justify-content:space-between ; box-shadow:0px 0px 5px 0px black ;border-radius:20px ">
 
 <%-- Myprofile button to show all details --%>
 
 <div style="height:100%;width:25%%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >


<% if(getAllEmployeeByEmployeeId!=null){
   %>
<a href="employeeDashBoard_step1_employeeDashboard_MyProfileButtonClick_step2">
    <img src="${pageContext.request.contextPath}/resources/staticResource/profile.png" alt="Profile Icon" width="50" height="50">
</a>
<%}else{ 
	session.setAttribute("no employee available in DB", "no employee available in DB");
%>
<a href="#">
    <img src="${pageContext.request.contextPath}/resources/staticResource/profile.png" alt="Profile Icon" width="50" height="50">
</a>

  <%} %>
 
 </div>
 
 <%--((END)) My profile button to get all details --%>
 
 <%-- employee working on  project details button click --%>
 
 <div style="height:100%;width:25%%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
   
 <%if(listOfprojectId.size()>0){ %>
<a href="employeeDashBoard_step1_employeeDashboard_AssignedOnProjectButtonClick_step2">
    <img src="${pageContext.request.contextPath}/resources/staticResource/project_1954372.png" alt="project Icon" width="50" height="50">
</a>
<%}else{
	session.setAttribute("no project is assigned for this employee", "no project is assigned for this employee");
	
%>
<a href="#">
    <img src="${pageContext.request.contextPath}/resources/staticResource/project_1954372.png" alt="project Icon" width="50" height="50">
</a>
  <%} %>
 
 </div>
 
 <%--(((END))) employee working on  project details button click --%>
 
  
 
  

 <%--toastify notification when no client in DB --%>
 <%
 Object o1=session.getAttribute("no employee available in DB");
 if(o1!=null&&o1.equals("no employee available in DB")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no employee available in DB, add client first",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no employee available in DB");
 }
 %>
 <%--|(((END)))toastify notification when noclientin DB --%>
 
 <%--logout button --%>
 <div style="height:100%;width:25%%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
  
<a href="employeeLogOutButtonServlet">
    <img src="${pageContext.request.contextPath}/resources/staticResource/turn-off.png" alt="log out Icon" width="50" height="50">
</a>
</div>
<%--((((END)))logout button --%> 
 <%--(END)flex item1 in flex item 2  start(app body) --%>
 </div>
 
 
 <%--flex item2 in flex item 2  start(app body) --%>
 <div style="height:85%;width:100%;  ">
 
 
 
 
 
 
 <%-- get My profile button click --%>
 <%
  Object o2=session.getAttribute("show my details");
  if(o2!=null&&o2.toString().equals("show my details")){ 
	 	%>
		 
		  
<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Employee Dept</th>
            <th>Emlpoyee Email</th>
            <th>Emlpoyee Phone</th>
            <th>Emlpoyee Date of Joing</th>
            <th>Project assigned</th> 
        </tr>
    </thead>
    <tbody>
 
	  <%
	 
	  if (getAllEmployeeByEmployeeId!=null) {
	
  %>
  
  
   <tr>
            <td><%= employeeId3 %></td>
            <td><%=employeeName %></td>
            <td><%= employeeDept%></td>
            <td><%= employeeEmail%></td>
            <td><%= employeePhone %></td> 
            <td><%= employeeDOJ %></td> 
            <td><%= projectIdInEmployee %></td>  
        </tr>
 
  
  <%
	  }
  session.removeAttribute("show my details");
  }
  
  %>
  </tbody>
</table> 
 
 <%--((END)) get My profile button click --%>


 <%-- get project assigned to employee button click --%>
 <%
  Object o22=session.getAttribute("show my Project");
  if(o22!=null&&o22.toString().equals("show my Project")){ 
	 	%>
		 
		  
<table>
    <thead>
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <th>Date of Start</th>
            <th>Date of End</th>
            <th>Client Id</th>  
        </tr>
    </thead>
    <tbody>

		 
	  <%

	  for (int i = 0; i < listOfprojectId.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfprojectId.get(i) %></td>
            <td><%= listOfprojectName.get(i) %></td>
            <td><%= listOfprojectDateOfStart.get(i) %></td>
            <td><%= listOfprojectDateOfEnd.get(i) %></td>
            <td><%= listOfclientIdinProject.get(i) %></td>  
        </tr>
 
  
  <%
	  }
  session.removeAttribute("show my Project");
  }
  
  %>
  </tbody>
</table>


<%--toastify notification no project is assigned for this employee--%>
 <%
 Object o3=session.getAttribute("no project is assigned for this employee");
 if(o3!=null&&o3.equals("no project is assigned for this employee")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no project is assigned for this employee",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no project is assigned for this employee");
 }
 %>
 <%--|(((END)))toastify notification no project is assigned for this employee --%>

<%-- ((END))get project assigned to employee button click --%>
  
 
 
 
 
 
 
 <%--flex item2 in flex item 2  start(app body) --%>
 </div>
 
 
 
 
<!--((ENDS)) flex item 2  start(app body)-->
</div>

 
<%--******(END)*******main outher element*(outer flex container)***************** --%>
</div>


</section>
<article></article>
<aside></aside>
</main>
<footer></footer>
</body>
</html>