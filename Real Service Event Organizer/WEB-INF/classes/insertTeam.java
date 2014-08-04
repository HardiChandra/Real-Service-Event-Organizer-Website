import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan insert team
public class insertTeam extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		String NamaTeam = request.getParameter("NamaTeam");
		String Keterangan = request.getParameter("teamKeterangan");



		if(NamaTeam == "" || NamaTeam== null)
		{
			response.sendRedirect("insert.jsp?error=Nama Team harus diisi !!!");
		}else if(Keterangan == "" || Keterangan == null)
		{
			response.sendRedirect("insert.jsp?error=Keteranan harus diisi !!!");
		}else
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

			if(db.InsertTeam(NamaTeam,Keterangan))
			{
				response.sendRedirect("insert.jsp?error=Berhasil melakukan insert Data Team");
			}else
			{
				response.sendRedirect("insert.jsp?error=Gagal melakukan insert Data");
			}
		}



	}
}