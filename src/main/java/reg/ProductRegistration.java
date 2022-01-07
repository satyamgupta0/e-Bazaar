package reg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/ProductRegistration")
public class ProductRegistration extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = resp.getWriter();


//		
		String productName = req.getParameter("productName");
		double productPrice = Double.parseDouble(req.getParameter("productPrice"));
		int productUnit = Integer.parseInt(req.getParameter("productUnit"));
		//String serialID = req.getParameter("productSerial");
		String[] productQualities = req.getParameter("productQualities").split(",");
		String productCategory = req.getParameter("category");// Fetch Category from the form
		String productSubCategory=req.getParameter("subCategory");
		String mfg=req.getParameter("mfg");
		
		
		////GET SELLERID
		String sellerID=req.getParameter("sellerID");
		Product product = new Product();
		
		product.setCategory(productCategory);
		product.setMfg(mfg);
		product.setName(productName);
		product.setSubCategory(productSubCategory);
		product.setProductPrice(productPrice);
		product.setProductUnit(productUnit);
		product.setProductQualities(productQualities);
		product.setSellerID(sellerID);
		
		
		
//        /**************************Method to check whether Product created correctly"*************************
		out.println("Hello");
		out.println("<br>");

		out.println("productName : " + product.getName());
		out.println("<br>");
		out.println("productCategory : " + product.getCategory());
		out.println("<br>");
		out.println("productID : " + product.getProductID());
		out.println("<br>");
		out.println("productPrice : " + product.getProductPrice());
		out.println("<br>");
		out.println("productUnit : " + product.getProductUnit());
		out.println("<br>");
		out.println("productQualities : " + Arrays.toString(product.getProductQualities()));
		out.println("<br>");
		out.println("SellerID : " + product.getSellerID());
		out.println("<br>");
		dbConnection db=new dbConnection();
		try {
			boolean result=db.addProductToDB(product);
			if(result) {
				out.println("Product added");
				resp.sendRedirect("stockVendor.jsp");
			}
			else {
				out.println("Product could not be added");
				resp.sendRedirect("welcomeprofilevendor.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
