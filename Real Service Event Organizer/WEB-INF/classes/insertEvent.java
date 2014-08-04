import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan insert event
public class insertEvent extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		String NamaEvent = request.getParameter("NamaEvent");
		String Keterangan = request.getParameter("eventKeterangan");



		if(NamaEvent== "" || NamaEvent== null)
		{
			response.sendRedirect("insert.jsp?error1=Nama Event harus diisi !!!");
		}else if(Keterangan == "" || Keterangan == null)
		{
			response.sendRedirect("insert.jsp?error1=Description harus diisi !!!");
		}else
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

			if(db.InsertEvent(NamaEvent,Keterangan))
			{
				response.sendRedirect("insert.jsp?error1=Berhasil melakukan insert Data");
			}else
			{
				response.sendRedirect("insert.jsp?error1=Gagal melakukan insert Data");
			}
		}



	}
}