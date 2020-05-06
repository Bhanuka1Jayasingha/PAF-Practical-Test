$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 $("#divItemsGrid").hide();
 }
 $("#alertError").hide();
});

// SAVE
$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	// If valid------------------------
	var type = ($("#hidIDSave").val() == "") ? "POST" : "PUT";
	$.ajax({
		url : "PaymentAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
			$("#divItemsGrid").show();
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidIDSave").val("");
	$("#formItem")[0].reset();
}

// UPDATE
$(document).on("click", ".btnUpdate", function(event) {
			$("#hidIDSave").val( $(this).closest("tr").find('#hidIDUpdate').val());
			$("#paymentType").val($(this).closest("tr").find('td:eq(1)').text());
			$("#appointmentId").val($(this).closest("tr").find('td:eq(4)').text());
			$("#patientId").val($(this).closest("tr").find('td:eq(5)').text());
		});

// Delete
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PaymentAPI",
		type : "DELETE",
		data : "paymentNo=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
			$("#divItemsGrid").hide();
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}



function validateItemForm()
{

//appointmentId
if ($("#appointmentID").val().trim() == "")
 {
 return "Insert Appointment ID.";
 } 

//patientId
if ($("#patientID").val().trim() == "")
 {
 return "Insert patient ID.";
 }
// is numerical value
var tmpAid = $("#appointmentID").val().trim();
if (!$.isNumeric(tmpAid))
 {
 return "Insert a numerical value for Appointment ID.";
 }
var tmpPid = $("#patientID").val().trim();
if (!$.isNumeric(tmpPid))
 {
 return "Insert a numerical value for Patient ID.";
 }
// convert to integer ID
 $("#appointmentID").val(parseInt(tmpAid).toFixed(0));
 $("#patientID").val(parseInt(tmpPid).toFixed(0));

return true;
}
