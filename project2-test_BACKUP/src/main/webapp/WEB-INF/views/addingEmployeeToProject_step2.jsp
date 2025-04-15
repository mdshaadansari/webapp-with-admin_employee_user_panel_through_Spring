<!-- if admin not login(admin logged out) --> 
<%@page import="java.util.Iterator"%>
<%
Object oz=request.getSession().getAttribute("going to adminVerificationOPTServlet");
if(oz==null){ 
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

String projectId=request.getParameter("projectId");
String projectName=request.getParameter("projectName"); 


			List<String> projectIdInemployee = new ArrayList();
			List<String> employeeId = new ArrayList();
			List<String> employeeName = new ArrayList();
			List<String> employeeDept = new ArrayList();

			List<String>	existingprojectIdInemployeeforIncomingProjectId = new ArrayList();
				List<String> existingEmploeeIdforIncomingProjectId  = new ArrayList();
				List<String> existingEmployeeNameforIncomingProjectId  = new ArrayList();
				List<String> existingEmployeeDeptIncomingProjectId = new ArrayList();
				
				
				
				//==========fetching all employee  
DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}
				List<List> allEmployee=DAOImpl.getAllEmployee();
				
				if(allEmployee!=null){
					employeeId.addAll( allEmployee.get(0));
					projectIdInemployee.addAll( allEmployee.get(1));
					employeeName.addAll(allEmployee.get(2));
					employeeDept.addAll(allEmployee.get(3));
				
				
					
				System.out.println("fetching all employee completed");
				//==================also fetching employee which is their in selected projectID from DB===================================
  
					List<List>getAllEmployeeForProjectId=DAOImpl.getAllEmployeeForProjectId(projectId);
					if(getAllEmployeeForProjectId!=null){
						 
						
					existingEmploeeIdforIncomingProjectId.addAll ( getAllEmployeeForProjectId.get(0));
					existingprojectIdInemployeeforIncomingProjectId.addAll ( getAllEmployeeForProjectId.get(1));
					existingEmployeeNameforIncomingProjectId.addAll ( getAllEmployeeForProjectId.get(2));
					existingEmployeeDeptIncomingProjectId.addAll ( getAllEmployeeForProjectId.get(3));
					
					}else{
						session.setAttribute("no employee assigned till now,please assign", "no employee assigned till now,please assign");
					}
					System.out.println(employeeId);
					System.out.println(employeeName);
					System.out.println(existingEmploeeIdforIncomingProjectId);
					System.out.println(existingEmployeeNameforIncomingProjectId); 
						//=========================removing employeealready assigned selected projectID==========================================
						 
						for(int qw = employeeId.size() - 1; qw >= 0; qw--){
							abc:
							for(int qw2=0;  qw2 < existingEmploeeIdforIncomingProjectId.size() ; qw2++){
							//System.out.println(iterator.next());
							if(employeeId.get(qw) .equals(existingEmploeeIdforIncomingProjectId.get(qw2))){
								System.out.println(employeeId.get(qw)+" "+existingEmployeeNameforIncomingProjectId.get(qw2));
								employeeId.remove(qw);
								employeeName.remove(qw);
								break abc;
							} 
						}
						}
						//these below didnt worked because ID is unique not, others like name, so multiple mathing name will get deleted
						//employeeId.removeAll(existingEmploeeIdforIncomingProjectId);
						//employeeName.removeAll(existingEmployeeNameforIncomingProjectId);						
						//projectIdInemployee.removeAll(existingprojectIdInemployeeforIncomingProjectId);
						//employeeDept.removeAll(existingEmployeeDeptIncomingProjectId);
						System.err.println(employeeId);
					System.err.println(employeeName); 
					
 
%>
<div style="height:300px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;;">
<a href="selectProject_step1" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
<div >
  <h4>assign project to Employee</h4>
<form action="addEmployeeToProjectServlet_step3" method="post" onsubmit="return validateInput()">
<!-- projectId & projectName coming from selectProject_step1.jsp -->
<!-- <input type="hidden" name="addEmployeeToProjectServlet_step3" value="addEmployeeToProjectServlet_step3"/> -->
<input type="text" name="projectName" value="<%=request.getParameter("projectName")%> "
placeholder="<%= request.getParameter("projectName")  %> "  readonly /></br>
<input type="text" name="projectId" value="<%=request.getParameter("projectId")%> "
placeholder="<%= request.getParameter("projectId")  %> "  readonly /></br>

    <input type="search" id="searchBox" name="employeeName" placeholder="Search..." onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inInJsCode" name="employeeId" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form>
</div>
</div>
<div>


<%
if(existingEmploeeIdforIncomingProjectId.size() > 0){
	//out.println("&nbsp &nbsp &nbsp employees already working on this project<br>");
	//out.println("&nbsp &nbsp &nbsp --------------------------------------------------------<br>");

    %>
    
<div  style="border:1px solid black;background-color:rgba(0,0,50,0.2);border-radius:5px">
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
<!-- <input type="hidden" name="addingEmployeeToProject_step2_releaseButtonClientServlet" value="addingEmployeeToProject_step2_releaseButtonClientServlet"   > -->
 <td><input type="text" name="projectName" value="<%=projectName%>" readonly></td>
 <td><input type="text" name="projectId" value="<%=projectId%>" readonly></td>
 <td>is assigned to &nbsp&nbsp&nbsp&nbsp</td>
 <td><input type="text" name="employeeName" value="<%=b%>" readonly></td>
 <td><input type="text" name="employeeId" value="<%=a%>" readonly></td>
  <td><input type="submit" value="release"></td>
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




  




<!-- message if employee is already assigned to some project -->
 
<%
System.out.println("********************************************");
Object o5=session.getAttribute("employeeAlreadyAssignedtoSomeProject");
if(o5 !=null && o5.toString().equals("employeeAlreadyAssignedtoSomeProject")){
	System.out.println("**********************again**********************");	  
%> 



<div  style="border:1px solid black;background-color:rgba(100,0,0,0.2);border-radius:5px;display:flex ;flex-direction: column;">
<div style="display:flex ;flex-direction: row-reverse;">
<a href="addingEmployeeToProject_step2.jsp?projectName=<%=request.getParameter("projectName")%>&projectId=<%=request.getParameter("projectId")%>" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>

<%="&nbsp &nbsp &nbsp selected employee is already working on some project<br>"%>
<%="&nbsp &nbsp &nbsp -------------------------------------------------------------------------<br></br>"%>



 <table>
 <thead>
 <tr>
 <th> Employee Name&nbsp;&nbsp;&nbsp;&nbsp;</th> 
  <th> Employee Id</th>
  <th></th>
 <th> Project Id</th> 
 </tr>
 </thead>
 
 <tbody>


 <tr>
 <form action="#" method="get">
 <td><input type="text" name="employee name" value="<%=session.getAttribute("employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject") %>" readonly></td>
 <td><input type="text" name="employee id" value="<%=session.getAttribute("employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject")%>" readonly></td>
 <td>is already assigned to &nbsp&nbsp&nbsp&nbsp</td>
 <td><input type="text" name="ProjectId" value="<%=session.getAttribute("projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject") %>" readonly></td>
 
 
 </form>
  
 </tr>
 
</tbody>
</table>


</div>





<%
session.removeAttribute("employeeAlreadyAssignedtoSomeProject");
session.removeAttribute("employeeIdOfEmployeeWhoIsAlreadyAssignedToSomeProject");
session.removeAttribute("employeeNameOfEmployeeWhoIsAlreadyAssignedToSomeProject");
session.removeAttribute("projectIdInEmployeeOfEmployeeWhoIsAlreadyAssignedToSomeProject");
}
%>
<!--(ENDS) message if employee is already assigned to some project -->
</div> 

<script>
    // Arrays to store project names and numeric values (IDs)
    const words = [];
    const numericValues = [];

 

<%
for (int i = 0; i < employeeId.size(); i++) {
    String employeeName1 = employeeName.get(i);
    String emploeeId1 = employeeId.get(i);
    out.print("words.push('" + employeeName1 + "');\n");
    out.print("numericValues.push('" + emploeeId1 + "');\n");
}
%>



    function showSuggestions() {
        let input = document.getElementById("searchBox").value.toLowerCase();
        let suggestionsDiv = document.getElementById("suggestions");
        suggestionsDiv.innerHTML = "";

        if (input.length === 0) {
            suggestionsDiv.style.display = "none";
            return;
        }

        let filteredWords = words
            .map((word, index) => ({ word, numericValue: numericValues[index] }))
            .filter(entry => entry.word.toLowerCase().includes(input));

        let filteredNumericValues = numericValues
            .map((numericValue, index) => ({ word: words[index], numericValue }))
            .filter(entry => entry.numericValue.includes(input));

        // Combine results and remove duplicates
        let combinedSuggestions = [...filteredWords, ...filteredNumericValues].filter(
            (value, index, self) =>
                index === self.findIndex((v) => v.word === value.word && v.numericValue === value.numericValue)
        );

        if (combinedSuggestions.length > 0) {
            suggestionsDiv.style.display = "block";
        } else {
            suggestionsDiv.style.display = "none";
        }

        combinedSuggestions.forEach(({ word, numericValue }) => {
            let div = document.createElement("div");
            div.classList.add("suggestion");
            div.innerText = word + " (ID: " + numericValue + ")";

            div.onclick = function (event) {
                event.stopPropagation();
                document.getElementById("searchBox").value = word;
                document.getElementById("inInJsCode").value = numericValue;
                suggestionsDiv.innerHTML = "";
                suggestionsDiv.style.display = "none";
                document.getElementById("error-message").style.display = "none";
            };

            suggestionsDiv.appendChild(div);
        });
    }

    function validateInput() {
        let input = document.getElementById("searchBox").value;
        let numericValue = document.getElementById("inInJsCode").value;

        if (numericValue === "") {
            document.getElementById("error-message").style.display = "block";
            return false;
        }
        return true;
    }

    document.addEventListener("click", function (event) {
        let searchBox = document.getElementById("searchBox");
        let suggestionsDiv = document.getElementById("suggestions");

        if (!searchBox.contains(event.target) && !suggestionsDiv.contains(event.target)) {
            suggestionsDiv.style.display = "none";
        }
    });
</script>




<%
					}else{
						%>
						
<%--when no employee in DB --%>						
<h2>Select Employee</h2>
<form action="#" method="get" onsubmit="return validateInput()">
<input type="text" name="projectId" value="<%= request.getParameter("projectId")  %> "
placeholder="<%= session.getAttribute("projectId")  %> "  readonly /></br>
<input type="text" name="projectName" value="<%= request.getParameter("projectName")  %> "
placeholder="<%= session.getAttribute("projectName")  %> "  readonly /></br>
 
    <input type="submit" value="Submit"> 
</form>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "no Employee available in DB, add Employee first" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
<%--((((((END)))when no employee in DB --%>			
	
	<%
					} 
			
%>


<!-- notifaication if "no employee assigned till now,please assign" -->

<%
Object success21=session.getAttribute("no employee assigned till now,please assign");
if(success21!=null && success21.toString().equals("no employee assigned till now,please assign")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "no employee assigned till now,please assign" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
session.removeAttribute("no employee assigned till now,please assign");    
}
%>

<!--(((((((((END))))))))) "no employee assigned till now,please assign" -->
<!-- notifaication if project assigned to employee successfully or not -->

<%
Object success=session.getAttribute("project assigned to employee successfully");
if(success!=null && success.toString().equals("project assigned to employee successfully")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "project assigned to employee successfully" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
session.removeAttribute("project assigned to employee successfully");    
}
%>
    

<%
Object notsuccess=session.getAttribute("project not assigned to employee successfully");
if(notsuccess!=null && notsuccess.toString().equals("project not assigned to employee successfully")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "project not assigned to employee" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
session.removeAttribute("project not assigned to employee successfully");    
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