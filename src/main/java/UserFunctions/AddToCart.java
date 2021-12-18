package UserFunctions;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import openUsers.MyCartFunctions;
import try1.User;
@WebServlet("/cartactions")
public class AddToCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String productID=req.getParameter("productID");
		User customer=(User) session.getAttribute("user");
		MyCartFunctions mn=new MyCartFunctions();
		boolean result=mn.addToCart(productID, customer);	
		if (result) {
			System.out.println(productID+" added to cart ");
		}
		else {
			System.out.println("failed");
		}
	}
}
