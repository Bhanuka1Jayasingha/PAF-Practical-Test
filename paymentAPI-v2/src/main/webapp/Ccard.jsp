<%@page import="com.healthcare.paymentAPI_v2.model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css">
<script src="components/jquery-3.4.1.min.js"></script>
<script src="components/ccard.js"></script>
</head>
<body>
<div style="text-align: center;position:relative;left:250px;top:50px;" class="container">
		<div class="row">
			<div style="background-color:#6ABAEC;height:820px;border-radius:10px;" class="col-6">
				<h1>Add Card</h1>
				<form id="formItem" name="formItem">
					Card No: 
					<input id="cardNo" name="cardNo" type="text"class="form-control form-control-sm" placeholder="Enter Card No"> <br>
					Card Holder Name:
					<input id="ccHolderName" name="ccHolderName" type="text" class="form-control form-control-sm" placeholder="Enter Cardholder Name"> <br> 
					Expiry Date:
					 <input id="ccExpDate" name="ccExpDate" type="date" class="form-control form-control-sm" placeholder="Enter Expiry Date"> <br>
					 CVV:
					 <input id="cvv" name="cvv" type="number" class="form-control form-control-sm" placeholder="Enter CVV "> <br>
					 Payment No:
					 <input id="paymentID" name="paymentID" type="number" class="form-control form-control-sm" placeholder="Enter Payment Number"> <br> 
					 
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					 <input type="hidden" id="hidIDSave" name="hidIDSave" value="">
				
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
					Payment cardObj = new Payment();
					out.print(cardObj.readCreditCardInfo());
					%>
				</div>
				<br>
				
			</div>
			
				<a href="payment.jsp"><input type="button" value="Back" class="btn btn-primary"></a><br><br>
				<br>
		</div>
	</div>

</body>
</html>