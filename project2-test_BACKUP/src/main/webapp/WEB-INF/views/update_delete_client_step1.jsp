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
List<List>getAllClient=DAOImpl.getAllClient();

if(getAllClient!=null){
	listOfclientId=getAllClient.get(0);
	listOfclientName=getAllClient.get(1);
	listOfemailClient=getAllClient.get(2);
	listOfclientRelationshaipDate=getAllClient.get(3);
	
 
				
				
			}else{
				session.setAttribute("no client available in DB", "no client available in DB");
			} 
%> 
 <%--(END) fetching all the client and putting it to java.util.List--%>
 
 
 
 
 
 
 <%--flex item1 in flex item 2  start(app body) --%>
 <div style="height:15%;;width:100%;display:flex ;align-items:center;justify-content:center ; box-shadow:0px 0px 3px 0px black ;border-radius:  20px ">
 

 
 <%-- select client Id BUTTON --%>
 
 <div style="height:100%;width:25%;border:1px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
 <%if(listOfclientId.size()>0){ %>
 
 
select client by Id/Name</br>
<form action="update_delete_client_step1_selectingClientId" method="get" onsubmit="return validateClientSearch()">
<!-- <input type="hidden" name="update_delete_client_step1_selectingClientId" value="update_delete_client_step1_selectingClientId"/> -->
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
//session.setAttribute("on client with particular clientId", "on client with particular clientId");
%>

 select client by Id/Name</br>
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
 <%--((END))selecte client Id BUTTON --%>
 
  

 <%--toastify notification when no client in DB --%>
 <%
 Object o11=session.getAttribute("no client available in DB");
 if(o11!=null&&o11.toString().equals("no client available in DB")){
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
 
 
 
 
 
 <%--BELOW ONE IS NOT IN USE --%>
<%--toastify notification no client with particular clientId --%>
 <%
 Object o1111=session.getAttribute("on client with particular clientId");
 if(o1111!=null&&o1111.toString().equals("on client with particular clientId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "on client with particular clientId",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("on client with particular clientId");
 }
 %>
 <%--|(((END)))toastify notification no client with particular clientId --%>
 
  
 
 
  
 

 
 <%--showing update and delete button for selected clientId --%>
 <%
 Object o12=session.getAttribute("client for this clientId");
if(o12 != null && o12.toString().equals("client for this clientId")){ 
	 
	
 %>
 	 
 <table>
 <thead>
 <tr>
 <th> client Id</th>
 <th> client Name</th>
 <th> client Email</th>
 <th> client registered date</th>
 </tr>
 </thead>
 
 <tbody>
 <tr>
 <form action="update_delete_client_step1_updateButtonClick" method="get">
 <!-- <input type="hidden" name="update_delete_client_step1_updateButtonClick" value="update_delete_client_step1_updateButtonClick"/> -->
 <td><input type="text" name="clientId2" value="<%=session.getAttribute("clientId2")%>" readonly></td>
 <td><input type="text" name="clientName" value="<%=session.getAttribute("clientName")%>" required></td>
 <td><input type="text" name="emailClient" value="<%=session.getAttribute("emailClient")%>" required></td>
 <td><input type="text" name="clientRelationshaipDate" value="<%=session.getAttribute("clientRelationshaipDate")%>" required></td>
 <td><input type="submit" value="update"></td>
 </form>
 <form action=update_delete_client_step1_DeleteButtonClick method="get">
 <!-- <input type="hidden" name="update_delete_client_step1_DeleteButtonClick" value="update_delete_client_step1_DeleteButtonClick"/> -->
 <td><input type="hidden" name="clientId2" value="<%=session.getAttribute("clientId2")%>" ></td>
 <td><input type="submit" value="delete"></td>
 </form>
 </tr>
 </tbody>
 
 
 </table>
 
 
 <%
 session.removeAttribute("client for this clientId");
 }
 %>
 
 <%--toastify notification no client with particular clientId--%>
 <%
 Object o2=session.getAttribute("no client for this clientId");
 if(o2!=null&&o2.toString().equals("no client for this clientId")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "on client with particular clientId",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("no client for this clientId");
 }
 %>
 <%--|(((END)))toastify notification no client with particular clientId --%>


 <%--toastify notification if client updated--%>
 <%
 Object o23=session.getAttribute("client updated");
 if(o23!=null&&o23.toString().equals("client updated")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "client updated",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("client updated");
 }
 %>
 <%--|(((END)))toastify notification if client updated --%>
 


 <%--toastify notification if client not updated--%>
 <%
 Object o234=session.getAttribute("client not updated");
 if(o234!=null&&o234.toString().equals("client not updated")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "client not updated",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("client not updated");
 }
 %>
 <%--|(((END)))toastify notification if client not updated --%>
 
 
 
 
 <%--toastify notification if client is deleted--%>
 <%
 Object oab=session.getAttribute("client deleted");
 if(oab!=null&&oab.toString().equals("client deleted")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("clientId2")%>"+" client got deleted" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("client deleted"); 
 session.removeAttribute("clientId2"); 
 }
 %>
 <%--((((((((END)))))))))toastify notification if client is deleted--%>
 
 
  <%--toastify notification if client did not get deleted--%>
 <%
 Object oc=session.getAttribute("client not deleted");
 if(oc!=null&&oc.toString().equals("client not deleted")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("clientId2")%>"+" client didnt got deleted" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("client not deleted"); 
 }
 %>
 <%--toastify notification if client did not get deleted--%>
 
 
   <%--toastify notification if "client deleted, contactperson released"--%>
 <%
 Object o1c=session.getAttribute("client deleted, contactperson released");
 if(o1c!=null&&o1c.toString().equals("client deleted, contactperson released")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("clientId2")%>"+" client deleted, contactperson released" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("client deleted, contactperson released"); 
 }
 %>
 <%--toastify notification if "client deleted, contactperson released"--%>
 
 
 
 
   <%--toastify notification if "client deleted, contactperson released, project released"--%>
 <%
 Object o1c1=session.getAttribute("client deleted, contactperson released, project released");
 if(o1c1!=null&&o1c1.toString().equals("client deleted, contactperson released, project released")){
 %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("clientId2")%>"+" client deleted, contactperson released, project released" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <%
 session.removeAttribute("client deleted, contactperson released, project released"); 
 }
 %>
 <%--toastify notification if "client deleted, contactperson released, project released"--%>
 
 
 
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