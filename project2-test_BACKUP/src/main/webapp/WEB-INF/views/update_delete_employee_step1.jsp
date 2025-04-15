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
	listOfemployeeId=getAllEmployeeEveryColumn.get(0);
	listOfemployeeName=getAllEmployeeEveryColumn.get(0);
	listOfemployeeDept=getAllEmployeeEveryColumn.get(0);
	listOfemployeeEmail=getAllEmployeeEveryColumn.get(0);
	listOfemployeePhone=getAllEmployeeEveryColumn.get(0);
	listOfemployeeDOJ=getAllEmployeeEveryColumn.get(0);
	listOfprojectIdInEmployee=getAllEmployeeEveryColumn.get(0);
	 
			}else{
				session.setAttribute("no employee available in DB", "no employee available in DB");
			}
%>

 
 
 <%--(END) fetching all the employee and putting it to java.util.List--%>
 
 
 
 
 
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:15%;;width:100%;display:flex ;align-items:center;justify-content:center ; box-shadow:0px 0px 3px 0px black ;border-radius:  20px ">
  

 <%-- GET ALL EMPLOYEE BY EMPLOYEE ID BUTTON --%>
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfemployeeId.size()>0){ %>
select employee by ID/Name </br>
<form action="update_delete_employee_step1_selectingEmployeeId" method="get" onsubmit="return validateEmployeeSearch()">
 <!--    <input type="hidden" name="update_delete_employee_step1_selectingEmployeeId" value="update_delete_employee_step1_selectingEmployeeId"/> -->
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
        String employeeName = listOfemployeeName.get(i);
        String employeeId = listOfemployeeId.get(i);
        out.print("employeeEmails.push('" + employeeName + "');\n");
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
	session.setAttribute("on employee with particular employeeId", "on employee with particular employeeId");
%>
 
  select employee by ID/Name </br>
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
 <div style="height:85%;width:100%; ">
 
 
 
 
  
  
 

 
 <%--showing update and delete button for selected employeeId --%>
 <%
 Object o12=session.getAttribute("employee for this employeeId");
if(o12 != null && o12.toString().equals("employee for this employeeId")){ 
	 
	
 %> 
 
 
 
 	 
 <table>
 <thead>
 <tr>
 <th> employee Id</th>
 <th> employee Name</th>
 <th> employee Dept</th>
 <th> employee Email</th>
 <th> employee Phone</th>
 <th> employee DOJ</th>
 <th> project Id In Employee</th>
 </tr>
 </thead>
 
 <tbody>
 <tr>
 <form action="update_delete_employee_step1_updateButtonClick" method="get">
 <!-- <input type="hidden" name="update_delete_employee_step1_updateButtonClick" value="update_delete_employee_step1_updateButtonClick"/> -->
 <td><input type="text" name="employeeId" value="<%=session.getAttribute("employeeId")%>" readonly></td>
 <td><input type="text" name="employeeName" value="<%=session.getAttribute("employeeName")%>" required></td>
 <td><input type="text" name="employeeDept" value="<%=session.getAttribute("employeeDept")%>" required></td>
 <td><input type="text" name="employeeEmail" value="<%=session.getAttribute("employeeEmail")%>" readonly></td>
 <td><input type="text" name="employeePhone" value="<%=session.getAttribute("employeePhone")%>" required></td>
 <td><input type="text" name="employeeDOJ" value="<%=session.getAttribute("employeeDOJ")%>" required></td>
 <td><input type="text" name="projectIdInEmployee" value="<%=session.getAttribute("projectIdInEmployee")%>" required></td>
 
 <td><input type="submit" value="update"></td>
 </form>
 <form action="update_delete_employee_step1_DeleteButtonClick" method="get">
 <!-- <input type="hidden" name="update_delete_employee_step1_DeleteButtonClick" value="update_delete_employee_step1_DeleteButtonClick"/> -->
 <td><input type="hidden" name="employeeId" value="<%=session.getAttribute("employeeId")%>" ></td>
 <td><input type="submit" value="delete"></td>
 </form>
 </tr>
 </tbody>
 
 
 </table>
 
 
 <%
 session.removeAttribute("employee for this employeeId");
 }
 %>
 
 <%--toastify notification no employee with particular clientId--%>
 <%
 Object o2=session.getAttribute("no employee for this employeeId");
 if(o2!=null&&o2.toString().equals("no employee for this employeeId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "no employee for this employeeId",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no employee for this employeeId");
 }
 %>
 <%--|(((END)))toastify notification no employee with particular clientId --%>


 <%--toastify notification if employee updated--%>
 <%
 Object o23=session.getAttribute("employee updated");
 if(o23!=null&&o23.toString().equals("employee updated")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "employee updated",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("employee updated");
 }
 %>
 <%--|(((END)))toastify notification if employee updated --%>
 


 <%--toastify notification if employee not updated--%>
 <%
 Object o234=session.getAttribute("employee not updated");
 if(o234!=null&&o234.toString().equals("employee not updated")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("employeeId2")%>"+"employee not updated",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("employee not updated");
 }
 %>
 <%--|(((END)))toastify notification if employee not updated --%>
 
 
 
 
 <%--toastify notification if employee is deleted--%>
 <%
 Object oab=session.getAttribute("employee deleted");
 if(oab!=null&&oab.toString().equals("employee deleted")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("employeeId2")%>"+" employee got deleted" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("employee deleted"); 
 session.removeAttribute("employeeId2"); 
 }
 %>
 <%--((((((((END)))))))))toastify notification if employee is deleted--%>
 
 
  <%--toastify notification if employee did not get deleted--%>
 <%
 Object oc=session.getAttribute("employee not deleted");
 if(oc!=null&&oc.toString().equals("employee not deleted")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("employeeId2")%>"+" employee didnt got deleted" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("employee not deleted"); 
 }
 %>
 <%--toastify notification if employee did not get deleted--%>
 
 
 
 <%--(END)showing update and delete button for selected clientId --%>
 
 
  
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