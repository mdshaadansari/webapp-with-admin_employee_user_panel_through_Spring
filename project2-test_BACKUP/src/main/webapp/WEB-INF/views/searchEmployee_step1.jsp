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
 
 <%-- fetching all the employee and putting it to java.util.List--%>
<%
List<String> listOfemployeeId=new ArrayList();
List<String> listOfemployeeName=new ArrayList();
List<String> listOfemployeeDept=new ArrayList();
List<String> listOfemployeeEmail=new ArrayList();
List<String> listOfemployeePhone=new ArrayList();
List<String> listOfemployeeDOJ=new ArrayList();
List<String> listOfprojectIdInEmployee=new ArrayList();

DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}
List<List>getAllEmployeeEveryColumn=DAOImpl.getAllEmployeeEveryColumn();
if(getAllEmployeeEveryColumn!=null){
	listOfemployeeId.addAll( getAllEmployeeEveryColumn.get(0));
	listOfemployeeName.addAll( getAllEmployeeEveryColumn.get(1));
	listOfemployeeDept=getAllEmployeeEveryColumn.get(2);
	
	listOfemployeeEmail=getAllEmployeeEveryColumn.get(3);
	listOfemployeePhone=getAllEmployeeEveryColumn.get(4);
	
	listOfemployeeDOJ=getAllEmployeeEveryColumn.get(5);
	listOfprojectIdInEmployee=getAllEmployeeEveryColumn.get(6);

 
				
				
			}else{
				session.setAttribute("no employee available in DB", "no employee available in DB");
			}
 

