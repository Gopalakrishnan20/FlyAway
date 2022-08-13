package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.fieldCleaner.*;

public class Dao {
	public Connection con = null;
	public Statement st = null;
	public static String travellers=null;

	public Dao() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "toor");
		System.out.println("connection established with database");
		st = con.createStatement();
	}// invoked in the object creation and connection is established


	// getAvailableFlights method returns a String List of available flights with
	// the
	// required constrains like From,To and Date which provided by the user
	public List<String[]> getAvailableFlights(String f, String t, String d,String tvlrs) {

		travellers=tvlrs;
		List<String[]> flights = new ArrayList<>();
		String query = "SELECT * FROM flyaway.flights where sourcef='" + f + "' and destinationf='" + t
				+ "' and datef='" + d + "'";
		try {
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				String[] flight = new String[4];
				flight[0] = rs.getString("airline");
				flight[1] = rs.getString("timef");
				flight[2] = rs.getString("price");
				flight[3] = rs.getString("id");
				flights.add(flight);
			}
			return flights;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	// checkUser method verifies with the database that the passed parameters are
	// available or not
	public HashMap<String, String> checkUser(String email, String password) {

		HashMap<String, String> user = null;
		String query = "select * from users where email='" + email + "' and password='" + password + "'";
		try {
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				user = new HashMap<>();
				user.put("name", rs.getString("username"));
				user.put("email", rs.getString("email"));
				user.put("phno", rs.getString("contact"));
				user.put("adno", rs.getString("aadharno"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	// insertUser method returns a boolean value by inserting a new user's data into
	// the database
	public boolean insertUser(HashMap<String, String> user) {

		String query = "INSERT INTO users (email, password, username, contact, aadharno) values('" + user.get("email")
				+ "','" + user.get("password") + "','" + user.get("name") + "','" + user.get("phno") + "','"
				+ user.get("adno") + "')";

		try {
			st.execute(query);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// checkAdmin method returns a boolean value by validating the admin's
	// credentials
	public boolean checkAdmin(String email, String password) {

		try {
			ResultSet rs = st
					.executeQuery("select * from admin where email='" + email + "' and password='" + password + "'");
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// changeAdminPassword method which accessible only through admin login
	public boolean changeAdminPassword(String email, String password) {

		try {
			ResultSet rs = st.executeQuery("select * from admin where email='" + email + "'");
			if (!rs.next()) {
				return false;
			}
			st.execute("update admin set password='" + password + "' where email='" + email + "'");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// insertFlight method is invoked by admin to register a new filght's data to
	// the database
	public boolean insertFlight(HashMap<String, String> flight) throws SQLException {
		String query1 = "INSERT INTO flights (airline,sourcef, destinationf, datef, timef, price) VALUES" + " ('"
				+ StringUtil.fixSqlFieldValue(flight.get("name")) + "'," + " '"
				+ StringUtil.fixSqlFieldValue(flight.get("from")) + "'," + " '"
				+ StringUtil.fixSqlFieldValue(flight.get("to")) + "'," + " '"
				+ StringUtil.fixSqlFieldValue(flight.get("date")) + "'," + " '"
				+ StringUtil.fixSqlFieldValue(flight.get("time")) + "'," + " '"
				+ StringUtil.fixSqlFieldValue(flight.get("price")) + "')";

		System.out.println(flight.get("date"));
		System.out.println(flight.get("time"));
		try {
			// stm.execute();
			st.execute(query1);
			return true;
		} catch (SQLException e) {
			System.out.print("error");
			e.printStackTrace();
		}
		return false;
	}

//	public boolean addBooking(int id, String name) {
//		try {
//			String query = "SELECT * FROM flights where id='" + id + "'";
//			ResultSet rs = st.executeQuery(query);
//			System.out.println(query);
//			System.out.println(rs.getInt("id"));
//			System.out.println(rs.getString("airline"));
//			String query2 = "insert into bookings(username,airline,source,destination,dateb,time,status,paidAmount) values('"
//					+ name + "','" + rs.getString("airline") + "','" + rs.getString("sourcef") + "','"
//					+ rs.getString("destination") + "','" + rs.getDate("datef") + "','" + rs.getTime("timef")
//					+ "',true,'" + rs.getInt("price") + "')";
//			System.out.println(query2);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return true;
//
//	}
	public List<String[]> getAvailableBFlights(int id,String name) {

		List<String[]> flights = new ArrayList<>();
		String query = "SELECT * FROM flyaway.flights where id='" + id + "'";
		try {
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				String[] flight = new String[8];
				flight[0] = rs.getString("id");
				flight[1] = rs.getString("airline");
				flight[2] = rs.getString("sourcef");
				flight[3] = rs.getString("destinationf");
				flight[4] = rs.getString("datef");
				flight[5] = rs.getString("timef");
				flight[6] = rs.getString("price");
				flight[7]=travellers;
				flights.add(flight);
			}
			return flights;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
}
