package com.lahad.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lahad.beans.Comment;
import com.lahad.beans.Subject;
import com.lahad.beans.User;
import com.lahad.daoImpl.CommentDaoImpl;
import com.lahad.daoImpl.SubjectDaoImpl;
import com.lahad.daoImpl.UserDaoImpl;

@Controller
@SessionAttributes("connectedUser")
public class SubjectAndCommentController {
	
	@Autowired
	User user;
	@Autowired
	Subject subject;
	@Autowired
	Comment comment;
	@Autowired
	UserDaoImpl udi;	
	@Autowired
	CommentDaoImpl cdi;
	@Autowired
	SubjectDaoImpl sdi;


	/*****************SUBJECT HANDLER******************************/
	@RequestMapping(value="/postSubject", method = RequestMethod.POST)
	public String addSubject(@Valid @ModelAttribute("postSubjectForm") Subject subjectForm, BindingResult result, Model model, HttpSession session){
		if(result.hasErrors()){
			return "forum";
		}
		String title = subjectForm.getTitle();
		String description = subjectForm.getDescription();

		user = (User) session.getAttribute("connectedUser");
		if(user != null){
			sdi.addSubject(title, description, user);
		}
		List <Subject>  subjectsList = sdi.listSubjects();
		List<String> collapsesList = new ArrayList<String>();
		for(int i = 0;  i < subjectsList.size(); i++){
			TreeSet<Comment> tree = new TreeSet<Comment>(subjectsList.get(i).getRelatedComments());
			subjectsList.get(i).setSortedComments(tree);
			collapsesList.add("collapse" + (i+1));
		}
		model.addAttribute("subjectsList", subjectsList);
		model.addAttribute("collapsesList", collapsesList);
		
		return "forum";
	}


	@RequestMapping(value="/updateSubject", method = RequestMethod.POST)
	@ResponseBody
	public Subject updateSubject(@RequestParam Map <String, String> params){
		sdi.updateSubject(Integer.parseInt(params.get("subjectId")), params.get("title"), params.get("description"));
		subject = sdi.findSubject(Integer.parseInt(params.get("subjectId")));
		return subject;
	}


	@RequestMapping(value="/deleteSubject", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSubject(@RequestParam String subjectId){
		sdi.delete(Integer.parseInt(subjectId));

		return "";
	}
	
	/*****************COMMENT HANDLER******************************/
	@RequestMapping(value="/persistComment", method= RequestMethod.POST)
	@ResponseBody
	public Comment persist(@RequestParam String subjectId, @RequestParam String commentMessage, @RequestParam String commentDate, HttpSession session){

		int id = Integer.parseInt(subjectId);
		subject = sdi.findSubject(id);
		user =(User) session.getAttribute("connectedUser");
		cdi.addComment(commentDate, commentMessage, subject, user);
		comment = cdi.getComment(commentDate, subject, user);

		return comment;
	}

	@RequestMapping(value="/updateComment", method= RequestMethod.POST)
	@ResponseBody
	public Comment update(@RequestParam String commentId, @RequestParam String commentMessage){

		int id = Integer.parseInt(commentId);		
		cdi.modifyComment(id, commentMessage);
		comment = cdi.getComment(id);
		return comment;
	}

	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestParam Map<String,String> params, Model model){

		int comId = Integer.parseInt(params.get("commentId"));
		cdi.deleteComment(comId);

		subject = sdi.findSubject(Integer.parseInt(params.get("subjectId")));
		String newLatestComment = "";
		if(sdi.countCommentsNumber(subject) > 0){
			newLatestComment = new TreeSet<Comment>(subject.getRelatedComments()).last().getCommentDate();
		}
		model.addAttribute("newLatestComment", newLatestComment);
		return newLatestComment;
	}

}
