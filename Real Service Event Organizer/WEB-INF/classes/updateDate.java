
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;


// class untuk melakukan update Date
public class updateDate extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();


		database db = new database (application.getRealPath("WEB-INF/db.mdb"));

		String tanggal = request.getParameter("date");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String cancel = request.getParameter("cancel");
		String idBooking = request.getParameter("idBooking");


		if(cancel != null  )
		{
					response.sendRedirect("search.jsp");
		}else if(tanggal == "" || tanggal == null)
		{
			response.sendRedirect("editHistory.jsp?idBooking="+idBooking+"&error=date harus di pilih");
		}else if(month == "" || month == null)
		{
			response.sendRedirect("editHistory.jsp?idBooking="+idBooking+"&error=month harus di pilih");
		}else if(year == "" || year == null)
		{
			response.sendRedirect("editHistory.jsp?idBooking="+idBooking+"&error=year harus di pilih");

		}else
		{


			if(db.UpdateDate(tanggal,month,year,idBooking))
			{
				response.sendRedirect("search.jsp");
			}else
			{
				response.sendRedirect("editHistory.jsp?idBooking="+idBooking);
			}
		}

	}
}