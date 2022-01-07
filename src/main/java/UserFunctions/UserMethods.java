package UserFunctions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import Connection.MyCon;
import openUsers.OpenUserMethods;
import reg.Product;
import try1.User;

public class UserMethods {
// buyItem
// addToCart
// display Cart
//view shopping history
// View login history

	public User getUserDetails(String usertype, String email) {//vendor, vendor41@gmail.com
		User user = new User();
		Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
		String tableName = "userRegistrationDetails";
		String sql = "select * from " + tableName + " where userEmailid='" + email + "' and userType='"+usertype+"'";
		
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				int userSerialID = rs.getInt(1);
				String username = rs.getString(2);
				String userEmailid = rs.getString(3);
				String userMobNumber = rs.getString(4);
				String userPassword = rs.getString(5);
				String userAddress = rs.getString(6);
				// String registrationTime=rs.getDateTime(7);
				String userUniqueID = rs.getString(8);
				System.out.println(userSerialID);

				user.setAddress(userAddress);
				user.setEmail(userEmailid);
				user.setMobNumber(userMobNumber);
				user.setName(username);
				user.setUserID(userUniqueID);
				user.setPassword(userPassword);
				user.setUserType(usertype);
				return user;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;

	}
	
	//Overloading the method with single userID type
	
	public User getUserDetails(String userID) {
		User user = new User();
		Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
		String tableName = "userRegistrationDetails";
		String sql = "select * from " + tableName + " where userUniqueID='" + userID + "'";
		
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				int userSerialID = rs.getInt(1);
				String username = rs.getString(2);
				String userEmailid = rs.getString(3);
				String userMobNumber = rs.getString(4);
				String userPassword = rs.getString(5);
				String userAddress = rs.getString(6);
				// String registrationTime=rs.getDateTime(7);
				String userUniqueID = rs.getString(8);
				String usertype=rs.getString(9);
				System.out.println(userSerialID);

				user.setAddress(userAddress);
				user.setEmail(userEmailid);
				user.setMobNumber(userMobNumber);
				user.setName(username);
				user.setUserID(userUniqueID);
				user.setPassword(userPassword);
				user.setUserType(usertype);
				return user;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;

	}
	
	
	
	
	
	
	

	public String toString(String arr[]) {
		String string = "";
		for (int i = 0; i < arr.length; i++) {
			string = string+ arr[i] + " ,";
		}
		return string;

	}
	public String getUserID(String usertype, String email) {
		User user=getUserDetails(usertype, email);
		return user.getUserID();
	}

	// A Method to register activity in user_activity DB
	public boolean registerActivity(User user, String activityName, String ProductID,String description) {
		//Registering the activity in user_activity table
		boolean  result=false;
		Connection con=MyCon.dbcon("user_activity");
		
		try {
					
			String sql3="insert into "+user.getUserType()+"_activity(userID,userName ,activityName,activityDescription ,productID) values(?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql3);
			st.setString(1, user.getUserID());
			st.setString(2, user.getName());
			st.setString(3, activityName);
			st.setString(4, description);
			st.setString(5, ProductID);		
			st.executeUpdate();
			result=true;
			System.out.println("Entered Activity in DB");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
}
