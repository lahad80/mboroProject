package com.lahad.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.lahad.daoImpl.MboroForEnglishDaoImpl;
import com.lahad.daoImpl.SubjectDaoImpl;

@Controller
@SessionAttributes("user")
public class IndexController {

	@Autowired
	MboroForEnglishDaoImpl mdi;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView printIndex(Model model ){
		OthersController.latestUrl = "/index";
		OthersController.focusedLink = "indexLink";
		model.addAttribute("likesCount", mdi.getLikesCount());
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView printIndex2(Model model ){
		OthersController.latestUrl = "/index";
		OthersController.focusedLink = "indexLink";
		model.addAttribute("likesCount", mdi.getLikesCount());
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
}
