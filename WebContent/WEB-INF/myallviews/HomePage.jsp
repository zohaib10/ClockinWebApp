<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.util.*, org.springframework.web.context.WebApplicationContext,
org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
				border: 2px solid black;
				border-radius: 50px;
			}	
		</style>
	</head>
	<body >
		
		<nav class="navbar">
		  <a class="navbar-brand" href="#">
		    <img src="resources/logo_transparent.png" width="60px" height="60px" class="d-inline-block align-top" alt="">
		  </a>
		 
		</nav>
		<div class="container-fluid" style="height: 670px; margin-top: 10px">
			<div class="row">
				<div class="col-8" style="height: 670px">
					<div class="jumbotron" style="background: #1A1A1D">
					  <h1 class="display-4" style="color: #ff2400">Welcome to AEON.Hour</h1>
					  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to 
					  featured content or information.</p>
					  <hr class="my-4">
					  <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
					  <p class="lead">
					    <a class="btn contactus-button" href="#" role="button">Contact us</a>
					  </p>
					</div>
				</div>
				
				<div class="col-4" style= "height: 670px">
					<div class="col-sm"style="height: 370px">
						<div class="col-sm" style="height: 370px; width:90%; color: white">
							<!-- Material form login -->
							<div class="card" style="border:none; background: #1A1A1D">
							
							  <h5 class="card-header info-color white-text text-center py-4" style="background: #1A1A1D; 
							  margin-top: 13px; 
							  font-family: Helvetica neue">
							  
							  </h5>
							
							  <!--Card content-->
							  <div class="card-body px-lg-5 pt-0" style="margin-top: 10px">
							
							    <!-- Form -->
							    <form class="text-center" action="loginOnUserName" name="loginform" method="post">
							
							      <!-- Email -->
							      <div class="md-form">
							        <input name="useremail" type="email" id="materialLoginFormEmail" class="form-control" 
							        placeholder="Email">
							      </div>
							
							      <!-- Password -->
							      <div class="md-form">
							        <input name="userpassword" type="password" id="materialLoginFormPassword" class="form-control" 
							        style="margin-top: 10px" placeholder="Password">
							      </div>
							
							     
							
							      <!-- Sign in button -->
							      <button class="btn btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Sign in</button>
							
							      <!-- Register -->
							      <p>Not a member?
							        <a href="newUser">Register</a>
							      </p>
							      <p>
							        <a href="" data-toggle="modal" data-target="#forgotPassword">Forgot password?</a>
							      </p>
								</form>
							    <!-- Form -->
							
							  </div>
							
							</div>
							<!-- Material form login -->
						
						</div>
					</div>
<!-- 					<div class="col-sm" style="height: 150px"></div>
 -->				</div>
			</div>
		</div>
		<!-- Invalid Login Credentials modal -->
		<div class="modal fade myModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
		aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     	<div class="modal-body" style="color: black">
		        	Invalid Email or Password!! Please try again!
		      </div>
		    </div>
		  </div>
		</div>
		<!--Contact US Email Modal  -->
		<div class="modal fade messageModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
		aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     	<div class="modal-body" style="color: black">
		        	Your message has been sent. Someone from our team will get back to you shortly
		      </div>
		    </div>
		  </div>
		</div>
		<!--Password Retrieval Modal -->
		<div class="modal fade forgotPasswordEmail" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
		aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     	<div class="modal-body" style="color: black">
		        	Your password has been sent to your email!
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="forgotPassword" style="background: #1A1A1D" tabindex="-1" role="dialog" 
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		 <div class="modal-dialog" role="document">
		 <form action="sendForgotPasswordEmail" method="post">
		    <div class="modal-content">
		      <div class="modal-body">
		        <div class="col-md-8 mb-8">
			      <label for="validationDefault11" style="color: #1A1A1D" >Account Email</label>
			      <input type="email" name="email-for-forgotPass" class="form-control input" id="validationDefault11" required>
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn forgotPasswordButton">Send Password</button>
		      </div>
		    </div>
		    </form>
		  </div>
		</div>
		
		<form id="contact-us-form" action="contactUs" method="post">
			<input type="hidden" name="fn" value="read" />
		</form>
	
		<script src="resources/jquerylib.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		<script>
		$( document ).ready(function() {
		    if(${tried} == 1){
		    	$(".myModal").modal('toggle');
		    }
		    if(${message} == 1){
		    	$(".messageModal").modal('toggle');
		    }
		    if(${forgotPasswordEmail} == 1){
		    	$(".forgotPasswordEmail").modal('toggle');
		    }
		    $(".contactus-button").on("click",function(){
		    	//var frm=document.getElementById('myform');
		    	$("#contact-us-form").submit();
		    	//frm.submit();
		    });
		   /*  $(".forgotPasswordButton").on("click",function(){
		    	var email = $("#validationDefault11").val();
		    	 window.location.href = "sendForgotPasswordEmail/"+email+".com";
		    }); */
		});
		
		
		
		
		</script>
		
		
	</body>
</html>