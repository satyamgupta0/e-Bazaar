package openUsers;

import java.sql.Connection;
import java.sql.Statement;

import Connection.MyCon;
import UserFunctions.UserMethods;
import try1.User;

public class MyCartFunctions {

	protected boolean buyProduct(User user, String productID, String quantity) {
		boolean result=false;
		//add to user activity
					
			UserMethods um=new UserMethods();
			um.registerActivity(user, "BOUGHT", productID, "");			
		
		return result;
	}
}
