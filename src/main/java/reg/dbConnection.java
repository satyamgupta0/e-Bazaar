package reg;

import java.sql.*;


public class dbConnection {

	String url = "jdbc:mysql://localhost:3306/product";
	String uname = "root";
	String pass = "password";

	
	
	
	protected boolean createCategory(String category) throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pass);
			Statement st = con.createStatement();
			String sql = "CREATE TABLE IF NOT EXISTS " + category
					+ "(serialID int NOT NULL AUTO_INCREMENT,productID varchar(30), subCategory varchar(50),productName varchar(100),  productPrice double, productUnit int,productQualities varchar(250), mfg varchar(250),sellerID varchar(50),  PRIMARY KEY (serialId))";
			st.executeUpdate(sql);
			System.out.println("Created table in given database...");
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	/********************************************************************************************/
	protected boolean addProductToDB(Product product) throws SQLException {

		String sql = "insert into " + product.getCategory()
				+ "( subCategory,productName,  productPrice, productUnit,productQualities, mfg )  values(?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pass);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getSubCategory());
			ps.setString(2, product.getName());
			ps.setDouble(3, product.getProductPrice());
			ps.setInt(4, product.getProductUnit());
			ps.setString(5,toString(product.getProductQualities()));
			ps.setString(6, product.getMfg());
			
			// Also include the vendorID in a column

			ps.executeUpdate();
			System.out.println("Addition SuccessFul");
			Statement st = con.createStatement();

			ResultSet rs = st
					.executeQuery("SELECT * FROM " + product.getCategory() + " ORDER BY serialID DESC LIMIT 1;");// get last insert id
			rs.next();
			int id = rs.getInt("serialID");// get last insert id
			String productID = product.getCategory().toUpperCase()+"_"+product.getSubCategory().toUpperCase() + id;// create a Unique ID
			// ProductID is generated as ELECTRONICS_LAPTOP45
			product.setProductID(productID);// set uniqueID of user			
			String sql2="update "+product.getCategory()+" set productID='"+product.getProductID()+"' where serialID="+id;
			st.executeUpdate(sql2); //// update the uniqueID into table using sql queries and with the help of last_insert_id();
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	
	public String toString(String arr[]) {
		String string = "";
		for (int i = 0; i < arr.length; i++) {
			string = arr[i] + " ,";
		}
		return string;

	}
}
