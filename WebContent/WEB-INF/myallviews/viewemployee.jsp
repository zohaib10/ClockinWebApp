<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      
     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Employees</title>
		<link rel="stylesheet" href="resources/bootstrap.css"/>
		<link rel="stylesheet" href="resources/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
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
				width: 180px;
				margin-top: 10px;
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
	<body>
		<nav class="navbar">
		  <div class="row" style="width: 100%">
			<div class="col-sm">
			<a class="navbar-brand" href="#">
				<img src="resources/logo_transparent.png" width="60px" height="60px" class="d-inline-block align-top" alt="">
			</a>
			</div>
			<div class="col-sm text-center">
	   			<h4 style="margin-top: 20px">${businessName}</h4>
	   		</div>
	   		<div class="col-sm" >
	   			<button class="btn logout-button float-sm-right" style="width: 100px">Logout</button>
	   		</div>
		   </div>
		</nav>
		<div class="col-sm" style=" height: 100px">
			<div class="row" style="width: 100%">
				<div class="col-sm">
					<button class="btn" style="width: 100px"><i class="fa fa-arrow-left"></i> Back</button>
				</div>
				<div class="col-sm">
					<button class="btn float-right" id="editButton" style="width: 100px"><i class="fa fa-pencil-square-o"></i> Edit</button>
				</div>
			</div>
			<div class="container-fluid" style="height: 570px; margin-top: 10px">
				<div class="row" style="height: 520px; margin-top: 10px">
					<div class="container">
							
			  				<div class="form-row">
			    				<div class="col-md-4 mb-4">
			      					<label for="validationDefault01">First name</label>
			      					<input type="text" class="form-control input" id="firstName" name="fname" 
			      					value='${employee.firstName}'  disabled required/>
			    				</div>
			    				<div class="col-md-4 mb-4">
			      					<label for="lastName">Last name</label>
			      					<input type="text" class="form-control input" id="lastName" name="lname" 
			      					value='${employee.lastName}'  disabled required/>
			    				</div>
			    				<div class="col-md-4 mb-4">
			      					<label for="hourlyRate">Hourly Rate</label>
			      					<div class="input-group">
			        					<input type="number" step="0.01" class="form-control input" id="hourlyRate" name="hourlyRate" 
			        					disabled aria-describedby="inputGroupPrepend2" value='${employee.hourlyRate}' required/>
			      					</div>
			    				</div>
			  				</div>
			  				<div class="form-row">
						    	<div class="col-md-6 mb-6">
						      		<label for="validationDefault11">Account Email</label>
							      	<input type="email" class="form-control input" id="accountEmail" 
							      	value='${employee.email}' disabled name="aemail" required/>
						    	</div>
						    	<div class="col-md-6 mb-6">
						      		<label for="validationDefault12">Account Password</label>
						      		<input type="password" class="form-control input" id="password" 
						      		value='${employee.password}' disabled name="apassword" required/>
						    	</div>
						  	</div>
			  				</br>
			  				<div class="form-row">
			    				<div class="col-md-4 mb-4">
			      					<label for="validationDefault03">Account Phone</label>
			      					<input type="text" class="form-control bfh-phone input" data-format="+1 (ddd) ddd-dddd" disabled
			      					value='${employee.phone}' name="aphone" id="phone" required/>
			    				</div>
			    				<div class="col-md-4 mb-4">
			      					<label for="validationDefaultUsername">Pay Period Hours</label>
			      					<div class="input-group">
			        					<input type="text" class="form-control input" id="ppHours" name="ppHours" disabled
			        					aria-describedby="inputGroupPrepend2" required/>
			      					</div>
			    				</div>
			    				<div class="col-md-4 mb-4">
						      		<label for="validationDefaultUsername">Year To Date Something</label>
						      		<div class="input-group">
						        		<input type="text" class="form-control input" id="ytd" name="ytd" disabled
						        		aria-describedby="inputGroupPrepend2" required/>
						      		</div>
						    	</div>
			    			</div>
			  				<div class="form-group">
						    	<div class="form-check">
						    		<c:choose>
						    			<c:when test="${employee.active == 'Yes'}">
						      				<input class="form-check-input inputCheck" type="checkbox" value="Yes" 
						      				id="activeCheck" checked disabled/>
						      			</c:when>
						      			<c:when test="${employee.active == 'No'}">
						      				<input class="form-check-input inputCheck" type="checkbox" value="No" 
						      				id="activeCheck" disabled/>
						      			</c:when>
						      		</c:choose>
						      		<label class="form-check-label" for="invalidCheck2">
						        		Active
						      		</label>
						    	</div>
						  	</div>
						  	<div class="row">
						 		<div class="col-sm">
						 			<button class="btn" type="button">
						 				<i class= "fa fa-lock"></i>
						 				Change Password
						 			</button>
						 		</div>
			 					<div class="col-sm">
						 			<button class="btn" type="button">
						 				<i class= "fa fa-usd"></i>
						 				Pay
						 			</button>
						 		</div>
						 		<div class="col-sm">
						 			<button class="btn" type="button">
						 				<i class= "fa fa-clipboard"></i>
						 				Current Pay Stub
						 			</button>
						 		</div>
						 		<div class="col-sm">
						 			<button class="btn" type="button">
						 				<i class= "fa fa-history"></i>
						 				Payment History
						 			</button>
						 		</div>
						 		<div class="col-sm">
						 			<button class="btn" type="button">
						 				<i class= "fa fa-remove"></i>
						 				Delete Employee
						 			</button>
						 		</div>
						 	</div>
					</div>
				</div>
			</div>
			
		<form name="submitForm" id="" method="POST" action="viewEmployee">
			<input id="idForForm" type="hidden" name="busid" value='${employee.id}'/>
			<input id="idForForm" type="hidden" name="param1" value='${employee.empid}'/>
			<input id="idForForm" type="hidden" name="date" value='${employee.date}'/>
    		<input id="firstName1" type="hidden" name="firstName" value="nil"/>
    		<input id="lastName1" type="hidden" name="lastName" value="nil"/>
    		<input id="hourlyRate1" type="hidden" name="hourlyRate" value="nil"/>
    		<input id="accountEmail1" type="hidden" name="accountEmail" value="nil"/>
    		<input id="phone1" type="hidden" name="phone" value="nil"/>
    		<input id="password1" type="hidden" name="password" value="${employee.password}"/>
    		<input id="ppHours1" type="hidden" name="ppHours" value="nil"/>
    		<input id="ytd1" type="hidden" name="ytd" value="nil"/>
    		<input id="activeCheck1" type="hidden" name="activeCheck" value="nil"/>
    	</form>
			
			
		</div>
		<script src="resources/jquerylib.js"></script>
		<script src="resources/bootstrap-formhelpers-phone.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#editButton').click(function(){
					console.log($('#editButton').text());
					if($('#editButton').text() === " Edit"){
						
						$('#firstName').removeAttr("disabled");
						$('#firstName1').val($('#firstName').val());
						
						$('#lastName').removeAttr("disabled");
						$('#lastName1').val($('#lastName').val());
						
						$('#hourlyRate').removeAttr("disabled");
						$('#hourlyRate1').val($('#hourlyRate').val());
						
						$('#accountEmail').removeAttr("disabled");
						$('#accountEmail1').val($('#accountEmail').val());
						
						$('#phone').removeAttr("disabled");
						$('#phone1').val($('#phone').val());
						
						$('#ppHours').removeAttr("disabled");
						$('#ppHours1').val($('#ppHours').val());
						
						$('#ytd').removeAttr("disabled");
						$('#ytd1').val($('#ytd').val());
						
						$('#activeCheck').removeAttr("disabled");
						$('#activeCheck1').val($('#activeCheck').val());
						
						$('#editButton').html("<i class=\"fa fa-pencil-square-o\"></i> Save");
					}else{
						$('#firstName').attr("disabled",'disabled');
						$('#lastName').attr("disabled",'disabled');
						$('#hourlyRate').attr("disabled",'disabled');
						$('#accountEmail').attr("disabled",'disabled');
						$('#phone').attr("disabled",'disabled');
						$('#ppHours').attr("disabled",'disabled');
						$('#ytd').attr("disabled",'disabled');
						$('#activeCheck').attr("disabled",'disabled');
						$('#editButton').html("<i class=\"fa fa-pencil-square-o\"></i> Edit");
						document.submitForm.submit();
					}
				});
				$('.input').on('change',function(){
					$("#"+$(this)[0].id + "1").val($(this).val());
				});
				$('.inputCheck').on('click', function(){
					if($('.inputCheck')[0].checked === true){
						$('#activeCheck1').val("Yes");
					}else{
						$('#activeCheck1').val("No");
					}
				});
				
			});
		
		</script>
	</body>
</html>