package customer;

import java.sql.Connection;

import Connection.MyCon;

public class CustomerMethods {
// buyItem
// addToCart
// display Cart
//view shopping history
// View login history
	
	public void getUserID(String usertype,String email, String password) {
		Connection con=MyCon.dbcon("user_signup_login_DATA_for_admin");
		String tableName=usertype+"RegistrationDetails";
		String sql="select * from "+tableName+" where userEmailid="+email+" and userPassword="+password;
		
	}
}
