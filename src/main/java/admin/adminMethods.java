package admin;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import Connection.MyCon;

public class adminMethods extends HttpServlet {
	
	Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
	
	

}
