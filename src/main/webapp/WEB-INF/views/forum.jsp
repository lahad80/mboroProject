<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>forum</title>

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
		
		<link rel="stylesheet" href="<c:url value="/resources/css/frame.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/forum.css" />">
		
		
		<style type="text/css">
			@media only screen and (max-width: 770px) {
				#userNameHead, .userNameBody, #commentCountHead, .commentCountBody, #latestCommentHead, .latestCommentBody{
			  		display:none;
			  	}
			  	#subjectHead, .subjectBody, #buttonsHead, .buttonsBody{
			  		width:45%;
			  	}
			}
				
			@media only screen and (max-width: 410px) {	
				#postSubjectForm, #modifySubjectForm, .modifyCommentForm  {
					width: 100%;
				}	
			    .addCommentform textarea{
					width:100%;
				} 
			}			  		
		</style>
		
		<script type="text/javascript">
			$(document).ready(function() {
				
				function isSomeoneConnected() {
					if (parseInt($('#connectedUserId').text()) === 0) {
						return false;
					}
					return true;
				}
	
				$('#newSubject').click(function() {	
					if (!isSomeoneConnected()) {
						$('#alertDangerAddSubject').show();
					} else {
						$('#subjectTitleAddSub, #subjectDescriptionAddSub').val('');
						$('#titleErrorAddSub, #descriptionErrorAddSub').text('');
						$('#postSubjectForm').fadeIn(1500);
					}
				});
	
				$('#postSubjectForm .submitBtn').click(function() {
					var correctAdd = true;	
					if ($('#subjectTitleAddSub').val().trim().length <= 0) {
						$('#titleErrorAddSub').text('Please write a title .').show();	
						correctAdd = false;
					}	
					else if ($('#subjectTitleAddSub').val().trim().length > 190) {
						$('#titleErrorAddSub').text('The title should be less than 190 character long.').show();
						correctAdd = false;
					} else {
						$('#titleErrorAddSub').hide();
					}
	
					if ($('#subjectDescriptionAddSub').val().trim().length <= 0) {
						$('#descriptionErrorAddSub').text('Please write a description.').show();
						correctAdd = false;
					}
					else if ($('#subjectDescriptionAddSub').val().trim().length > 900) {
						$('#descriptionErrorAddSub').text('The description should be less than 900 characters.').show();
						correctAdd = false;
					} else {
						$('#descriptionErrorAddSub').hide();
					}
					return correctAdd;
				});
	
				var subjectId;
				$('.modifySubjectButton').on('click',function() {	
					subjectId = $(this).attr('data-subjectId');
					var title = $('#subjectTitle' + subjectId).text();
					var description = $('#subjectText' + subjectId).text();
					$('#subjectTitleModSub').val(title);
					$('#subjectDescriptionModSub').val(description);
					$('#modifySubjectForm').show();
				});
				$('#modifySubjectForm .submitBtn').click(function(event) {
					event.preventDefault();
					var correctModif = true;
	
					if ($('#subjectTitleModSub').val().trim().length <= 0) {
						$('#titleErrorModSub').html('Please write a title .').show();
						correctModif = false;
					}else if ($('#subjectTitleModSub').val().trim().length >= 190) {
						$('#titleErrorModSub').html('The title should be less than 190 character long.').show();
						correctModif = false;
					}else {
						$('#titleErrorModSub').hide();
					}		
					if ($('#subjectDescriptionModSub').val().trim().length <= 0) {
						$('#descriptionErrorModSub').html('Please write a description.').show();
						correctModif = false;
					}else if ($('#subjectDescriptionModSub').val().trim().length >= 900) {
						$('#descriptionErrorModSub').html('The description should be less than 900 character long.').show();
						correctModif = false;
					} else {
						$('#descriptionErrorModSub').hide();
					}
	
					// if everything is ok
					if (correctModif) {	
						title = $('#subjectTitleModSub').val();
						description = $('#subjectDescriptionModSub').val();
						$.ajax({
							method : 'POST',
							url : 'updateSubject',
							data : 'subjectId='+ subjectId+ "&title="+ title+ "&description="+ description,
							success : function(subject) {
								$('#modifySubjectForm').hide();
								$('#subjectTitle'+ subjectId).text(subject.title);
								$('#subjectText'+ subjectId).text(subject['description']);
							}
						});
					}	
				});
	
				$('#modifySubjectForm .cancelBtn').click(function() {
					$('#modifySubjectForm').hide();
				});
	
				$('.deleteSubjectButton').on('click', function() {
					var subjectId = $(this).attr('data-subjectId');
					$.ajax({
						method : 'POST',
						url : 'deleteSubject',
						data : 'subjectId=' + subjectId,
						success : function(response) {
							$('#panelDefault' + subjectId).remove();
						}
					});
				});
	
				$('.addCommentform textarea').on('click', function() {
					var subjectId = $(this).attr("data-subjectId");
					if (!isSomeoneConnected()) {
						$('#alertDanger' + subjectId).show();	
					} else {
						$('#alertDanger' + subjectId).hide();
					}
				});
				var tempoSubjectId = 0, tempoCommentId = 0;
				var formId = "";
				$('.saveCommentButton').on('click',function(event) {
					event.preventDefault();
					tempoSubjectId = $(this).attr("data-subjectId");
					var connectedUser = {
						id : 0,
						email : "",
						userName : "",
						password : ""
					};
					connectedUser.id = "${sessionScope.connectedUser.getId()}";
					connectedUser.email = "${sessionScope.connectedUser.getEmail()}";
					connectedUser.userName = "${sessionScope.connectedUser.getUserName()}";
					connectedUser.password = "${sessionScope.connectedUser.getPassword()}";	
					var subjectId = $(this).attr("data-subjectId");												
					var commentMessage = $('.commentMessage'+ subjectId).val().trim();
					var theDate = new Date();
					var monthToString = (parseInt(theDate.getMonth()) + 1).toString();
					if(monthToString.length < 2){
						monthToString = '0' + monthToString;
					}
					var customizedDate = theDate.getFullYear() + '/' + monthToString + '/' + theDate.getDate();
					var gmtTimeUkFormat = theDate.toLocaleTimeString("en-UK", {timeZone: 'Africa/Dakar'}); 
					var commentDate = customizedDate + ' at ' + gmtTimeUkFormat + ' (GMT)';
					if (!isSomeoneConnected()) {
						$('#alertDanger' + subjectId).show();
					}else if(commentMessage.length <= 0){
						$('#alertDanger' + subjectId).text('Please write a comment first !').show();
					}else if(commentMessage.length >= 900){
						$('#alertDanger' + subjectId).text('Comment must be less than 900 character long !').show();
					}
					else {
						$('#alertDanger' + subjectId).hide();
						var commentCount = parseInt($('#commentCount'+ subjectId).text()) + 1;
						$.ajax({
							method : 'POST',
							url : 'persistComment',
							data : "subjectId="+ subjectId+ "&commentMessage="+ commentMessage+ "&commentDate="+commentDate,
							success : function(comment) {
								tempoCommentId = comment.id;	
								$('#addCommentform'+ subjectId).before('<div tempoId="tempo">'
																		+ '<div><p>Author: <span style="color:#0000FF;">'
																		+ connectedUser.userName
																		+ '</span><br />Date:   '
																		+ comment.commentDate
																		+ '<br /></p><p>'
																		+ '<span tempoId="tempo">'
																		+ comment.text
																		+ '<br /></span>'
																		+ '<button type="button" class="btn btn-success  btn-xs" style="margin-bottom:3px;" purpose="modify">Modify comment</button>'
																		+ ' <button type="button" class="btn btn-warning  btn-xs" purpose="delete">Delete comment</button><br /></p></div><br />'
																		+
																		'<form action="#" class="modifyCommentForm" tempoId="tempo" >'
																		+ '<h4>Modify your comment !</h4>'
																		+ '<textarea rows="7" cols="40" style="width:90%;" tempoId="tempo" >'
																		+ comment.text
																		+ '</textarea><br />'
							
																		+ '<input type="submit" class="saveModifiedComment" value="Submit" style="margin-top:3px;" />'
																		+ '<input type="reset" class="cancelBtn" value="Cancel" style="margin-top:3px;" />'
																		+ '</form>'
																		+ '</div>');
								$('div[tempoId="tempo"]:last').attr("id","newComment-"+ tempoSubjectId+ "-"+ tempoCommentId);
								$('span[tempoId="tempo"]:last').attr("id","commentTextZone-"+ tempoSubjectId+ "-"+ tempoCommentId);
								formId = "modifyCommentForm-"+ tempoSubjectId+ "-"+ tempoCommentId;
								$('form[tempoId="tempo"]:last').attr("id",formId);
								$('button[purpose="modify"]:last').attr("data-subjectId",tempoSubjectId).attr("data-commentId",tempoCommentId);
								$('button[purpose="delete"]:last').attr("data-subjectId",tempoSubjectId).attr("data-commentId",tempoCommentId);
								$('textarea[tempoId="tempo"]:last').attr("id","modifiedText-"+ tempoSubjectId+ "-"+ tempoCommentId);
								$('#commentCount'+ subjectId).text(commentCount);
								$('#commentLatest'+ subjectId).text(comment.commentDate);
								$('.commentMessage'+ subjectId).val("");	
								$('button[purpose="modify"]').on('click',function() {
									modifyComment(this);
								});
								$('button[purpose="delete"]').on('click',function() {
									deleteComment(this);
								});
								$('.cancelBtn').on('click',function() {
									$('#postSubjectForm, .modifyCommentForm').hide();
								});
							}
						});
					}
				});
				$('.link').click();	
				function modifyComment(elem) {
					var subjectId = $(elem).attr('data-subjectId');
					var commentId = $(elem).attr('data-commentId');
					$('.modifyCommentForm').hide();
					$('#modifyCommentForm-' + subjectId + '-'+ commentId).show();
					$('.saveModifiedComment').click(function(event) {
						event.preventDefault();
						var newText = "";
						newText = $('#modifiedText-' + subjectId+ '-' + commentId).val().trim();
						$('.modifyCommentForm').hide();	
						$.ajax({	
							method : 'POST',
							url : 'updateComment',
							data : "commentId=" + commentId+ "&commentMessage="+ newText,
							success : function(comment) {
								$('#commentTextZone-'+ subjectId+ '-'+ commentId).text(newText).append('<br />');
							}
						});
					});
				}
	
				$('.modifyCommentButton').on('click', function(event) {
					modifyComment(this);
				});
	
				function deleteComment(button) {
					var subjectId = $(button).attr('data-subjectId');
					var commentId = $(button).attr('data-commentId');	
					var commentCount = parseInt($('#commentCount' + subjectId).text()) - 1;	
					$.ajax({
						method : 'POST',
						url : 'deleteComment',
						data : "commentId=" + commentId + "&subjectId="+ subjectId,
						success : function(newLatestComment) {
							$('#newComment-' + subjectId + '-'+ commentId).remove();
							$('#commentCount' + subjectId).text(commentCount);	
							$('#commentLatest' + subjectId).text(newLatestComment);
						}
					});
				}
				$('.deleteCommentButton').on('click', function(event) {
					deleteComment(this);
				});
	
				$('.cancelBtn').on('click', function(event) {
					$('#postSubjectForm, .modifyCommentForm').hide();
					});
	
			});

		</script>
	</head>
	<body>
		<c:import url="includes/sideNav.jsp" />
		<div id="page-content">
			<c:import url="includes/header.jsp" />
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<p>You can post here a subject on any issue you like or add a comment to already-published subjects,  provided it is relevant and fits the forum-moderation policy.<br />
						So I reserve the right to remove any improper input which does not meet the ethical standards.</p>
						<p style="height:50px;"></p>
						<button type="button" class="btn btn-info" id="newSubject">new subject</button>
						<br />
						<div class="alert alert-danger" alert-dismissible" role="alert" id="alertDangerAddSubject">
							You must be identified to add a subject !
							<a href="login">
								<button type="button" class="btn btn-default">
									Log in
								    <button type="button" class="close" data-dismiss="alert" aria-label="close">&times;</button>
								</button>
							</a>
						</div>
						<p></p><br>
						<div id="connectedUserId">
							<c:choose>
								<c:when test="${sessionScope.connectedUser != null}">
									${sessionScope.connectedUser.getId()}
								</c:when>
								<c:otherwise>
									0
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
		
				<div class="row" id="headTable">
					<div class="col-sm-2">
						<div id="subjectHead">SUBJECT
						</div>
					</div>
	
					<div class="col-sm-2">
						<div id="userNameHead">AUTHOR
						</div>
					</div>	
					<div class="col-sm-1">
						<div id="commentCountHead">COMMENTS
						</div>
					</div>
	
					<div class="col-sm-4" >
						<div id="latestCommentHead">LATEST COMMENT
						</div>
					</div>	
					<div class="col-sm-3" style="text-align:center;">
						<div id="buttonsHead">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="panel-group" id="forumPanel">
						<c:forEach var="subject" items="${subjectsList}" varStatus="status">
							<div class="panel panel-default" id="panelDefault${subject.getId()}">
								<div class="panel-heading">
									<div class="panel-title">
										<div class="row">
											<div class="col-sm-2 subjectBody">
												<a data-toggle="collapse" data-parent="#forumPanel" href="#collapse${status.index+1}" class="link">   
													<span id="subjectTitle${subject.getId()}">${subject.getTitle()}</span>
												</a>
											</div>
											<div class="col-sm-2 userNameBody">
												${subject.getUser().getUserName()}
											</div>						
											<div class="col-sm-1 commentCountBody">
												<span class="badge" id="commentCount${subject.getId()}">${subject.getSortedComments().size()}
												</span>
											</div>
											<div class="col-sm-4 latestCommentBody"  style="font-size:75%;text-align:center;" id="commentLatest${subject.getId()}">
												<c:if test="${subject.getSortedComments().size()>0}">
										        	${subject.getSortedComments().last().getCommentDate()} 
										        </c:if>
											</div>
											<div class="col-sm-3 buttonsBody">
												<c:if test="${subject.getUser().getId() == sessionScope.connectedUser.getId()}">
													<button type="button"  class="btn btn-success  btn-sm  modifySubjectButton" data-subjectId="${subject.getId()}">
														Modify subject
													</button>
													<button type="button" class="btn btn-warning  btn-sm  deleteSubjectButton" data-subjectId="${subject.getId()}">
														Delete subject
													</button>
												</c:if>
												<c:if test="${administrator.getId() == sessionScope.connectedUser.getId()}">
													<button type="button" class="btn btn-warning  btn-sm  deleteSubjectButton"data-subjectId="${subject.getId()}">
														Delete subject
													</button>												
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<div id="collapse${status.index+1}" class="panel-collapse collapse in">  
									<div class="panel-body">
										<span id="subjectText${subject.getId()}">${subject.getDescription()}
										</span><br />
										----------------------------<br />
										<c:forEach var="comment" items="${subject.getSortedComments()}" varStatus="status2">
											<div id="newComment-${subject.getId()}-${comment.getId()}">
												<div>
													<p>
														Author: <span style="color: #0000FF;">${comment.getUser().getUserName()}
																</span><br />
														Date: ${comment.getCommentDate()}<br />
													</p>
													<p>
														<span id="commentTextZone-${subject.getId()}-${comment.getId()}">
															${comment.getText()}<br />
														</span>
														<c:if test="${comment.getUser().getId() == sessionScope.connectedUser.getId()}">
															<button type="button" class="btn btn-success  btn-xs modifyCommentButton" data-subjectId="${subject.getId()}" data-commentId="${comment.getId()}">
																Modify comment
															</button>
															<button type="button" class="btn btn-warning  btn-xs deleteCommentButton" data-subjectId="${subject.getId()}" data-commentId="${comment.getId()}">
																Delete comment
															</button>													
															<br />
														</c:if>
														<c:if test="${administrator.getId() == sessionScope.connectedUser.getId()}">
															<button type="button" class="btn btn-warning  btn-xs deleteCommentButton" data-subjectId="${subject.getId()}" data-commentId="${comment.getId()}">
																Delete comment
															</button>
														</c:if>
													</p>
												</div>
												<c:if test="${comment.getUser().getId() == sessionScope.connectedUser.getId()}">
													<form action="#" id="modifyCommentForm-${subject.getId()}-${comment.getId()}" class="modifyCommentForm">
														<h4>
															Modify your comment !
														</h4>
														<textarea rows="7" cols="40" class="commentDescMod" id="modifiedText-${subject.getId()}-${comment.getId()}">
															${comment.getText()}
												        </textarea>
														<br /> 
														<input type="submit" class="saveModifiedComment" value="Submit" data-commentId="${comment.getId()}" />
														<input type="reset" class="cancelBtn" value="Cancel" data-commentId="${comment.getId()}" />
													</form>
												</c:if>
												----------------------------<br />
											</div>
										</c:forEach>
	
	
										<form action="#" id="addCommentform${subject.getId()}" class="addCommentform">
											<div class="alert alert-danger alert-dismissible" role="alert" id="alertDanger${subject.getId()}">
												You must be connected to post a message !
												<a href="login">
													<button type="button" class="btn btn-default">											
														Log in													
													    <button type="button" class="close" data-dismiss="alert" aria-label="close">&times;</button>
													</button>
												</a>
											</div>
											<h4>Join the discussion !</h4>
											<textarea rows="7" class="commentMessage${subject.getId()}" data-subjectId="${subject.getId()}">
									        </textarea>
											<br /> 
											<input type="submit" class="saveCommentButton" style="width:55px; margin-top:3px; font-size:13px;" value="Submit" data-subjectId="${subject.getId()}" /> 
											<input type="reset" class="cancelBtn" style="width:55px; margin-top:3px; font-size:13px;" value="Cancel" />
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<form:form method="POST" action="postSubject" commandName="postSubjectForm" id="postSubjectForm">
					<h3>Add a new subject !</h3>
				    	Title:<br />
					<form:input path="title" id="subjectTitleAddSub"></form:input>
					<br />
					<span id="titleErrorAddSub"></span>
					<br />
				     Description:<br />
					<form:textarea path="description" id="subjectDescriptionAddSub" cols="20" />
					<br />
					<span id="descriptionErrorAddSub"></span>
					<br />
					<input class="submitBtn" type="submit" value="Submit" />
					<input class="cancelBtn" type="reset" value="Cancel" />
				</form:form>
	
	
				<form method="POST" action="#" id="modifySubjectForm">
					<h3>Modify the subject !</h3>
					Title:<br />
					<input id="subjectTitleModSub" /><br /> 
					<span id="titleErrorModSub"></span><br /> <br />
					 Description:<br />
					<textarea id="subjectDescriptionModSub" cols="20"></textarea>
					<br />
					<span id="descriptionErrorModSub"></span><br /> 
					<input class="submitBtn" type="submit" value="Submit" />
					<input class="cancelBtn" type="reset" value="Cancel" />
				</form>
				<div id="plus"></div>
				<div class="w3-container">
					<br>
					<div class="row">
						<div class="col-sm-2">
							<a href="pictures"><button class="w3-btn w3-white w3-text-indigo w3-border w3-round-large w3"><span class="glyphicon glyphicon-triangle-left"></span> Previous</button></a>							
						</div>
						<div class="col-sm-8"></div>
						<div class="col-sm-2">
							<a href="contact">
								<button class="w3-btn w3-white w3-text-indigo w3-border w3-round-large">
									Next <span class="glyphicon glyphicon-triangle-right"></span>
								</button>
							</a>
						</div>
					</div>
					<div id="space">
					</div>
				</div>
			</div>
			<c:import url="includes/footer.jsp" />
		</div>
	</body>
</html>