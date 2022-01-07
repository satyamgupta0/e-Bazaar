package try1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import Connection.MyCon;
import UserFunctions.UserMethods;

public class Dao {

	// private Connection con;

	protected boolean insertSignUpDetails(User user) {
		boolean result = false;
		String name = user.getName();
		String email = user.getEmail();
		String mobNumber = user.getMobNumber();
		String pass = user.getPassword();
		String address = user.getAddress();
		String userType = user.getUserType();

		try {

			Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
//			Statement stm=con.createStatement();
//			ResultSet rs=stm.executeQuery("")
//			int serial=

			String sql = "insert into userRegistrationDetails( username, userEmailid,userMobNumber,userPassword,userAddress,userType) values(?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, mobNumber);
			st.setString(4, pass);
			st.setString(5, address);
			st.setString(6, userType);

			st.executeUpdate();
			System.out.println("Details Inserted ......");

			// Update the USERUniqueID as CUSTOMER34 or VENDOR23 in the table

			String tableName = "userRegistrationDetails";
			ResultSet rs = st.executeQuery("SELECT * FROM " + tableName + " ORDER BY userSerialID DESC LIMIT 1;");
			rs.next();
			int id = rs.getInt("userSerialID");
			String userID = userType.toUpperCase() + id;//CUStomer56
			user.setUserID(userID);
			System.out.println(user.getUserID());
			String sql2 = "update " + tableName + " set userUniqueID='" + user.getUserID() + "' where userSerialID="
					+ id;
			st.executeUpdate(sql2);
			System.out.println("Product ID updated");

			// get last insert id
			// create a Unique ID
			// set uniqueID of user
			// update the uniqueID into table using sql queries and with the help of
			// last_insert_id();			
			UserMethods um=new UserMethods();
			boolean t=um.registerActivity(user, "REGISTERED", "","Completed Registration");
			if(t) {
				System.out.println("Activity Recorded");
			}
			result = true;
		}

		catch (Exception f) {
			f.getMessage();
		}

		return result;
	}

	protected boolean checkLogIN(String user, String pass, String usertype) {
		boolean result = false;
		System.out.println(usertype);
		System.out.println(user);
		System.out.println(pass);
		if (usertype.equals("admin")) {
			if (user.equals("admin@admin.com") && pass.equals("password"))
				System.out.println("Successful");
			result = true;
		} else {
			try {
				String sql = "select * from userRegistrationDetails where userEmailid=? and userPassword=? and userType=?";
				Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, user);
				st.setString(2, pass);
				st.setString(3, usertype);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					result = true;
				}
				UserMethods um = new UserMethods();
				User user2 = um.getUserDetails(usertype, user);

				String sql2 = "insert into signindetails(userID,fetchedUserName,fetchedUserRegistrationID,usertype) values('"
						+ user + "','" + user2.getName() + "','" + user2.getUserID() + "','" + usertype + "');";
				st.executeUpdate(sql2);
				boolean t=um.registerActivity(user2, "LOGGEDIN", "","");
				if(t) {
					System.out.println("Activity Recorded");
				}

			} catch (Exception f) {
				f.getStackTrace();
			}

		}
		return result;
	}

}
