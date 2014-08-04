
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.database;
import bean.HeaderBooking;

// class untuk melakukan Delete team
public class pecat extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = getServletContext();

		PrintWriter out = response.getWriter();

		String idTeam = request.getParameter("idTeam");

		if(idTeam  !="" && idTeam !=null)
		{
			database db = new database (application.getRealPath("WEB-INF/db.mdb"));

			if(db.DeleteTeam(idTeam))
			{
							ArrayList booking = db.viewBooking("select b.idBooking,tanggal,month,year,namaTeam,namaEvent,c.username from ms_header_Booking b, ms_login c, ms_event d, ms_team e where  b.idUser = c.idUser and b.idEvent = d.idEvent and e.idTeam = b.idTeam and e.idTeam = "+idTeam);
							Iterator iterator = booking.iterator();

						while(iterator.hasNext())
						{
						HeaderBooking bkg = (HeaderBooking) iterator.next();

						db.DeleteBooking(Integer.toString(bkg.getidBooking()));
						}

				response.sendRedirect("teamProfile.jsp");
			}else
			{

				out.println("Gagal Melakukan Delete <a href='teamProfile.jsp'>teamProfile</a>");
			}

		}



	}
}