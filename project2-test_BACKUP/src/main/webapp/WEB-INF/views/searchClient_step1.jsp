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
 
 <%-- fetching all the client and putting it to java.util.List--%>
<%
List<String> listOfclientId=new ArrayList();
List<String> listOfclientName=new ArrayList();
List<String> listOfemailClient=new ArrayList();
List<String> listOfclientRelationshaipDate=new ArrayList(); 

DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}
List<List>getAllClient= DAOImpl.getAllClient();

if(getAllClient!=null){

	listOfclientId.addAll(getAllClient.get(0));
	listOfclientName.addAll(	getAllClient.get(1));
	listOfemailClient.addAll(getAllClient.get(2));
	listOfclientRelationshaipDate.addAll(	getAllClient.get(3));
 
				
			}else{
				session.setAttribute("no client available in DB", "no client available in DB");
			}
 

%>

 
 
 <%--(END) fetching all the client and putting it to java.util.List--%>
 
 
 
 
 
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:15%;;width:100%;display:flex ;align-items:center;justify-content:center ;  box-shadow:0px 0px 3px 0px black ;border-radius:  20px ">
 
 <%-- GET ALL client BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfclientId.size()>0){
 
 %>
 display all client
 <form action="searchClient_step1_getAllClientButtonClienk_step2">
 <!-- <input type="hidden" name="searchClient_step1_getAllClientButtonClienk_step2" value="searchClient_step1_getAllClientButtonClienk_step2"/> -->
 <input type="submit" value="get all client"  />
 </form>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->

 <%
 }else{
 %>
display all client
 <form action="#">
 <input type="submit" value="get all client"  />
 </form>
 <h2>no client in DB</h2>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->
 <%
 }
 %>
 
 </div>
 
 <%--(((END)) GET ALL client BUTTON --%>
 
 <%-- GET project BY client Id BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfclientId.size()>0){ %>
 
 
get project of client by client Id<br>
<form action="searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java" method="get" onsubmit="return validateClientSearch()">
 <!--    <input type="hidden" name="searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java" value="searchClient_step1_getAllProjectByClientIdButtonClienk_step3.java"/> -->
    <input type="search" id="clientIdSearch" name="clientId" placeholder="Enter Client ID" onkeyup="showClientSuggestions()">
    <div id="clientSuggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="selectedClientName" name="clientName" value="">
    <input type="submit" value="Submit">
    <p id="clientError" class="error-message">Invalid input! Please select a suggestion.</p>
</form>

<script>
    // Arrays to store client names and IDs
    const clientNames = [];
    const clientIds = [];

    <%
    for (int i = 0; i < listOfclientId.size(); i++) {
        String listOfclientName1 = listOfclientName.get(i);
        String listOfclientId1 = listOfclientId.get(i);
        out.print("clientNames.push('" + listOfclientName1 + "');\n");
        out.print("clientIds.push('" + listOfclientId1 + "');\n");
    }
    %>

    function showClientSuggestions() {
        let input = document.getElementById("clientIdSearch").value.toLowerCase();
        let suggestionsDiv = document.getElementById("clientSuggestions");
        suggestionsDiv.innerHTML = "";

        if (input.length === 0) {
            suggestionsDiv.style.display = "none";
            return;
        }

        let filteredByName = clientNames
            .map((name, index) => ({ name, id: clientIds[index] }))
            .filter(entry => entry.name.toLowerCase().includes(input));

        let filteredById = clientIds
            .map((id, index) => ({ name: clientNames[index], id }))
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
                document.getElementById("clientIdSearch").value = id;
                document.getElementById("selectedClientName").value = name;
                suggestionsDiv.innerHTML = "";
                suggestionsDiv.style.display = "none";
                document.getElementById("clientError").style.display = "none";
            };

            suggestionsDiv.appendChild(div);
        });
    }

    function validateClientSearch() {
        let input = document.getElementById("clientIdSearch").value;
        let selectedName = document.getElementById("selectedClientName").value;

        if (selectedName === "") {
            document.getElementById("clientError").style.display = "block";
            return false;
        }
        return true;
    }

    // Hide suggestions when clicking outside
    document.addEventListener("click", function (event) {
        let searchBox = document.getElementById("clientIdSearch");
        let suggestionsDiv = document.getElementById("clientSuggestions");

        if (!searchBox.contains(event.target) && !suggestionsDiv.contains(event.target)) {
            suggestionsDiv.style.display = "none";
        }
    });
