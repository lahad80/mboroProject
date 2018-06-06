<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Contact</title>
	
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
		<link rel="stylesheet" href="<c:url value="/resources/css/frame.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/contact.css" />">
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('ul li[data-isFocused="yes"]').css('background-color', '#708090');
				
				$('form').submit(function(event) {
					event.preventDefault();
					handleForm();
				});
				
				function handleForm() {
					var pattern = /^[\w-.+]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
					var firstName = $('#firstName').val();
					var email = $('#email').val().trim();
					var country = $(':selected').val();
					var message = $('#message').val().trim();
					var correctData = true;
					if(email.length <= 0){
						$('#emailError').text('Your email is needed !').fadeIn(1000);
						correctData = false;
					}else if( ! pattern.test(email)){
						$('#emailError').text('Invalid email address !').fadeIn(1000);
						correctData = false;
					}else{
						$('#emailError').fadeOut(1000);
					}
					if(message.length <= 0){
						$('#messageError').text('Please enter a message').fadeIn(1000);
						correctData = false;
					}else{
						$('#messageError').fadeOut(1000);
					}
					if(correctData)	{
						$.ajax({
							method : 'POST',
							url : 'sendContactEmail',
							data : 'firstName=' + firstName+ '&email=' + email+ '&country=' + country+ '&message=' + message,
							success : function(response) {
								$('#successMessage').text('Hello '+ response+ ', your message has been successfully sent and will be processed as quicky as possible !').fadeIn(1500);
								$(':reset').click();
								$('#emailError').fadeOut(1000);
								$('#messageError').fadeOut(1000);
							}
						});
					}
				}
			});
		</script>
		
	</head>
	<body>
		<c:import url="includes/sideNav.jsp" />
		<div id="page-content">
			<c:import url="includes/header.jsp" />
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
					</div>
					<div class="col-sm-3">
						<img id="baobabImg" src="<c:url value="/resources/images/inn.png" />" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<form>
							<label for="firstName">First Name</label> <br>
							<input type="text" id="firstName" name="firstName" placeholder="Your name..">
							<label for="email">Email<span class="required">*</span></label><span class="error" id="emailError"></span><br />
							<input type="text" id="email" name="email" placeholder="Your email.." value="${connectedUser.getEmail()}">
							<label for="country">Country</label>
							<select id="country" name="country">
								<option value="Australia">Australia</option>
								<option value="Canada">Canada</option>
								<option value="China">China</option>
								<option value="Japan">Japan</option>
								<option value="Luxembourg">Luxembourg</option>
								<option value="Netherlands">Netherlands</option>
								<option value="New Zealand">New Zealand</option> 
								<option value="Norway">Norway</option>
								<option value="Sweden">Sweden</option>
								<option value="United Kingdom">United Kingdom</option>
								<option value="USA">USA</option>
								<option value="Other">Other</option>
							</select> 
							<label for="message">Message<span class="required">*</span></label><span class="error" id="messageError"></span>
							<textarea id="message" name="message" placeholder="Write something.." style="height: 200px">
							</textarea>	
							<span id="successMessage">.</span><br>
							<input type="submit" value="Submit">
							<input type="reset" value="Cancel">
						</form>
					</div>
				</div>
				<div class="w3-container">
					<br>
					<div class="row">
						<div class="col-sm-2">
							<a href="forum">
								<button class="w3-btn w3-white w3-text-indigo w3-border w3-round-large w3"><span class="glyphicon glyphicon-triangle-left"></span> Previous
								</button>
							</a>							
						</div>
						<div class="col-sm-8">
						</div>
						<div class="col-sm-2">
						</div>
					</div>
				</div>
			</div>
			<c:import url="includes/footer.jsp" />
		</div>
	</body>
</html>