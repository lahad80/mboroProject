<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Pictures</title>
		
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
		<link rel="stylesheet" href="<c:url value="/resources/css/frame.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/pictures.css" />">	
		
	</head>
	<body>
		<c:import url="includes/sideNav.jsp" />
		<div id="page-content">
			<c:import url="includes/header.jsp" />
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="w3-container w3-padding-32 w3-theme-d1">
							<h3 style="color: gray">Culture, Craftsmanship & Cuisine</h3>
						</div>
						<div class="w3-row-padding w3-theme">
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/dance.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Goumbé & Baawanaan </h4>
										<p>Goumbé and Baawanaan are festival-like events staged by rural communities when 
										they experience hardship such as severe droughts .
										Women dressed in colorful outfits, some disguised as men, sing and dance all day long to 
									    beseech heaven for rainfall.</p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/fakeLions2.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Simb</h4>
										<p>
										These guys mimic lions to scare children away
										while entertaining adults. According to the myth, this game was
										pioneered by a man allegedly abducted by a group of true lions and who eventually managed
										to escape.This is by all accounts a urban legend. </p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/wrestlers.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Mbapat</h4>
										<p>A sport competition formerly organized shortly after grain harvesting, during which
										 single boys wrestle their way to find a bride.
										In the past, parents attended the contest in their dozens, with the aim of marrying 
										their daughters to the strongest champions </p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/facepieces.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Masque</h4>
										<p>Wood carvings and iron sculpture are ancestral arts respectively practiced 
										by the "Loabé" and "Teugg". These social groups, though looked upon in modern-time Senegal,
										used to have a critical role within the kingdoms that preceded the advent of our republic.</p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/drums2.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Sabar & tama</h4>
										<p>
										Sabar and tama, also known as talking drums are loud African musical instruments.<br>
										Historically they were used by the griot to catch people's attention to inform them of forthcoming events and to transmit 
										 writs issued by the king or the village head. 
									.  </p>
									</div>
								</div>
							</div>
	
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/baskets.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Panier</h4>
										Hand-crafted baskets combining aesthetics and usefulness.
										If not working in their fields, Sereer women gather fallen palm leaves to weave nice baskets and trays they sell at the market to 
										make a living. Others are specialized in pottery, they utilize mud to mould lovely stoves used by low-income families. 
										
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/rice.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Tieboudienne</h4>
										<p>Undoubtedly the national dish in Senegal.
										You will notice it's widespread consumption and will probably eat
										a lot of it during your journey. It is made of rice, fish and vegetables.</p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/yassa.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Yassa</h4>
										<p>Another big name of Senegalese gastronomy with a yummy onion sauce. Amateurs of spicy food will relish
										it's sour taste. Served with chicken thighs or fried fish; it's at your convenience.  </p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/porridge.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Laakh</h4>
										<p>Until in the early 60's, this oil-free delicacy, along with low-fat "Thiéré" was the cornerstone of our forefather' healthy staple diet; only for the following generations to 
										shift afterwards to a rice-based food.</p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/duutee.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Douté</h4>
										<p>A popular drink in the countryside. Easy to prepare, many sip it for breakfast with a slice of bread.
										You just need to put the leaves in a pan filled with water and let boil over low heat for less than 30 minutes 
										to preserve the vitamins. </p>
									</div>
								</div>
							</div>
	
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/bouye.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Bouye</h4>
										<p>These are fruits from the well known baobab tree. After being soaked for hours, they produce
										a wonderful juice that all Senegalese are fan of. They are also said to bear healing powers, specially against 
										stomach ache.</p>
									</div>
								</div>
							</div>
							<div class="w3-third w3-section">
								<div class="w3-card-4">
									<img src="<c:url value="/resources/images/bissap.png" />" style="width: 100%">
									<div class="w3-container w3-white">
										<h4>Bissab</h4>
										<p>This dessert is somewhat the senegalese enhancing drink. Utterly efficient against fatigue,
										they take it to boost their vitality and withstand back-breaking works. To get it right, add some sugar and fresh mint to offset it's bitter flavor. </p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="w3-container">
					<br>
					<div class="row">
						<div class="col-sm-2">
							<a href="miscellaneous"><button class="w3-btn w3-white w3-text-indigo w3-border w3-round-large w3"><span class="glyphicon glyphicon-triangle-left"></span> Previous</button></a>							
						</div>
						<div class="col-sm-8">
						</div>
						<div class="col-sm-2">
							<a href="forum"><button class="w3-btn w3-white w3-text-indigo w3-border w3-round-large">Next <span class="glyphicon glyphicon-triangle-right"></span></button></a>
						</div>
					</div>
				</div>
			</div>
			<c:import url="includes/footer.jsp" />
		</div>
	</body>
</html>