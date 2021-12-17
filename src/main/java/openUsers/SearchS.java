package openUsers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.LinkedList;

import Connection.MyCon;
import reg.Product;

public class SearchS {

	public LinkedList<Product> search(String query) {
		// electronics_laptop_34
		String table[]= {"electronics", "clothing", "grocery"};		
		Connection con=MyCon.dbcon("product");
		LinkedList<Product> result= new LinkedList<Product>();
		// First Search Product query searching the query in subCategory section of the product table
		for (int i = 0; i < table.length; i++) {
			String sql="select * from "+table[i]+" where subCategory='"+query+"'";	
			
			try {
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()) {					
					String productID = rs.getString(2);
					Product pr=OpenUserMethods.getProductDetails(productID);
					result.add(pr);					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.getMessage();
			}
			
		}
		// Searching Through Product names
		for (int i = 0; i < table.length; i++) {
			String sql="select * from "+table[i]+" where productName like '"+query+"%'";	
			
			try {
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()) {					
					String productID = rs.getString(2);
					String productName = rs.getString(4);
					//use LCS algorithms to find the longest SubSequence in query and productName 
					// Calculate probability of similarity
					// if probability is greater than 80% push the product to the result
//					if (productName.equals(query)) {
//						
//					}
					Product pr=OpenUserMethods.getProductDetails(productID);
					result.add(pr);
										
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.getMessage();
			}
			
		}
		/*
		//searching through the product description and qualities
		for (int i = 0; i < table.length; i++) {
			String sql="select * from "+table[i]+" where productQualities='"+query+"'";	
			
			try {
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()) {					
					String productID = rs.getString(2);
					String[] productQualities = rs.getString(7).split(",");
					//use LCS algorithms to find the longest SubSequence in query and productName 
					// Calculate probability of similarity
					// if probability is greater than 80% push the product to the result
					Product pr=OpenUserMethods.getProductDetails(productID);
					result.add(pr);					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.getMessage();
			}
			
		}*/
		//Some other loops searching for the query in different columns
		//Some loops who searched on the like operator with missing elements in the query
		
		
		return result;
		
		
	}
}
