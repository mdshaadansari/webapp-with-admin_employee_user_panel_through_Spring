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

// fetching all the project evry column
DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}
List<List>getAllProjectEveryColumn=DAOImpl.getAllProjectEveryColumn();

if(getAllProjectEveryColumn!=null){

	listOfprojectId.addAll( getAllProjectEveryColumn.get(0));
	listOfprojectName.addAll( getAllProjectEveryColumn.get(1));
	listofprojectDateOfStart=getAllProjectEveryColumn.get(2);
	listofprojectDateOfEnd=getAllProjectEveryColumn.get(3);
	listclientIdInProject=getAllProjectEveryColumn.get(4);
 
				
			}else{
				session.setAttribute("no project available in DB", "no project available in DB");
			}
 

%> 
 <%--(END) fetching all the project and putting it to java.util.List--%>
 
 
 
 
 
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:15%;;width:100%;display:flex ;align-items:center;justify-content:center ;  box-shadow:0px 0px 3px 0px black ;border-radius: 20px ">
 
 <%-- GET ALL project BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfprojectId.size()>0){
 
 %>
 display all project<br>
 <form action="searchProject_step1_getAllProjectButtonClienk_step2">
 <!-- <input type="hidden" name="searchProject_step1_getAllProjectButtonClienk_step2" value="searchProject_step1_getAllProjectButtonClienk_step2"> -->
 <input type="submit" value="get all project"  />
 </form>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->

 <%
 }else{
 %>
display all project<br>
 <form action="#">
 <input type="submit" value="get all employee"  />
 </form>
 <h2>no project in DB</h2>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->
 <%
 }
 %>
 
 </div>
 
 <%--(((END)) GET ALL project BUTTON --%>
 
 <%-- GET ALL project BY Id BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfprojectId.size()>0){ %>
 
 
 search project by Id </br>
<form action="searchProject_step1_getAllProjectByProjectIdButtonClienk_step2" method="get" onsubmit="return validateInput()">
<!-- <input type="hidden" name="searchProject_step1_getAllProjectByProjectIdButtonClienk_step2" value="searchProject_step1_getAllProjectByProjectIdButtonClienk_step2"/> -->
    <input type="search" id="searchBox" name="projectId" placeholder="projectId" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="projectName" value="">
    <input type="submit" value="Submit">
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
%>
 
 search project by Id </br>
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox" name="employeeId" placeholder="Project Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="Project Name" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form> 
 no project in DB 
<%} %>
 </div>
 <%--(END) GET ALL project BY Id BUTTON --%>

 <%-- GET ALL Client BY project Id BUTTON --%>
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfprojectId.size()>0){ %>
 get client of project, by project ID </br>
<form action="searchProject_step1_getAllClientByProjectIdButtonClick_step2" method="get" onsubmit="return validateProjectSearch()">
   <!--  <input type="hidden" name="searchProject_step1_getAllClientByProjectIdButtonClick_step2" value="searchProject_step1_getAllClientByProjectIdButtonClick_step2"/> -->
    <input type="search" id="projectIdSearch" name="projectId" placeholder="Enter Project ID" onkeyup="showProjectSuggestions()">
    <div id="projectSuggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="selectedProjectName" name="projectName" value="">
    <input type="submit" value="Submit">
    <p id="projectError" class="error-message">Invalid input! Please select a suggestion.</p>
</form>

<script>
    // Arrays to store project names and IDs
    const projectNames = [];
    const projectIds = [];

    <%
    for (int i = 0; i < listOfprojectId.size(); i++) {
        String projectName = listOfprojectName.get(i);
        String projectId = listOfprojectId.get(i);
        out.print("projectNames.push('" + projectName + "');\n");
        out.print("projectIds.push('" + projectId + "');\n");
    }
    %>

    function showProjectSuggestions() {
        let input = document.getElementById("projectIdSearch").value.toLowerCase();
        let suggestionsDiv = document.getElementById("projectSuggestions");
        suggestionsDiv.innerHTML = "";

        if (input.length === 0) {
            suggestionsDiv.style.display = "none";
            return;
        }

        let filteredByName = projectNames
            .map((name, index) => ({ name, id: projectIds[index] }))
            .filter(entry => entry.name.toLowerCase().includes(input));

        let filteredById = projectIds
            .map((id, index) => ({ name: projectNames[index], id }))
            .filter(entry => entry.id.includes(input));

        // Combine results & remove duplicates
        let combinedSuggestions = [...filteredByName, ...filteredById].filter(
            (value, index, self) =>
                index === self.findIndex((v) => v.name === value.name && v.id === value.id)
        );

        if (combinedSuggestions.length > 0) {
            suggestionsDiv.style.display = "block";
        } else {
            suggestionsDiv.style.display = "none";
        }

        combinedSuggestions.forEach(({ name, id }) => {
            let div = document.createElement("div");
            div.classList.add("suggestion");
            div.innerText = name + " (ID: " + id + ")";

            div.onclick = function (event) {
                event.stopPropagation();
                document.getElementById("projectIdSearch").value = id;
                document.getElementById("selectedProjectName").value = name;
                suggestionsDiv.innerHTML = "";
                suggestionsDiv.style.display = "none";
                document.getElementById("projectError").style.display = "none";
            };

            suggestionsDiv.appendChild(div);
        });
    }

    function validateProjectSearch() {
        let input = document.getElementById("projectIdSearch").value;
        let selectedName = document.getElementById("selectedProjectName").value;

        if (selectedName === "") {
            document.getElementById("projectError").style.display = "block";
            return false;
        }
        return true;
    }

    // Hide suggestions when clicking outside
    document.addEventListener("click", function (event) {
        let searchBox = document.getElementById("projectIdSearch");
        let suggestionsDiv = document.getElementById("projectSuggestions");

        if (!searchBox.contains(event.target) && !suggestionsDiv.contains(event.target)) {
            suggestionsDiv.style.display = "none";
        }
    });
</script>


<%}else
{ 
%>
  get client of project, by project ID </br>
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox" name="projectId" placeholder="employee Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="projectName" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form> 
 no project in DB 
<%} %>
 </div>
