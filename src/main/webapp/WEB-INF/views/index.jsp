<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome to mboroForEnglish.com</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
		
		
		<link rel="stylesheet" href="<c:url value="/resources/css/frame.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/index.css" />">
	
		<script type="text/javascript">
			$(function() {
			
				var audioElem = document.getElementById('theAudio');
				var latestTrack;
				var playing = false;
				function play_track(element, music, title) {
					$(element).click(function() {						
						$(latestTrack).attr('src','<c:url value="/resources/images/playButton.png" />');
						if (latestTrack != element) {
							$('#scrollingText').html('<marquee id="musicTitle">' + title + '</marquee>');
							$(this).attr('src','<c:url value="/resources/images/pauseButton.png" />');
							playing = true;
							$('audio').attr('src', music).attr('autoplay', '');
						} else if (playing == true) {
							$(this).attr('src','<c:url value="/resources/images/playButton.png" />');
							$('#scrollingText').html('<span id="musicTitle">' + title + '</span>');
 							playing = false;
							audioElem.pause();
						} else {
							$(this).attr('src','<c:url value="/resources/images/pauseButton.png" />');
							$('#scrollingText').html('<marquee id="musicTitle">' + title + '</marquee>');
							playing = true;
							audioElem.play();
						}
						latestTrack = element;
					});
				}
				
				play_track('#massamba', '<c:url value="/resources/music/massamba.mp3"/>','Massamba');
				play_track('#fanta', '<c:url value="/resources/music/fanta.mp3"/>','Fanta');
				play_track('#djolaKele','<c:url value="/resources/music/djolaKele.mp3"/>','Djola kele');
			
			});
		</script>
		
	</head>
	<body>
		<c:import url="includes/sideNav.jsp" />
		<div id="page-content">
			<c:import url="includes/header.jsp" />
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="panel panel-default">
							<div class="panel-heading" style="color: white; background-color:#D2B48C;text-align:center;">
								<h3>A sneak peak of Mboro !</h3>
							</div>
							<div class="panel-body" style="padding:5px 0px 0px 0px;">
								<div id="myCarousel" class="carousel slide" data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
										<li data-target="#myCarousel" data-slide-to="1"></li>
										<li data-target="#myCarousel" data-slide-to="2"></li>
										<li data-target="#myCarousel" data-slide-to="3"></li>
										<li data-target="#myCarousel" data-slide-to="4"></li>
										<li data-target="#myCarousel" data-slide-to="5"></li>
										<li data-target="#myCarousel" data-slide-to="6"></li>
									</ol>
									<!-- Wrapper for slides -->
									<div class="carousel-inner">	
										<div class="item active">
											<img src="<c:url value="/resources/images/peulHamlet.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>A Peul hamlet</h3>
											</div>
										</div>	
										<div class="item">
											<img src="<c:url value="/resources/images/market.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>The market</h3>
											</div>
										</div>
										<div class="item">
											<img src="<c:url value="/resources/images/beach.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>The beach</h3>
											</div>
										</div>
										<div class="item">
											<img src="<c:url value="/resources/images/savanna2.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>Savanna of Mboro</h3>
											</div>
										</div>
										<div class="item">
											<img src="<c:url value="/resources/images/church.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>The church</h3>
											</div>
										</div>
										<div class="item">
											<img src="<c:url value="/resources/images/mosque.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>The mosque</h3>
											</div>
										</div>
										<div class="item">
											<img src="<c:url value="/resources/images/farm.png" />" alt="" style="width: 100%;">
											<div class="carousel-caption">
												<h3>A farm in Mboro</h3>
											</div>
										</div>	
									</div>
	
									<!-- Left and right controls -->
									<a class="left carousel-control" href="#myCarousel" data-slide="prev">
										 <span class="glyphicon glyphicon-chevron-left"></span>
										 <span class="sr-only">Previous</span>
									</a> 
									<a class="right carousel-control" href="#myCarousel" data-slide="next">
										<span class="glyphicon glyphicon-chevron-right"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>									
							</div>
						</div>
						<br />
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 style="color: #8B4513; text-align:center;">Discover Senegalese music.</h3>
							</div>
							<div class="panel-body">
								<div id="player">
									<div id="scrollingText">
										<marquee id="musicTitle">Massamba</marquee>
									</div>
									<audio  controls id="theAudio"  src="<c:url value="/resources/music/massamba.mp3"/>"> </audio>
									<br /> 
									<img id="massamba" src="<c:url value="/resources/images/playButton.png" />" /> <span>Massamba</span><br />
									<img id="fanta" src="<c:url value="/resources/images/playButton.png" />" /> <span>Fanta </span><br />
									<img id="djolaKele" src="<c:url value="/resources/images/playButton.png" />" /> <span>Djola Kele </span><br />
								</div>
								<br />		
							</div>
						</div>
						<div class="panel panel-warning">
							<div class="panel-heading">
								<h3 style="color: #8B4513; text-align:center;">Useful links</h3>
							</div>
							<div class="panel-body">
								<ol>
									<li>
										<a href="https://www.aeroport-dakar.com/things_to_know_and_visa_senegal.php" target="_blank">Traveller Essentials</a>
									</li> <br />
									<li>
										<a href="https://travel.state.gov/content/travel/en/traveladvisories/traveladvisories.html" target="_blank">Security alerts - US.Department of State</a>
									</li><br />
									<li>
										<a href="http://servicepublic.gouv.sn/index.php/demarche_administrative/services/2/218" target="_blank">Senegalese Ministry of Tourism</a>
									</li><br />
								</ol>	
							</div>
						</div>			
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 style="color: #8B4513; text-align:center;">Senegal's map & flag</h3>
							</div>
							<div class="panel-body">
								<img style="width:100%;" src="<c:url value="/resources/images/senegalMap.png" />" />	
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<h3>Hi everybody, welcome to <span style="color:#8B4513;">mboroForEnglish.com</span></h3>
						<p>
							My mane is Lahad, and I am a native of Mboro.
							I've created this website just to provide information to Anglophones who are either planning
							to visit or merely interested in learning a little more about my home town.<br>
						</p>
						<p>
							Mboro is a small senegalese town populated by roughly 20,000 residents.
							It's population includes various ethnic groups namely Wolof, Pulaar, Sereer, Djiola, Mankagne; 
							all living together in perfect harmony.<br />
							A cultural and linguistic mix representing a valuable and rare asset.<br>   
							In contrast to big bustling cities like Dakar, Thies or Saint Louis, Mboro embodies the quaint exotic small town with a traditional 
							social fabric conducive to a deep diving in African lifestyle.
							It's definitely a place worth visiting if you are seeking an out-of-the-box travel experience.
						</p>	
						<p>
							Senegalese citizens overall have a good record of been a generous and outward-looking people.<br>
							The country is known worldwide as "Le pays de la Teranga". It stands for "The land of hospitality".
							And the inhabitants of Mboro are no exception to that friendly mindset. Whoever stays with them, will see on a daily basis that they do 
							live up to their reputation of being a welcoming people.<br> 
							Despite difficulties, the people of Mboro is a smiling and clubable one. It is down to their sense of solidarity and other human values they hold dear.
							
						</p>
						<p>
							Most of the residents rely on agriculture for a livelihood. Indeed, the town is located in a zone called the "Niayes". 
							An extended and fertile area considered the breadbasket of Senegal. Farmers grow vegetables, cereals and fruits mainly for 
							personal consumption. But the extra production is sold at the local market, or exported to other cities and neighboring  countries. <br>
							The sea, three miles away from downtown is also a key source of income through small-scale fishery. Extraordinarily festooned pirogues 
							offer a nice scene when they get back onshore.<br>
							Besides those two aforementioned activities, many live on informal craftsmanship, producing amazing stuffs with rudimentary tools.		
						</p>
						 
						 <p>
						 	When it comes to spirituality , Mboro is a soufi muslim-majority town with a sizeable  catholic community.<br>
						 	Tenets of both faiths are taught with tolerance and mutual respect. Christian and muslim neighbors sharing a meal on their respective religious holidays
						 	is something commonplace in Senegal as a whole.
						 </p>
						 <p>
						 	On security, Senegal is a relatively safe and politically stable country. It currently enjoys an 
						 	"Exercise normal precautions" label in security alerts issued by the US Department of State on all countries; for US citizens 
						 	touring the world. It's exactly the same ranking as peaceful countries like Japan or Norway.
						 	<a href="https://travel.state.gov/content/travel/en/traveladvisories/traveladvisories.html" target="_blank"><span style="font-size:x-small">(see. April, 29<sup>th</sup> 2018).</span></a>
						 </p>
						<br><br><br>
				
						<h3>Here are a couple of things you should avoid to do as far as you can:</h3>
						<p>
							<b>- Travel there between July and September.</b><br>
							It's the raining season with sky-rocketing temperatures. 
							They bring about an overwhelming heat which even locals struggle to cope with.
							Furthermore, you might feel pestered by a bunch of blood-thirsty mosquitos that could turn your
							journey into a nightmare.
						</p>
						<p>
							<b>- Drink tap water.</b><br>
							Do it at your own risk.
							Senegal is unfortunately still a developing country with poor water sanitation infrastructure.<br/>
							Thus, buy water bottles from the corner shop instead.
						 </p> 
						 
						 <p>
							<b>- Hand over something to somebody with your left hand.</b><br>
							In selegalese culture, it's quite frowned upon to do so for it is regarded as a disrespectful gesture and a sign of contempt. 
						</p>
						
						<p>
							<b>- Ask to be served on a separate plate.</b><br>
							Because the people of  Mboro is a sharing-driven community, such a request might be deemed selfish.
							So strive to abide by their custom of eating on the same plate, together with others.
						</p>
										
						<p><br><br>
							That's pretty much what I wanted to tell you about Mboro.<br>
							Carry on browsing the website for further details and practical information.<br>
							If you have any question, feel free to ask me. I can be reached via the contact form and will readily respond.<br />
							Thank you !
						</p>

						<h3>Liability disclaimer</h3>
						Since this is a one-hundred percent non-profit website, I couldn't be hold accountable for any regrettable event 
						that might occur throughout your journey. It would be helpful to report it to the local police station on 
						(+221)33 955 77 34.
						
						<div class="w3-container">
						<br>
							<div class="row">
								<div class="col-sm-2">
								</div>
								<div class="col-sm-8">
								</div>
								<div class="col-sm-2">
									<a href="miscellaneous"><button class="w3-btn w3-white w3-text-indigo w3-border w3-round-large">Next<span class="glyphicon glyphicon-triangle-right"></span></button></a>
								</div>
							</div>
						</div>	
					</div>	
				</div>
			</div>
			<c:import url="includes/footer.jsp" />
		</div>
	</body>
</html>


