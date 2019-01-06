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
	   			<h4 style="margin-top: 20px">${businessName}</h4>
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
					<div class="col-sm text-center">
						<h4 style="margin-top: 20px">Current Employees</h4>
					</div>
					<div class="col-sm">
						<div class="input-group mb-3 float-sm-right" style="width: 250px">
						  <input type="text" class="form-control input" style="margin-top: 20px; border: 1px solid white" 
						  placeholder="Search Employees" aria-label="Search Employees" aria-describedby="basic-addon2">
						  <div class="input-group-append">
						    <button class="btn btn-outline-secondary" type="button" style="width: 50px; border: 1px solid #ff2400">
								<i class="fa fa-search"></i>
							</button>
						  </div>
						</div>
					</div>
				</div>
				
				<div class="row" style="height: 520px; margin-top: 10px">
				<table class="table table-dark">
				  <thead class="thead-dark">
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Phone</th>
		      <th scope="col">Active</th>
		      <th scope="col">Pay Period hours</th>
		      <th scope="col">Paid</th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var= "emp" items="${employeeList}">
				<input id="busidForForm1" type="hidden" name="busid" value="${emp.id}"/>
				<tr class="table-row" id="${emp.empid}">
					<td>${emp.firstName} ${emp.lastName}</td>
					<td>${emp.phone}</td>
					<td>${emp.active}</td>
					<td>N/A</td>
					<td>N/A</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
				
			
			</div>
			 <div class="row" style="">
			 	<div class="col-sm">
			 		<button class="btn manage-employees-button float-sm-right" data-toggle="modal" data-target="#addNewEmpModal">
			 			<i class="fa fa-plus-circle"></i>
			 			Add New Employee
			 		</button>
			 	</div>
			 </div>
				
			</div>
		
		</div>
		
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
					    <div class="form-group col-md-6">
					    	<label for="validationDefault4" style="color: black">Hourly Rate</label>
					      	<input type="number" name="hourlyRate" class="form-control input" 
					      	id="hourlyRate" placeholder="$" required/>
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
		
		
		<form name="submitForm" id="" method="POST" action="viewEmployee">
    		<input id="idForForm" type="hidden" name="param1" value="nil"/>
    		<input id="busidForForm" type="hidden" name="busid" value="1"/>
		</form>
		
		
		<script src="resources/jquerylib.js"></script>
		<script src="resources/bootstrap-formhelpers-phone.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		<script>
		$(document).ready(function() {
			$("#busidForForm").val($("#busidForForm").val());
			$(".table-row").on("click", function(){
				$("#idForForm").val($(this)[0].id);
				document.submitForm.submit();
			})
		});
		
		</script>
	</body>
</html>