%> 
 <%--(END) fetching all the employee and putting it to java.util.List--%>
 
 
 
 
 
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:15%;;width:100%;display:flex ;align-items:center;justify-content:center ;  box-shadow:0px 0px 3px 0px black ;border-radius:20px 20px 20px 20px ">
 
 <%-- GET ALL EMPLOYEE BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfemployeeId.size()>0){
 
 %>
 display all employee<br>
 <form action="searchEmployee_step1_getAllEmployeeButtonClienk_step2">
<!--  <input type="hidden" name="searchEmployee_step1_getAllEmployeeButtonClienk_step2" value="searchEmployee_step1_getAllEmployeeButtonClienk_step2"/> -->
 <input type="submit" value="get all employee"  />
 </form>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->

 <%
 }else{
 %>
display all employee<br>
 <form action="#">
 <input type="submit" value="get all employee"  />
 </form>
 <h2>no employee in DB</h2>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->
 <%
 }
 %>
 
 </div>
 
 <%--(((END)) GET ALL EMPLOYEE BUTTON --%>
 
 <%-- GET ALL EMPLOYEE BY EMAIL BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfemployeeId.size()>0){ %>
 
 
 search employee by Email </br>
<form action="searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2" method="get" onsubmit="return validateInput()">
 <!--   <input type="hidden" name="searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2" value="searchEmployee_step1_getAllEmployeeByEmailButtonClienk_step2"/> -->
    <input type="search" id="searchBox" name="employeeEmail" placeholder="employee Email" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="employeeId" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form>

<script>
    // Arrays to store project names and numeric values (IDs)
    const words = [];
    const numericValues = [];

    <%
    for (int i = 0; i < listOfemployeeId.size(); i++) {
        String listOfemployeeEmail1 = listOfemployeeEmail.get(i);
        String listOfemployeeId1 = listOfemployeeId.get(i);
        out.print("words.push('" + listOfemployeeEmail1 + "');\n");
        out.print("numericValues.push('" + listOfemployeeId1 + "');\n");
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
 search employee by email</br>
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox2" name="employeeId" placeholder="employee Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="employeeEmail" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form> 
 no employee in DB 
<%} %>
 </div>
 <%--((END)) GET ALL EMPLOYEE BY EMAIL BUTTON --%>

 <%-- GET ALL EMPLOYEE BY EMPLOYEE ID BUTTON --%>
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfemployeeId.size()>0){ %>
 search employee by  ID </br>
<form action="searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#" method="get" onsubmit="return validateEmployeeSearch()">
  <!--  <input type="hidden" name="searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#" value="searchEmployee_step1_getAllEmployeeByEmployeeIdButtonClienk_step2#"/> -->
    <input type="search" id="employeeIdSearch" name="employeeId" placeholder="Enter Employee ID" onkeyup="showEmployeeSuggestions()">
    <div id="employeeSuggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="selectedEmployeeEmail" name="employeeEmail" value="">
    <input type="submit" value="Submit">
    <p id="employeeError" class="error-message">Invalid input! Please select a suggestion.</p>
</form>

<script>
    // Arrays to store employee emails and IDs
    const employeeEmails = [];
    const employeeIds = [];

    <%
    for (int i = 0; i < listOfemployeeId.size(); i++) {
        String employeeEmail = listOfemployeeEmail.get(i);
        String employeeId = listOfemployeeId.get(i);
        out.print("employeeEmails.push('" + employeeEmail + "');\n");
        out.print("employeeIds.push('" + employeeId + "');\n");
    }
    %>

    function showEmployeeSuggestions() {
        let input = document.getElementById("employeeIdSearch").value.toLowerCase();
        let suggestionsDiv = document.getElementById("employeeSuggestions");
        suggestionsDiv.innerHTML = "";

        if (input.length === 0) {
            suggestionsDiv.style.display = "none";
            return;
        }

        let filteredByEmail = employeeEmails
            .map((email, index) => ({ email, id: employeeIds[index] }))
            .filter(entry => entry.email.toLowerCase().includes(input));

        let filteredById = employeeIds
            .map((id, index) => ({ email: employeeEmails[index], id }))
            .filter(entry => entry.id.includes(input));

        // Combine results & remove duplicates
        let combinedSuggestions = [...filteredByEmail, ...filteredById].filter(
            (value, index, self) =>
                index === self.findIndex((v) => v.email === value.email && v.id === value.id)
        );

        if (combinedSuggestions.length > 0) {
            suggestionsDiv.style.display = "block";
        } else {
            suggestionsDiv.style.display = "none";
        }

        combinedSuggestions.forEach(({ email, id }) => {
            let div = document.createElement("div");
            div.classList.add("suggestion");
            div.innerText = email + " (ID: " + id + ")";

            div.onclick = function (event) {
                event.stopPropagation();
                document.getElementById("employeeIdSearch").value = id;
                document.getElementById("selectedEmployeeEmail").value = email;
                suggestionsDiv.innerHTML = "";
                suggestionsDiv.style.display = "none";
                document.getElementById("employeeError").style.display = "none";
            };

            suggestionsDiv.appendChild(div);
        });
    }

    function validateEmployeeSearch() {
        let input = document.getElementById("employeeIdSearch").value;
        let selectedEmail = document.getElementById("selectedEmployeeEmail").value;

        if (selectedEmail === "") {
            document.getElementById("employeeError").style.display = "block";
            return false;
        }
        return true;
    }

    // Hide suggestions when clicking outside
    document.addEventListener("click", function (event) {
        let searchBox = document.getElementById("employeeIdSearch");
        let suggestionsDiv = document.getElementById("employeeSuggestions");

        if (!searchBox.contains(event.target) && !suggestionsDiv.contains(event.target)) {
            suggestionsDiv.style.display = "none";
        }
    });
</script>



<%}else
{ 
%>
 
  search employee by  ID </br>
<form action="#" method="get" onsubmit="return validateInput()">
    <input type="search" id="searchBox" name="employeeId" placeholder="employee Id" onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inJsCode" name="employeeEmail" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form> 
 no employee in DB 
<%} %>
 <%--(END) GET ALL EMPLOYEE BY EMPLOYEE ID BUTTON --%>
 </div>
 
 

