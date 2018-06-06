package com.lahad.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lahad.beans.User;
import com.lahad.daoImpl.UserDaoImpl;



@Controller
public class RetrievePwdController {
	@Autowired
	User user;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	UserDaoImpl udi;

	@RequestMapping(value = "/retrievePwd",  method = RequestMethod.GET)
	public String showretrievePwdForm(@ModelAttribute("retrievePasswordForm")User userfromForm, BindingResult result, Model model){
		return "retrievePassword";
	}


	@RequestMapping(value = "/retrievePwd", method = RequestMethod.POST)
	public String retrieveThePwd(@Valid @ModelAttribute("retrievePasswordForm")User userfromForm, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "retrievePassword";
		}else{
			List <User> list = 	udi.findUserByEmail(userfromForm.getEmail());
			if(list.isEmpty()){
				String emailNotFound = "This email couldn't be found ";
				model.addAttribute("emailNotFound", emailNotFound);
				model.addAttribute("user", userfromForm);
				return "retrievePassword";
			}else{
				user = list.get(0);
				String to = user.getEmail();
				String subject = "Password lost";
				String text = "Hello " + user.getUserName()+ ",\nYour password for mboroForEnglish.com is: "+ user.getPassword();
	
				SimpleMailMessage smm = new SimpleMailMessage();
				smm.setTo(to);
				smm.setSubject(subject);
				smm.setText(text);
	
				mailSender.send(smm);	    	
			}

			model.addAttribute("user", userfromForm);
			return "retrievePwdSuccess";
		}
	}
}



