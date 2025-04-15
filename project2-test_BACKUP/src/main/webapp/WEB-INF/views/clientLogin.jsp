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

<!-- 
  <div class="title-bar" style="border-radius: 25px 25px 0px 0px;color:black">
 
        <div class="menu-item">add member
            <div class="dropdown">
                <a href="addEmployeeButtonClick">addEmployee</a>
                <a href="addProjectButtonClick">addProject</a>
                <a href="addClientButtonClick">addClient</a>
            </div>
        </div>
        <div class="menu-item">assign/release
            <div class="dropdown">
                <a href="selectProject_step1.jsp">assign project to employee</a>
                <a href="selectClient_step1.jsp">assign client to project</a>
                <a href="selectClientToAddContactPerson_setp1.jsp">assign contact person to client</a>
                <a href="selectProjectToReleaseEmployee_step1.jsp">release Employee from Project</a> 
            </div>
        </div>
        <div class="menu-item">search
            <div class="dropdown">
                <a href="searchClient_step1.jsp">search in client</a>
                <a href="searchProject_step1.jsp">search in project</a>
                <a href="searchEmployee_step1.jsp">search in employee</a>
            </div>
        </div>
        <div class="menu-item">delete/update
            <div class="dropdown">
                     <a href="update_delete_client_step1.jsp">update/delete client</a>
                <a href="update_delete_project_step1.jsp">update/delete project</a>
                <a href="update_delete_employee_step1.jsp">update/delete employee</a>
            </div>
        </div> 
        <div class="menu-item">login as
            <div class="dropdown">
               <a href="clientLogin.jsp">login as client</a>
                <a href="employeeLogin.jsp">login as employee</a>
            </div>
        </div> 
          <div style="height:100%;width:25%%;border:0px solid rgba(0,0,0,0.2);border-radius:20px;display:flex;flex-direction:column;justify-content:center;align-items:center" >
  		<a href="adminLogOutButtonServlet">
    	<img src="${pageContext.request.contextPath}/resources/staticResource/turn-off.png" alt="log out" width="30" height="30">
		</a>
		</div> 
 </div>
   -->
<%--***********((END))**title bar flex item 1 in outer flex container***************** --%> 


<!-- flex item 2  start(app body)-->
<div style="height:100%;display:flex;flex-direction:column;justify-content:center;align-items:center;       ;border-bottom-width:0px;">
 
 <div style="height:300px;width:250px;display:flex;flex-direction:column;justify-content:center;align-items:center; box-shadow:0px 20px 40px 0px black;border-radius:20px">

<div style="display:flex ;flex-direction: row-reverse; height:20%;width:250px;">
<a href="Login" style="border:2px solid red;height:20px;width:20px;text-align: center; border-radius:45px ;text-decoration:none;color:black !important" >x</a>
</div>

<div style="display:flex ;flex-direction: column; height:80%">
<h3>client Login</h3>
<%
java.time.LocalTime lastRequestTime=(java.time.LocalTime)session.getAttribute("lastRequestTime");
//300sec==5min
if(lastRequestTime!=null && java.time.Duration.between(lastRequestTime,java.time.LocalTime.now()).getSeconds()<30){
	session.removeAttribute("email2");
%>

<form action="clientLoginView" method="get">
<!--  <input type="date" name="date"/>-->
<input type="text" name="email" placeholder="******@gmail.com" required pattern=".*\S.*"/>
<input type="submit" value="login"/>
</form>
<%
//300sec==5min
long a=30 - java.time.Duration.between(lastRequestTime,java.time.LocalTime.now()).getSeconds() ;
%>
<!-- Toastify -->
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "<%="wait for "+ a+" sec.." %>",  
                duration: 3000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>


<!--******************using self made notification shower********** 
  <div style="display:flex;
border:3px solid rgba(0,150,240,1);
border-radius:10px;
 height:30px; width:200px; 
 background-color:grey">
<span style=" 
user-select:none;
 width:180px;
 text-align:center;
 line-height: 30px;
 border-radius:10px 0px 0px 10px;
<%--
//300sec==5min
long a=30 - java.time.Duration.between(lastRequestTime,java.time.LocalTime.now()).getSeconds() ;
--%>
"><%--="wait for "+ a +" sec.." --%></span>
<a style="  
text-align:center;
font-family: cursive;
font-weight: 900; 
    font-size: 14px;
  line-height: 30px;
 width:20px;
 text-decoration:none;
 text-decoration-color:black;
 border-radius:0px 10px 10px 0px;
 "
  
   href="clientLogin.jsp">X</a>
</div>
*********end of using self made notification shower***** -->

 
<%}else{ 
	session.removeAttribute("lastRequestTime");
%>
<!-- *******************for new request****************** -->


<%
String email1=(String)session.getAttribute("email2") ;
if(email1!=null){
	//out.println("no user for "+email1);
	session.removeAttribute("email2");
 
%>


<!-- ************************************** -->

  <div style="display:flex;
border:3px solid rgba(0,150,240,1);
border-radius:10px;
 height:30px; width:200px; 
 background-color:grey">
<span style=" 
user-select:none;
 width:180px;
 text-align:center;
 line-height: 30px;
 border-radius:10px 0px 0px 10px;

"><%=email1 %></span>
<a style="  
text-align:center;
font-family: cursive;
font-weight: 900; 
    font-size: 14px;
  line-height: 30px;
 width:20px;
 text-decoration:none;
 text-decoration-color:black;
 border-radius:0px 10px 10px 0px;
 "
  
   href="clientLoginView">X</a>
</div>

 
<!-- ************************************** -->

 
<%} %>
<form action="clientLogin" method="get">
<!--  <input type="date" name="date"/>-->
<input type="text" name="email" placeholder="******@gmail.com" required pattern=".*\S.*"/>
<!--  <input type="hidden" name="clientLogin" value="clientLogin"/>-->
<input type="submit" value="login"/>
</form>
<%} %>



</div>

</div>
<!--((ENDS)) flex item 2  start(app body)-->
</div>


<!-- Toastify on wrong OTP-->

<%
Object oo=session.getAttribute("wrong OTP provided");
if(oo!=null&&oo.toString().equals("wrong OTP provided")){
%>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            Toastify({
                text: "wrong OTP provided", 
                duration: 3000,
                close: true, 
                gravity: "top", // 'top' or 'bottom'
               position: "right", // 'left', 'center', or 'right'
                backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
            }).showToast();
        });
    </script>
<%
session.removeAttribute("wrong OTP provided");
}
%>)
<!--((ENDS)) Toastify on wrong OTP-->
 
<%--******(END)*******main outher element*(outer flex container)***************** --%>
</div>


</section>
<article></article>
<aside></aside>
</main>
<footer></footer>
</body>
</html>