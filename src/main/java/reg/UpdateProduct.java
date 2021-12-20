package reg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import openUsers.OpenUserMethods;
import vendor.VendorMethods;
@WebServlet("/updateStock")
public class UpdateProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productName = req.getParameter("productName");
		double productPrice = Double.parseDouble(req.getParameter("productPrice"));
		int productUnit = Integer.parseInt(req.getParameter("productUnit"));
		String[] productQualities = req.getParameter("productQualities").split(",");
		String productCategory = req.getParameter("category");// Fetch Category from the form
		String productSubCategory=req.getParameter("subCategory");
		String mfg=req.getParameter("mfg");
		String sellerID=req.getParameter("sellerID");
		String productID=req.getParameter("productID");
		
		Product product = new Product();
		
		product.setCategory(productCategory);
		product.setMfg(mfg);
		product.setName(productName);
		product.setSubCategory(productSubCategory);
		product.setProductPrice(productPrice);
		product.setProductUnit(productUnit);
		product.setProductQualities(productQualities);
		product.setSellerID(sellerID);
		product.setProductID(productID);
		VendorMethods vm=new VendorMethods();
		boolean result = vm.updateProduct(productID, product);
		if (result) {
			resp.sendRedirect("stockVendor.jsp");
		}
		else {
			resp.sendRedirect("updateStockVendor.jsp?productID="+productID);
		}
		
	}
}
