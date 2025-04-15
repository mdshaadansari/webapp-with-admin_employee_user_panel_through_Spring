<!-- if admin not login(admin logged out) --> 
<%
Object ozz=request.getSession().getAttribute("going to adminVerificationOPTServlet");
if(ozz==null){ 
	response.sendRedirect("Login");
	return;
}
%>
<!--((((END))))) if admin not login(admin logged out) -->




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
   <div class="title-bar" style="border-radius: 25px 25px 0px 0px;color:black">
 
        <div class="menu-item">add member
            <div class="dropdown">
                <a href="${pageContext.request.contextPath}/addEmployee/addEmployeeButtonClick">addEmployee</a>
                <a href="${pageContext.request.contextPath}/addProject/addProjectButtonClick">addProject</a>
                <a href="${pageContext.request.contextPath}/addClient/addClientButtonClick">addClient</a>
            </div>
        </div>
        <div class="menu-item">assign/release
            <div class="dropdown">
                <a href="${pageContext.request.contextPath}/selectProject_step1">assign project to employee</a>
                <a href="${pageContext.request.contextPath}/selectClient_step1">assign client to project</a>
                <a href="${pageContext.request.contextPath}/selectClientToAddContactPerson_setp1">assign contact person to client</a>
                <a href="${pageContext.request.contextPath}/selectProjectToReleaseEmployee_step1">release Employee from Project</a> 
            </div>
        </div>
        <div class="menu-item">search
            <div class="dropdown">
                <a href="${pageContext.request.contextPath}/searchClient_step1">search in client</a>
                <a href="${pageContext.request.contextPath}/searchProject_step1">search in project</a>
                <a href="${pageContext.request.contextPath}/searchEmployee_step1">search in employee</a>
            </div>
        </div>
        <div class="menu-item">delete/update
            <div class="dropdown">
                    <a href="${pageContext.request.contextPath}/update_delete_client_step1">update/delete client</a>
                <a href="${pageContext.request.contextPath}/update_delete_project_step1">update/delete project</a>
                <a href="${pageContext.request.contextPath}/update_delete_employee_step1">update/delete employee</a>
            </div>
        </div> 
        <div class="menu-item">login as
            <div class="dropdown">
                <a href="${pageContext.request.contextPath}/clientLoginView">login as client</a>
                <a href="${pageContext.request.contextPath}/employeeLoginView">login as employee</a>
                
            </div>
        </div> 
        
       
         <div style="height:100%;width:25%%;border:0px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
  		<a href="adminLogOutButtonServlet">
    	<img src="${pageContext.request.contextPath}/resources/staticResource/turn-off.png" alt="log out" width="30" height="30">
		</a>
		</div> 
 </div>
 
 
<%--***********((END))**title bar flex item 1 in outer flex container***************** --%> 

<!-- flex item 2  start(app body)-->
<div style="height:100%;display:flex; justify-content:center; align-items:center;      ;border-bottom-width:0px;">
 
 
<%
 
				//==================also fetching employee assigned for projectID from DB===================================
System.out.println("fetching employee assigned for this project");
String projectId=request.getParameter("projectId");
String projectName=request.getParameter("projectName");


	List<String> existingEmploeeIdforIncomingProjectId  = new ArrayList();
	List<String>	existingprojectIdInemployeeforIncomingProjectId = new ArrayList();
	List<String> existingEmployeeNameforIncomingProjectId  = new ArrayList();
	List<String> existingEmployeeDeptIncomingProjectId = new ArrayList();
	
	
	DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
	if(DAOImpl==null){ 
		DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
	}
List<List> getAllEmployeeForProjectId=DAOImpl.getAllEmployeeForProjectId(projectId);
 
if(getAllEmployeeForProjectId!=null){
	existingEmploeeIdforIncomingProjectId=	getAllEmployeeForProjectId.get(0);
	existingprojectIdInemployeeforIncomingProjectId=	getAllEmployeeForProjectId.get(1);
	existingEmployeeNameforIncomingProjectId=	getAllEmployeeForProjectId.get(2);
	existingEmployeeDeptIncomingProjectId=	getAllEmployeeForProjectId.get(3);
	
	 
					}else{
						session.setAttribute("no employee assigned for this project", "no employee assigned for this project");
						
					}
					
					 
					 	 
 
