package com.example.project2_test.Service.emailSender;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class emailSender {

	@Autowired
	JavaMailSender  mailSender;
	
	@Autowired
	SimpleMailMessage message;
	

public void sendEmail(String sendEmailTo,String emailSubject,String emailMessage) {
	try {
message.setFrom("mdshaad0000024@gmail.com");
message.setTo(sendEmailTo);
message.setSubject(emailSubject);
message.setText(emailMessage);
mailSender.send(message);
	}catch(Exception e) {
		System.out.println(
				"Exception in emailSender.java when sending email");
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
}

public   String getRandomOtp() { 
Random r=new Random();

String str="";

for(int i=1;i<=6;i++) {
	

if(i==4 || i==2 ) {
	str+=(char)r.nextInt(97,122);

}else if(i==3  || i==6) {
		str+=(char)r.nextInt(65,90);		
		
	}else{
		str+=r.nextInt(0,9);
	}
}	
return str;
}

	
	
}
