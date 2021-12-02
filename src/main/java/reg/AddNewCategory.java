package reg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/addNewCategory")
public class AddNewCategory extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category=req.getParameter("categoryName").toUpperCase();
		PrintWriter out=resp.getWriter();
		out.print("<br><br>");
		out.println(category);
		dbConnection db=new dbConnection();
		try {
			boolean result=db.createCategory(category);
			if(result) {
				out.println("Category Created");
			}
			else {
				out.println("Category could not be Created");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
