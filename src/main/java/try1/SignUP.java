package try1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUP extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mobNumber = req.getParameter("mobNumber").toString();
		String address=req.getParameter("address");
		String password = req.getParameter("password");
		String userType=req.getParameter("userType").toLowerCase();
		
		User user=new User(name,email,mobNumber,address,password,userType);	
		
		
		PrintWriter out=resp.getWriter();
		/**************************Checks working*************/
		out.println("name: "+user.getName());
		out.println("<br>");
		out.println("email: "+user.getEmail());
		out.println("<br>");
		out.println("mobNumber: "+user.getMobNumber());
		out.println("<br>");
		out.println("password: "+user.getPassword());
		out.println("<br>");
		out.println("address : "+user.getAddress());
		out.println(user.getUserType());
		out.println("UserID:"+user.getUserID());
		Dao ob=new Dao();
		boolean result=ob.insertSignUpDetails(user);
		if(result) {
			out.println("Successful");
		}
		else{
			out.println("userEmail Already exists.");
		}
		
		
	}
}
