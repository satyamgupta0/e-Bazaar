package Connection;

import java.sql.Connection;
import java.sql.DriverManager;


public class MyCon {
	public MyCon()  {}

	public static  Connection  dbcon(String dbName)  {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,"root","password");
		
		return con;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		
		
}
	
}