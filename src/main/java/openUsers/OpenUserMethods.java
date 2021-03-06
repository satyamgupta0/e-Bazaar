package openUsers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import Connection.MyCon;
import reg.Product;

public class OpenUserMethods {
	public static Product getProductDetails(String ProductID) {
		Product product = new Product();//Creates a new Product
		Connection con = MyCon.dbcon("product");//Establish a connection from Product database

		String tableName = ProductID.split("_")[0];//ELECTRONICS_EARPHONE23
		System.out.println(tableName);

		String sql = "select * from " + tableName + " where productID='" + ProductID + "'";
//		System.out.println(sql);
		try {
			Statement st = con.createStatement();//Statement helps to execute SQL queries
			ResultSet rs = st.executeQuery(sql);//Execute the Query and Stores the result.
			while (rs.next()) {
				int serialID = rs.getInt(1);
				String productID = rs.getString(2);
				String subCategory = rs.getString(3);
				String productName = rs.getString(4);
				double productPrice = rs.getDouble(5);
				int productUnit = rs.getInt(6);
				String[] productQualities = rs.getString(7).split(",");
				String mfg = rs.getString(8);
				String sellerID = rs.getString(9);

				product.setCategory(tableName);
				product.setMfg(mfg);
				product.setSubCategory(subCategory);
				product.setProductQualities(productQualities);
				product.setProductID(productID);
				product.setProductUnit(productUnit);
				product.setProductPrice(productPrice);
				product.setName(productName);
				product.setSellerID(sellerID);
				product.printProductDetails();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return product;
	}
	public static String toStringL(String arr[]) {
		String string = "";
		for (int i = 0; i < arr.length; i++) {
			string = string+arr[i] + " ,";
		}
		return string;

	}
}