<%--((((END))))))) GET ALL Client BY project Id BUTTON --%>
 
 
<%-- GET ALL Employee BY project Id BUTTON --%>
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfprojectId.size()>0){ %>
get employee working on project, by project ID </br>
<form action="searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2" method="get" onsubmit="return validateProjectSearch3()">
   <!-- <input type="hidden" name="searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2" value="searchProject_step1_getAllEmployeeByProjectIdButtonClick_step2"/> -->
    <input type="search" id="projectId3Search" name="projectId" placeholder="Enter Project ID" onkeyup="showProjectSuggestions3()">
    <div id="projectSuggestions3" class="autocomplete-suggestions"></div>
    <input type="hidden" id="selectedProjectName3" name="projectName" value="">
    <input type="submit" value="Submit">
    <p id="projectError3" class="error-message">Invalid input! Please select a suggestion.</p>
</form>

<script>
    // Arrays to store project names and IDs
    const projectNames3 = [];
    const projectIds3 = [];

    <%
    for (int i = 0; i < listOfprojectId.size(); i++) {
        String projectName = listOfprojectName.get(i);
        String projectId = listOfprojectId.get(i);
        out.print("projectNames3.push('" + projectName + "');\n");
        out.print("projectIds3.push('" + projectId + "');\n");
    }
    %>

    function showProjectSuggestions3() {
        let input = document.getElementById("projectId3Search").value.toLowerCase();
        let suggestionsDiv = document.getElementById("projectSuggestions3");
        suggestionsDiv.innerHTML = "";

        if (input.length === 0) {
            suggestionsDiv.style.display = "none";
            return;
        }

        let filteredByName = projectNames3
            .map((name, index) => ({ name, id: projectIds3[index] }))
            .filter(entry => entry.name.toLowerCase().includes(input));

        let filteredById = projectIds3
            .map((id, index) => ({ name: projectNames3[index], id }))
            .filter(entry => entry.id.includes(input));

        // Combine results & remove duplicates
        let combinedSuggestions = [...filteredByName, ...filteredById].filter(
            (value, index, self) =>
                index === self.findIndex((v) => v.name === value.name && v.id === value.id)
        );

        if (combinedSuggestions.length > 0) {
            suggestionsDiv.style.display = "block";
        } else {
            suggestionsDiv.style.display = "none";
        }

        combinedSuggestions.forEach(({ name, id }) => {
            let div = document.createElement("div");
            div.classList.add("suggestion");
            div.innerText = name + " (ID: " + id + ")";

            div.onclick = function (event) {
                event.stopPropagation();
                document.getElementById("projectId3Search").value = id;
                document.getElementById("selectedProjectName3").value = name;
                suggestionsDiv.innerHTML = "";
                suggestionsDiv.style.display = "none";
                document.getElementById("projectError3").style.display = "none";
            };

            suggestionsDiv.appendChild(div);
        });
    }

    function validateProjectSearch3() {
        let input = document.getElementById("projectId3Search").value;
        let selectedName = document.getElementById("selectedProjectName3").value;

        if (selectedName === "") {
            document.getElementById("projectError3").style.display = "block";
            return false;
        }
        return true;
    }

    // Hide suggestions when clicking outside
    document.addEventListener("click", function (event) {
        let searchBox = document.getElementById("projectId3Search");
        let suggestionsDiv = document.getElementById("projectSuggestions3");

        if (!searchBox.contains(event.target) && !suggestionsDiv.contains(event.target)) {
            suggestionsDiv.style.display = "none";
        }
    });
</script>



<%}else
{ 
%>
 search employee by project ID </br>
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox" name="projectId" placeholder="employee Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="projectName" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form> 
 no employee in DB 
<%} %>
 </div>
