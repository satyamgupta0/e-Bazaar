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
		HttpSession session=request.getSession();
		String user	=request.getParameter("email");
		String pass	=request.getParameter("password");
		String userType=request.getParameter("usertype");
		PrintWriter out =response.getWriter();
		System.out.println(userType);		
		out.println("email: "+user);
		out.println("<br>");
		
		out.println("password: "+pass);
		out.println("<br>");
		Dao obj=new Dao();
		boolean result=obj.checkLogIN(user, pass,userType);
		
		//session.setAttribute("LoginValue",result);
		session.setAttribute("email", user);
		
		if(result) {
			
			UserMethods um=new UserMethods();
			
			if(userType.equals("vendor")||userType.equals("customer")) {
			User user2=um.getUserDetails(userType, user);
			session.setAttribute("user", user2);}			
			response.sendRedirect("welcomeprofile"+userType+".jsp");
			
		}
		else{
			System.out.println("Wrong Email/Password");
			response.sendRedirect("login.html");
		}
		
		
	}
}	