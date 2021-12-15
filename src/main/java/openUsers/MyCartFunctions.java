package openUsers;

import java.sql.Connection;

import Connection.MyCon;

public class MyCartFunctions {

	protected boolean buyProduct(String email, String productID, String quantity) {
		boolean result=false;
		//add to user activity
		try {
			Connection con=MyCon.dbcon("user_activity");
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
}
