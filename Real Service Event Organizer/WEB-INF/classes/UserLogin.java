
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk mengecek Login yang dilakukan User
public class UserLogin extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		String username = request.getParameter("username");
		String password = request.getParameter("password");



		if(username == "" || username == null)
		{
			response.sendRedirect("login.jsp?error=username harus diisi !!!");
		}else if(password == "" || password == null)
		{
			response.sendRedirect("login.jsp?error=password harus diisi !!!");
		}else
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

			try
			{
				if(db.cekLogin(username,password))
				{

					db.UpdateLogin(username,password,"login");
					session.setAttribute("user",username);
					session.setAttribute("pass",password);
					session.setAttribute("admin",db.getAdmin(username,password));
					response.sendRedirect("index.jsp");


				}else response.sendRedirect("login.jsp?error=Gagal!!!");
			}catch (Exception e)
			{

			}
		}



	}
}