<%--((((END))))))) GET ALL Employee BY project Id BUTTON --%>
 

 <%--toastify notification when no projectin DB --%>
 <%
 Object o1=session.getAttribute("no project available in DB");
 if(o1!=null&&o1.equals("no project available in DB")){
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
 <div style="height:85%;width:100%; ">
 
  

 
<%--   project for all project button click--%>
 <%
 Object o3=session.getAttribute("all info of project");
 if(o3!=null&&o3.toString().equals("all info of project")){ 
	  List<String> listOfprojectId2=new ArrayList();
		List<String> listOfprojectName2=new ArrayList();
		List<String> listofprojectDateOfStart2=new ArrayList();
		List<String> listofprojectDateOfEnd2=new ArrayList();
		List<String> listclientIdInProject2=new ArrayList(); 
	  
	  
		listOfprojectId2=(List)	session.getAttribute("listOfprojectId");
		listOfprojectName2=(List)session.getAttribute("listOfprojectName");
		listofprojectDateOfStart2=(List)session.getAttribute("listofprojectDateOfStart");
		listofprojectDateOfEnd2=(List)session.getAttribute("listofprojectDateOfEnd");
		listclientIdInProject2=(List)session.getAttribute("listclientIdInProject"); 
		%>
		 

<table>
   <thead>
       <tr>
           <th>Project ID</th>
           <th>Project Name</th>
           <th>Date of Start</th>
           <th>Date of End</th>
           <th>project belongs to Client</th>
            
       </tr>
   </thead>
   <tbody>

		
	  <%

	  for (int i = 0; i < listOfprojectId2.size(); i++) {
	
 %>
 
 
  <tr>
           <td><%= listOfprojectId2.get(i) %></td>
           <td><%= listOfprojectName2.get(i) %></td>
           <td><%= listofprojectDateOfStart2.get(i) %></td>
           <td><%= listofprojectDateOfEnd2.get(i) %></td>
           <td><%= listclientIdInProject2.get(i) %></td> 
       </tr>

 
 <%
	  }
 session.removeAttribute("all info of project");
 }
 
 %>
 
 
 
 
 </tbody>
</table>
 
<%-- (END) project for all project button click--%>
 
 <%--for project with particular projectId --%>
 <%
  Object o334=session.getAttribute("project on the basis of projectId");
  if(o334!=null&&o334.toString().equals("project on the basis of projectId")){ 
	  List<String> listOfprojectId2=new ArrayList();
		List<String> listOfprojectName2=new ArrayList();
		List<String> listofprojectDateOfStart2=new ArrayList();
		List<String> listofprojectDateOfEnd2=new ArrayList();
		List<String> listclientIdInProject2=new ArrayList(); 
	  
		listOfprojectId2=(List)	session.getAttribute("listOfprojectId");
		listOfprojectName2=(List)session.getAttribute("listOfprojectName");
		listofprojectDateOfStart2=(List)session.getAttribute("listofprojectDateOfStart");
		listofprojectDateOfEnd2=(List)session.getAttribute("listofprojectDateOfEnd");
		listclientIdInProject2=(List)session.getAttribute("listclientIdInProject"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <th>Date of Start</th>
            <th>Date of End</th>
            <th>Client</th> 
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfprojectId2.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfprojectId2.get(i) %></td>
            <td><%= listOfprojectName2.get(i) %></td>
            <td><%= listofprojectDateOfStart2.get(i) %></td>
            <td><%= listofprojectDateOfEnd2.get(i) %></td>
            <td><%= listclientIdInProject2.get(i) %></td>  
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("project on the basis of projectId");
  }
  
  %>
  </tbody>
</table>
<%--toastify notification project not available on the basis of projectId--%>
 <%
 Object o1111=session.getAttribute("project not available on the basis of projectId");
 if(o1111!=null&&o1111.equals("project not available on the basis of projectId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "on project with particular Project Id",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("project not available on the basis of projectId");
 }
 %>
 <%--|(((END)))toastify notification project not available on the basis of projectId --%>
 
  <%--((((ENDS))))))for project with particular projectId --%>
  
  
  <%--client for  project Id --%>
 <%
  Object c1=session.getAttribute("client on the basis of projectId");
  if(c1!=null&&c1.toString().equals("client on the basis of projectId")){ 
	  List<String> listOfclientid=new ArrayList();
		List<String> listOfclientName=new ArrayList();
		List<String> listofemailClient=new ArrayList();
		List<String> listofclientRelationshaipDate=new ArrayList(); 
	  
		listOfclientid=(List)	session.getAttribute("listOfclientid");
		listOfclientName=(List)session.getAttribute("listOfclientName");
		listofemailClient=(List)session.getAttribute("listofemailClient");
		listofclientRelationshaipDate=(List)session.getAttribute("listofclientRelationshaipDate"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Client ID</th>
            <th>Client Name</th>
            <th>Client Email</th>
            <th>Client is with us from</th>
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfclientid.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfclientid.get(i) %></td>
            <td><%= listOfclientName.get(i) %></td>
            <td><%= listofemailClient.get(i) %></td>
            <td><%= listofclientRelationshaipDate.get(i) %></td> 
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("client on the basis of projectId");
  }
  
  %>
  </tbody>
</table>
<%-- toastify notification for no client for  project Id --%>
 <%
 Object c2=session.getAttribute("no client is their for this projectId");
 if(c2!=null&&c2.equals("no client is their for this projectId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no client assigned on this project",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no client is their for this projectId");
 }
 %>
 <%--|(((END)))toastify notification for no client for  project Id --%>
  
  <%--((ENDS))client for  project Id --%>
  
  
  <%--employee for  project Id --%>
 <%
  Object c112=session.getAttribute("employee on the basis of projectId");
  if(c112!=null&&c112.toString().equals("employee on the basis of projectId")){ 
	  List<String> listOfemployeeId=new ArrayList();
		List<String> listOfemployeeName=new ArrayList();
		List<String> listofemployeeEmail=new ArrayList();
		List<String> listofemployeeDept=new ArrayList();
		List<String> listofemployeePhone=new ArrayList();
		List<String> listofemployeeDOJ=new ArrayList(); 
		List<String> listofprojectIdInEmployee=new ArrayList(); 
		
		
	  
		listOfemployeeId=(List)	session.getAttribute("listOfemployeeId");
		listOfemployeeName=(List)session.getAttribute("listOfemployeeName");
		listofemployeeEmail=(List)session.getAttribute("listofemployeeEmail");
		listofemployeeDept=(List)session.getAttribute("listofemployeeDept");
		listofemployeePhone=(List)session.getAttribute("listofemployeePhone");
		listofemployeeDOJ=(List)session.getAttribute("listofemployeeDOJ"); 
		listofprojectIdInEmployee=(List)session.getAttribute("listofprojectIdInEmployee"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Employee Email</th>
            <th>Employee Phone</th>
            <th>Employee Dept</th>
            <th>Employee DOJ</th>
            <th>Employee working on Project</th>
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfemployeeId.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfemployeeId.get(i) %></td>
            <td><%= listOfemployeeName.get(i) %></td>
            <td><%= listofemployeeEmail.get(i) %></td>
            <td><%= listofemployeePhone.get(i) %></td>
            <td><%= listofemployeeDept.get(i) %></td>
            <td><%= listofemployeeDOJ.get(i) %></td> 
            <td><%= listofprojectIdInEmployee.get(i) %></td> 
            
             
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("employee on the basis of projectId");
  }
  
  %> 
  </tbody>
</table>
<%-- toastify notification for no employee for  project Id --%>
 <%
 Object c22=session.getAttribute("no employee on the basis of projectId");
 if(c22!=null&&c22.equals("no employee on the basis of projectId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no employee assigned for this project",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no employee on the basis of projectId");
 }
 %>
 <%--|(((END)))toastify notification for no employee for  project Id --%>
  
  <%--((ENDS))employee for  project Id --%>
  
  
  
  
 
 <%--(END)flex item2 in flex item 2  start(app body) --%>
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