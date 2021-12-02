package UserFunctions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import Connection.MyCon;
import try1.User;

public class UserMethods {
// buyItem
// addToCart
// display Cart
//view shopping history
// View login history
	
	public User getUserDetails(String usertype,String email) {
		User user=new User();
		Connection con=MyCon.dbcon("user_signup_login_DATA_for_admin");
		String tableName=usertype+"RegistrationDetails";
		String sql="select * from "+tableName+" where userEmailid='"+email+"'";
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) {
				int userSerialID=rs.getInt(1);
				String username =rs.getString(2); 
				String userEmailid = rs.getString(3); 
				String userMobNumber =rs.getString(4); 
				String userPassword= rs.getString(5); 
				String userAddress =rs.getString(6); 
				//String registrationTime=rs.getDateTime(7); 
				String userUniqueID =rs.getString(8); 
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
	
}
