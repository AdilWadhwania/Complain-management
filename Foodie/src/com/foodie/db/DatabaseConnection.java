package com.foodie.db;

import java.sql.*;

public class DatabaseConnection {

	static Connection connectionObj=null;
	private static String url="jdbc:mysql://localhost:3306/sys";
	private static String user="root";
	private static String dpass="adil1129261";
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(connectionObj==null) {
			Class.forName("com.mysql.jdbc.Driver");
			 connectionObj=DriverManager.getConnection(url,user,dpass);
		}else if(!connectionObj.isClosed()) {
			return connectionObj;
		}else if(connectionObj.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			 connectionObj=DriverManager.getConnection(url,user,dpass);
		}
		return connectionObj;
	}
	
}
