package reg;

import UserFunctions.UserMethods;

public class ProductUpdation {
	
	public Product createUpdateCopy(Product product2) {
		Product product=new Product();//product2.get
		product.setCategory(product2.getCategory());	
		product.setSubCategory(product2.getSubCategory());
		product.setSellerID(product2.getSellerID());
		product.setProductID(product2.getProductID());
//		product.setProductPrice(productPrice);
//		product.setProductUnit(productUnit);
//		product.setProductQualities(productQualities);
//      product.setMfg(mfg);
//      product.setName(productName);
		
		return product;
	}
}