<%-- GET project on the basis of employee --%>
<div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
    <%if(listOfemployeeId.size()>0){ %>
    get project assigned to employee </br>
    <form action="searchEmployee_step1_getPrjectAssignedToEmployee_step2" method="get" onsubmit="return validateEmpSearch()">
      <!--  <input type="hidden" name="searchEmployee_step1_getPrjectAssignedToEmployee_step2" value="searchEmployee_step1_getPrjectAssignedToEmployee_step2"/> -->
        <input type="search" id="empIdSearch" name="employeeId" placeholder="Enter Employee ID" onkeyup="showEmpSuggestions()">
        <div id="empSuggestions" class="autocomplete-suggestions"></div>
        <input type="hidden" id="selectedEmpEmail" name="employeeName" value="">
        <input type="submit" value="Submit">
        <p id="empError" class="error-message">Invalid input! Please select a suggestion.</p>
    </form>

    <script>
        // Arrays to store employee emails and IDs
        const empEmails = [];
        const empIds = [];

        <%
        for (int i = 0; i < listOfemployeeId.size(); i++) {
            String employeeName = listOfemployeeName.get(i);
            String employeeId = listOfemployeeId.get(i);
            out.print("empEmails.push('" + employeeName + "');\n");
            out.print("empIds.push('" + employeeId + "');\n");
        }
        %>

        function showEmpSuggestions() {
            let input = document.getElementById("empIdSearch").value.toLowerCase();
            let suggestionsDiv = document.getElementById("empSuggestions");
            suggestionsDiv.innerHTML = "";

            if (input.length === 0) {
                suggestionsDiv.style.display = "none";
                return;
            }

            let filteredByEmail = empEmails
                .map((email, index) => ({ email, id: empIds[index] }))
                .filter(entry => entry.email.toLowerCase().includes(input));

            let filteredById = empIds
                .map((id, index) => ({ email: empEmails[index], id }))
                .filter(entry => entry.id.includes(input));

            // Combine results & remove duplicates
            let combinedSuggestions = [...filteredByEmail, ...filteredById].filter(
                (value, index, self) =>
                    index === self.findIndex((v) => v.email === value.email && v.id === value.id)
            );

            if (combinedSuggestions.length > 0) {
                suggestionsDiv.style.display = "block";
            } else {
                suggestionsDiv.style.display = "none";
            }

            combinedSuggestions.forEach(({ email, id }) => {
                let div = document.createElement("div");
                div.classList.add("suggestion");
                div.innerText = email + " (ID: " + id + ")";

                div.onclick = function (event) {
                    event.stopPropagation();
                    document.getElementById("empIdSearch").value = id;
                    document.getElementById("selectedEmpEmail").value = email;
                    suggestionsDiv.innerHTML = "";
                    suggestionsDiv.style.display = "none";
                    document.getElementById("empError").style.display = "none";
                };

                suggestionsDiv.appendChild(div);
            });
        }

        function validateEmpSearch() {
            let input = document.getElementById("empIdSearch").value;
            let selectedEmail = document.getElementById("selectedEmpEmail").value;

            if (selectedEmail === "") {
                document.getElementById("empError").style.display = "block";
                return false;
            }
            return true;
        }

        // Hide suggestions when clicking outside
        document.addEventListener("click", function (event) {
            let searchBox = document.getElementById("empIdSearch");
            let suggestionsDiv = document.getElementById("empSuggestions");

            if (!searchBox.contains(event.target) && !suggestionsDiv.contains(event.target)) {
                suggestionsDiv.style.display = "none";
            }
        });
    </script>

    <%}else { %>
    get project assigned to employee </br>
    <form action="#" method="get" onsubmit="return validateInput()">
        <input type="search" id="searchBox" name="employeeId" placeholder="Employee ID" onkeyup="showSuggestions()">
        <div id="suggestions" class="autocomplete-suggestions"></div>
        <input type="hidden" id="inJsCode" name="employeeEmail" value="">
        <input type="submit" value="Submit">
        <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
    </form> 
    no employee in DB 
    <%} %>
