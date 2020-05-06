<%@page import="com.healthcare.paymentAPI_v2.model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css">
<script src="components/jquery-3.4.1.min.js"></script>
<script src="components/adminPayInfo.js"></script>
<script>
$(document).ready(function(){
  $("#divItemsGrid").click(function(){
    confirm("Payment record will be deleted.");
  });
});
</script>
</head>
<body>
	<div style="text-align: center;position:relative;left:250px;top:50px;" class="container">
		<div class="row">
			<div style="background-color:#6ABAEC;height:750px;border-radius:10px;" class="col-6">
				<h1>Payment Management Dashboard</h1>
				<form id="formItem" name="formItem">
					Appointment ID:
					<input id="appointmentID" name="appointmentID" type="text" class="form-control form-control-sm" placeholder="Enter Appointment ID"> <br> 
					
					Patient ID:
					 <input id="patientID" name="patientID" type="text" class="form-control form-control-sm" placeholder="Enter Patient ID"> <br> 
					 
					 Doctor ID:
					 <input id="docID" name="docID" type="text" class="form-control form-control-sm" placeholder="Enter Doctor ID"> <br>
					 
					 Amount:
					 <input id="amount" name="amount" type="text" class="form-control form-control-sm" placeholder="Enter Amount"> <br>
					 
					 hospital ID:
					 <input id="hospitalID" name="hospitalID" type="text" class="form-control form-control-sm" placeholder="Enter hospital ID"> <br>
					 
					 
					 
					 
					 Pay <br>
					<select id="paymentStatus" name="paymentStatus" class="form-control form-control-sm">
			        <option value="UNPAID">Later</option>
			        <option value="PAID">NOW</option>
			        </select><br>
					 
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					 <input type="hidden" id="hidIDSave" name="hidIDSave" value="">
				
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
			
			</div>
				<br>
				<br>
				<div id="divItemsGrid">
					<%
					Payment paymentObj = new Payment();
					out.print(paymentObj.readPayments());
					%>
				</div>
				<br>
				<br>
				<a href="Ccard.jsp"><input type="button" value="Add Card Details" class="btn btn-primary"></a><br><br><br>
				<br>
		</div>
	</div>

</body>
</html>