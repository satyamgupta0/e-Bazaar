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

	public User getUserDetails(String usertype, String email) {
		User user = new User();
		Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
		String tableName = usertype + "RegistrationDetails";
		String sql = "select * from " + tableName + " where userEmailid='" + email + "'";
		
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



	public boolean updateProduct(String productID, Product productUpdated) {
		Connection con = MyCon.dbcon("product");
		OpenUserMethods op=new OpenUserMethods();
		Product productOld = op.getProductDetails(productID);

		String tableName = productID.split("_")[0];
		String sql = "update " + tableName+" set productName='"+productUpdated.getName()+"',  productPrice='"+productUpdated.getProductPrice()+"', productUnit='"+productUpdated.getProductUnit()+"',productQualities='"+toString(productUpdated.getProductQualities())+"', mfg='"+productUpdated.getMfg()+"'  where productID='"+productID+"'";
		
		try {
			Statement st=con.createStatement();			
			st.executeUpdate(sql);
			System.out.println("updation Successful SuccessFul");		
			System.out.println("***************");
			productOld.printProductDetails();
			System.out.println("#############is updated to ##########");
			productUpdated.printProductDetails();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
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
	public boolean registerActivity(User user, String activityName, String ProductID) {
		//Registering the activity in user_activity table
		boolean  result=false;
		Connection con2=MyCon.dbcon("user_activity");
		String sql4="CREATE TABLE IF NOT EXISTS "+user.getUserID()+"(serialID int NOT NULL AUTO_INCREMENT,activityTime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, activityName varchar(50),productID varchar(50),PRIMARY KEY (serialId))";

		Statement st2;
		try {
			st2 = con2.createStatement();
			st2.executeUpdate(sql4);//Table is Created
			String sql3="insert into "+user.getUserID()+"(activityName,productID) values('"+activityName+"','"+ProductID+"')";
			st2.executeUpdate(sql3);	
			result=true;
			System.out.println("Entered Activity in DB");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
}
