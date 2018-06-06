<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Retrieve your password</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
		<link rel="stylesheet" href="<c:url value="/resources/css/frame.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/retrievePwdSuccess.css" />">
		
	</head>
	<body>
		<c:import url="includes/sideNav.jsp" />
		<div id="page-content">
			<c:import url="includes/header.jsp" />
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h1 id="message">
							Your password has been sent to: ${user.getEmail()} <br /> <br /> 
							<a href="index">Click here to go to landing page !</a>
						</h1>
						<div id="space">
						</div>
					</div>
				</div>
			</div>
			<c:import url="includes/footer.jsp" />
		</div>
	</body>
</html>


