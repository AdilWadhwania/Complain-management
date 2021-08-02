package com.foodie.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.foodie.complain.Complain;
import com.foodie.db.DatabaseConnection;


public class UserManagement {

	public boolean registerUser(User user) throws Exception {
		
		
		Statement statementObj=DatabaseConnection.getConnection().createStatement();
	   
		
		
		int isSuccess=statementObj.executeUpdate("insert into users(user_name,email,mobile,food,city,state,password) values ('"+user.getuserName()+"','"+user.getEmail()+"','"+user.getMobile()+"','"+user.getFood()+"','"+user.getCity()+"','"+user.getState()+"','"+user.getPassword()+"' )");
		if(isSuccess>0) {
			return true;
		}else {
			throw new Exception();
		}
	}
	
	public User getUserByUserName(String user_name,String pass) throws ClassNotFoundException, SQLException {
		Statement statementObj=DatabaseConnection.getConnection().createStatement();
		
		ResultSet rs=statementObj.executeQuery("select * from users where user_name='"+user_name+"'");
		User user=new User();
		while(rs.next()) {
			if(rs.getString("user_name").equals(user_name) && rs.getString("password").equals(pass)) {
			user.setuserName(rs.getString("user_name"));
			user.setPassword(rs.getString("password"));
			user.setFood(rs.getString("food"));
			user.setEmail(rs.getString("email"));
			user.setCity(rs.getString("city"));
			user.setId(rs.getInt("id"));
			user.setMobile(rs.getLong("mobile"));
			user.setState(rs.getString("state"));
		    return user;
		  }else if(!rs.getString("user_name").equals(user_name) && !rs.getString("password").equals(pass)){
			  
			  return null;
		  }
		}
		
		return user;
	}
	
	public boolean updateUser(User user) throws ClassNotFoundException, SQLException {
		Statement statementObj=new DatabaseConnection().getConnection().createStatement();
		int isSuccess=statementObj.executeUpdate("update users set user_name= '"+user.getuserName()+"',email = '"+user.getEmail()+"',mobile='"+user.getMobile()+"',food='"+user.getFood()+"',city='"+user.getCity()+"',state='"+user.getState()+"',password='"+user.getPassword()+"' where id="+user.getId());
		if(isSuccess>0) {
			return true;
		}
		return false;
	}
}
