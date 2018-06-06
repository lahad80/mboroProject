package com.lahad.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lahad.daoImpl.MboroForEnglishDaoImpl;

@Controller
public class OthersController {

	public static String focusedLink = "indexLink";
	public static String latestUrl ;
	
	@Autowired
	MboroForEnglishDaoImpl mdi;

	@RequestMapping(value="/backToLatestPage", method= RequestMethod.GET)
	public String lastestPage(){
		return "redirect:" + OthersController.latestUrl;
	}

	@RequestMapping(value="/getLikesCount", method = RequestMethod.GET)
	@ResponseBody
	public int sendCount()
	{	
		return mdi.getLikesCount();
	}
	
	
	@RequestMapping(value="/incrementLikesCount", method = RequestMethod.POST)
	@ResponseBody
	public int incrementCount() {
		
		mdi.incrementLikesCount();
		return mdi.getLikesCount();
	}
	
	@RequestMapping(value="/findFocusedLink", method = RequestMethod.GET)
	@ResponseBody
	public String sendFocusedLink() {
		return OthersController.focusedLink;
	}
}

