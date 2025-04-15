package com.example.project2_test.controller.LogIn_LogOut_Controller.employee_LogIn_LogOut;

import java.time.LocalTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.project2_test.DAO_Repository.DAOInterface;
import com.example.project2_test.Service.emailSender.emailSender;
 

@Controller
public class employeeLogin_login_logout_controller {
	
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	
	static	int requstCount=1;

	@RequestMapping(value="/employeeLogin" ,method= RequestMethod.GET)
	public String employeeLogin(HttpServletRequest request,HttpSession session) { 
			System.out.println("employeeLogin handler method in employeeLogin_login_logout_controller.java");	
			
				String email = request.getParameter("email");
				

				String emailincontactPersonDB = null;
				String nameincontactPersonDB = null;
				String employeeId = null;

		//===============================fetching email from DB====================
				
			List<String> checkEmployeeEmail=DAOImpl.checkEmployeeEmail(email);
				if(checkEmployeeEmail!=null) {
					emailincontactPersonDB=checkEmployeeEmail.get(0);
					nameincontactPersonDB=checkEmployeeEmail.get(1);
					employeeId=checkEmployeeEmail.get(2);
				 
						System.out.print(email);
						System.out.print("  is matching with email in DB which is  ");
						System.out.print(emailincontactPersonDB);
						System.out.print("  and user name is\t" );
						System.out.print(nameincontactPersonDB);
						System.out.println();
		//=================sending OTP and forwarding client to clientVerifingOPTv.jsp====================
						System.out.print("sending OPT to ");
						System.out.print(emailincontactPersonDB);
						System.out.println();
					 
							String OTP = emailSender.getRandomOtp();
							
							
							//dont delete till log out because in .jsp we cant do dependency injection,
							//so in order to intract with DB in .jsp use this
							session.setAttribute("DAOImpl", DAOImpl);
							session.setAttribute("going to employeeprovidingOTP.jsp",
									"going to employeeprovidingOTP.jsp");
							session.setAttribute("OTP", OTP);
							session.setAttribute("email", emailincontactPersonDB);
							session.setAttribute("employeeId", employeeId);

							emailSender.sendEmail(emailincontactPersonDB, "Verification Code \t" + nameincontactPersonDB, OTP);
							
							
							System.out.print("OPT sent to ");
							System.out.print(emailincontactPersonDB);
							System.out.println();
							
							return "employeeprovidingOTP" ;
						 
		//======================= ====sending OTP and forwarding client to clientVerifingOPTv.jsp END=======================================

					} else {
		//================================if email is not in DB sending back to clientLogin.jsp==================
						
						 
						if(requstCount < 5) {
							session.setAttribute("email2", email);
						System.out.println("no user for this email\t" + email);
						System.out.println("request reach "+requstCount+" time");
						requstCount++;
						return "redirect:/employeeLoginView";
						}else{
							System.out.println("request reach "+requstCount+" time");
							requstCount=1;
							java.time.LocalTime lt1=  LocalTime.now();

							session.setAttribute("email2", email);
							session.setAttribute("lastRequestTime", lt1);
							return "redirect:/employeeLoginView" ;
						}
					
 
			}
				
				

	
}
	
	@RequestMapping(value="/employeeVerificationOPTServlet" ,method= RequestMethod.GET)
	String employeeVerificationOPT(HttpSession session,HttpServletRequest request){
		System.out.println("employeeVerificationOPT handler method in employeeLogin_login_logout_controller.java");
		
		Object o=session.getAttribute("going to employeeVerificationOPTServlet");
		if(o==null){
			return "redirect:/employeeLoginView" ;
			 
		//request.removeAttribute("going to employeeprovidingOTP.jsp");	
		}
		
		 
		//=================================
		String employeesubmitedOTPinclientprovidingOTP=request.getParameter("otp").trim();
		
		String otpfromemployeeLoginServlet= request.getSession().getAttribute("OTP").toString();
		//dont delete,delete at logout
		//String DAOImpl= request.getSession().getAttribute("DAOImpl").toString(); 
	System.out.println(employeesubmitedOTPinclientprovidingOTP);
	System.out.println(otpfromemployeeLoginServlet);
		
		
	session.removeAttribute("OTP");
		
		if(employeesubmitedOTPinclientprovidingOTP.equals(otpfromemployeeLoginServlet)) {
			System.out.println("yes BOTH OTP ARE MATCHING");
			System.out.print("( ");
			System.out.print(employeesubmitedOTPinclientprovidingOTP);
			System.out.print(" from internally ) equals  ");
			System.out.print("( ");
			System.out.print(otpfromemployeeLoginServlet);
			System.out.print(" which is client submiited ");
			System.out.print(")");
			System.out.println();
			
			
			 
			return "redirect:/employeeDashboard_step1";
			
			 
		
		
		
		} 
			System.out.println("NO BOTH OTP ARE MATCHING");
			 
				request.getSession().setAttribute("wrong OTP provided", "wrong OTP provided");
				return "redirect:/employeeLoginView" ;
			 
			
		 
	 
		
	 
		
		
	}
	
	@RequestMapping(value="/employeeLogOutButtonServlet" ,method= RequestMethod.GET)
	String employeeLogOutButton  (HttpSession session ,HttpServletResponse response){
		System.out.println("employeeLogOutButton handler method in employee_login_logout_controller.java");

		session.removeAttribute("DAOImpl");
		session.removeAttribute("going to employeeVerificationOPTServlet");
		session.removeAttribute("email");
session.invalidate();
 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


	return "redirect:/Login";
 
 
	 
	}
}