</div>
<%--(END) GET project on the basis of employee --%>
<%-- GET ALL EMPLOYEE with no project BUTTON --%>
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfemployeeId.size()>0){
 
 %>
 get all employee on bench <br>
 <form action="searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java">
 <!-- <input type="hidden" name="searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java" value="searchEmployee_step1_getAllEmployeeOnBenchButtonClienk_step2.java"/> -->
 <input type="submit" value="get employee on bench"  />
 </form>
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->

 <%
 }else{
 %>

 get all employee on bench <br>
 <form action="#">
 <input type="submit" value="get employee on bench"  />
 </form>
 no employee in DB 
 <!-- <a href="searchEmployee_getAllEmployeeButtonClienk_step2"> get all employee</a>-->
 <%
 }
 %>
 </div>
<%--(ends) GET ALL EMPLOYEE with no project BUTTON --%>





 <%--toastify notification when no employee in DB --%>
 <%
 Object o1=session.getAttribute("no employee available in DB");
 if(o1!=null&&o1.equals("no employee available in DB")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no Employee available in DB, add Employee first",
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
 <%--|(((END)))toastify notification when no employee in DB --%>
 
 <%--(END)flex item1 in flex item 2  start(app body) --%>
 </div>
 
 
 <%--flex item2 in flex item 2  start(app body) --%>
 <div style="height:85%;width:100%;  ">
 
 <%--form all employee button click --%>
  <%
  Object o2=session.getAttribute("all info of employee");
  if(o2!=null&&o2.toString().equals("all info of employee")){ 
	  List<String> listOfemployeeId2=new ArrayList();
		List<String> listOfemployeeName2=new ArrayList();
		List<String> listOfemployeeDept2=new ArrayList();
		List<String> listOfemployeeEmail2=new ArrayList();
		List<String> listOfemployeePhone2=new ArrayList();
		List<String> listOfemployeeDOJ2=new ArrayList();
		List<String> listOfprojectIdInEmployee2=new ArrayList();    
	  
		listOfemployeeId2=(List)	session.getAttribute("listOfemployeeId");
		listOfemployeeName2=(List)session.getAttribute("listOfemployeeName");
		listOfemployeeDept2=(List)session.getAttribute("listOfemployeeDept");
		listOfemployeeEmail2=(List)session.getAttribute("listOfemployeeEmail");
		listOfemployeePhone2=(List)session.getAttribute("listOfemployeePhone");
		listOfemployeeDOJ2=(List)session.getAttribute("listOfemployeeDOJ");
		listOfprojectIdInEmployee2=(List)session.getAttribute("listOfprojectIdInEmployee"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Date of Joining</th>
            <th>working on project</th>
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfemployeeId2.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfemployeeId2.get(i) %></td>
            <td><%= listOfemployeeName2.get(i) %></td>
            <td><%= listOfemployeeDept2.get(i) %></td>
            <td><%= listOfemployeeEmail2.get(i) %></td>
            <td><%= listOfemployeePhone2.get(i) %></td>
            <td><%= listOfemployeeDOJ2.get(i) %></td>
            <td><%= listOfprojectIdInEmployee2.get(i) %></td>
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("all info of employee");
  }
  
  %>
  </tbody>
</table>





<%--(end) form all employee button click --%>
<%--for employee on bench button click --%>
 <%
  Object o3=session.getAttribute("employee on bench are");
  if(o3!=null&&o3.toString().equals("employee on bench are")){ 
	  List<String> listOfemployeeId2=new ArrayList();
		List<String> listOfemployeeName2=new ArrayList();
		List<String> listOfemployeeDept2=new ArrayList();
		List<String> listOfemployeeEmail2=new ArrayList();
		List<String> listOfemployeePhone2=new ArrayList();
		List<String> listOfemployeeDOJ2=new ArrayList();
		List<String> listOfprojectIdInEmployee2=new ArrayList();    
	  
		listOfemployeeId2=(List)	session.getAttribute("listOfemployeeId");
		listOfemployeeName2=(List)session.getAttribute("listOfemployeeName");
		listOfemployeeDept2=(List)session.getAttribute("listOfemployeeDept");
		listOfemployeeEmail2=(List)session.getAttribute("listOfemployeeEmail");
		listOfemployeePhone2=(List)session.getAttribute("listOfemployeePhone");
		listOfemployeeDOJ2=(List)session.getAttribute("listOfemployeeDOJ");
		listOfprojectIdInEmployee2=(List)session.getAttribute("listOfprojectIdInEmployee"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Date of Joining</th>
            <th>working on project</th>
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfemployeeId2.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfemployeeId2.get(i) %></td>
            <td><%= listOfemployeeName2.get(i) %></td>
            <td><%= listOfemployeeDept2.get(i) %></td>
            <td><%= listOfemployeeEmail2.get(i) %></td>
            <td><%= listOfemployeePhone2.get(i) %></td>
            <td><%= listOfemployeeDOJ2.get(i) %></td>
            <td><%= listOfprojectIdInEmployee2.get(i) %></td>
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("employee on bench are");
  }
  
  %>
  </tbody>
</table>

<%--toastify notification when no employee on bench --%>
 <%
 Object o11=session.getAttribute("no employee on bench");
 if(o11!=null&&o11.equals("no employee on bench")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no employee on bench",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no employee on bench");
 }
 %>
 <%--|(((END)))toastify notification no employee on bench --%>




<%--(((END)))for employee on bench button click --%>

<%--for employee with particular employeeEmail --%>
 <%
  Object o33=session.getAttribute("employee with particular employeeEmail");
  if(o33!=null&&o33.toString().equals("employee with particular employeeEmail")){ 
	  List<String> listOfemployeeId2=new ArrayList();
		List<String> listOfemployeeName2=new ArrayList();
		List<String> listOfemployeeDept2=new ArrayList();
		List<String> listOfemployeeEmail2=new ArrayList();
		List<String> listOfemployeePhone2=new ArrayList();
		List<String> listOfemployeeDOJ2=new ArrayList();
		List<String> listOfprojectIdInEmployee2=new ArrayList();    
	  
		listOfemployeeId2=(List)	session.getAttribute("listOfemployeeId");
		listOfemployeeName2=(List)session.getAttribute("listOfemployeeName");
		listOfemployeeDept2=(List)session.getAttribute("listOfemployeeDept");
		listOfemployeeEmail2=(List)session.getAttribute("listOfemployeeEmail");
		listOfemployeePhone2=(List)session.getAttribute("listOfemployeePhone");
		listOfemployeeDOJ2=(List)session.getAttribute("listOfemployeeDOJ");
		listOfprojectIdInEmployee2=(List)session.getAttribute("listOfprojectIdInEmployee"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Date of Joining</th>
            <th>working on project</th>
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfemployeeId2.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfemployeeId2.get(i) %></td>
            <td><%= listOfemployeeName2.get(i) %></td>
            <td><%= listOfemployeeDept2.get(i) %></td>
            <td><%= listOfemployeeEmail2.get(i) %></td>
            <td><%= listOfemployeePhone2.get(i) %></td>
            <td><%= listOfemployeeDOJ2.get(i) %></td>
            <td><%= listOfprojectIdInEmployee2.get(i) %></td>
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("employee with particular employeeEmail");
  }
  
  %>
  </tbody>
</table>

<%--toastify notification employee with particular employeeEmail--%>
 <%
 Object o111=session.getAttribute("on employee with particular employeeEmail");
 if(o111!=null&&o111.equals("on employee with particular employeeEmail")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "on employee with particular Email",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("on employee with particular employeeEmail");
 }
 %>
 <%--|(((END)))toastify notification employee with particular employeeEmail --%>




<%--(((END)))employee with particular employeeEmail --%>
<%--for employee with particular employeeId --%>
 <%
  Object o334=session.getAttribute("employee with particular employeeId");
  if(o334!=null&&o334.toString().equals("employee with particular employeeId")){ 
	  List<String> listOfemployeeId2=new ArrayList();
		List<String> listOfemployeeName2=new ArrayList();
		List<String> listOfemployeeDept2=new ArrayList();
		List<String> listOfemployeeEmail2=new ArrayList();
		List<String> listOfemployeePhone2=new ArrayList();
		List<String> listOfemployeeDOJ2=new ArrayList();
		List<String> listOfprojectIdInEmployee2=new ArrayList();    
	  
		listOfemployeeId2=(List)	session.getAttribute("listOfemployeeId");
		listOfemployeeName2=(List)session.getAttribute("listOfemployeeName");
		listOfemployeeDept2=(List)session.getAttribute("listOfemployeeDept");
		listOfemployeeEmail2=(List)session.getAttribute("listOfemployeeEmail");
		listOfemployeePhone2=(List)session.getAttribute("listOfemployeePhone");
		listOfemployeeDOJ2=(List)session.getAttribute("listOfemployeeDOJ");
		listOfprojectIdInEmployee2=(List)session.getAttribute("listOfprojectIdInEmployee"); 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Date of Joining</th>
            <th>working on project</th>
        </tr>
    </thead>
    <tbody>

		
	  <%

	  for (int i = 0; i < listOfemployeeId2.size(); i++) {
	
  %>
  
  
   <tr>
            <td><%= listOfemployeeId2.get(i) %></td>
            <td><%= listOfemployeeName2.get(i) %></td>
            <td><%= listOfemployeeDept2.get(i) %></td>
            <td><%= listOfemployeeEmail2.get(i) %></td>
            <td><%= listOfemployeePhone2.get(i) %></td>
            <td><%= listOfemployeeDOJ2.get(i) %></td>
            <td><%= listOfprojectIdInEmployee2.get(i) %></td>
            
        </tr>
 
  
  <%
	  }
  session.removeAttribute("employee with particular employeeId");
  }
  
  %>
  </tbody>
</table>

<%--toastify notification employee with particular employeeId--%>
 <%
 Object o1111=session.getAttribute("on employee with particular employeeId");
 if(o1111!=null&&o1111.equals("on employee with particular employeeId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "on employee with particular employeeId",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("on employee with particular employeeId");
 }
 %>
 <%--|(((END)))toastify notification employee with particular employeeId --%>




<%--(((END)))employee with particular employeeId --%>


<%--for project on the basis of employee--%>
 <%
  Object o3345=session.getAttribute("project on the basis of employee");
  if(o3345!=null&&o3345.toString().equals("project on the basis of employee")){ 
	 
		%>
		 

<table>
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Employee Email</th>
            <th>Employee Phone</th>
            <th></th>
            <th>Project Id</th>
            <th>Project Name</th>
            <th>Project Date Of Start</th>
            <th>Project Date Of End</th>
        </tr>
    </thead>
    <tbody>

	 
  
   <tr>
            <td><%= session.getAttribute("employeeId") %></td>
            <td><%= session.getAttribute("employeeName") %></td>
            <td><%= session.getAttribute("employeeEmail") %></td>
            <td><%= session.getAttribute("employeePhone") %></td>
            <td><%="is working on &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"%></td>
            <td><%= session.getAttribute("projectId") %></td>
            <td><%= session.getAttribute("projectName") %></td>
            <td><%= session.getAttribute("projectDateOfStart") %></td>
            <td><%= session.getAttribute("projectDateOfEnd") %></td> 
            
            
        </tr>
 
  </tbody>
</table>
  
  <%
	  
  session.removeAttribute("project on the basis of employee");
  }
  
  %>

<%--toastify notification no project assigned to employee--%>
 <%
 Object o11112=session.getAttribute("no project assigned to employee");
 if(o11112!=null&&o11112.equals("no project assigned to employee")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no project is assigned to selected employee",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no project assigned to employee");
 }
 %>
 <%--|(((END)))toastify notification no project assigned to employee --%>




<%--(((END)))project on the basis of employee --%>







 <%--((ENDS))flex item2 in flex item 2  start(app body) --%>
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