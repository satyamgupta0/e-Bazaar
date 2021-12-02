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
import admin.adminMethods;



@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user	=request.getParameter("email");
		String pass	=request.getParameter("password");
		String userType=request.getParameter("usertype");
		PrintWriter out =response.getWriter();
		out.println("email: "+user);
		out.println("<br>");
		
		out.println("password: "+pass);
		out.println("<br>");
		Dao obj=new Dao();
		boolean result=obj.checkLogIN(user, pass,userType);
		if(result) {
			UserMethods um=new UserMethods();
			User user2=um.getUserDetails(userType, user);
			user2.printUserDetails();
			response.sendRedirect("welcomeprofile"+userType+".jsp");
			
		}
		else{
			out.println("Wrong Email/Password");
			response.sendRedirect("/UserEntry/src/main/webapp/Home.html");
		}
		
		
	}
}	