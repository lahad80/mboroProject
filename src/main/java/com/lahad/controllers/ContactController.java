package com.lahad.controllers;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ContactController {
	
	@Autowired
	JavaMailSender mailSender;
	

	@RequestMapping(value="/contact",method = RequestMethod.GET)
	public String printContact(){
		OthersController.latestUrl = "/contact";
		OthersController.focusedLink = "contactLink";
		return "contact";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/sendContactEmail", method=RequestMethod.POST)
	public String sendEmail(@RequestParam Map<String,String> parameters, Model model){
		String firstName = parameters.get("firstName");
		String email = parameters.get("email");
		String country = parameters.get("country");
		String message = parameters.get("message");
		
		String to = "mboroforenglish@gmail.com";
        String subject = "Message from contact form";
        String text = "First Name: "+firstName+ "\nEmail: " +email+ "\nCountry: "+ country+ "\nMessage: " +message;
    
        SimpleMailMessage smm = new SimpleMailMessage();
        smm.setTo(to);
        smm.setSubject(subject);
        smm.setText(text);
        
        mailSender.send(smm);
      
		return firstName;
	}
}
