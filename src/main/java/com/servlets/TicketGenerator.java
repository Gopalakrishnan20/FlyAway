package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.Dao;

@WebServlet("/TicketGenerator")
public class TicketGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.println("Hi");
		@SuppressWarnings("unchecked")
		HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("UserPage.jsp");
		} else {
			try {
				Dao dao=new Dao();
				int id=Integer.parseInt(request.getParameter("fID"));
				String uName=user.get("name");
				String query = null;
				List<String[]> flights =dao.getAvailableBFlights(id,uName);
				session.setAttribute("ticket", flights);
				for (String[] flight : flights) {
					for(int i=0;i<7;i++) {
					System.out.println(flight[i]);}
					query="insert into bookings(username,airline,source,destination,dateb,time,status,paidAmount,travellers) values('"
							+ uName + "','" + flight[1] + "','" + flight[2] + "','"
							+ flight[3] + "','" + flight[4] + "','" + flight[5]
							+ "',1,'" + flight[6] + "','"+flight[7]+"')";
				}
				Connection con = null;
				Statement st = null;
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "toor");
				System.out.println("connection established with database");
				st = con.createStatement();
				st.execute(query);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("ConformationPage.jsp");
		}
	}

}
