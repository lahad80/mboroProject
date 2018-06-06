package com.lahad.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/miscellaneous")
public class MiscellaneousController {


	@RequestMapping(method = RequestMethod.GET )
	public ModelAndView printHistoryGeography(){
		OthersController.latestUrl = "/miscellaneous";
		OthersController.focusedLink = "miscellaneaousLink";
		ModelAndView mv = new ModelAndView("miscellaneous");
		return mv;
	}
}
