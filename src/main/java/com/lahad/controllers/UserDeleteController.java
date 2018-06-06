package com.lahad.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lahad.beans.User;
import com.lahad.daoImpl.UserDaoImpl;


// separated from add and update USER because of the "@SessionAttributes("connectedUser")" annotation
@Controller
public class UserDeleteController {


	@Autowired
	User user;
	@Autowired
	UserDaoImpl udi;

	@RequestMapping(value="/deleteUser", method = RequestMethod.GET)
	public ModelAndView deleteUser( HttpServletRequest request){

		HttpSession session = request.getSession();
		if((User) session.getAttribute("connectedUser") != null){
			user = (User) session.getAttribute("connectedUser");
			udi.deleteUser(user.getId());
		}
		session.invalidate();
		return new ModelAndView("redirect:index");
	}
}
