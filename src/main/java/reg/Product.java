package reg;

public class Product {

	public String name;
	public String category;
	public String subCategory;//
	public String productID;
	public String[] productQualities;
	public int productUnit;
	public double productPrice;
	public String mfg;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String[] getProductQualities() {
		return productQualities;
	}
	public void setProductQualities(String[] productQualities) {
		this.productQualities = productQualities;
	}
	public int getProductUnit() {
		return productUnit;
	}
	public void setProductUnit(int productUnit) {
		this.productUnit = productUnit;
	}
	public double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	public String getMfg() {
		return mfg;
	}
	public void setMfg(String mfg) {
		this.mfg = mfg;
	}
	public Product(String name, String category, String subCategory, String productID, String[] productQualities,
			int productUnit, double productPrice, String mfg) {
		
		this.name = name;
		this.category = category;
		this.subCategory = subCategory;
		this.productID = productID;
		this.productQualities = productQualities;
		this.productUnit = productUnit;
		this.productPrice = productPrice;
		this.mfg = mfg;
	}
	public Product() {
		
		this.name = "";
		this.category =  "";
		this.subCategory =  "";
		this.productID =  "";
		this.productQualities = null;
		this.productUnit = 0;
		this.productPrice = 0;
		this.mfg = "";
	}


	
}
