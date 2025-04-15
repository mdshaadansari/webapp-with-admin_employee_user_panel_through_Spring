<!-- if admin not login(admin logged out) -->
<%
Object o=request.getSession().getAttribute("going to adminVerificationOPTServlet");
if(o==null){ 
	 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     response.setHeader("Pragma", "no-cache");
     response.setDateHeader("Expires", 0);
	response.sendRedirect("Login");
	return;
}
%>
<!--((((END))))) if admin not login(admin logged out) -->







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


<%--*******1111111111111111111  ADDING EMPLOYEE  --%>
<% 
Object o1=session.getAttribute("comingFromaddEmployeeButtonClick");
if(o1!=null && o1.toString().equals("comingFromaddEmployeeButtonClick")){
	session.removeAttribute("comingFromaddEmployeeButtonClick");
	//out.println(session.getAttribute("employeeId").toString());
	//out.println(session.getAttribute("employeeDOJ").toString());
	
	System.out.println(session.getAttribute("employeeId") );
	System.out.println(session.getAttribute("employeeDOJ") );


%>

<%--
\+ = Must start with +
[0-9]{1,4} = Country code (1 to 4 digits)
- = Hyphen required after the country code
[0-9]{10} = Exactly 10 digits
$ = Ends after 10 digits (No extra characters allowed)
 --%>


<div style="height:250px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;">
<a href="${pageContext.request.contextPath}/adminDashboard" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>

<form action="${pageContext.request.contextPath}/addEmployee/addEmployeeInDB" method="get">
<!-- <input type="hidden" name="addEmployeeInDB" value="addEmployeeInDB"/> -->
<input type="text" name="employeeId" value="<%= session.getAttribute("employeeId")  %> "
placeholder="<%= session.getAttribute("employeeId")  %> "  readonly /></br>
<input type="text" name="employeeDOJ" value="<%= session.getAttribute("employeeDOJ")  %>" 
placeholder="<%= session.getAttribute("employeeDOJ")  %> "  readonly /></br>

<input type="text" name="employee-name" required placeholder="employee-name"  pattern="^[A-Za-z ]+$" title="Only alphabets and spaces are allowed"  maxlength="40"/></br>
<input type="text" name="employee-phone" required placeholder="+91-1234567890"   title="+91-1234567890"   pattern="^\+[0-9]{1,4}-[0-9]{10}$"  maxlength="40"/></br>
<input type="email" name="employee-email" required placeholder="employee-email"  maxlength="40"/></br>
<input type="text" name="employee-dept" required placeholder="employee-dept"  maxlength="40"/></br>
<!-- 
<select name="project">
<option value="select project" disabled selected>select project</option>
<c:forEach var="s" items="">
<option value=${s}  ></option>
</c:forEach>
</select></br>
 -->

<input type="reset" value="reset"/>
<input type="submit" value="add into DB"/>
</form> 
</div>
<%

}
%>




