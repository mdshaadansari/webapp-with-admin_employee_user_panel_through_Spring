package com.example.project2_test.controller.LogIn_LogOut_Controller.Client_LogIn_LogOut;

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
public class Client_login_logout_controller {
	
	@Autowired
	DAOInterface DAOImpl;
	
	@Autowired
	emailSender emailSender;
	
	static	int requstCount=1;

	@RequestMapping(value="/clientLogin" ,method= RequestMethod.GET)
	public String clientLogin(HttpServletRequest request) { 
			System.out.println("clientLogin handler method in Client_login_logout_controller.java");	
			
				String email = request.getParameter("email");
				

				String emailincontactPersonDB = null;
				String nameincontactPersonDB = null;
		String clientId=null;
		//===============================fetching email from DB==================== 
				try {
					List <String> checkClientEmail = DAOImpl.checkClientEmail(email);
					if(checkClientEmail!=null) {
						emailincontactPersonDB = checkClientEmail.get(0);
						nameincontactPersonDB = checkClientEmail.get(1);
						clientId = checkClientEmail.get(2);
						 
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
						try {
							String OTP = emailSender.getRandomOtp();

							System.out.println("sending "+OTP+" "+emailincontactPersonDB+"  "+clientId+" forwards");
							
							request.getSession().setAttribute("going to clientprovidingOTP.jsp",
									"going to clientprovidingOTP.jsp");
							request.getSession().setAttribute("OTP", OTP);
							request.getSession().setAttribute("email", emailincontactPersonDB);
							request.getSession().setAttribute("clientId", clientId);

							emailSender.sendEmail(emailincontactPersonDB, "Verification Code \t" + nameincontactPersonDB, OTP);
						//sending DAOImpl object to .jsp because in .jsp we cant do dependency injecttion for Bean
							request.getSession().setAttribute("DAOImpl", DAOImpl);
							return "clientprovidingOTP" ;
						} catch (Exception e) {
							System.out.println(
									"Exception in clientLoginServlet.java at COMMENT sending OTP and frwarding cclient to clientVerifingOPT.jsp");
							System.out.println(e.getMessage());
							e.printStackTrace();
						}
		//======================= ====sending OTP and forwarding client to clientVerifingOPTv.jsp END=======================================

					} else {
		//================================if email is not in DB sending back to clientLogin.jsp==================
						
						
						if(requstCount < 5) {
						request.getSession().setAttribute("email2", email);
						System.out.println("no user for this email\t" + email);
						System.out.println("request reach "+requstCount+" time");
						requstCount++;
						return "redirect:/clientLoginView";
						}else{
							System.out.println("request reach "+requstCount+" time");
							requstCount=1;
							java.time.LocalTime lt1=  LocalTime.now();

							request.getSession().setAttribute("email2", email);
							request.getSession().setAttribute("lastRequestTime", lt1);
							return "redirect:/clientLoginView";
						}
					}

				} catch (Exception e) {
					System.out.println("Exception in clientLoginServlet.java at fetching email from DB ");
					System.out.println(e.getMessage());
					e.printStackTrace();
				}

				return "redirect:/clientLoginView";

	
}
	
	@RequestMapping(value="/clientVerificationOPTServlet" ,method= RequestMethod.GET)
	String clientVerificationOTP(HttpSession session,HttpServletRequest request){
		System.out.println("clientVerificationOTP handler method in Client_login_logout_controller.java");
		
		
		Object o=session.getAttribute("going to clientVerificationOPTServlet");
		if(o!=null){
		//request.removeAttribute("going to clientprovidingOTP.jsp");	
			
		
		 
		//=================================
		String clientsubmitedOTPinclientprovidingOTP=request.getParameter("otp").trim();
		
		String otpfromclientLoginServlet= session.getAttribute("OTP").toString();

		
		
		session.removeAttribute("OTP");
		if(clientsubmitedOTPinclientprovidingOTP.equals(otpfromclientLoginServlet)) {
			System.out.print("( ");
			System.out.print(clientsubmitedOTPinclientprovidingOTP);
			System.out.print(" from internally ) equals  ");
			System.out.print("( ");
			System.out.print(otpfromclientLoginServlet);
			System.out.print(" which is client submiited ");
			System.out.print(")");
			System.out.println();
			
			 
			return "redirect:/clientDashboard_step1";
			 
		
		
		
		} 
		}
				
				session.setAttribute("wrong OTP provided", "wrong OTP provided");
				return "redirect:/clientLoginView";
			  
	 
		
		 
	
		
		
	}
	
	@RequestMapping(value="/clientLogOutButtonServlet" ,method= RequestMethod.GET)
	String clientLogOutButton (HttpSession session,HttpServletRequest request,HttpServletResponse response){
		System.out.println("clientLogOutButton handler method in Client_login_logout_controller.java");

		session.removeAttribute("DAOImpl");
		session.removeAttribute("going to clientVerificationOPTServlet");
		session.removeAttribute("email");
		session.removeAttribute("clientId");
		session.invalidate();
 
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	        response.setHeader("Pragma", "no-cache");
	        response.setDateHeader("Expires", 0);

		
		
	return "redirect:/Login";
 
	 
	}
}