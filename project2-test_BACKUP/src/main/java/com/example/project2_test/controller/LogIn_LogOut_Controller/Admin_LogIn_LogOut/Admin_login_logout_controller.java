package com.example.project2_test.controller.LogIn_LogOut_Controller.Admin_LogIn_LogOut;

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
public class Admin_login_logout_controller {
	
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	
	static	int requstCount=1;

	@RequestMapping(value="/adminLogin" ,method= RequestMethod.GET)
	public String AdminLogin(HttpServletRequest request) {  
			System.out.println("AdminLogin handler method in Admin_login_logout_controller.java");	
			

			String email = request.getParameter("email");
			

			String emailincontactPersonDB = null;
			String nameincontactPersonDB = null;

	//===============================fetching email from DB====================
			
			List<String >checkAdminEmail= DAOImpl.checkAdminEmail(email);
			if(checkAdminEmail!=null) {
				emailincontactPersonDB = checkAdminEmail.get(0);
				nameincontactPersonDB =  checkAdminEmail.get(1); 

			 
					System.out.print(email);
					System.out.print("  is matching with email in DB which is  ");
					System.out.print(emailincontactPersonDB);
					System.out.print("  and  adminName is\t" );
					System.out.print(nameincontactPersonDB);
					System.out.println();
	//=================sending OTP and forwarding admin to adminVerifingOPT.jsp====================
					System.out.print("sending OPT to ");
					System.out.print(emailincontactPersonDB);
					System.out.println();
					 
						String OTP = emailSender.getRandomOtp();

						System.out.println("sending "+OTP+" "+emailincontactPersonDB+"  "+" forwards");
						
						//delete at logout, use it to intract with DB in .jsp, because we cant do dependency injecttion in .jsp
						request.getSession().setAttribute("DAOImpl", DAOImpl);
						request.getSession().setAttribute("going to adminprovidingOTP.jsp",
								"going to adminprovidingOTP.jsp");
						request.getSession().setAttribute("OTP", OTP);
						request.getSession().setAttribute("email", emailincontactPersonDB); 

						emailSender.sendEmail(emailincontactPersonDB,
								"Verification Code \t" + nameincontactPersonDB, OTP);
						return "adminprovidingOTP";
				 
	//======================= ====sending OTP and forwarding client to adminVerifingOPT.jsp END=======================================

				} else {
	//================================if email is not in DB sending back to adminLogin.jsp==================
					
					 
					if(requstCount < 5) {
					request.getSession().setAttribute("email2", email);
					System.out.println("no admin for this email\t" + email);
					System.out.println("request reach "+requstCount+" time");
					requstCount++;
					return "redirect:/adminLoginView";
					}else{
						System.out.println("request reach "+requstCount+" time");
						requstCount=1;
						java.time.LocalTime lt1=  LocalTime.now();

						request.getSession().setAttribute("email2", email);
						request.getSession().setAttribute("lastRequestTime", lt1);
						return "redirect:/adminLoginView" ;
					}
				 
				}


	
}
	
	@RequestMapping(value="/adminVerificationOPTServlet" ,method= RequestMethod.GET)
	String adminVerificationOPT(HttpSession session,HttpServletRequest request){
		System.out.println("adminVerificationOPT handler method in Admin_login_logout_controller.java");
		
		Object o=request.getSession().getAttribute("going to adminVerificationOPTServlet");
		if(o==null){
		//request.removeAttribute("going to clientprovidingOTP.jsp");	
			return "redirect:/adminLoginView";
		}
			
		
		 
		//=================================
		String clientsubmitedOTPinclientprovidingOTP=request.getParameter("otp").trim();
		
		String otpfromclientLoginServlet= request.getSession().getAttribute("OTP").toString();

		
		
		request.getSession().removeAttribute("OTP");
		if(clientsubmitedOTPinclientprovidingOTP.equals(otpfromclientLoginServlet)) {
			System.out.print("( ");
			System.out.print(clientsubmitedOTPinclientprovidingOTP);
			System.out.print(" from internally ) equals  ");
			System.out.print("( ");
			System.out.print(otpfromclientLoginServlet);
			System.out.print(" which is admin submiited ");
			System.out.print(")");
			System.out.println(); 
			 
			return "redirect:/adminDashboard";
			 
		
		
		}else {
			 
				
				
				request.getSession().setAttribute("wrong OTP provided", "wrong OTP provided");
				return "redirect:/adminLoginView";
			 
		}
	 
		
	 
		
		
	}
	
	@RequestMapping(value="/adminLogOutButtonServlet" ,method= RequestMethod.GET)
	String adminLogOutButton  (HttpSession session,HttpServletRequest request,HttpServletResponse response){
		System.out.println("adminLogOutButton handler method in Admin_login_logout_controller.java");

		session.removeAttribute("DAOImpl");
		session.removeAttribute("going to adminVerificationOPTServlet");
		session.removeAttribute("email"); 

		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	        response.setHeader("Pragma", "no-cache");
	        response.setDateHeader("Expires", 0);
 
	return "redirect:/Login";
 
	 
	}
}