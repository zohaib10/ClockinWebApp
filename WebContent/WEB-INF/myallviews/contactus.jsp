<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/bootstrap.css"/>
		<link rel="stylesheet" href="resources/bootstrap.min.css"/>
		<style>
			body{
				background: #1A1A1D;
				color: white
			}
			.btn{
				border: 2px solid #ff2400;
				color: white;
				border-radius: 50px;
				background: #1A1A1D;
			}	
			.btn:hover{
				color: white;
				background: #ff2400;
			}
			.input {
				border: 2px solid white;
				border-radius: 50px;
			}	
		</style>
	</head>
	<body>
		<nav class="navbar">
		  <a class="navbar-brand" href="#">
		    <img src="resources/logo_transparent.png" width="60px" height="60px" class="d-inline-block align-top" alt="">
		  </a>
		 
		</nav>
		<div class="container" style="height: 670px; margin-top: 10px">
			<div class="row" style="height: 670px; margin-top: 10px">
				<div class="col-md-6 mb-6" style="margin-top: 55px">
			      <form action="contactUsForm" method="post">
					  <div class="form-row">
					    <div class="col-md-12 mb-12">
					      <label for="validationDefault01">Name</label>
					      <input type="text" class="form-control input" id="validationDefault01" name="name" required>
					    </div>
					    <br>
					    <div class="col-md-12 mb-12">
					      <label for="validationDefault02">Email</label>
					      <input type="email" class="form-control input" id="validationDefault02" name="email" required>
					    </div>
						  </div>
						  
						  <div class="form-row">
						  	<div class="col-md-12 mb-12">
							    <label for="exampleFormControlTextarea1">Message</label>
							    <textarea class="form-control rounded-0" id="exampleFormControlTextarea1" name="message" rows="6" required>
							    </textarea>
							</div>
						</div>
						<br>
						<button class="btn" type="submit">Send Message</button>
					</form>
		  	  </div>
			    <div class="col-md-6 mb-6">
			    	<div class="jumbotron" style="background: #1A1A1D">
					  <h1 class="display-4" style="color: #ff2400">AEON</h1>
					  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention 
					  to featured content or information.</p>
					  <hr class="my-4">
					  <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
					  <p class="lead">
					    <a class="btn btn-lg" href="#" role="button">Facebook</a>
					    <a class="btn btn-lg" href="#" role="button">Instagram</a>
					    <a class="btn btn-lg" href="#" role="button">Twitter</a>
					  </p>
					</div>
			    
			    </div>
			</div>
		</div>
	
	
		<script src="resources/jquerylib.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
	</body>
</html>