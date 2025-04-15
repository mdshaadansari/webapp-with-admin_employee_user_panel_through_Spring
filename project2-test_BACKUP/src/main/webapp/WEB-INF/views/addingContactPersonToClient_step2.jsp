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
			List<String> existingclientIdInContactPersonforIncomingClientId = new ArrayList();
			List<String> existingcontactPersonNameforIncomingClientId = new ArrayList();
			List<String> existingemailforIncomingClientId = new ArrayList();
			List<String> existingphoneforIncomingClientId = new ArrayList(); 
			List<String> existingdesignationforIncomingClientId = new ArrayList(); 
  
				
 
				//==================fetching contactPerson from DB which is matching selected clientId  ===================================
		System.out.println("==fetching contactPerson from DB which is matching selected clientId ");

DAOInterface DAOImpl=(DAOInterface)session.getAttribute("DAOImpl");
if(DAOImpl==null){ 
	DAOImpl=com.example.project2_test.DAO_Repository.DAOImpleSingeltonFOR_jsp.getDAOImpl();
}

				List<List> getAllContactPersonForClientId=DAOImpl.getAllContactPersonForClientId(clientId);
				
				if(getAllContactPersonForClientId!=null){
					existingclientIdInContactPersonforIncomingClientId=	getAllContactPersonForClientId.get(0);
					existingcontactPersonNameforIncomingClientId=	getAllContactPersonForClientId.get(1);
					existingemailforIncomingClientId=	getAllContactPersonForClientId.get(2);
					existingphoneforIncomingClientId=	getAllContactPersonForClientId.get(3);
					existingdesignationforIncomingClientId=	getAllContactPersonForClientId.get(4);
					
					 
					%>	 

<%
}else{
					 %>
						
<%--when no contactPerson in DB --%>						
 
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "no contact Person available for " %><%=clientId +" "+clientName%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
<%--((((((END)))when no contactPerson in DB --%>			
	
<%
					} 
%>
					
						 
  
<div style="height:350px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;">
<a href="selectClientToAddContactPerson_setp1" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
<div >
  <h4>Add more Contact person </h4>
<form action="addContactPersonToClientServlet_step3" method="get"> 
<!-- <input type="hidden" name="addContactPersonToClientServlet_step3" value="addContactPersonToClientServlet_step3"/> -->
<input type="text" name="clientName" value="<%=request.getParameter("clientName")%> "
placeholder="<%= session.getAttribute("clientName")  %> "  readonly /></br>
<input type="text" name="clientId" value="<%=request.getParameter("clientId")%> "
placeholder="<%= request.getParameter("clientId")  %> "  readonly /></br>

 
<input type="text" name="contactPersonName" required placeholder="contact person name" pattern="^[A-Za-z0-9 ]+$"
 title="Symbols not allowed"   maxlength="40" required/></br>
 <input type="email" name="contactPersonEmail" required placeholder="contact-person-email"  maxlength="40"/></br>
<input type="text" name="contactPersonPhone" required placeholder="+91-1234567890"   title="follow pattern +91-1234567890"   pattern="^\+[0-9]{1,4}-[0-9]{10}$"    maxlength="40"/></br>
<input type="text" name="contactPersonDesignation" required placeholder=" Designation"  pattern="^[A-Za-z ]+$" title="Symblow & numbers not allowed"  maxlength="40"/></br>
 

<input type="reset" value="reset"/><br>
<input type="submit" value="add to <%=request.getParameter("clientName")%>"/>
</form> 
 


    
</div>
</div>

<%-- printing exsisting contact Person for incoming clientId --%>


  

<%
if(existingclientIdInContactPersonforIncomingClientId.size() > 0){
%>
<div style="border:1px solid black;background-color:rgba(0,0,50,0.2);border-radius:5px">

<%= "&nbsp &nbsp &nbsp contact person for client ->"+clientName+" "+clientId+ "<br>"%>
<%="&nbsp &nbsp &nbsp ------------------------------------------------------------------------<br>" %>


    <table>
        <thead>
            <tr>
                <th>contact person name&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</th>
                <th>contact person email&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</th>
                <th>contact person phone&nbsp; &nbsp; &nbsp;</th> 
            </tr>
        </thead>
        <tbody>
            <%
            for(int i=0; i<existingclientIdInContactPersonforIncomingClientId.size(); i++){
                String a = existingclientIdInContactPersonforIncomingClientId.get(i);
                String b = existingcontactPersonNameforIncomingClientId.get(i);
                String c = existingemailforIncomingClientId.get(i);
                String d=existingphoneforIncomingClientId.get(i);
            %>
            <tr>
                <td><%= b %></td>
                <td><%= c %></td>
                <td><%= d %></td> 
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
}
%>
 
 
 
 <%--when Contact Person added to successfully in DB --%>	
 
 <%
 Object o1=session.getAttribute("Contact Person added successfully");
 if(o1!=null && o1.toString().equals("Contact Person added successfully")){
 %>					
 
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "Contact Person added successfully for " %><%=clientId +" "+clientName%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
    session.removeAttribute("Contact Person added successfully");
 }
    %>
<%--((((((END)))when Contact Person added to successfully in DB --%>
 
 
 
 <%--when Contact Person not added in DB --%>	
 
 <%
 Object o22=session.getAttribute("fail adding Contact Person");
 if(o22!=null && o22.toString().equals("fail adding Contact Person")){
 %>					
 
<script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%= "fail adding Contact Person for " %><%=clientId +" "+clientName%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>	
    
    <%
    session.removeAttribute("fail adding Contact Person");
 }
    %>
<%--(((END)))when Contact Person not added in DB --%>	
 


 
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