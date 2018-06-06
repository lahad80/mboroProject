<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<c:url value="/resources/css/sideNav.css" />">

<style>
	@media only screen and (max-width: 600px) {
    	.sidenav {width:0%;}  
	}
</style>

<script type="text/javascript">

	$(document).ready(function() {	
		$.ajax({
			method:'GET',
			url:'findFocusedLink',
			success: function(focusedLink){
				$('.'+focusedLink).css('color', '#8B4513');
			}
		});
	});
</script>

<div class="sidenav">
  <a href="index" class="indexLink"><span class="glyphicon glyphicon-home" style="font-size:50px;margin-top:100px;"></span></a>
  <a href="miscellaneous" class="miscellaneaousLink"><span class="glyphicon glyphicon-info-sign" style="font-size:50px; margin-top:20px;"></span></a>
  <a href="pictures" class="picturesLink"><span class="glyphicon glyphicon-picture" style="font-size:50px; margin-top:20px;"></span></a>
  <a href="forum" class="forumLink"><span class="glyphicon glyphicon-pencil" style="font-size:50px; margin-top:20px;"></span></a>
  <a href="contact" class="contactLink"><span class="glyphicon glyphicon-envelope" style="font-size:50px; margin-top:20px;"></span></a>
</div>
