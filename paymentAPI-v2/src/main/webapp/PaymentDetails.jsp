<%@page import="com.healthcare.paymentAPI_v2.model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/payment.js"></script>
</head>
<body style="background-color:#C7A0FF;">
<div style="text-align: center;position:relative;left:250px;top:50px;" class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payments</h1><br>
				<div style="text-align: center;position:relative;right:10px;" id="divItemsGrid">
					<%
						Payment paymentObj = new Payment();
					out.print(paymentObj.readPayments());
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>