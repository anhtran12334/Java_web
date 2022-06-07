package com.java.shop15.controller.user;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailController {
	@Autowired
    public static JavaMailSender emailSender;
	
	 public static void sendHtmlEmail(String to) throws MessagingException {

	        MimeMessage message = emailSender.createMimeMessage();

	        boolean multipart = true;
	        
	        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
	        
	        String htmlMsg = "<h3>Im testing send a HTML email</h3>"
	                +"<img src='http://www.apache.org/images/asf_logo_wide.gif'>";
	        
	        message.setContent(htmlMsg, "text/html");
	        
	        helper.setTo(to);
	        
	        helper.setSubject("Test send HTML email");
	        
	    
	        emailSender.send(message);

	        
	    }

}
