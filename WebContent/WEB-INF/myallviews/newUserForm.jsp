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
		
		<div class="container">
			<form action="newUserRegister" name="loginform" method="post">
			  <div class="form-row">
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault01">First name</label>
			      <input type="text" class="form-control input" id="validationDefault01" name="fname" required>
			    </div>
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault02">Last name</label>
			      <input type="text" class="form-control input" id="validationDefault02" name="lname" required>
			    </div>
			    <div class="col-md-4 mb-4">
			      <label for="validationDefaultUsername">Business Name</label>
			      <div class="input-group">
			        <input type="text" class="form-control input" id="validationDefaultUsername" name="bname" aria-describedby="inputGroupPrepend2" required>
			      </div>
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="col-md-6 mb-6">
			      <label for="validationDefault11">Account Email</label>
			      <input type="email" class="form-control input" id="validationDefault11" name="aemail" required>
			    </div>
			    <div class="col-md-6 mb-6">
			      <label for="validationDefault12">Account Password</label>
			      <input type="password" class="form-control input" id="validationDefault12" name="apassword" required>
			    </div>
			  </div>
			  </br>
			  <div class="form-row">
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault03">Account Phone</label>
			      <input type="text" class="form-control bfh-phone input" data-format="+1 (ddd) ddd-dddd" 
			      name="aphone" id="validationDefault03" required>
			      
			    </div>
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault02">Account Type</label>
			       <input type="hidden" id="restType" name="atype" value="Restaurant">
			      <div class="dropdown show">
					  <a class="btn dropdown-toggle restTypeSelected" style="width: 100%;"href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    Restaurant
					  </a>
					
					  <div class="dropdown-menu" style="width: 100%;" aria-labelledby="dropdownMenuLink">
					    <a class="dropdown-item restTypeSelect" href="#">Restaurant</a>
					    <a class="dropdown-item restTypeSelect" href="#">Hotel</a>
					    <a class="dropdown-item restTypeSelect" href="#">Other</a>
					  </div>
				</div>
			    </div>
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault02">Default Pay Period</label>
			      <input type="hidden" id="payPeriod" name="pperiod" value="Weekly">
			     <div class="dropdown show">
					  <a class="btn dropdown-toggle payPeriodSelected" style="width: 100%;"href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    Weekly
					  </a>
					
					  <div class="dropdown-menu" style="width: 100%;" aria-labelledby="dropdownMenuLink">
					    <a class="dropdown-item payPeriodSelect" href="#">Weekly</a>
					    <a class="dropdown-item payPeriodSelect" href="#">Bi-Weekly</a>
					    <a class="dropdown-item payPeriodSelect" href="#">Monthly</a>
					  </div>
				</div>
			     
			     
			    </div>
			  </div>
			  
			 <div class="form-group">
			    <div class="form-check">
			      <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
			      <label class="form-check-label" for="invalidCheck2">
			        Agree to terms and conditions
			      </label>
			    </div>
			  </div>
			  <button class="btn register-submit-button" type="submit">Submit form</button>
			</form>
		
		
		
		</div>
		
		<!--Email Exists Modal -->
		<div class="modal fade myModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
		aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     	<div class="modal-body" style="color: black">
		        	Invalid email! An Account with this email already exists! 
		      </div>
		    </div>
		  </div>
		</div>
		<script src="resources/jquerylib.js"></script>
		<script src="resources/popper.min.js"></script>
		<script src="resources/bootstrap-formhelpers-phone.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		
		<script>
		$( document ).ready(function() {
			$(".payPeriodSelect").click(function(){
				$(".payPeriodSelected").html($(this)[0].textContent);
				$("#payPeriod").val($(this)[0].textContent);
			});
			$(".restTypeSelect").click(function(){
				$(".restTypeSelected").html($(this)[0].textContent);
				$("#restType").val($(this)[0].textContent);
			});
			$(".register-submit-button").click(function(){
				console.log("submit clicked");
			});
			$(".phone-number").blur(function(){
				if(phonenumber($(".phone-number").val())){
					console.log("true");
				}
			});
			if(${emailExists} == 1){
		    	$(".myModal").modal('toggle');
		    }
			
			function phonenumber(inputtxt)
			{
			  var phoneno = /^\d{10}$/;
			  if(inputtxt.match(phoneno)){
			      return true;
			    }else{
			       return false;
			   	}
			}
			
		});
		//1) check phone number validation
		//2) Store info
		//3) If email exists - show error
		
		
		
		</script>
	</body>
</html>