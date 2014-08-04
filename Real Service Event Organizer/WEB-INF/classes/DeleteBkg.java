
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan Delete pembookingan
public class DeleteBkg extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		PrintWriter out = response.getWriter();

		String idBooking = request.getParameter("idBooking");

		if(idBooking !="" && idBooking !=null)
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

			if(db.DeleteBooking(idBooking))
			{
				response.sendRedirect("search.jsp");
			}else
			{
				out.println("Gagal Melakukan Delete <a href='search.jsp'>kembali</a>");
			}
		}



	}
}