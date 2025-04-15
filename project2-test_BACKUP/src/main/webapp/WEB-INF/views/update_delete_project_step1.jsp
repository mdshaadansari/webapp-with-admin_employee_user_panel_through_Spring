<!-- if admin not login(admin logged out) -->

<%
Object o=request.getSession().getAttribute("going to adminVerificationOPTServlet");
if(o==null){ 
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
<div style="height:100%;display:flex;flex-direction:column; justify-content:flex-start      ;border-bottom-width:0px;">
 
 <%-- fetching all the project and putting it to java.util.List--%>
<%
List<String> listOfprojectId=new ArrayList();
List<String> listOfprojectName=new ArrayList();
List<String> listofprojectDateOfStart=new ArrayList();
List<String> listofprojectDateOfEnd=new ArrayList();
List<String> listclientIdInProject=new ArrayList(); 

DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}
List<List>getAllProjectEveryColumn=DAOImpl.getAllProjectEveryColumn();

if(getAllProjectEveryColumn!=null){
	
	listOfprojectId=getAllProjectEveryColumn.get(0);
	listOfprojectName=getAllProjectEveryColumn.get(1);
	listofprojectDateOfStart=getAllProjectEveryColumn.get(2);
	listofprojectDateOfEnd=getAllProjectEveryColumn.get(3);
	listclientIdInProject=getAllProjectEveryColumn.get(4);
	 
				
				
			}else{
				session.setAttribute("no project available in DB", "no project available in DB");
			}
 

%>

 
 
 <%--(END) fetching all the project and putting it to java.util.List--%>
 
 
 
 
 
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:15%;;width:100%;display:flex ;align-items:center;justify-content:center ; box-shadow:0px 0px 3px 0px black ;border-radius:  20px ">
 
 <%-- select project BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfprojectId.size()>0){ %>
 
 
select project by Id/Name </br>
<form action="update_delete_project_step1_selectingProjectId" method="get" onsubmit="return validateInput()">
<!-- <input type="hidden" name="update_delete_project_step1_selectingProjectId" value="update_delete_project_step1_selectingProjectId"/> -->
    <input type="search" id="searchBox" name="projectId" placeholder="projectId" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="projectName" value="" >
   <input type="submit" value="submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form>

<script>
    // Arrays to store project names and numeric values (IDs)
    const words = [];
    const numericValues = [];

    <%
    for (int i = 0; i < listOfprojectId.size(); i++) {
        String listOfprojectName2 = listOfprojectName.get(i);
        String listOfprojectId2 = listOfprojectId.get(i);
        out.print("words.push('" + listOfprojectId2 + "');\n");
        out.print("numericValues.push('" + listOfprojectName2 + "');\n");
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
                document.getElementById("inJsCode").value = numericValue;
                suggestionsDiv.innerHTML = "";
                suggestionsDiv.style.display = "none";
                document.getElementById("error-message").style.display = "none";
            };

            suggestionsDiv.appendChild(div);
        });
    }

    function validateInput() {
        let input = document.getElementById("searchBox").value;
        let numericValue = document.getElementById("inJsCode").value;

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
 
 
<%}else
{ 
	session.setAttribute("on project with particular projectId", "on project with particular projectId");
%>
 
 
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox" name="projectId" placeholder="Project Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="Project Name" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form> 
 no project in DB 
<%} %>
 </div>
 <%--(END) select project  BUTTON --%>
 
 

 <%--toastify notification when no projectin DB --%>
 <%
 Object o12=session.getAttribute("no project available in DB");
 if(o12!=null&&o12.equals("no project available in DB")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no project available in DB, add project first",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no project available in DB");
 }
 %>
 <%--|(((END)))toastify notification when no projectin DB --%>
 
 <%--(END)flex item1 in flex item 2  start(app body) --%>
 </div>
 
 
 <%--flex item2 in flex item 2  start(app body) --%>
 <div style="height:85%;width:100%;  ">
 
  
  



  
 

 
 <%--showing update and delete button for selected projectId --%>
 <%
 Object o132=session.getAttribute("project for this projectId");
