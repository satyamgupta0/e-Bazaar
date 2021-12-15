package vendor;

import java.sql.Connection;
import java.sql.Statement;

import Connection.MyCon;
import openUsers.OpenUserMethods;
import reg.Product;
import try1.User;

public class VendorMethods {

	protected boolean updateProduct(String productID, Product productUpdated) {
		Connection con = MyCon.dbcon("product");
		OpenUserMethods op = new OpenUserMethods();
		Product productOld = op.getProductDetails(productID);

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

	protected boolean updateStock(Product product, User vendor, int quantity) {
		boolean result = false;

		return false;
	}
	
	public String toString(String arr[]) {
		String string = "";
		for (int i = 0; i < arr.length; i++) {
			string = string+ arr[i] + " ,";
		}
		return string;

	}

}
