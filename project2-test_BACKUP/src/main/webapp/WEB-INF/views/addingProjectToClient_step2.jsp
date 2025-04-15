<!-- if admin not login(admin logged out) --> 
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
//==========fetching all project  
 
String clientId=request.getParameter("clientId");
String clientName=request.getParameter("clientName");

System.out.println("fetching all project");
			
			List<String> projectId = new ArrayList();
			List<String> clientIdInProject = new ArrayList();
			List<String> projectName = new ArrayList(); 

				List<String>	existingClientIdInprojectforIncomingClientId = new ArrayList();
				List<String> existingProjectIdforIncomingClientId  = new ArrayList();
				List<String> existingProjectNameforIncomingClientId  = new ArrayList();
				 
				DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
				if(DAOImpl==null){ 
					DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
				}
				List<List> getAllProject=DAOImpl.getAllProject();
				
				if(!getAllProject.isEmpty()){
					projectId.addAll( getAllProject.get(0) );
					clientIdInProject.addAll(getAllProject.get(1));
					projectName.addAll(getAllProject.get(2));
				 
				System.out.println("fetching all project completed");
				//==================also fetching project which is their in selected clientId from DB=================================== 
  				List<List> getAllProjectForClientId=DAOImpl.getAllProjectForClientId(clientId);
				
				
				if(getAllProjectForClientId!=null){
					existingProjectIdforIncomingClientId.addAll(getAllProjectForClientId.get(0));
					existingClientIdInprojectforIncomingClientId.addAll(	getAllProjectForClientId.get(1));
					existingProjectNameforIncomingClientId.addAll(	getAllProjectForClientId.get(2));
				}else{
					session.setAttribute("client dont have any project, please assign", "client dont have any project, please assign");
				}
				


					System.out.println(existingProjectIdforIncomingClientId); 
						//=========================removing employeealready assigned selected projectID==========================================
						
					 
					for(int qw = projectId.size() - 1; qw >= 0; qw--){
						abc:
						for(int qw2=0;  qw2 < existingProjectIdforIncomingClientId.size() ; qw2++){
						//System.out.println(iterator.next());
						if(projectId.get(qw) .equals(existingProjectIdforIncomingClientId.get(qw2))){
							System.out.println(projectId.get(qw)+" "+existingProjectNameforIncomingClientId.get(qw2));
							projectId.remove(qw);
							projectName.remove(qw);
							break abc;
						} 
					}
					}
						
								//dont work because project name ccan be duplicate
						//projectId.removeAll(existingProjectIdforIncomingClientId);
						//projectName.removeAll(existingProjectNameforIncomingClientId); 
						//clientIdInProject.removeAll(existingClientIdInprojectforIncomingClientId);


 
%>
<div style="height:300px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;;">
<a href="selectClient_step1" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
<div >
  <h4>Add Project to client</h4>
<form action="addProjectToClientServlet_step3" method="get" onsubmit="return validateInput()">
<!-- projectId & projectName coming from selectProject_step1.jsp -->
<!--  <input type="hidden" name="addProjectToClientServlet_step3" value="addProjectToClientServlet_step3"/>-->
<input type="text" name="clientName" value="<%=request.getParameter("clientName")%> "
placeholder="<%= request.getParameter("clientName")  %> "  readonly /></br>
<input type="text" name="clientId" value="<%=request.getParameter("clientId")%> "
placeholder="<%= request.getParameter("clientId")  %> "  readonly /></br>

    <input type="search" id="searchBox" name="projectName" placeholder="Search..." onkeyup="showSuggestions()">
    <div id="suggestions" class="autocomplete-suggestions"></div>
    <input type="hidden" id="inInJsCode" name="projectId" value="">
    <input type="submit" value="Submit">
    <p id="error-message" class="error-message">Invalid input! Please select a suggestion.</p>
</form>
</div>
</div>
<div>




<%
if(existingProjectIdforIncomingClientId.size() > 0){
%> 
<div style="border:1px solid black;background-color:rgba(0,0,50,0.2);border-radius:5px">
    <%="&nbsp &nbsp &nbsp project of these client<br>"%>
    <%= "&nbsp; &nbsp; &nbsp; -----------------------------<br>"%>

    <table>
        <thead>
            <tr>
                <th>Project Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>Project Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>Client Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>Client Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            </tr>
        </thead>
        <tbody>
            <%
            for(int i=0; i<existingProjectIdforIncomingClientId.size(); i++){
                String a = existingProjectIdforIncomingClientId.get(i);
                String b = existingProjectNameforIncomingClientId.get(i);
            %>
            <tr>
                <td><%= b %></td>
                <td><%= a %></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is project of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>${param.clientName}</td>
                <td>${param.clientId}</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
}
%>




<!-- message if project belongs to some client -->
 
<%
System.out.println("********************************************");
Object o5=session.getAttribute("projectBelongsToSomeClient"); 
if(o5 !=null && o5.toString().equals("projectBelongsToSomeClient")){
	System.out.println("**********************again**********************");	  
%> 

<div  style="border:1px solid black;background-color:rgba(100,0,0,0.2);border-radius:5px;display:flex ;flex-direction: column;">
<div style="width:100%; display:flex; flex-direction:row-reverse">
<a href="addingProjectToClient_step2.jsp?clientName=<%=request.getParameter("clientName")%>&clientId=<%=request.getParameter("clientId")%>" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
&nbsp &nbsp &nbsp project belongs to this client<br>
&nbsp &nbsp &nbsp -------------------------------------<br> 
<table>
<thead>
<tr>
<th>Project ID</th>
<th>Project Name</th>
<th></th>
<th>Client Id</th>
</tr>
</thead>

<tbody>
<tr>
<forn>
<td><input type="text" value=<%=session.getAttribute("projectIdOfProjectWhichAlreadyHaveClient")%> readonly></td>
<td><input type="text" value=<%=session.getAttribute("projectNameOfProjectWhichAlreadyHaveClient") %> readonly></td>
<td><%=" project , belongs to  ->" %></td>
<td><input type="text" value=<%=session.getAttribute("clientIdInProjectOfClientWhichAlreadyHaveProject") %> readonly></td>
 
</forn>
</tr>
</tbody>
</table>



  
</div>
<%
session.removeAttribute("projectBelongsToSomeClient");
session.removeAttribute("projectIdOfProjectWhichAlreadyHaveClient");
session.removeAttribute("projectNameOfProjectWhichAlreadyHaveClient");
session.removeAttribute("clientIdInProjectOfClientWhichAlreadyHaveProject");
}
%>

<!--(ENDS) message if project belongs to some client -->
</div> 

<script>
    // Arrays to store project names and numeric values (IDs)
    const words = [];
    const numericValues = [];

 

<%
for (int i = 0; i < projectId.size(); i++) {
    String projectName1 = projectName.get(i);
    String projectId1 = projectId.get(i);
    out.print("words.push('" + projectName1 + "');\n");
    out.print("numericValues.push('" + projectId1 + "');\n");
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
						
<%--when no Project in DB --%>						
<h2>Select Project</h2>
<form action="#" method="get" onsubmit="return validateInput()">
<input type="text" name="clientId" value="<%= request.getParameter("clientId")  %> "
placeholder="<%= session.getAttribute("clientId")  %> "  readonly /></br>
<input type="text" name="clientName" value="<%= request.getParameter("clientName")  %> "
placeholder="<%= session.getAttribute("clientName")  %> "  readonly /></br>
 
    <input type="submit" value="Submit"> 
</form>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "no Project available in DB, add Project first" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
<%--((((((END)))when no Project in DB --%>			
	
	<%
					}
					 
%>



<!-- notifaication if "client dont have any project, please assign" -->

<%
Object success=session.getAttribute("client dont have any project, please assign");
if(success!=null && success.toString().equals("client dont have any project, please assign")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "client dont have any project, please assign"%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
session.removeAttribute("client dont have any project, please assign");    
}
%>
    <!-- (END)"client dont have any project, please assign" -->

<!-- notifaication if client assigned to project successfully or not -->

<%
Object successqw=session.getAttribute("client assigned to project successfully");
if(successqw!=null && successqw.toString().equals("client assigned to project successfully")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "client assigned to project successfully" %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
session.removeAttribute("client assigned to project successfully");    
}
%>
    

<%
Object notsuccess=session.getAttribute("client not assigned to project successfully");
if(notsuccess!=null && notsuccess.toString().equals("client not assigned to project successfully")){
%>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "client not assigned to project " %>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
session.removeAttribute("client not assigned to project successfully");    
}
%>

 
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