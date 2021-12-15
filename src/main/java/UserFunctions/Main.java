package UserFunctions;

import openUsers.OpenUserMethods;
import reg.Product;


public class Main {
	public static void main(String[] args) {

		OpenUserMethods op = new OpenUserMethods();
		Product product2 = op.getProductDetails("GROCERY_KURKURE6");
		product2.printProductDetails();
		
		Product product =product2.createUpdateCopy();
		product.setProductPrice(40);
		product.setProductUnit(40);		
		product.setMfg("DELETED");		
		product.setName("Bingo Tedhemede");
		String Qualities[]= {"Juicy","Delicious"};
		product.setProductQualities(Qualities);
		UserMethods uf=new UserMethods();
		boolean result=uf.updateProduct("GROCERY_KURKURE6", product);
		if (result) {
			System.out.println("Updated");
		}
		else {
			System.out.println("Not Updated");
		}
	}
}