</script>

 
<%}else
{ 
%>

 get project of client by client Id<br>
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox" name="clienId" placeholder="employee Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="clientName" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form>
  
 no client in DB 
<%} %>
 </div>
 <%--((END)) GET project BY client Id BUTTON --%>
 
  

 <%--toastify notification when no client in DB --%>
 <%
 Object o1=session.getAttribute("no client available in DB");
 if(o1!=null&&o1.equals("no client available in DB")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no client available in DB, add client first",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no client available in DB");
 }
 %>
 <%--|(((END)))toastify notification when noclientin DB --%>
 
 <%--(END)flex item1 in flex item 2  start(app body) --%>
 </div>
 
 
 <%--flex item2 in flex item 2  start(app body) --%>
 <div style="height:85%;width:100%;  ">
 
 
 
 
 
 
 <%-- get all client button clieck --%>
 <%
  Object o2=session.getAttribute("all info of client");
  if(o2!=null&&o2.toString().equals("all info of client")){ 
	  List<String> listOfclientId2=new ArrayList();
		List<String> listOfclientName2=new ArrayList();
		List<String> listOfemailClient2=new ArrayList();
		List<String> listOfclientRelationshaipDate2=new ArrayList(); 
	  
	  
		listOfclientId2=(List)	session.getAttribute("listOfclientId");
		listOfclientName2=(List)session.getAttribute("listOfclientName");
		listOfemailClient2=(List)session.getAttribute("listOfemailClient");
		listOfclientRelationshaipDate2=(List)session.getAttribute("listOfclientRelationshaipDate"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Client ID</th>
            <th>Client Name</th>
            <th>Client Email</th>
            <th>Client Joinned On</th> 
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfclientId2.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfclientId2.get(i) %></td>
            <td><%= listOfclientName2.get(i) %></td>
            <td><%= listOfemailClient2.get(i) %></td>
            <td><%= listOfclientRelationshaipDate2.get(i) %></td> 
        </tr>
 
  
  <%
	  }
  session.removeAttribute("all info of client");
  }
  
  %>
  </tbody>
</table>



<%--toastify when no client in db --%>

<%
  Object o23=session.getAttribute("client not available in DB");
  if(o23!=null&&o23.toString().equals("client not available in DB")){ 
	%>
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no client available in DB, add client first",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
	
	<%} %>

<%--toastify when no client in db --%> 
 <%--(END) get all client button clieck --%>
 
 <%--get project by client Id --%>
 
  <%--for project with particular clientId --%>
 <%
  Object o334=session.getAttribute("project is assigned for this clientId");
  if(o334!=null&&o334.toString().equals("project is assigned for this clientId")){ 
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
  session.removeAttribute("project is assigned for this clientId");
  }
  
  %>
  </tbody>
</table>
<%--toastify notification no project is assigned for this clientId--%>
 <%
 Object o1111=session.getAttribute("no project is assigned for this clientId");
 if(o1111!=null&&o1111.equals("no project is assigned for this clientId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no project is assigned for this clientId",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no project is assigned for this clientId");
 }
 %>
 <%--|(((END)))toastify notification no project is assigned for this clientId --%>
 
  <%--((((ENDS))))))for project with particular clientId --%>
 
 <%--((END))get project by client Id --%>
 
 
 
 
 
 
 
 
 
 
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