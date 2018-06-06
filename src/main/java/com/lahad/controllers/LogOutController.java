package com.lahad.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


//separated from logIn  because of the "@SessionAttributes("connectedUser")" annotation
@Controller
public class LogOutController {

	@RequestMapping("/logout")
	public ModelAndView logUserOut(HttpServletRequest request ){

		HttpSession session = request.getSession();
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/index");
		return mv;
	}
}
