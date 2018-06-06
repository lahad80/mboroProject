package com.lahad.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
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

@Controller
@SessionAttributes("connectedUser")
public class UserAddAndUpdateController {
	
	@Autowired
	User user;
	@Autowired
	User connectedUser;
	@Autowired
	User tempoUser;
	@Autowired
	UserDaoImpl udi;

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String showLoginForm(@ModelAttribute("signUpForm") User userFromForm, BindingResult result) {
		
		return "signUp";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String signUpUser(@Valid @ModelAttribute("signUpForm") User userFromForm, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "signUp";
		}else{
			List<User> list = udi.findUserByEmail(userFromForm.getEmail());	
			if( ! list.isEmpty()){
				model.addAttribute("emailAlreadyExist", new String(" Someone already uses this email !") );
				return "signUp";
			}else if(! udi.isUserNameAvailable(userFromForm.getUserName())){
				model.addAttribute("userNameAlreadyExist", new String(" Someone already uses this username !") );
				return "signUp";
			}
			else{
				udi.addUser(userFromForm.getEmail(), userFromForm.getUserName(), userFromForm.getPassword());
				user = udi.findUserByEmail(userFromForm.getEmail()).get(0);	
				model.addAttribute("connectedUser", user);
			}
		}
		return "redirect:" + OthersController.latestUrl;
	}



	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public String displayLoginForm(@ModelAttribute("updateForm") User userFromForm, BindingResult result) {

		return "updateUser";
	}


	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@Valid @ModelAttribute("updateForm") User userFromForm, BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			model.addAttribute("correctEmail", new Boolean(false));
			model.addAttribute("correctUserName", new Boolean(false));
			return "updateUser";
		}else{
			connectedUser = (User) session.getAttribute("connectedUser");
			
			tempoUser.setEmail(userFromForm.getEmail());
			tempoUser.setUserName( userFromForm.getUserName());
			tempoUser.setPassword(userFromForm.getPassword());
			if(! userFromForm.getEmail().equals(connectedUser.getEmail())){
				if(! udi.isEmailAvailable(userFromForm.getEmail()) ){
					model.addAttribute("emailAlreadyExist", new String(" Someone already uses this email !") );
					model.addAttribute("correctEmail", new Boolean(false));
					model.addAttribute("correctUserName", new Boolean(false));
					model.addAttribute("tempoUser",tempoUser);
					return "updateUser";

				}
			}
			if(! userFromForm.getUserName().equals(connectedUser.getUserName())){
				if(! udi.isUserNameAvailable(userFromForm.getUserName())){
					model.addAttribute("userNameAlreadyExist", new String(" Someone already uses this username !") );
					model.addAttribute("correctUserName", new Boolean(false));
					model.addAttribute("correctEmail", new Boolean(false));
					model.addAttribute("tempoUser",tempoUser);
					return "updateUser";

				}
			}
			udi.updateUser(connectedUser.getId(), userFromForm.getEmail(), userFromForm.getUserName(), userFromForm.getPassword());
			connectedUser = (User) udi.findUserById(connectedUser.getId());
			model.addAttribute("connectedUser", connectedUser);
		}
		return "redirect:" + OthersController.latestUrl;
	}
}
