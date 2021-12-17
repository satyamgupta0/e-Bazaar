package openUsers;

import java.util.LinkedList;

import reg.Product;

public class Main {
//Method to check the buy Product function
//	public static void main(String[] args) {
//		MyCartFunctions m=new MyCartFunctions();
//		System.out.println(m.buyProduct("CUSTOMER1","GROCERY_KURKURE6", 40));
//	}
	
	public static void main(String[] args) {
		SearchS om=new SearchS();
		LinkedList<Product> result=om.search("JACKET");
		if (result.size()==0) {
			System.out.println("Sorry No Result found");
		}
		else {
		for (int i = 0; i < result.size(); i++) {
			result.get(0).printProductDetails();
			System.out.println("\n\n\n\n");
			System.out.println("__________________________________");
		}
		}
	}
}
