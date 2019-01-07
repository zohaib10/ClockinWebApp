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
				color: white;
				font-family: Helvetica neue
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
		
		<div class="container-fluid" style=" height: 670px">
			<div class="col-sm" style=" height: 100px">
				<div class="row text-center">
					<div class="col-sm">
						<button class="btn btn2" data-toggle="modal" data-target="#getUserPassword" id="btn2">Clock In</button>
					</div>
					<div class="col-sm">
						<button class="btn btn2" data-toggle="modal" data-target="#getUserPassword" id="btn2">Lunch Out</button>
					</div>
					<div class="col-sm">
						<button class="btn btn2" data-toggle="modal" data-target="#getUserPassword" id="btn2">Lunch In</button>
					</div>
					<div class="col-sm">
						<button class="btn btn2" data-toggle="modal" data-target="#getUserPassword" id="btn2">Clock Out</button>
					</div>
				</div>
			
			<div class="row" style="height: 520px; margin-top: 10px">
				<table class="table table-dark">
				  <thead>
				    <tr>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				      <th scope="col">Clock IN</th>
				      <th scope="col">Lunch Out</th>
				      <th scope="col">Lunch IN</th>
				      <th scope="col">Clock Out</th>
				    </tr>
				  </thead>
				  <tbody>
				  </tbody>
				</table>
			
			</div>
			
			 <div class="row" style="">
			 	<div class="col-sm">
			 		<button class="btn manage-employees-button" data-toggle="modal" data-target="#getAdminPassword">
			 			Manage Employees
			 		</button>
			 	</div>
			 	
			 	<div class="col-sm"><button class="btn">.Batch</button></div>
			 	<div class="col-sm"><button class="btn">Shop</button></div>
			 	<div class="col-sm"><button class="btn">Account Settings</button></div>
			 </div>
			 </div>
		</div>
		
		
		<div class="modal fade" id="getAdminPassword" style="background: #1A1A1D" tabindex="-1" role="dialog" 
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		 <div class="modal-dialog" role="document">
		 	<form action="checkAdminPassword" method="post">
		    <div class="modal-content">
		      <div class="modal-body">
		        <div class="col-md-8 mb-8">
			      <label for="validationDefault11" style="color: #1A1A1D" >Administrator Password</label>
			      <input type="password" autocomplete="off" class="form-control input" id="validationDefault11" readonly 
					onfocus="this.removeAttribute('readonly');" name="admin-pass-verify" style= "background: white" required>
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn checkAdminPassword">Submit</button>
		      </div>
		    </div>
		    </form>
		  </div>
		</div>
		<!--incorrect AdminPass Modal -->
		<div class="modal fade incorrectAdminPass" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
		aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     	<div class="modal-body" style="color: black">
		        	The Administrator Password is incorrect!
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="getUserPassword" style="background: #1A1A1D" tabindex="-1" role="dialog" 
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		 <div class="modal-dialog" role="document">
		 	<form action="checkUserPassword" method="post">
		    <div class="modal-content">
		      <div class="modal-body">
		        <div class="col-md-8 mb-8">
			      <label for="validationDefault111" style="color: #1A1A1D" >Enter your password</label>
			      <input type="password" autocomplete="off" class="form-control input" id="validationDefault111" readonly 
					onfocus="this.removeAttribute('readonly');" name="user-pass-verify" style= "background: white" required>
					<input id="typeOfOp" type="hidden" name="type" value="nil"/>
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn checkUserPassword">Submit</button>
		      </div>
		    </div>
		    </form>
		  </div>
		</div>
		<!--incorrect AdminPass Modal -->
		<div class="modal fade incorrectUserPass" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
		aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     	<div class="modal-body" style="color: black">
		        	User not found!
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<script src="resources/jquerylib.js"></script>
		<script src="resources/bootstrap.js"></script>
		<script src="resources/bootstrap.min.js"></script>
		<script>
		$( document ).ready(function() {
			$(".logout-button").click(function(){
				 window.location.href = "logoutuser";
			});
			$('.btn2').on('click',function(){
				$('#typeOfOp').val($(this).text());
				console.log($('#typeOfOp').val());
			})
			/* $(".checkAdminPassword").click(function(){
				 window.location.href = "checkAdminPassword/"+$("#validationDefault11").val();
			}); */
			if(${incorrectAdminPass} == 1){
				$(".incorrectAdminPass").modal('toggle');
			}
			
		});
		
		</script>
	</body>
</html>