
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>login informations</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
		<link rel="stylesheet" href="<c:url value="/resources/css/frame.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />">
		
		<style type="text/css">			
			@media only screen and (max-width: 410px) {
				#logInForm {width:100%;}  
			}		
		</style>
		
		
		<script>
			$(document).ready(function() {
				$('.submitBtn').click(function(){					
					$('#emptyEmail, #emptyPassword, .error').hide();
					var correctData = true;					
					if($('#theEmail').val().trim().length < 1 ){					
						correctData = false;
						$('#emptyEmail').show();
					}
					if($('#password').val().trim().length < 1 ){					
						correctData = false;
						$('#emptyPassword').show();
					}					
					return correctData;
				});
		
				$('.cancelBtn').click(function() {
					$(location).attr('href','backToLatestPage');
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
						<div id="logInForm">
							<form:form method="POST" action="login" commandName="logInForm">
								<h2>Connection !</h2>                            
								<span id="emptyEmail">Please enter your email !</span>
								<span class="error">${emailOrPwdNotFound}</span><br>
								<form:errors path="email" class="error" />
								<form:input path="email" placeholder="email" id="theEmail"></form:input>
								<br />

								<br />
								<span id="emptyPassword">Please enter your password !</span>
								<form:errors path="password" class="error" />
								<form:input path="password" type="password"
									placeholder="password" id="password"></form:input>
								<br />						
								<br />
								<p>
									<a href="retrievePwd" id="forgetten">Password forgetten ?</a>
								</p>
								<input class="submitBtn" type="submit" value="Submit" />
								<input class="cancelBtn" type="reset" value="Cancel" />
								<p>
									New to mboroForEnglish ?
									<a href="addUser" id="signUpNewbie">
										Sign up now.
									</a>
								</p>
							</form:form>
						</div>
						<div id="space">
						</div>
					</div>
				</div>
			</div>
			<c:import url="includes/footer.jsp" />
		</div>
	</body>
</html>