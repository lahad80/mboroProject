package com.lahad.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PicturesController {

	@RequestMapping(value="/pictures", method=RequestMethod.GET)
	public ModelAndView showPictures(){
		OthersController.latestUrl = "/pictures";
		OthersController.focusedLink = "picturesLink";
		return new ModelAndView("pictures");
	}
}