<%-- toastify notification when employee not added successfully, problem in DB --%>
<%
Object os2=session.getAttribute("employee not added successfully, problem in DB");
if(os2!=null && os2.toString().equals("employee added successfully")){
	
%> 
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("employee not added successfully, problem in DB") %>",  
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
    <%
    session.removeAttribute("employee not added successfully, problem in DB");
}
    %>
    
    <%--((((((end))))) toastify notification when employee not added successfully, problem in DB --%>
<%-- toastify notification when employee is add in DB and login credential send to employee and removing used seesion attributes --%>
<%
Object o2=session.getAttribute("employee added successfully");
if(o2!=null && o2.toString().equals("employee added successfully")){
	
%> 
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("employee added successfully") %>",  
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("login credentials send to employee email") %>",  
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>


<%
session.removeAttribute("employee added successfully");
session.removeAttribute("login credentials send to employee email");
} %>
<%--(((END))) toastify notification when employee is add in DB and login credential send to employee and removing used seesion attributes --%>

<%-- toastify notification if email is already in db and removing used seesion attributes --%>
<%
Object o3=session.getAttribute("employee with this email already exsist in DB");
if(o3 !=null && o3.toString().equals("employee with this email already exsist in DB")){ %>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("duplicateemployeeemail") +" already exsist in DB"%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
<%
session.removeAttribute("employee with this email already exsist in DB");
session.removeAttribute("duplicateemployeeemail");
} %>
<%--(((END))) toastify notification if email is already in db and removing used seesion attributes --%>
<%--*******1111111111111111111 (((END))) ADDING EMPLOYEE  --%>
<%--*******2222222222222222222222          ADDING project --%>


<% 
Object o4=session.getAttribute("comingFromaddProjectButtonClick");
if(o4!=null && o4.toString().equals("comingFromaddProjectButtonClick")){
	session.removeAttribute("comingFromaddProjectButtonClick");
	//out.println(session.getAttribute("employeeId").toString());
	//out.println(session.getAttribute("employeeDOJ").toString());
	
	System.out.println(session.getAttribute("projectId") );
	System.out.println(session.getAttribute("projectDateOfStart") );


%>
<div style="height:200px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;">
<a href="${pageContext.request.contextPath}/adminDashboard" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
<form action="${pageContext.request.contextPath}/addProject/addProjectInDB" method="get">
<!-- <input type="hidden" name="addProjectInDB" value="addProjectInDB"/>-->
<input type="text" name="projectId" value="<%= session.getAttribute("projectId")  %> "
placeholder="<%= session.getAttribute("projectId")  %> "  readonly /></br>
<input type="text" name="Starting Date" value="<%= session.getAttribute("projectDateOfStart")  %>" 
placeholder="<%= session.getAttribute("projectDateOfStart")  %> "  readonly /></br>

<input type="text" name="project-name" required placeholder="project name" pattern="^[A-Za-z0-9 ]+$"
 title="Symbols not allowed"   maxlength="40" required/></br>
 

<input type="text" name="Ending date" pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$" required placeholder="dd/mm/yyyy" title="dd/mm/yyyy follow the pattern"  maxlength="40"/></br>
 

<input type="reset" value="reset"/>
<input type="submit" value="add into DB"/>
</form> 
</div>

<%
} 
%>




<%--  toastify notification  project not add, problem in DB --%>
<%
Object o51=session.getAttribute("project not add, problem in DB");
if(o51!=null && o51.toString().equals("project not add, problem in DB")){ 
%>

 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: " <%= session.getAttribute("project not add, problem in DB") %>" ,
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>

<%
session.removeAttribute("project not add, problem in DB"); 
} 
%>
<%--(((ENDS)))  toastify notification  project not add, problem in DB--%>
<%--  toastify notification  project added successfully in DB --%>
<%
Object o5=session.getAttribute("project added successfully in DB");
if(o5!=null && o5.toString().equals("project added successfully in DB")){
	
%>

 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("project_name")+" (project) added successfully in DB"%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>

<%
session.removeAttribute("project added successfully in DB");
session.removeAttribute("project_name");
} %>
<%--(((ENDS)))  toastify notification  project added successfully in DB --%>
<%--*******2222222222222222222222   (((END)))       ADDING project --%>
<%--*******333333333333333333333333       ADDING client --%>


 

<% 
System.out.println("hiiiiiiiiiiiiiiiii");
System.out.println(session.getAttribute("comingFromaddClientButtonClick")); 
System.out.println(session.getAttribute("clientId") ); 
Object o6=session.getAttribute("comingFromaddClientButtonClick");
if(o6!=null && o6.toString().equals("comingFromaddClientButtonClick")){
	System.out.println(session.getAttribute("comingFromaddClientButtonClick")); 
	System.out.println(session.getAttribute("clientId") ); 
	
	session.removeAttribute("comingFromaddClientButtonClick");
	//out.println(session.getAttribute("clientId").toString()); 
	


%>
<% System.err.println(session.getAttribute("clientId")); %>
<div style="height:370px;width:250px;display:flex;flex-direction:column;  box-shadow:0px 20px 40px 0px black;border-radius:20px">
<div style="display:flex ;flex-direction: row-reverse;;">
<a href="${pageContext.request.contextPath}/adminDashboard" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>
<form action="${pageContext.request.contextPath}/addClient/addClientInDB" method="get"> 

<!--<input type="hidden" name="addClientInDB" value="addClientInDB"/>-->
<input type="text" name="clientId" value="<%= session.getAttribute("clientId")  %> "
placeholder="<%= session.getAttribute("clientId")  %> "  readonly /></br>

<input type="text" name="client-name" required placeholder="name" pattern="^[A-Za-z0-9 ]+$"
 title="Symbols not allowed"   maxlength="40" required /></br>
 <input type="email" name="clientEmail" required placeholder="client-email"/></br>
<input type="text" name="client date" pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$" required placeholder="dd/mm/yyyy" title="dd/mm/yyyy follow the pattern" /></br>
<!-- contact person -->
<div style="margin:8px ; border: 2px solid rgba(0,0,0,0.2); border-radius:10px">

<h5 style =  "margin-top: 4px; margin-bottom: 4px; padding:0px;color:rgba(0,0,0,.3)">contact person details</h5> 
<input type="text" name="contactPersonName" required placeholder="contact person name" pattern="^[A-Za-z0-9 ]+$"
 title="Symbols not allowed"   maxlength="40" required/></br>
 <input type="email" name="contactPersonEmail" required placeholder="contact-person-email"  maxlength="40"/></br>
<input type="text" name="contactPersonPhone" required placeholder="+91-1234567890"   title="follow pattern +91-1234567890"   pattern="^\+[0-9]{1,4}-[0-9]{10}$"    maxlength="40"/></br>
<input type="text" name="contactPersonDesignation" required placeholder=" Designation"  pattern="^[A-Za-z ]+$" title="Symblow & numbers not allowed"  maxlength="40"/></br>
</div>

<input type="reset" value="reset"/><br>
<input type="submit" value="add into DB"/>
</form>  
</div>
<%
 //session.removeAttribute("clientId");
}
%>

 
						
<%--  toastify notification  client not added successfully,problem in DB --%>
<%
Object o17=session.getAttribute("client not added successfully,problem in DB");
if(o17!=null && o17.toString().equals("client not added successfully,problem in DB")){

%>

 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("client not added successfully,problem in DB")%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
    
<%
session.removeAttribute("client not added successfully,problem in DB"); 

} %>
<%--(((ENDS)))  toastify notification  contactPerson not added successfully,problem in DB --%>
		<%
Object o127=session.getAttribute("contactPerson not added successfully,problem in DB");
if(o127!=null && o127.toString().equals("contactPerson not added successfully,problem in DB")){

%>

 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("contactPerson not added successfully,problem in DB")%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
    
<%
session.removeAttribute("contactPerson not added successfully,problem in DB"); 

} %>
<%--(((ENDS)))  toastify notification  contactPerson not added successfully,problem in DB --%>				


<%--  toastify notification  client added successfully in DB --%>
<%
Object o7=session.getAttribute("client added successfully");
if(o7!=null && o7.toString().equals("client added successfully")){

%>

 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("client added successfully")%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
     <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("login credentials send to client email")%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%=session.getAttribute("welcome send to contact person email")%>",
                duration: 10000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>

<%
session.removeAttribute("client added successfully");
session.removeAttribute("login credentials send to client email");
session.removeAttribute("welcome send to contact person email");

} %>
<%--(((ENDS)))  toastify notification  client added successfully in DB --%>

<%--*******333333333333333333333333   (((END)))    ADDING client --%>





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