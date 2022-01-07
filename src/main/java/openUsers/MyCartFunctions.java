package openUsers;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import Connection.MyCon;
import UserFunctions.UserMethods;
import reg.Product;
import try1.User;
import vendor.VendorMethods;

public class MyCartFunctions {

	public String buyProduct(User customer, String productID, int quantity) {//w.r.t. customer
		String result = "failed";
		// update to vendor product database

		VendorMethods vm = new VendorMethods();
		String result2 = vm.sellProduct(productID, customer, quantity);
		String resultArr[] = result2.split("_");
		if (resultArr[0].equals("error") && resultArr[1].equals("0")) {
			result = "You bought nothing" + "_false";

		} else if (resultArr[0].equals("error") && resultArr[1].equals("-1")) {
			result = "Sorry negative input" + "_false";

		} else if (resultArr[0].equals("error")) {
			result = "Sorry maximum availability is " + resultArr[1] + "_false";

		} else if (resultArr[0].equals("success")) {
			result = "Congrats the item is bought" + "_true";
			removeFromCart(customer, productID, quantity);
		}

		return result;
	}
	// Overloading with userID at the place of User user

	protected String buyProduct(String userID, String productID, int quantity) {
		String result = "failed";
		// User
		UserMethods um = new UserMethods();
		User customer = um.getUserDetails(userID);
		result = buyProduct(customer, productID, quantity);

		return result;
	}

	public boolean addToCart(String productID, User customer) {
		boolean result;
		UserMethods um = new UserMethods();

		Product product = OpenUserMethods.getProductDetails(productID);
		result = um.registerActivity(customer, "CARTED", productID, "from " + product.getSellerID());
		return result;
	}

	public boolean removeFromCart(User customer, String productID, int quantity) {
		boolean result = false;
		Connection con = MyCon.dbcon("user_activity");
		try {
			Statement st = con.createStatement();
			String sql = "delete from customer_activity  where productID='" + productID
					+ "' and activityName='CARTED' and userID='" + customer.getUserID() + "'";
			st.executeUpdate(sql);
			System.out.println("Removed from customer_activity");
			result = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
