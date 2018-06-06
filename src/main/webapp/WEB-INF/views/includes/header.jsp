<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="<c:url value="/resources/css/header.css" />"> 


<script>
	$(document).ready(function() {
		
		$.ajax({
			method:'GET',
			url:'findFocusedLink',
			success: function(focusedLink){
				$('#'+focusedLink).css('color', '#0000FF');
			}
		});

		$('.dropbtn, glyphicon-user').on('click', function() {
			$('.dropdown-content').slideToggle();
		});

		$('#deleteBtn').click(function() {

			$("#dialog-confirm").dialog({
				resizable : false,
				
				height : "auto",
				width : 300,
				modal : true,
				buttons : {
					"Yes, delete my account" : function() {

						$(location).attr('href', 'deleteUser');
					},
					Cancel : function() {
						$(this).dialog("close");
					}
				}
			});
		});
		
		
		var date = new Date();
		var d = date.toDateString();
		var utc = date.toUTCString();	
		var mb = date.toLocaleTimeString("fr-FR", {timeZone: 'Africa/Dakar'});
		var uk = date.toLocaleTimeString("en-UK", {timeZone: 'Europe/London'});
		var us = date.toLocaleTimeString("en-US", {timeZone: 'America/New_York'});
		$('#theDate').html('<span style="color:#4B0082;">'+d+'</span>  | '+mb+'<span style="color:brown;"> in Mboro</span> | '+uk+'<span style="color:brown;"> in London </span> | '+us +'<span style="color:brown;"> in New York</span>');
	
		$.ajax({
			method:'GET',
			url:'getLikesCount',
			success:function(likesCount){
				document.getElementById("likesCount").innerHTML = likesCount;
			}
		});
		
		
		$('.likesZone').on('click', function(){
			$.ajax({
				method:'POST',
				url:'incrementLikesCount',
				data : 'currentCount='+$('#likesCount').text(),
				success:function(likesCount){
					document.getElementById("likesCount").innerHTML = likesCount;
				}
			});
		});
	});
	
</script>

<div class="container">
<nav class="navbar navbar-inverse" style="border:none;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" id="iconButton">
      	<span style="color:white; font-size:10px;">Menu</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index"><span id="logo" >mboroForEnglish</span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="theLi"><a href="index"><span class="urls" id="indexLink">Home</span></a></li>
        <li class="theLi"><a href="miscellaneous"><span class="urls" id="miscellaneaousLink">Miscellaneous</span></a></li>
        <li class="theLi"><a href="pictures"><span class="urls" id="picturesLink">Pictures</span></a></li>
        <li class="theLi"><a href="forum"><span class="urls" id="forumLink">Forum</span></a></li>
        <li class="theLi"><a href="contact"><span class="urls" id="contactLink">Contact</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        
        <div class="w3-container">
			<c:choose>
				<c:when test="${sessionScope.connectedUser != null}">	
					 <li class="dropdown">
				          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
				          	<button class="w3-button w3-white w3-text-brown w3-border w3-border-brown w3-round-large w3-hover-brown w3-hover-text-white">
								<span style="margin-right:5px;" class="glyphicon glyphicon-menu-down"></span>My account
								<span style="margin-left: 7px"class="glyphicon glyphicon-user"></span>
							</button>
				          </a>
				          <ul class="dropdown-menu">
				            <li class="theLi">
				            	<a href="logout">
								<span style="margin-right: 7px" class="glyphicon glyphicon-log-out"></span>Log out
								</a>
				            </li>
				            <li class="theLi">
				            	<a href="updateUser">
								<span style="margin-right: 7px" class="glyphicon glyphicon-pencil"></span>Edit
								</a>
				            </li>
				            <li class="theLi">
				            	<a href="#"id="deleteBtn">
								<span style="margin-right: 7px" class="glyphicon glyphicon-trash"></span>Delete
								</a>
				            </li>
				          </ul>
				      </li> 
				  </c:when>
					<c:otherwise>	
						<a href="login">
							<button class="w3-button w3-white w3-text-green w3-border w3-border-green w3-round-large w3-hover-pale-green w3-hover-text-green">
								<span style="margin-right: 7px" class="glyphicon glyphicon-log-in"></span>Log in
							</button>
						</a>														
						<a href="addUser">
							<button class="w3-button w3-white w3-text-orange w3-border w3-border-orange w3-round-large w3-hover-pale-yellow w3-hover-text-orange" style="margin-top:3px;">
								<span style="margin-right: 7px" class="glyphicon glyphicon-edit"></span> Sign up
							</button>
						</a>								
					</c:otherwise>
				</c:choose>		
		</div>      
      </ul>
    </div>
  </div>
</nav>
  
<script type="text/javascript">
		var userAg = window.navigator.userAgent;
 		var msie = userAg.indexOf("MSIE");
 		if (msie > -1 || !!navigator.userAgent.match(/Trident.*rv\:11\./)){
 			$('.dateZone, .likesZone').text('');
 		}
</script>
			
<img id="banner" src="<c:url value="/resources/images/banner1.png" />" style="width:100%;"/> 

<div class="row" style="margin-top:15px; margin-bottom:50px;">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-6 dateZone">
		<div style="text-align:left; background-color:#F0E68C; color:gray;" id="theDate" >
		</div>
	</div>	
	<div class="col-sm-2 likesZone" style="margin-top:2px; text-align:center;">		
		<div style="background-color:#191970">
			<a href="#" style="text-decoration:none;color:#FFFFFF">
				<span style="color: white;" class="glyphicon glyphicon-thumbs-up"></span>
				<span id="likesCount">${likesCount}</span> Likes&nbsp
			</a>
		</div>
	</div>
</div>
<div id="dialog-confirm" title="Delete your account ?">
	<p>
		<span class="ui-icon ui-icon-alert" style="float: left; margin: 12px 12px 20px 0;"></span>Do you really want to dump you account ?
	</p>
</div>
</div>
