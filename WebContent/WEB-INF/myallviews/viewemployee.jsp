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
				width: 300px;
				margin-top: 20px;
			}	
			.btn:hover{
				color: white;
				background: #ff2400;
			}
			.input {
				border: 2px solid black;
				border-radius: 50px;
			}	
			table{
			    table-layout: fixed;
			    border-collapse: collapse;	
			}	
			tbody {
				display:block;
				width: 100%;
			  	overflow: auto;
			  	height: 470px;
			}
			tr {
			   display: block;
			}
			th,td{
				padding: 5px;
			  	text-align: left;
			  	width: 340px;
			}
			.table-row:hover{
				cursor: pointer;
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
	   			<h4 style="margin-top: 20px">${businessaccount.businessName}</h4>
	   		</div>
	   		<div class="col-sm">
	   			<button class="btn logout-button float-sm-right" style="width: 100px">Logout</button>
	   		</div>
		   </div>
		</nav>
		
		
		<div class="container-fluid" style="height: 670px; margin-top: 10px">
			<div class="col-sm" style=" height: 100px">
				<div class="row">
					<div class="col-sm">
						<button class="btn" style="width: 100px"><i class="fa fa-arrow-left"></i> Back</button>
					</div>
					<div class="col-sm ">
						<button class="btn float-sm-right" style="width: 100px"><i class="fa fa-arrow-left"></i> Edit</button>
					</div>
					
				</div>
				
			<div class="row" style="height: 520px; margin-top: 10px">
				<div class="container">
			<form action="newUserRegister" name="loginform" method="post">
			  <div class="form-row">
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault01">First name</label>
			      <input type="text" class="form-control input" id="validationDefault01" name="fname" 
			      value='${employee.firstName}'  disabled required>
			    </div>
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault02">Last name</label>
			      <input type="text" class="form-control input" id="validationDefault02" name="lname" 
			      value='${employee.lastName}'  disabled required>
			    </div>
			    <div class="col-md-4 mb-4">
			      <label for="validationDefaultUsername">Hire Date</label>
			      <div class="input-group">
			        <input type="date" class="form-control input" id="hireDate" name="hireDate" disabled
			         aria-describedby="inputGroupPrepend2" required>
			      </div>
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="col-md-6 mb-6">
			      <label for="validationDefault11">Account Email</label>
			      <input type="email" class="form-control input" id="validationDefault11" 
			      value='${employee.email}' disabled name="aemail" required>
			    </div>
			    <div class="col-md-6 mb-6">
			      <label for="validationDefault12">Account Password</label>
			      <input type="password" class="form-control input" id="validationDefault12" 
			      value='${employee.password}' disabled name="apassword" required>
			    </div>
			  </div>
			  </br>
			  <div class="form-row">
			    <div class="col-md-4 mb-4">
			      <label for="validationDefault03">Account Phone</label>
			      <input type="text" class="form-control bfh-phone input" data-format="+1 (ddd) ddd-dddd" disabled
			      value='${employee.phone}' name="aphone" id="validationDefault03" required>
			    </div>
			    
			    <div class="col-md-4 mb-4">
			      <label for="validationDefaultUsername">Pay Period Hours</label>
			      <div class="input-group">
			        <input type="text" class="form-control input" id="ppHours" name="ppHours" disabled
			        aria-describedby="inputGroupPrepend2" required>
			      </div>
			    </div>
			    
			    <div class="col-md-4 mb-4">
			      <label for="validationDefaultUsername">Year To Date Something</label>
			      <div class="input-group">
			        <input type="text" class="form-control input" id="ytd" name="ytd" disabled
			        aria-describedby="inputGroupPrepend2" required>
			      </div>
			    </div>
			    
			    
			    
			  </div>
			  
			  <div class="row" style="">
			 	<div class="col-sm">
			 		<button class="btn manage-employees-button " data-toggle="modal" data-target="#addNewEmpModal">
			 			<i class="fa fa-plus-circle"></i>
			 			Change Password
			 		</button>
			 	</div>
			 	<div class="col-sm text-center">
			 		<button class="btn manage-employees-button" data-toggle="modal" data-target="#addNewEmpModal">
			 			<i class="fa fa-plus-circle"></i>
			 			Pay
			 		</button>
			 	</div>
			 	<div class="col-sm">
			 		<button class="btn manage-employees-button float-sm-right" data-toggle="modal" data-target="#addNewEmpModal">
			 			<i class="fa fa-plus-circle"></i>
			 			Current Pay Stub
			 		</button>
			 	</div>
			 </div>
			</form>
		
		
		
		</div>
				
			
			</div>
			
				
			</div>
		
		</div>
		
		<form name="submitForm" method="POST" action="viewEmployee">
    		<input id="idForForm" type="hidden" name="param1" value="nil">
			<!--     <A HREF="javascript:document.submitForm.submit()">Click Me</A>-->
		</form>
		
		<!-- Modal Add New Employee-->
		<div class="modal fade" id="addNewEmpModal" style="background: #1A1A1D" tabindex="-1" role="dialog" 
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		  	<form action = "saveEmployee" method="post">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel" style="color: black">New Employee</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        
					  <div class="form-row">
					    <div class="form-group col-md-6">
					    <label for="validationDefault1" style="color: black">First Name</label>
					      <input type="text" class="form-control input" name="fname" 
					      id="validationDefault1" placeholder="First Name" required/>
					    </div>
					    <div class="form-group col-md-6">
					    	<label for="validationDefault4" style="color: black">Last Name</label>
					      	<input type="text" name="lname" class="form-control input" 
					      	id="validationDefault4" placeholder="Last Name" required/>
					    </div>
					  </div>
					  
					  <div class="form-row">
					    <div class="form-group col-md-6">
					    	<label for="validationDefault2" style="color: black">Email</label>
					      	<input type="email" name="email" class="form-control input" 
					      	id="validationDefault2" placeholder="Employee Email" required/>
					    </div>
					    <div class="form-group col-md-6">
					    	<label for="validationDefault3" style="color: black">Password</label>
					    	<input type="password" class="form-control input" name="password" 
					    	id="validationDefault3" placeholder="Employee Password" required/>
					    </div>
					  </div>
					  
					   <div class="form-row">
					    <div class="form-group col-md-6">
					    	<label for="validationDefault5" style="color: black">Phone Number</label>
					      	<input type="text" class="form-control bfh-phone input" name="phonenumber" 
					      	id="validationDefault5" data-format="+1 (ddd) ddd-dddd" 
					      	name="aphone" placeholder="Employee Phone" required>
					    </div>
					  </div>
					  	
					
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		    </form>
		  </div>
		</div>
		
		
		
		<script src="resources/jquerylib.js"></script>
		<script src="resources/bootstrap-formhelpers-phone.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		<script>
		$(document).ready(function() {
			$(".table-row").on("click", function(){
				console.log($(this)[0].id);
				$("#idForForm").val($(this)[0].id);
				document.submitForm.submit();
			})
		});
		
		</script>
	</body>
</html>