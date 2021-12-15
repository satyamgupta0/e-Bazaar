package openUsers;


import UserFunctions.UserMethods;
import try1.User;
import vendor.VendorMethods;

public class MyCartFunctions {

	protected String buyProduct(User customer, String productID, int quantity) {
		String result="failed";
		//update to vendor product database		
		
		VendorMethods vm=new VendorMethods();
		String result2=vm.sellProduct(productID, customer, quantity);
		String resultArr[]=result2.split("_");
		if (resultArr[0].equals("error")&&resultArr[1].equals("0")) {
			result="You bought nothing";
			
		}else if (resultArr[0].equals("error")&&resultArr[1].equals("-1")) {
			result="Sorry negative input";
			
		}
		else if (resultArr[0].equals("error")) {
			result="Sorry maximum availability is "+resultArr[1];
			
		}
		else if (resultArr[0].equals("success")) {
			result="Congrats the item is bought";			
		}
				
		
		return result;
	}
	//Overloading with userID at the place of User user
	
	protected String buyProduct(String userID, String productID, int quantity) {
		String result="failed";
		//User
		UserMethods um = new UserMethods();
		User customer=um.getUserDetails(userID);
		result=buyProduct(customer, productID, quantity);				
		
		return result;
	}
}
