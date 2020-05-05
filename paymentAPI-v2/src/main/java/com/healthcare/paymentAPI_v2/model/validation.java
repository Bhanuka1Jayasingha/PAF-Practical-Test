package com.healthcare.paymentAPI_v2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class validation {

	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/healthcare", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// validate appointmentid in payment form---------------------------------------------------------------
			public Boolean validateAppointmentId(String appointmentID) {

				try {
					Connection con = connect();
					if (con == null) {
						return false;
					}

					// validate appointmentID
					PreparedStatement stmt1 = con.prepareStatement("SELECT appointmentID FROM payments p" + " WHERE p.appointmentID=? ");
					stmt1.setInt(1, Integer.parseInt(appointmentID));
					ResultSet result1 = stmt1.executeQuery();

					if (result1.next() != false) {

						return true;
					}

				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
				return true;

			}

	// validate patientID in payment form-----------------------------------------------------------
			public Boolean validatePatientId(String patientID) {

				try {
					Connection con = connect();
					if (con == null) {
						return false;
					}

					// validate patientID
					PreparedStatement stmt2 = con.prepareStatement("SELECT patientID FROM payments p" + " WHERE p.patientID=? ");
					stmt2.setInt(1, Integer.parseInt(patientID));
					ResultSet result2 = stmt2.executeQuery();

					if (result2.next() != false) {

						return true;
					}

				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
				return true;

			}
	
}
