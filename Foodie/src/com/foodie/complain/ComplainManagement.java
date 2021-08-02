package com.foodie.complain;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodie.db.DatabaseConnection;

public class ComplainManagement {

	
	public List<Complain> getAllComplainByUserId(int userId) throws SQLException, ClassNotFoundException{
		Statement statementObj=new DatabaseConnection().getConnection().createStatement();
		ResultSet rs=statementObj.executeQuery("select * from complain where user_id="+userId);
		List<Complain> complain=getComplainByResultSet(rs);
		return complain;
	}

	public Complain getComplainById(int id,int userId) throws ClassNotFoundException, SQLException{
		Statement statementObj=new DatabaseConnection().getConnection().createStatement();
		ResultSet rs=statementObj.executeQuery("select * from complain where id="+id+" and user_id="+userId);
		Complain complain=new Complain();
		while(rs.next()) {
		  complain=getComplainObject(rs);
		}
		return complain;
	}
	
	private List<Complain> getComplainByResultSet(ResultSet rs) throws SQLException {
	
		List<Complain> complainList=new ArrayList();
		while(rs.next()) {
			Complain complainObj=getComplainObject(rs);
			complainList.add(complainObj);
		}
		return complainList;
	}



	private Complain getComplainObject(ResultSet rs) throws SQLException {
		Complain complain=new Complain();
		complain.setAddress(rs.getString("address"));
		complain.setDescription(rs.getString("description"));
		complain.setId(rs.getInt("id"));
		complain.setMobileNo(rs.getLong("mobile_no"));
		complain.setUserId(rs.getInt("user_id"));
		complain.setTitle(rs.getString("title"));
		return complain;
	}


	public boolean addComplain(Complain complain,int user_id) throws Exception {
		
		Statement statementObj=new DatabaseConnection().getConnection().createStatement();
		int isSuccess=statementObj.executeUpdate("insert into complain(title,description,address,mobile_no,user_id) values ('"+complain.getTitle()+"','"+complain.getDescription()+"','"+complain.getAddress()+"','"+complain.getMobileNo()+"','"+user_id+"')");
		
		if(isSuccess>0) {
			return true;
		}else {
			throw new Exception();
		}
	}

	public boolean removeComplainById(int id) throws ClassNotFoundException, SQLException {
		Statement statementObj=new DatabaseConnection().getConnection().createStatement();
		System.out.println("id is"+id);
		int isSuccess=statementObj.executeUpdate("delete from complain where id="+id);
		if(isSuccess>0) {
			return true;
		}
		
		return false;
	}

	public boolean updateComplain(Complain complain) throws ClassNotFoundException, SQLException {
		Statement statementObj=new DatabaseConnection().getConnection().createStatement();
		int isSuccess=statementObj.executeUpdate("update complain set user_id= '"+complain.getUserId()+"',title = '"+complain.getTitle()+"',description='"+complain.getDescription()+"',address='"+complain.getAddress()+"',mobile_no='"+complain.getMobileNo()+"' where id="+complain.getId());
		if(isSuccess>0) {
			return true;
		}
		return false;
	}
	
	
	
}
