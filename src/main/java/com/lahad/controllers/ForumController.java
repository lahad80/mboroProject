package com.lahad.controllers;

import java.util.List;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lahad.beans.Comment;
import com.lahad.beans.Subject;
import com.lahad.beans.User;
import com.lahad.daoImpl.SubjectDaoImpl;
import com.lahad.daoImpl.UserDaoImpl;

@Controller
public class ForumController {

	
	@Autowired
	SubjectDaoImpl sdi;
	@Autowired
	Subject subject;
	@Autowired
	UserDaoImpl udi;
	@Autowired
	User administrator;

	@RequestMapping(value="/forum", method = RequestMethod.GET)
	public String displayForum(@ModelAttribute("postSubjectForm") Subject subjectForm, BindingResult result, Model model ){
		OthersController.latestUrl = "/forum";
		OthersController.focusedLink = "forumLink";

		List <Subject> subjectsList = sdi.listSubjects();

		administrator = udi.findUserById(1); // an administrator with id = 1 must has been registered in the database otherwise you'll get a NullPointerException
		model.addAttribute("administrator", administrator);
		model.addAttribute("subjectsList", subjectsList);
		return "forum";
	}
}