%>
<div style="height:300px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;;">
<a href="selectProjectToReleaseEmployee_step1" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
<div >
  <h4>selected project</h4>
<form action="#" method="get"  >
<!-- projectId & projectName coming from selectProject_step1.jsp -->
<input type="text" name="projectName" value="<%=request.getParameter("projectName")%> "
placeholder="<%= request.getParameter("projectName")  %> "  readonly /></br>
<input type="text" name="projectId" value="<%=request.getParameter("projectId")%> "
placeholder="<%= request.getParameter("projectId")  %> "  readonly /></br> 
</form>
</div>
</div>
<div>


<%
if(existingEmploeeIdforIncomingProjectId.size() > 0){

    %>
<div  style="border:1px solid black;background-color:rgba(0,0,50,0.2);border-radius:5px">
    
<%=	"&nbsp &nbsp &nbsp employees already working on this project<br>" %>
	<%=	"&nbsp &nbsp &nbsp --------------------------------------------------------<br></br>"%>
 <table>
 <thead>
 <tr>
 <th> Project Name</th> 
  <th> Project Id</th>
  <th></th>
 <th> Employee Name</th> 
 <th> Employee Id</th>
 </tr>
 </thead>
 
 <tbody>
    
    
 
<%
for(int i=0;i<existingEmploeeIdforIncomingProjectId.size();i++){
String a=existingEmploeeIdforIncomingProjectId.get(i);
String b=existingEmployeeNameforIncomingProjectId.get(i);
 

%>
 
 <tr>
 <form action="addingEmployeeToProject_step2_releaseButtonClientServlet" method="get">
 <!--  <input type="hidden" name="addingEmployeeToProject_step2_releaseButtonClientServlet" value="addingEmployeeToProject_step2_releaseButtonClientServlet"/>-->
 <td><input type="text" name="projectName" value="<%=projectName%>" readonly></td>
 <td><input type="text" name="projectId" value="<%=projectId%>" readonly></td>
 <td>is assigned to &nbsp&nbsp&nbsp&nbsp</td>
 <td><input type="text" name="employeeName" value="<%=b%>" readonly></td>
 <td><input type="text" name="employeeId" value="<%=a%>" readonly></td>
  <td><input type="submit" value="release employee"></td>
 </form>
  
 </tr>
   
<% 
}
%>
 
 </tbody>
 
 
 </table>
 </div>
 

  
<% 
}
%>



 
<%----------tostify notification if employee released successfull from project --%>
<%
 String emplyeeReleasedSuccessfully=request.getParameter("emplyeeReleasedSuccessfully");
if(emplyeeReleasedSuccessfully!=null && emplyeeReleasedSuccessfully.toString().equals("emplyeeReleasedSuccessfully")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "emplyee Released Successfully" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <% 
    
}
%>

<%----------((((END))))tostify notification if employee released successfull from project --%>
<%----------tostify notification if employee not released successfull from project --%>
<%
 String emplyeeNotReleasedSuccessfully=request.getParameter("emplyeeNotReleasedSuccessfully");
if(emplyeeNotReleasedSuccessfully!=null && emplyeeNotReleasedSuccessfully.toString().equals("emplyeeNotReleasedSuccessfully")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "emplyee not Released Successfully" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <% 
}
%>

<%----------((((END))))tostify notification if employee not released successfull from project --%>





 
<%----------tostify notification if no employee assigned for this   project --%>
<%
 Object o1=session.getAttribute("no employee assigned for this project");
if(o1!=null && o1.toString().equals("no employee assigned for this project")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "no employee assigned for this project" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <% 
    session.removeAttribute("no employee assigned for this project");
}
%>

<%----------((((END))))tostify notification if no employee assigned for this project --%>






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