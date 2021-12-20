package openUsers;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reg.Product;
import try1.User;
@WebServlet("/removefromcart")
public class RemoveFromCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		User customer=(User) session.getAttribute("user");
		String productID = req.getParameter("productID");
		
		MyCartFunctions mn=new MyCartFunctions();
		boolean result=mn.removeFromCart(customer, productID, 1);
		
		if (result) {
			@SuppressWarnings("unchecked")
			LinkedList<Product> cartItems=(LinkedList<Product>) session.getAttribute("cartItems");
			for (int i = 0; i < cartItems.size(); i++) {
				if (cartItems.get(i).getProductID().equals(productID)) {
					cartItems.remove(i);
					break;
				}
			}
			session.setAttribute("cartItems", cartItems);
			resp.sendRedirect("cart.jsp");
		}
	}
}
