package openUsers;

import reg.*;
import Connection.*;
import java.sql.*;
import java.util.*;

public class Search {
	void searchProduct(String str) {
		int n = str.length();
		char[] Cstr = str.toCharArray();
		char[] pName;
		try {
			Connection con = MyCon.dbcon("product");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM product");
			rs.next();
			int count = rs.getInt(1);
			while (count > 0) {
				// name : column name for Product Name
				// Add an extra column (serialNo) to the product Table
				rs = st.executeQuery("SELECT name FROM product WHERE serialNo =" + count + "LIMIT 1");
				rs.next();
				// Parameter in getString is the column serial in which Product Name is stored
				pName = rs.getString(1).toCharArray();
				if (LongestCommonSubsequence(Cstr, pName, Cstr.length, pName.length) >= Cstr.length) {
					// Display Product
				}
				count--;
			}
		} catch (SQLException SE) {
			System.out.println(SE.getMessage());
		}
	}

	int LongestCommonSubsequence(char[] Str1, char[] Str2, int n, int m) {
		if (n == 0 || m == 0)
			return 0;
		if (Str1[n - 1] == Str2[m - 1])
			return 1 + LongestCommonSubsequence(Str1, Str2, n - 1, m - 1);
		else
			return Math.max(LongestCommonSubsequence(Str1, Str2, n, m - 1),
					LongestCommonSubsequence(Str1, Str2, n - 1, m));
	}
}