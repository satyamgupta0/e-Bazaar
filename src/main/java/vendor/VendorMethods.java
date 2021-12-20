package vendor;

import java.sql.Connection;
import java.sql.Statement;

import Connection.MyCon;
import UserFunctions.UserMethods;
import openUsers.OpenUserMethods;
import reg.Product;
import try1.User;

public class VendorMethods {

	public boolean updateProduct(String productID, Product productUpdated) {
		Connection con = MyCon.dbcon("product");
		OpenUserMethods op = new OpenUserMethods();
		Product productOld = OpenUserMethods.getProductDetails(productID);

		String tableName = productID.split("_")[0];
		String sql = "update " + tableName + " set productName='" + productUpdated.getName() + "',  productPrice='"
				+ productUpdated.getProductPrice() + "', productUnit='" + productUpdated.getProductUnit()
				+ "',productQualities='" + toString(productUpdated.getProductQualities()) + "', mfg='"
				+ productUpdated.getMfg() + "'  where productID='" + productID + "'";

		try {
			Statement st = con.createStatement();
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

	public String sellProduct(String productID, User customer, int quantity) {
		String result = "error_0";

		if (quantity == 0) {
			result = "error_0";
		} else if (quantity < 0) {
			result = "error_-1";
		} else {

			OpenUserMethods om = new OpenUserMethods();
			Product product2 = OpenUserMethods.getProductDetails(productID);
			// Created Product Update Copy
			Product product = product2.createUpdateCopy();
			product.setProductPrice(product2.getProductPrice());
			product.setProductQualities(product2.getProductQualities());
			product.setMfg(product2.getMfg());
			product.setName(product2.getName());
			if (product2.getProductUnit() - quantity < 0) {

				result = "error_" + product2.getProductUnit();// return the maximum unit which can be sold
			} else {
				// setting the updated product unit
				product.setProductUnit(product2.getProductUnit() - quantity);
				// updating the product in the database
				updateProduct(productID, product);
				result = "success_" + OpenUserMethods.getProductDetails(productID).getProductUnit();
				// Getting the vendor details
				UserMethods um = new UserMethods();
				User vendor = um.getUserDetails(product2.getSellerID());

				// Register Activity
				// Registering for Customer
				um.registerActivity(customer, "BOUGHT", productID, quantity + "pieces from " + product2.getSellerID());
				// Registering for Vendor
				um.registerActivity(vendor, "SOLD", productID, quantity + " pieces to " + customer.getUserID());
			}
		}
		return result;
	}

	
	public String sellProduct(String productID, String customerID, int quantity) {
		UserMethods um= new UserMethods();
		User customer=um.getUserDetails(customerID);
		String result = sellProduct(productID, customer, quantity);		
		return result;
	}

	public String toString(String arr[]) {
		String string = "";
		for (int i = 0; i < arr.length; i++) {
			string = string + arr[i] + " ,";
		}
		return string;

	}

}
