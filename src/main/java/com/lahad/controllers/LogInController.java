package com.lahad.controllers;



import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lahad.beans.User;
import com.lahad.daoImpl.UserDaoImpl;

//@SessionAttributes({"connectedUser","administrator"})
@SessionAttributes("connectedUser")
@Controller
public class LogInController {


	@Autowired
	User user;
	@Autowired
	User connectedUser;
	@Autowired
	UserDaoImpl udi;

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm(@ModelAttribute("logInForm") User userFromForm, BindingResult result) {

		return "logIn"; 
	}

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String logInUser(@Valid @ModelAttribute("logInForm") User userFromForm, BindingResult result, Model model){

		if (result.hasErrors()) {
			return "logIn";
		}
		List<User> list = udi.findUserByEmail(userFromForm.getEmail());
	
		if(! list.isEmpty() &&  list.get(0).getPassword().equals(userFromForm.getPassword())){
			connectedUser = list.get(0);
			model.addAttribute("connectedUser", connectedUser);
			return  "redirect:"+OthersController.latestUrl;
		}
		else{
			String emailOrPwdNotFound = "Login details invalid";
			model.addAttribute("emailOrPwdNotFound", emailOrPwdNotFound);

			return "logIn";
		}
	}
}
