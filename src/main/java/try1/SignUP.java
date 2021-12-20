package try1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UserFunctions.UserMethods;

@WebServlet("/signup")
public class SignUP extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mobNumber = req.getParameter("mobNumber").toString();
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String userType = req.getParameter("userType").toLowerCase();

		User user = new User(name, email, mobNumber, address, password, userType);

		
		Dao ob = new Dao();
		boolean result = ob.insertSignUpDetails(user);
		session.setAttribute("email", user);

		if (result) {

			UserMethods um = new UserMethods();

			if (userType.equals("vendor") || userType.equals("customer")) {
				session.setAttribute("user", user);
			}
			resp.sendRedirect("welcomeprofile" + userType + ".jsp");

		} else {
			System.out.println("Wrong Email/Password");
			resp.sendRedirect("login.html");
		}

	}
}