if(o132 != null && o132.toString().equals("project for this projectId")){ 
	 
	
 %> 
  
 
 	 
 <table>
 <thead>
 <tr>
 <th> project Id</th>
 <th> project Name</th>
 <th> project Date Of Start</th>
 <th> project Date Of End</th>
 <th> clientId In Project</th> 
 </tr>
 </thead>
 
 <tbody>
 <tr>
 <form action="update_delete_project_step1_updateButtonClick" method="get">
 <!-- <input type="hidden" name="update_delete_project_step1_updateButtonClick" value="update_delete_project_step1_updateButtonClick"/> -->
 <td><input type="text" name="projectId" value="<%=session.getAttribute("projectId")%>" readonly></td>
 <td><input type="text" name="projectName" value="<%=session.getAttribute("projectName")%>" required></td>
 <td><input type="text" name="projectDateOfStart" value="<%=session.getAttribute("projectDateOfStart")%>" required></td>
 <td><input type="text" name="projectDateOfEnd" value="<%=session.getAttribute("projectDateOfEnd")%>" required></td>
 <td><input type="text" name="clientIdInProject" value="<%=session.getAttribute("clientIdInProject")%>" required></td> 
 
 <td><input type="submit" value="update"></td>
 </form>
 <form action="update_delete_project_step1_DeleteButtonClick" method="get">
 <!-- <input type="hidden" name="update_delete_project_step1_DeleteButtonClick" value="update_delete_project_step1_DeleteButtonClick"/> -->
 <td><input type="hidden" name="projectId" value="<%=session.getAttribute("projectId")%>" ></td>
 <td><input type="submit" value="delete"></td>
 </form>
 </tr>
 </tbody>
 
 
 </table>
 
 
 <%
 session.removeAttribute("project for this projectId");
 }
 %>
 
 <%--toastify notification no project with particular projectId--%>
 <%
 Object o2=session.getAttribute("no project for this projectId");
 if(o2!=null&&o2.toString().equals("no project for this projectId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no project for this projectId",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no project for this projectId");
 }
 %>
 <%--|(((END)))toastify notification no project with particular projectId --%>


 <%--toastify notification if project updated--%>
 <%
 Object o23=session.getAttribute("project updated");
 if(o23!=null&&o23.toString().equals("project updated")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "project updated",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("project updated");
 }
 %>
 <%--|(((END)))toastify notification if project updated --%>
 


 <%--toastify notification if project not updated--%>
 <%
 Object o234=session.getAttribute("project not updated");
 if(o234!=null&&o234.toString().equals("project not updated")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("projectId2")%>"+" project not updated",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("project not updated");
 }
 %>
 <%--|(((END)))toastify notification if project not updated --%>
 
 
 
 
 <%--toastify notification if project is deleted--%>
 <%
 Object oab=session.getAttribute("project deleted");
 if(oab!=null&&oab.toString().equals("project deleted")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("projectId3")%>"+", project got deleted" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("project deleted"); 
 session.removeAttribute("projectId3"); 
 }
 %>
 <%--((((((((END)))))))))toastify notification if project is deleted--%>
 
 
  <%--toastify notification if project did not get deleted--%>
 <%
 Object oc=session.getAttribute("project not deleted");
 if(oc!=null&&oc.toString().equals("project not deleted")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("projectId3")%>"+", project didnt got deleted" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("project not deleted"); 
 }
 %>
 <%--toastify notification if project did not get deleted--%>
 
 
 
   <%--toastify notification if project deleted & employee working on project also released--%>
 <%
 Object ocq=session.getAttribute("project deleted & employee working on project also released");
 if(ocq!=null&&ocq.toString().equals("project deleted & employee working on project also released")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("projectId3")%>"+", project deleted & employee working on project also released" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("project deleted & employee working on project also released"); 
 }
 %>
 <%--toastify notification if project deleted & employee working on project also released--%>
 
 
 
 <%--(END)showing update and delete button for selected projectId --%>
 
 






  
 
 <%--(END)flex item2 in flex item 2  start(app body) --%>
 </div>
 
 
 
 
 <%--((ENDS)) flex item 2  start(app body)--%>
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