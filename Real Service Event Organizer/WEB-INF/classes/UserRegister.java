import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan register oleh user bertugas melakukan insert jika data benar
public class UserRegister extends HttpServlet {


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
		String nama = request.getParameter("nama");
		String email = request.getParameter("email");
		String gender = request.getParameter("radiobutton");
		String RetPassword = request.getParameter("RetPassword");


		if(nama == "" || nama == null)
		{
			response.sendRedirect("registrasi.jsp?error=nama harus diisi !!!");
		}else if(email == "" || email == null)
		{
			response.sendRedirect("registrasi.jsp?error=email harus diisi !!!");
		}else if(gender == "" || gender == null)
		{
			response.sendRedirect("registrasi.jsp?error=jenis kelamin harus diisi !!!");
		}else if(username == "" || username == null)
		{
			response.sendRedirect("registrasi.jsp?error=username harus diisi !!!");
		}else if(password == "" || password == null)
		{
			response.sendRedirect("registrasi.jsp?error=password harus diisi !!!");
		}else if(!(password.equals(RetPassword)))
		{
			response.sendRedirect("registrasi.jsp?error=password dan retype password harus sama !!!");
		}else
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

			try
			{

				if(db.cekUsername(username))
				{
					response.sendRedirect("registrasi.jsp?error=Username sudah ada , silahkan gunakan username lain!!!");
				}

				try
				{
					db.InsertRegister(nama,email,gender,username,password);
					response.sendRedirect("registrasi.jsp?error=Sukses Anda dapat melakukan Login sekarang dengan username dan password yang didaftarkan <a href='login.jsp'>Login</a>!!!");

				}catch (Exception en){

					response.sendRedirect("registrasi.jsp?error=Gagal1 !!!");
					}


			}catch (Exception e)
			{
				response.sendRedirect("registrasi.jsp?error=Gagal2 !!!");
			}
		}



	}
}